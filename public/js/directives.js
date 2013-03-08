'use strict';

/* Directives */
String.prototype.splice = function( idx, rem, s ) {
    return (this.slice(0,idx) + s + this.slice(idx + Math.abs(rem)));
};

var daymap = {
    mo: "Monday",
    tu: "Tuesday",
    we: "Wednesday",
    th: "Thursday",
    fr: "Friday",
    sa: "Saturday",
    su: "Sunday"
}
function format_day(d) {
    return daymap[d] || d
}

function format_team(tm,px) {
    var fullname = tm.split("_").join(" ").split("X").join("/");
    var name = fullname;

    if ( px && px/fullname.length < 5 ) {
        // not much space, let's abbrieviate
        if ( name.match(/^[GB]U/) ) {
            name = name.split(/\s+/)[0]
        } else {
            name = _.map(name.split(/\s+/),
                         function(ss) { return ss[0].toUpperCase() })
                .join("")
        }
    }
    return name
}

function time_overlaps(o1,o2) {
    var o1f = o1.from.getTime() 
    var o1t = o1.to.getTime() 
    var o2f = o2.from.getTime() 
    var o2t = o2.to.getTime() 
    return ( o1f >= o2f && o1f < o2t ) ||
        ( o1t > o2f && o1t <= o2t );
}

function slot_clashes(sl,data) {
    var clash = false;
    _.each(data,function(d,i) {
        _.each(d.slots,function(othersl) {
            if ( sl.day == othersl.day && 
                 sl.slot == othersl.slot &&
                 time_overlaps(sl,othersl)
               ) {
                // overlap
                clash = true;
            }
        });
    });
    return clash;

}

function append_textbox(text,width,height,classes) {
    return function(d,i) {
        // per http://stackoverflow.com/questions/12975717/using-switch-with-foreignobject-in-svg

        var sw = d3.select(this).append('svg:switch')
            .classed("textswitch",true)

        var tt = sw.append('svg:foreignObject')
            .attr('width', width)
            .attr('height', height)
            .attr('requiredFeatures',"http://www.w3.org/TR/SVG11/feature#Extensibility")

        tt.append('xhtml:body')
            .style("font", "14px 'Helvetica Neue'")
            .style("background-color", "transparent")
            .style("margin", 0)
            .style("padding", 0)
            .style("text-align", "center")
            .append('div')
            .classed(classes,true)
            .style("height",height+"px")
            .style("min-height",height+"px")
            .style("min-width",width+"px")
            .style("line-height",height+"px")
            .style("font-weight","bold")
            .text(text)

        // fallback for IE
        sw.append('svg:text')
            .attr('dx',width/2)
            .attr('dy',height/2)
            .style('text-anchor','middle')
            .classed(classes,true)
            .text(text)

        return this
    }
}

angular.module('myApp.directives', []).
  directive('appVersion', ['version', function(version) {
    return function(scope, elm, attrs) {
      elm.text(version);
    };
  }]).
    directive('fieldchart', function() {
        return {
            restrict: 'E',
            terminal: true,
            scope: {
                field: '=',
                schedule: '=',
                colors: '=',
                twilight: '=',
                basedate: '=',
                timestep: '=',
                formatfield: '=',
                rain: '=',
                chartWidth: '@chartWidth',
                chartHeight: '@chartHeight',
                chartPadding: '@chartPadding'
            },
            link: function( scope, element, attrs ) {
                var vis = d3.select(element[0]);

                var tw = parseInt(attrs.chartWidth) || 1200;
                var th = parseInt(attrs.chartHeight) || 600;
                var padding = parseInt(attrs.chartPadding) || 50;
                var w = tw - padding*2;
                var h = th - padding*2;
                var days = ["mo","tu","we","th","fr","sa","su"]

                var xScale, tScale // defined in watch statements

                function convert_time(tma,add,base) {
                    var d = 1;
                    if ( add === undefined) add = 0
                    var th = Math.floor(tma/100)
                    var tm = parseInt((""+tma).slice(-2))
                    var dd = angular.copy(scope.basedate)
                    dd.setHours(th)
                    dd.setMinutes(tm)
                    if ( add ) dd.add(add).minutes()
                    return dd
                }


                function split_time_array(ta) {
                    var slt = _.clone(ta);
                    var ll = []
                    // scan times to see if there are gaps, if so split into multiple arrays
                    while( slt.length > 0 ) {
                        var tt = []
                        var lstslt = null
                        for( ; !lstslt || (slt[0] && convert_time(slt[0]).getTime() === convert_time(lstslt,scope.timestep).getTime()); 
                             lstslt = slt.shift() ) {
                            tt.push(slt[0]);
                        }
                        ll.push(tt)
                    }
                    return ll
                }

                var svg = vis.insert("svg:svg", "form")
                    .attr("width", tw )
                    .attr("height", th )
                    .attr("pointer-events", "all")
                    .append("svg:g")
                    .attr("transform","translate("+padding+" "+padding+")")

                var defs = svg.append("svg:defs")
                defs.append("svg:clipPath")
                    .attr("id", "clip")
                    .append("svg:rect")
                    .attr("id", "clip-rect")
                    .attr("x", "0")
                    .attr("y", "0")
                    .attr("width", w)
                    .attr("height", h);
                defs.append("svg:pattern")
                    .attr('id','diaghatch')
	            .attr('patternUnits', 'userSpaceOnUse')
	            .attr('width', '6')
	            .attr('height', '6')
	            .append('svg:image')
	            .attr('xlink:href', '/images/stripe.png')
	            .attr('x', 0)
	            .attr('y', 0)
	            .attr('width', 6)
	            .attr('height', 6);
                defs.append("svg:pattern")
                    .attr('id','rainhatch')
	            .attr('patternUnits', 'userSpaceOnUse')
	            .attr('width', '6')
	            .attr('height', '6')
	            .append('svg:image')
	            .attr('xlink:href', '/images/transparent-stripe-blue.png')
	            .attr('x', 0)
	            .attr('y', 0)
	            .attr('width', 6)
	            .attr('height', 6);


                // keep track of the mouse position
                var mousecoord = null

                // lay down the "closed" rectangle
                var closed = svg.append("svg:rect")
                    .classed('closed',true)
                    .attr('x', 0)
                    .attr('y', 0)
                    .attr('width', w)
                    .attr('height', h)
                    .style('fill', 'url(#diaghatch) #000')
                    .on('mousemove', function(d) {
                        scope.mousecoord = d3.mouse(this)
                        // manual inversion of day based upon pointer
                        var dayidx = Math.floor(scope.mousecoord[0]/xScale.rangeBand())
                        var title = scope.formatfield(scope.field)+" is closed to everyone on "+format_day(days[dayidx])+" @ "+tScale.invert(scope.mousecoord[1]).toString("h:mm tt")
                        d3.select(this)
                            .selectAll('title')
                            .text(function(dd) {
                                return title
                            })
                    })
                    .append("svg:title")
                    .text("NO MESSAGE")


                // background axis features
                var axesg_b = svg.append('svg:g')
                    .classed('axes',true)

                var availableg = svg.append("svg:g")
                    .classed('available',true)
                    .attr("clip-path","url(#clip)")
                
                // add the group for allocated field blocks
                var allocationsg = svg.append("svg:g")
                    .classed('allocations',true)
                    .attr("clip-path","url(#clip)")

                var raing = svg.append("svg:g")
                    .classed('rainclosures',true)
                    .attr("clip-path","url(#clip)")

                var twighlightg = svg.append('svg:g')
                    .classed('twilight',true)
                    .attr("clip-path","url(#clip)")

                // foregroup axis features
                var axesg = svg.append('svg:g')
                    .classed('axes',true)


                // Watch the PSRS model for changes
                scope.$watch(
                    function() { 
                        // $watch will be triggered if the result of this
                        // function changes between calls.  Easiest way to look
                        // for changes in objects is to simply convert them to
                        // JSON
                        return angular.toJson(scope.schedule) 
                            + angular.toJson(scope.twilight)
                    },  function(newVal,oldVal) {

                        // set up the time scale
                        //var from = new Date(1970,0,1,8,0,0)
                        var from = angular.copy(scope.basedate)
                        from.setHours(8)

                        var twilight = _.max(scope.twilight, function(t) { 
                            
                            return new Date(t.civil_twilight).getTime()
                                - new Date(t.civil_twilight).clearTime().getTime()
                        })
                        var twilighta = new Date(twilight.civil_twilight)
                        twilight = new Date(from)
                        twilight.setHours(twilighta.getHours())
                        twilight.setMinutes(twilighta.getMinutes())
                        //var to = new Date(1970,0,1,19,0,0)

                        // advance to the next hour
                        var to = angular.copy(twilight).add(1).hour();
                        to.setMinutes(0)

                        tScale = d3.time.scale()
                            .domain([from,to])
                            .range([0,h])

                        xScale = d3.scale.ordinal()
                            .domain(days)
                            .rangeBands([0,w])

                        // do the axes
                        var tAxis = d3.svg.axis()
                            .scale(tScale)
                            .ticks(d3.time.minutes,60)
                            .orient("left");

                        var xAxis = d3.svg.axis()
                            .scale(xScale)
                            .orient("top")
                            .ticks(2);                

                        // compute field availability
                        var ll = []
                        _.each( scope.schedule.fields[scope.field].slots, function(sl,d) {
                            _.each(split_time_array(sl), function( ta ) { ll.push({day: d, times: ta}) } )
                                });

                        availableg
                            .selectAll("rect.available")
                            .data(ll)
                            .enter()
                            .append("rect")
                            .classed('available',true)
                            .attr('x',function(sl) { 
                                var ii = _.indexOf(days,sl.day);
                                return ii*xScale.rangeBand()
                            })
                            .attr('y',function(sl) { 
                                return tScale(convert_time(sl.times[0])) 
                            })
                            .attr('width', xScale.rangeBand())
                            .attr('height', function(sl) { 
                                var lasttime = convert_time(sl.times[sl.times.length-1],scope.timestep)
                                var mytwilight = new Date(scope.twilight[_.indexOf(days,sl.day)].civil_twilight)
                                // schedule times specified for monday
                                mytwilight.setMonth(lasttime.getMonth())
                                mytwilight.setDate(lasttime.getDate())

                                if ( lasttime > mytwilight ) lasttime = mytwilight
                                return tScale(lasttime) - tScale(convert_time(sl.times[0]));
                            })
                            .on('mousemove', function(d) {
                                scope.mousecoord = d3.mouse(this)
                                // manual inversion of day based upon pointer
                                var dayidx = Math.floor(scope.mousecoord[0]/xScale.rangeBand())
                                var title = scope.formatfield(scope.field)+" is allocated to Cardiff Soccer on "+days[dayidx]+" @ "+tScale.invert(scope.mousecoord[1]).toString("h:mm tt")
                                d3.select(this)
                                    .selectAll('title')
                                    .text(function(dd) {
                                        return title
                                    })
                            })
                            .append("svg:title")
                            .text("This time is allocated to Cardiff Soccer")

                        _.each(scope.schedule.fields, function(fo,field) {
                        });
                            

                        axesg.append("g")
                            .attr("class","x axis")
                            .attr("transform", "translate(0,0)")
                            .call(xAxis);

                        axesg_b // goes in back
                            .selectAll("line.dayticks")
                            .data(["mo","tu","we","th","fr","sa","su"])
                            .enter()
                            .append("svg:line")
                            .classed("dayticks",true)
                            .attr('x1',function(d,i) { return (i+1)*xScale.rangeBand(); })
                            .attr('y1',function(d) { return tScale(from); })
                            .attr('x2',function(d,i) { return (i+1)*xScale.rangeBand(); })
                            .attr('y2',function(d) { return tScale(to); })
                        
                        axesg_b // goes in back
                            .selectAll("line.timeticks")
                            .data(tScale.ticks(d3.time.minutes,scope.timestep).slice(1))
                            .enter()
                            .append("svg:line")
                            .classed("timeticks",true)
                            .attr('x1',function(d) { return 0; })
                            .attr('y1',function(d) { return tScale(d); })
                            .attr('x2',function(d) { return w; })
                            .attr('y2',function(d) { return tScale(d); })
                        
                        

                        axesg
                            .append("g")
                            .attr("class","y axis")
                            .call(tAxis);

                        // copy from the team schedule data to d3-compatible data array
                        var daywidth = {}
                        var data = []
                        _.each(scope.schedule.teamsched,function(tmo,tm) {
                            var oo = { team: tm, slots: [] }
                            _.each(tmo, function(sl,d) {
                                var ts = _.keys(sl)
                                var fieldmatch = _.filter(ts,function(ssl) { 
                                    // allow "teams" to be assigned more than one field
                                    // at a particular time.  We really use this to
                                    // represent other league's field allocations.  Here
                                    // we check if the slot is an array of allocated
                                    // fields and if not we make it an array.
                                    var arr;
                                    if ( sl[ssl] instanceof Array ) { arr = sl[ssl]; } 
                                    else { arr = [sl[ssl]] }
                                    
                                    // now see if any of the fields in the array match
                                    // the field in this chart
                                    return _.indexOf(arr, scope.field) != -1
                                } )
                                if ( fieldmatch.length>0 ) {
                                    var sla = fieldmatch;

                                    _.each(split_time_array(sla),function(ta) {
                                        var nsl = {day: d,
                                                   from: convert_time(ta[0]),
                                                   to: convert_time(ta[ta.length-1],scope.timestep),
                                                   slot: 1
                                                  }

                                        // determine if slot overlaps with already scheduled
                                        // slots and shift it over accordingly
                                        while( slot_clashes( nsl, data ) ) {
                                            nsl.slot++;
                                        }
                                        if ( daywidth[d] == undefined || daywidth[d] < nsl.slot ) daywidth[d] = nsl.slot
                                        oo.slots.push(nsl)
                                    })
                                        }
                            });
                            if ( oo.slots.length > 0 ) data.push(oo);
                        });


                        console.log("FIELD IS ",scope.field)
                        console.log(data)

                        var teams = allocationsg
                            .selectAll("g.team")
                            .data(data,function(d) { return d.team; })
                        ;

                        teams.enter()
                            .append("svg:g")
                            .attr('class',function(d) { return d.team })
                            .classed("team",true)
                            .each(function(team,i) {
                                var slots = d3.select(this).selectAll('g.slot')
                                    .data(team.slots);

                                var rb = xScale.rangeBand();

                                slots.enter()
                                    .append('svg:g')
                                    .classed('slot',true)
                                    .each(function(slot) {
                                        var g = d3.select(this);
                                        var slotbor = rb/15
                                        var slotw = (rb-2*slotbor)/daywidth[slot.day]
                                        var dayidx = _.indexOf(days,slot.day)

                                        /*                                
                                                                          var mytwilight.setHours(twilighta.getHours())
                                                                          var mytwilight.setMinutes(twilighta.getMinutes())
                                        */
                                        //var mytwilight = twilight
                                        var mytwilight = new Date(scope.twilight[_.indexOf(days,slot.day)].civil_twilight)

                                        // schedule times specified for monday
                                        mytwilight.setMonth(slot.to.getMonth())
                                        mytwilight.setDate(slot.to.getDate())
                                        
                                        var myto = slot.to < mytwilight ? slot.to : mytwilight
                                        var sloth = tScale(myto)-tScale(slot.from);
                                        var xx = xScale(slot.day)+slotbor+(slot.slot-1)*slotw;
                                        // adjust for other leagues schedules to fill
                                        // the whole column
                                        if ( team.team.match(/(encinitas_soccer|little_league|rugby|lacrosse)/i) ) {
                                            xx = xScale(slot.day)
                                            slotw = rb
                                        }

                                        g.append('svg:rect')
                                            .attr('x',function(slot) { return xx } )
                                            .attr('y',function(slot) { return tScale(slot.from) } )
                                        //.attr('rx',8) // corder radius
                                        //.attr('ry',8) 
                                            .attr('width', function(slot) { return slotw })
                                            .attr('height', function(slot) { return sloth; })
                                            .attr('style', 
                                                  function(slot) { 
                                                      return "fill: "+scope.colors[team.team]; 
                                                  })
                                        
                                        var tgg = g.append('svg:g')
                                            .attr("transform", "translate("+[xx,tScale(myto)].join(",")+") rotate(-90)")

                                        if ( true ) {
                                            var tn = format_team(team.team,sloth);
                                            if ( tn.match(/^[GB]/) ) tn = tn.split(" ")[0]
                                            tgg.each(append_textbox(tn,sloth,slotw,'teamname'))
                                        } else {
                                        // per http://stackoverflow.com/questions/12975717/using-switch-with-foreignobject-in-svg
                                        var sw = tgg.append('svg:switch')

                                        var tt = sw.append('svg:foreignObject')
                                            .attr('width', sloth)
                                            .attr('height', slotw)
                                            .attr('requiredFeatures',"http://www.w3.org/TR/SVG11/feature#Extensibility")


                                        tt.append('xhtml:body')
                                            .style("font", "14px 'Helvetica Neue'")
                                            .style("background-color", "transparent")
                                            .style("margin", 0)
                                            .style("padding", 0)
                                            .style("text-align", "center")
                                            .append('div')
                                            .classed("teamname",true)
                                            .style("height",slotw+"px")
                                            .style("min-height",slotw+"px")
                                            .style("min-width",sloth+"px")
                                            .style("line-height",slotw+"px")
                                            .style("font-weight","bold")
                                            .text(format_team(team.team,sloth))

                                        // fallback for IE
                                        var tn = format_team(team.team,sloth);
                                        if ( tn.match(/^[GB]/) ) tn = tn.split(" ")[0]
                                        sw.append('svg:text')
                                            .attr('dx',sloth/2)
                                            .attr('dy',slotw/2)
                                            .style('text-anchor','middle')
                                            .text(tn)
                                        }

                                        g.append('svg:title')
                                            .text(function(slot) { return format_team(team.team) + " : "+slot.from.toLocaleTimeString().splice(-6,3,"") + "—" + myto.toLocaleTimeString().splice(-6,3,"") })
                                    });
                            });

                        // draw twilight times
                        var monday = new Date(scope.twilight[0].civil_twilight)
                        var gg = twighlightg
                            .selectAll('g.dtwilight')
                            .data(_.map(scope.twilight, function(t) { 
                                var dd = new Date(t.civil_twilight)
                                // schedule times specified for monday
                                dd.setMonth(monday.getMonth())
                                dd.setDate(monday.getDate())

                                return dd
                            } ))

                        var dg = gg.enter()
                            .append('svg:g')
                            .classed('dtwilight',true);

                        dg.append('svg:line')
                            .classed('twilight',true)
                            .attr('x1', function (t,i) { return xScale(days[i]) })
                            .attr('y1', function (t,i) { return tScale(t) })
                            .attr('x2', function (t,i) { return xScale(days[i])+xScale.rangeBand() })
                            .attr('y2', function (t,i) { return tScale(t) })

                        dg.append('svg:text')
                            .attr('text-anchor','middle')
                            .attr('x', function( t,i ) { return xScale(days[i])+xScale.rangeBand()/2 })
                            .attr('y', function( t,i ) { return tScale(t) })
                            .attr('dy', '16px')
                            .text("Twilight")
                    })

                scope.$watch(
                    function() {
                        return angular.toJson(scope.rain)

                    }, function( newVal, oldval ) {

                        if ( !scope.rain || !scope.rain[scope.field] ) return

                        var raingg = raing
                            .selectAll("g.raing")
                            .data(scope.rain[scope.field])

                        raingg
                            .enter()
                            .append("svg:g")
                            .classed("raing",true)

                        raingg
                            .append("svg:title")
                            .text(function(d) {
                                return scope.formatfield(scope.field)+" is closed due to rain on "+format_day(d.day)
                            })
                        
                        raingg
                            .append("svg:rect")
                            .classed("rain",true)
                            .attr('x',function(d) { return xScale(d.day) })
                            .attr('y',function(d) { return 0 })
                            .attr('width', xScale.rangeBand)
                            .attr('height', h)
                            .style('fill', 'url(#rainhatch) #00f')

                        var tgg = raingg.append('svg:g')
                            .attr("transform", 
                                  function(d) {
                                      return "translate("+[xScale(d.day),h].join(",")+") rotate(-90)"})

                        tgg.selectAll('g.textbox')
                        .data([1])
                        .enter()
                            .append('svg:g').classed('textbox',true)
                            .each(append_textbox("CLOSED DUE TO RAIN",
                                                 h,xScale.rangeBand(),
                                                 'rain'),
                             h,xScale.rangeBand())

                        raingg
                            .exit()
                            .remove()
                    })
            }
        }
    })
;
