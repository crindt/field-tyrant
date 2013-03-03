'use strict';

/* Directives */


function format_team(tm) {
    return tm.split("_").join(" ").split("X").join("/");
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
                schedule: '='
            },
            link: function( scope, element, attrs ) {
                var vis = d3.select(element[0]);

                var tw = 1200;
                var th = 1200;
                var padding = 100;
                var w = tw - padding*2;
                var h = th - padding*2;
                
                var svg = vis.insert("svg:svg", "form")
                    .attr("width", tw )
                    .attr("height", th )
                    .append("svg:g")
                    .attr("transform","translate("+padding+" "+padding+")")

                var from = new Date(1970,0,1,8,0,0)
                var to = new Date(1970,0,1,19,0,0)

                var tScale = d3.time.scale()
                    .domain([from,to])
                    .range([0,h])

                var tAxis = d3.svg.axis()
                    .scale(tScale)
                    .ticks(d3.time.minutes,60)
                    .orient("left");


                var xScale = d3.scale.ordinal()
                    .domain(["mo","tu","we","th","fr","sa","su"])
                    .rangeBands([0,w])

                var xAxis = d3.svg.axis()
                    .scale(xScale)
                    .orient("top")
                    .ticks(2);

                svg.append("g")
                    .attr("class","x axis")
                    .attr("transform", "translate(0,0)")
                    .call(xAxis);

                svg.selectAll("line.dayticks")
                    .data(["mo","tu","we","th","fr","sa","su"])
                    .enter()
                    .append("svg:line")
                    .classed("dayticks",true)
                    .attr('x1',function(d,i) { return (i+1)*xScale.rangeBand(); })
                    .attr('y1',function(d) { return tScale(from); })
                    .attr('x2',function(d,i) { return (i+1)*xScale.rangeBand(); })
                    .attr('y2',function(d) { return tScale(to); })
                
                svg.selectAll("line.timeticks")
                    .data(tScale.ticks(d3.time.minutes,30).slice(1))
                    .enter()
                    .append("svg:line")
                    .classed("timeticks",true)
                    .attr('x1',function(d) { return 0; })
                    .attr('y1',function(d) { return tScale(d); })
                    .attr('x2',function(d) { return w; })
                    .attr('y2',function(d) { return tScale(d); })
                
                              

                svg.append("g")
                    .attr("class","y axis")
                    .call(tAxis);

                function convert_time(tm,add) {
                    var d = 1;
                    if ( add === undefined) add = 0
                    var th = Math.floor(tm/100)
                    var tm = parseInt(tm.slice(-2))+add
                    if (tm>59) { 
                        tm %= 60
                        th += 1
                    }
                    if (th>23) {
                        th %= 24
                        d += 1
                    }
                    return new Date(1970,0,d,th,tm)
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

                // copy from the team schedule data to d3-compatible data array
                var daywidth = {}
                var data = []
                _.each(scope.schedule.teamsched,function(tmo,tm) {
                    var oo = { team: tm, slots: [] }
                    _.each(tmo, function(sl,d) {
                        var ts = _.keys(sl)
                        var fieldmatch = _.filter(ts,function(ssl) { 
                            return sl[ssl] == scope.field } )
                        if ( fieldmatch.length>0 ) {
                            var sla = fieldmatch;
                            var nsl = {day: d,
                                       from: convert_time(sla[0]),
                                       to: convert_time(sla[sla.length-1],30),
                                       slot: 1
                                      }

                            // determine if schedules overlap and shift slots
                            // accordingly
                            while( slot_clashes( nsl, data ) ) {
                                nsl.slot++;
                            }
                            if ( daywidth[d] == undefined || daywidth[d] < nsl.slot ) daywidth[d] = nsl.slot
                            oo.slots.push(nsl)
                        }
                    });
                    if ( oo.slots.length > 0 ) data.push(oo);
                });


                console.log("FIELD IS ",scope.field)
                console.log(data)

                var teams = svg.selectAll("g.team")
                    .data(data,function(d) { return d.team; })
                ;

                var colors = d3.scale.category20();

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
                                var slotbor = rb/5
                                var slotw = (rb-2*slotbor)/daywidth[slot.day]
                                var sloth = tScale(slot.to)-tScale(slot.from);
                                var xx = xScale(slot.day)+slotbor+(slot.slot-1)*slotw;
                                g.append('svg:rect')
                                    .attr('x',function(slot) { return xx } )
                                    .attr('y',function(slot) { return tScale(slot.from) } )
                                    .attr('width', function(slot) { return slotw })
                                    .attr('height', function(slot) { return sloth; })
                                    .attr('style', 
                                          function(slot) { 
                                              return "fill: "+colors(i); })
                                
                                var tt = g.append('svg:g')
                                    .attr("transform", "translate("+[xx,tScale(slot.to)].join(",")+") rotate(-90)")
                                    .append('svg:foreignObject')
                                    .attr('width', sloth)
                                    .attr('height', slotw)

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
                                    .text(format_team(team.team))
                            });
                    })
                                  
                
            }
        }
    })
;
