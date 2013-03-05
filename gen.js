var prog = require('commander');
var _ = require('underscore');
var fs = require('fs');
var exec = require('child_process').exec,
    child;
var colors = require('colors')
        ,winston = require("winston")
        ,sprintf = require("sprintf").sprintf

var jade = require('jade')

prog
    .version('0.0.1')
    .option('-f, --format <format>','Output Format')
    .option('-l, --loglevel <level>',"Set the loglevel for console output [info]","info")
    .option('-o, --output <file>',"File to output results to",null)
    .option('-t, --timestep <int>',"Size of time block size to us <30 minutes>",30)
    .option('-e, --echo', "Echo the program and results to stdout",false)
    .parse(process.argv)

var outstream = process.stdout
if ( prog.output ) outstream = fs.createWriteStream(prog.output)

logger = new (winston.Logger)({
    transports: [
	new (winston.transports.Console)(
            { colorize: true, level: prog.loglevel })
    ]
});
// set so loglevel ordering makes sense.
logger.setLevels(winston.config.syslog.levels);  

logger.info("LOGLEVEL IS "+prog.loglevel);

var workweek = ["mo", "tu", "we", "th", "fr"]
var weekend = ["sa","su"]
var week = _.union(workweek,weekend);

var conf = JSON.parse(fs.readFileSync(prog.args[0],'utf8'));

var fn = jade.compile(fs.readFileSync('fieldtablevert.jade','utf8'),{pretty:true});

var teams = conf.teams;
var fields = conf.fields;

// automatically create nested assoc array if keys don't yet exist...ala perl
function nested() {
    var args = _.values(arguments);
    var v = args.shift()
    var aa = args.slice(0,-2)
    var arg;
    while( arg = aa.shift() ) {
        if ( v[arg] === undefined ) { v[arg] = {} }
        v = v[arg]
    }
    aa = args.slice(-2)
    if ( aa.length == 2 ) {
        v[aa[0]] = aa[1];
    } else {
        logger.error("ERROR SHIFTING NESTED")
    }
}
function nested_push() {
    var args = _.values(arguments);
    var v = args.shift()
    var aa = args.slice(0,-2)
    var arg;
    while( arg = aa.shift() ) {
        if ( v[arg] === undefined ) { v[arg] = {} }
        v = v[arg]
    }
    aa = args.slice(-2)
    if ( aa.length == 2 ) {
        if ( v[aa[0]] === undefined ) { v[aa[0]] = [] }
        v[aa[0]].push( aa[1] );
    } else {
        logger.error("ERROR SHIFTING NESTED")
    }
}



function float_time(t) {
    var hr = Math.floor(t / 100);
    var mn = t % 100;
    if (mn > 60) { logger.error("INVALID TIME"); return -1; }
    else return hr + mn/60.0;
}
function int_time(t) {
    var hr = Math.floor(t);
    var mn = Math.round((t-hr)*60);
    logger.debug("IT: %f,%f,%f",t,hr,mn);
    return hr*100+mn;
}

function fill_times(arro) {
    if ( arro[0] instanceof Array ) {
        // arro is array of time ranges, recursively expand these
        return _.flatten(_.union(_.map(arro,function(a) { return fill_times(a); })))
    }
    tarr = _.map(arro,function(t) { return t === 'dusk' ? 2100 : t; }) // convert dusk keyword to late
    var ltime = _.min(tarr)
    var htime = _.max(tarr)
    var ttimes = [];
    if ( ( (htime%100) % prog.timestep ) != 0 ) {
        logger.warning("Field preferences time specified ("+htime+") is not aligned with the timestep ("+prog.timestep+")" )
    }
    for( t = Math.floor(ltime/100)+(ltime%100)/60; t < Math.floor(htime/100)+(htime%100)/60; t += prog.timestep/60 ) {
        ttimes.push(Math.floor(t)*100+(t%1)*60)
    }
    return ttimes;
}

function merge_times(arro) {
    var arr = _.map(arro, function(t) { return float_time(t); });
    logger.debug(arr.join(","));
    var tt;
    var lt;
    var tts = [];
    var used = [];
    for( tt = arr.shift(); 
         lt == undefined || tt == lt+prog.timestep/60; 
         lt=tt,tt = arr.shift() ) {
        logger.debug("MERGING TIME "+lt+","+tt)
        tts.push(tt);
        used.push(float_time(arro.shift()));
    }
    return int_time(used[0]) + "--" + int_time(used[used.length-1]+prog.timestep/60);
}

function format_request(req) {
    return _.map( _.keys(req), function(d) { return d + " " + merge_times(req[d]) } ).join(", ")
}

function format_team(tm) {
        return tm.split("X").join("/").split("_").join(" ")
}

function format_field(f) {
    return conf.fields && conf.fields[f] ? conf.fields[f].pretty : f;
}


// SETUP

// add dummy request
_.each(conf.teams, function(tmo,tm) {
    if ( tmo.req.length == 0 || _.keys(tmo.req[tmo.req.length-1]).length !== 0 ) {
        // last request for this team is not {}
        // push a dummy on there
        tmo.req.push({})
    }
})

// expand times for team requests
_.each(conf.teams,function(tmo,tm) { 
    _.each(tmo.req, function(r) {
        _.each(_.keys(r), function(d) {
            r[d] = fill_times(r[d])
        });
    });
});

// expand times for field slots
_.each(conf.fields,function(fo,f) {
    _.each(fo.slots, function(dayo,d) {
        if ( dayo.length > 0 && dayo[0] instanceof Array ) {
            fo.slots[d] = _.flatten(_.union(_.map(dayo, function (tt) { return fill_times(tt) })))
        } else 
            fo.slots[d] = fill_times(dayo);
    });
});



// spawn lp_solve
child = exec('lp_solve',function(err,stdout,stderr) {
    var cnt = 0;
    var times = {}
    var wetimes = {}
    var sched = {}
    var teams = {}
    var choices = {}
    if ( err ) {
        throw new Error(err);
    }
    var errs = stderr.split("\n");
    if ( errs ) {
        _.each(errs, function(line) {
            logger.debug("ERRORS".red)
            logger.debug(line.red)
        });
    }
    _.each(stdout.split(/\n/), function(line) {
        if ( prog.echo ) console.log(line)
        var m
        if ( m = line.match(/^\s*$/)) {}
        else if ( m = line.match(/Value of the objective function:/) ) {}
        else if ( m = line.match(/Actual values/) ) {}
        else if ( m = line.match(/(\w+)\s+(\d+)/) ) {
            d = 0
            t = 0
            var det = m[1].split(/_/)
            //[team,coach,of,d,t] = 
            var mm;
            if ( det[2] && ( mm = det[2].match(/^o(\d)/) ) && m[2] === "1" ) {
                // selection
                nested(choices,[det[0],det[1]].join("_"),mm[1])
            }
            else if ( det[3] && det[4] && m[2] == 1 ) {
                var tm = [det[0],det[1]].join("_");
                var f = det[2]
                var d = det[3]
                var t = det[4]
                nested_push(sched,f,d,t, tm)
                nested(teams,tm,d,t, f)
                if ( false && (d === "sa" || d === "su") ) {
                    wetimes[t] = 1
                } else {
                    times[t] = 1
                }
            }
        }
    });


    // fill out the times
    _.each(_.values(conf.fields),function(fd) {
        _.each(week,function(d) {
            _.each(fd.slots[d], function(t) {
                times[t] = 1;
            });
        })
/*
        _.each(["sa","su"],function(d) {
            _.each(fd.slots[d], function(t) {
                wetimes[t] = 1;
            });
        })
*/
    });

    // push in other leagues
    _.each(_.keys(conf.others), function(tm) {
        _.each(_.keys(conf.others[tm]), function(f) {
            _.each(_.keys(conf.others[tm][f]),function(d) {
                var tt = fill_times(conf.others[tm][f][d])
                _.each(tt,function(t) {
                    nested_push(sched,f,d,t,tm)
                    nested_push(teams,tm,d,t,f)
                    if ( d === "sa" || d === "su" ) {
                        wetimes[t] = 1
                    } else {
                        times[t] = 1
                    }
                });
            })
        });
    });

    if ( prog.format === "field" ) {
        outstream.write("FIELD SCHEDULES\n")
        var dorder = { mo:1, tu:2, we:3, th:4, fr:5, sa:6, su:7 };
        // loop over fields in the schedule
        _.each(_.keys(sched),function(f) { 
            outstream.write(sprintf("\t%s:\n",format_field(f)));

            // loop over days in the schedule for the field (sorted by week order)
            _.each(_.sortBy(_.keys(sched[f]), function(k) { return dorder[k]; }), function(d) {

                // sort the allocated field times for this day
                var tarr = _.sortBy(_.keys(sched[f][d]),function(t) { return parseInt(t); })

                _.each(tarr, function(t) {
                    outstream.write(sprintf("\t\t%s @ %s is %s\n", d, t, _.map(sched[f][d][t],function(c) { return format_team(c) }).join(", ")));
                    if ( false && ( d === "sa" || d === "su") ) {
                        wetimes[t] = 1
                    } else {
                        times[t] = 1
                    }
                });
            });
        });
    } else if ( prog.format === "team" ) {
        outstream.write("TEAM SCHEDULES\n")
        var dorder = { mo:1, tu:2, we:3, th:4, fr:5, sa:6, su:7 };
        _.each(_.keys(teams),function(tm) {
            outstream.write(sprintf("\t%s: choice %s\n",format_team(tm),choices[tm]/*,format_request(conf.teams[tm].req[choices[tm]-1])*/))
            _.each(_.sortBy(_.keys(teams[tm]),function(k) { return dorder[k] }), function(d) {
                var tarr = _.sortBy(_.keys(teams[tm][d]),function(t) {return parseInt(t);})
                while( tarr.length > 0 ) {
                    t = tarr[0]
                    var ts = merge_times(tarr);
                    outstream.write(sprintf("\t\t%s from %s @ %s\n",d,ts,format_field(teams[tm][d][t])))
                    if ( false && ( d === "sa" || d === "su" ) ) {
                        wetimes[t] = 1
                    } else {
                        times[t] = 1
                    }
                }
            });
        });
    } else if ( prog.format === "json" ) {
        ccnt = 0;
        tt = _.map(_.keys(conf.teams), function(tm) { return {name:tm, color:colors[ccnt++]} });
        var stimes = _.map(_.keys(times), function(t) { return parseInt(t); });
        ttimes = fill_times(stimes);
        outstream.write(JSON.stringify(
            {times:ttimes, 
             days:week, sched:sched,
             teams:tt,
             teamsched: teams,
             fields:conf.fields,
             _: _,
             format_team: format_team,
             format_field: format_field
            },null,4));
        
    } else if ( prog.format === "html" ) {

        colors = [ "red", "blue", "green", "orange", "cyan", "magenta" ]

        ccnt = 0;
        tt = _.map(_.keys(conf.teams), function(tm) { return {name:tm, color:colors[ccnt++]} });
        var stimes = _.map(_.keys(times), function(t) { return parseInt(t); });
        ttimes = fill_times(stimes);
        outstream.write(fn({times:ttimes, 
                            days:week, sched:sched,
                            teams:tt,
                            fields:conf.fields,
                            _: _,
                            format_team: format_team,
                            format_field: format_field
                           }))
    } else {
        logger.warning( "SOLVED, but no output format specified" );
    }
    _.each(_.difference(_.keys(conf.teams),_.keys(teams)),function(tm){
        logger.warning("%s is UNALLOCATED",format_team(tm));
        var opts = conf.teams[tm].req.slice(0,-1)
        if ( opts.length === 0 ) logger.warning("\tNO OPTIONS PROVIDED")
        _.each(opts, function(opt,i) {
            logger.warning("\toption "+(i+1)+": "+
                           _.map(_.keys(opt), function(d) { return d+" "+merge_times(_.clone(opt[d])) }).join(", ")
                          );
            // look at other team allocations for conflicts
            var conflicts = []
            _.each(_.keys(teams),function(otm) {
                // loop over days in option
                _.each(_.keys(opt), function(d) {
                    var dts = opt[d];
                    if ( teams[otm][d] ) {
                        var tarr = _.map( _.keys(teams[otm][d]), function( t ) { return parseInt(t) })
                        var intr = _.intersection(tarr, opt[d])
                        if ( intr.length > 0 ) conflicts.push( { team: otm, day: d, slot: merge_times(tarr), field: _.unique(_.values(teams[otm][d])).join(", ") } );
                    }
                });
            });
            _.each(conflicts, function(c) {
                logger.warning("\t\tconflicts with: "+format_team(c.team)+" on "+c.day+" @ "+format_field(c.field)+": "+c.slot);
            });
        })
            })
    
})


var bvars = {};
var ivars = {}

function bvar() {
    var args = _.values(arguments)
    var tm = args[0]
    var t = teams[tm]
    var f = args[1]
    var v = args.join("_")
    var pri = -1
    if ( t && t.fpref ) {
        pri = t.fpref.indexOf(f)+1
    }
    if (pri<1) pri = t.fpref.length;
    bvars[v] = pri
    return v;
}

function ivar() {
    var args = _.values(arguments)
    var tm = [args[0],args[1]].join("_")
    var t = teams[tm]
    var f = args[2]
    var v = args.join("_")
    var pri = -1
    if ( t && t.fpref ) {
        pri = t.fpref.indexOf(f.slice(0,-1)) 
    }
    if (pri<0) pri = 1;
    ivars[v] = pri
    return v;
}

function emit(str) {
    if ( prog.echo ) process.stdout.write(str);
    child.stdin.write(str);
}

// objective
emit("min: 0.00001 bvarsum\n");
_.each(_.keys(teams),function(tm) {
    var pri = 1;
    _.each(_.keys(teams[tm].req), function(o) {
        var mult = 1;
        if ( pri === teams[tm].req.length ) mult = 100;
        emit(" + "+(mult*pri)+" "+bvar(tm,"o"+pri))
        pri++
    });
    emit("\n")
});
emit(";\n")


emit("/* Must pick one option for each team */\n");
_.each(_.keys(teams),function(tm) {
    var pri = 0
    emit(_.map(_.keys(teams[tm].req),function(o) { 
        pri++; return bvar(tm, "o"+pri)
    }).join(" + ")+" = 1;\n" );
});

function field_is_avail(f,d,t) {
    return _.find(fields[f].slots[d], function(tt) { 
        return tt === t 
    }) != undefined
}

var invalid = []
var unreq = []

emit( "\n/* team options */" );
_.each(_.keys(teams), function(tm) {
    var pri = 1
    _.each(_.keys( teams[tm].req ), function(o) {
        // allow exactly one option to be chosen
        emit( "\n"+bvar(tm,"o"+pri)+" = "+_.map(_.keys(fields), function(f) {
            return bvar(tm,"o"+pri,f)
        }).join("+")+";\n")

        // require all slots for a particular option to be used if the option is selected
        var gslots = []
        _.each(_.keys(fields), function(f) {
            var dd = _.keys(teams[tm].req[pri-1])
            var tot = 0
            var slots = []
            _.each(dd,function(d) {
                var times = teams[tm].req[pri-1][d]
                tot += times.length
                slots.push( _.map(times,function(t) { return bvar(tm,f,d,t) }) )

                // filter for invalid variables that we will forcefully disallow
                var iv = _.map(_.filter(times,function(t) { return !field_is_avail( f, d, t ) }),
                      function(t) {
                          return bvar(tm,f,d,t)
                      })
                if (iv.length > 0) { invalid.push( iv ) }
                                                      
            });
            if ( tot ) {
                emit(tot+" "+bvar(tm,"o"+pri,f)+" = "+_.flatten(slots).join(" + ")+";\n");
            }

        });
        
        pri++;
    })
});

emit("\n/* DON'T OVERBOOK FIELDS */");
_.each(_.keys(fields), function(f) {
    _.each(_.keys(fields[f].slots), function(d) {
        _.each(fields[f].slots[d], function(t) {
            emit( "\n" )
            emit( ivar(f,d,t)+" <= "+(field_is_avail( f, d, t )?fields[f].cap+0.5:0)+";\n" )
            emit( ivar(f,d,t)+" = " )
            emit( _.map(_.keys(teams), function(tm) { return bvar(tm,f,d,t) } ).join(" + ") );
            emit( ";\n" )
        });
    });
});

emit("\n/* CREATE BVAR SUM */\n")
emit("bvarsum = " + _.map(_.keys(bvars),function(v) { return bvars[v]+" "+v; }).join( " + " ) + ";")

if ( invalid.length ) {
    emit( "\n\n/* ZERO THE DISALLOWED TIMES */\n" );
    emit( _.flatten(invalid).join(" + " )+" = 0;");
}
if ( unreq.length ) {
    emit( "\n\n/* ZERO THE UNREQUESTED TIMES */\n" );
    emit( _.flatten(unreq).join(" + " )+" = 0;");
}


// dump binary variables
emit( "\n\n/* BINARY VARS */" );
emit( "\nbin "+_.keys(bvars).join(", ")+";\n");

// dump binary variables
emit( "\n\n/* INTEGER VARS */" );
emit( "\nint "+_.keys(ivars).join(", ")+";\n");

child.stdin.end();
