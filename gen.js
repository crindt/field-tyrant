var prog = require('commander');
var _ = require('underscore');
var fs = require('fs');
var exec = require('child_process').exec,
    child;

var jade = require('jade')

prog
    .version('0.0.1')
    .option('-f, --format <format>','Output Format')
    .parse(process.argv)

var conf = JSON.parse(fs.readFileSync(prog.args[0],'utf8'));

var fn = jade.compile(fs.readFileSync('fieldtable.jade','utf8'),{pretty:true});

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
        console.log("ERROR SHIFTING NESTED")
    }
}


function float_time(t) {
    var hr = Math.floor(t / 100);
    var mn = t % 100;
    if (mn > 60) { console.log("INVALID TIME"); return -1; }
    else return hr + mn/60.0;
}
function int_time(t,doit) {
    var hr = Math.floor(t);
    var mn = Math.round((t-hr)*60);
    if ( doit ) console.log("IT: %f,%f,%f",t,hr,mn);
    return hr*100+mn;
}


function merge_times(arro,doit) {
    var arr = _.map(arro, function(t) { return float_time(t); });
    if ( doit ) console.log(arr.join(","));
    var tt;
    var lt;
    var tts = [];
    var used = [];
    for( tt = arr.shift(); 
         lt == undefined || tt == lt+0.5; 
         lt=tt,tt = arr.shift() ) {
        if ( doit ) console.log("MERGING TIME "+lt+","+tt)
        tts.push(tt);
        used.push(float_time(arro.shift()));
    }
    return int_time(used[0],doit) + "--" + int_time(used[used.length-1]+0.5,doit);
}

// spawn lp_solve
child = exec('lp_solve',function(err,stdout,stderr) {
    var cnt = 0;
    var times = {}
    var wetimes = {}
    sched = {}
    teams = {}
    _.each(stdout.split(/\n/), function(line) {
        var m
        if ( m = line.match(/^\s*$/)) {}
        else if ( m = line.match(/Value of the objective function:/) ) {}
        else if ( m = line.match(/Actual values/) ) {}
        else if ( m = line.match(/(\w+)\s+(\d+)/) ) {
            d = 0
            t = 0
            var det = m[1].split(/_/)
            //[team,coach,of,d,t] = 
            if ( det[3] && det[4] && m[2] == 1 ) {
                nested(sched,det[2],det[3],det[4], [det[0],det[1]].join(" "))
                nested(teams,[det[0],det[1]].join("_"),det[3],det[4], det[2])
            }
        }
    });

    // push in other leagues
    _.each(_.keys(conf.others), function(tm) {
        _.each(_.keys(conf.others[tm]), function(f) {
            _.each(_.keys(conf.others[tm][f]),function(d) {
                _.each(_.values(conf.others[tm][f][d]),function(t) {
                    nested(sched,f,d,t,tm)
                    nested(teams,tm,d,t,f)
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
        console.log("FIELD SCHEDULES")
        var dorder = { mo:1, tu:2, we:3, th:4, fr:5, sa:6, su:7 };
        _.each(_.keys(sched),function(f) {
            console.log("\t%s:",f);
            _.each(_.sortBy(_.keys(sched[f]), function(k) { return dorder[k]; }), function(d) {
                var tarr = _.sortBy(_.keys(sched[f][d]),function(t) { return parseInt(t); })
                while( tarr.length > 0 ) {
                    t = tarr[0]
                    var ts = merge_times(tarr);
                    console.log("\t\t%s from %s is %j",d,ts,sched[f][d][t])
                    if ( d === "sa" || d === "su" ) {
                        wetimes[t] = 1
                    } else {
                        times[t] = 1
                    }
                }
            });
        });
    } else if ( prog.format === "team" ) {
        console.log("TEAM SCHEDULES")
        _.each(_.keys(teams),function(tm) {
            console.log("\t%s:",tm)
            _.each(_.sortBy(_.keys(teams[tm]),function(k) { return dorder[k] }), function(d) {
                var tarr = _.sortBy(_.keys(teams[tm][d]),function(t) {return parseInt(t);})
                while( tarr.length > 0 ) {
                    t = tarr[0]
                    var ts = merge_times(tarr);
                    console.log("\t\t%s from %s @ %s",d,ts,teams[tm][d][t])
                    if ( d === "sa" || d === "su" ) {
                        wetimes[t] = 1
                    } else {
                        times[t] = 1
                    }
                }
                /*
                  _.each(_.keys(teams[tm][d]).sort(), function(t) {
                  console.log("%s @ %d is %s",d,t,teams[tm][d][t])
                  })
                */
            });
        });
    } else if ( prog.format === "html" ) {

        console.log(fn({times:_.keys(times), 
                        days:["mo","tu","we","th","fr"], sched:sched}))
        console.log(fn({times:_.keys(wetimes), 
                        days:["sa","su"], sched:sched}))

    } else {
        console.log( "SOLVED, but no output format specified" );
    }
    
})


var bvars = {};

function bvar() {
    var v = _.values(arguments).join("_")
    bvars[v]++;
    return v;
}

// objective
child.stdin.write("min: 0\n");
_.each(_.keys(teams),function(tm) {
    var pri = 1;
    _.each(_.keys(teams[tm]), function(o) {
        child.stdin.write(" + "+pri+" "+bvar(tm,"o"+pri))
        pri++
    });
    child.stdin.write("\n")
});
child.stdin.write(";\n")


child.stdin.write("/* Must pick one option for each team */\n");
_.each(_.keys(teams),function(tm) {
    var pri = 0
    child.stdin.write(_.map(_.keys(teams[tm]),function(o) { 
        pri++; return bvar(tm, "o"+pri)
    }).join(" + ")+" = 1;\n" );
});

function field_is_avail(f,d,t) {
    return _.find(fields[f][d], function(tt) { 
        return tt === t 
    }) != undefined
}

var invalid = []

child.stdin.write( "\n/* team options */" );
_.each(_.keys(teams), function(tm) {
    var pri = 1
    _.each(_.keys( teams[tm] ), function(o) {
        child.stdin.write( "\n"+bvar(tm,"o"+pri)+" = "+_.map(_.keys(fields), function(f) {
            return bvar(tm,"o"+pri,f)
        }).join("+")+";\n")

        _.each(_.keys(fields), function(f) {
            var dd = _.keys(teams[tm][pri-1])
            var tot = 0
            var slots = []
            _.each(dd,function(d) {
                var times = teams[tm][pri-1][d]
                tot += times.length
                slots.push( _.map(times,function(t) { return bvar(tm,f,d,t) }) )
                iv = _.map(_.filter(times,function(t) { return !field_is_avail( f, d, t ) }),
                      function(t) {
                          return bvar(tm,f,d,t)
                      })
                if (iv.length > 0) { invalid.push( iv ) }
            });
            if ( tot ) {
                child.stdin.write(tot+" "+bvar(tm,"o"+pri,f)+" = "+_.flatten(slots).join(" + ")+";\n");
            }
        });
        pri++;
    })
});



child.stdin.write("\n/* DON'T OVERBOOK FIELDS */");
_.each(_.keys(fields), function(f) {
    _.each(_.keys(fields[f]), function(d) {
        _.each(_.keys(fields[f][d]), function(t) {
            child.stdin.write( "\n" )
            child.stdin.write( bvar(f,d,t)+" <= "+(field_is_avail( f, d, t )?1.5:0)+";\n" )
            child.stdin.write( bvar(f,d,t)+" = " )
            child.stdin.write( _.map(_.keys(teams), function(tm) { return bvar(tm,f,d,t) } ).join(" + ") );
            child.stdin.write( ";\n" )
        });
    });
});

if ( invalid.length ) {
    child.stdin.write( "\n/* ZERO THE DISALLOWED TIMES */\n" );
    child.stdin.write( _.flatten(invalid).join(" + " )+" = 0;");
}


// dump binary variables
child.stdin.write( "\n/* BINARY VARS */" );
child.stdin.write( "\nbin "+_.keys(bvars).join(", ")+";\n");

child.stdin.end();