var prog = require('commander');
var _ = require('underscore');
var fs = require('fs');
var spawn = require('child_process').spawn,
child;
var colors = require('colors')
,winston = require("winston")
,sprintf = require("sprintf").sprintf
var util = require('util')

var jade = require('jade')

prog
  .version('0.0.1')
  .option('-f, --format <format>','Output Format')
  .option('-l, --loglevel <level>',"Set the loglevel for console output [info]","info")
  .option('-i, --input <file>',"File to read schedule from",null)
  .option('-o, --output <file>',"File to output results to",null)
  .option('-t, --timestep <int>',"Size of time block size to us [30 minutes]",30)
  .option('-e, --echo', "Echo the program and results to stdout [false]",false)
  .option('-b, --bvarweight <float>', "Weight to apply to the sum of binary variables in the objective [10000]", 10000)
  .option('-i, --ivarweight <float>', "Weight to apply to the sum of binary variables in the objective [0.00001]", 0.001)
  .option('-u, --usedsumweight <float>', "Weight to apply to the sum of binary variables in the objective [9999]", 9999)
  .option('-s, --prioritizespread', "Make spreading teams more important than individual priority [true]", true)
  .option('-x, --force <string>', "Comma separated list of variables to force to be 1", null)
  .option('-a, --always-feasible', "Set up dummy options to always admit feasibility", true)
  .option('-p, --limit-to-prefs', "Limit allocations only to preferred fields",false)
  .option('-c, --prefer-comp', "Give comp teams slightly more importance",false)
  .option('-d, --dusk <n>', "Dusk time [2100]",2100)
  .parse(process.argv)

if ( prog.prioritizespread && !prog.bvarweight && !prog.ivarweight ) {
  prog.bvarweight = prog.bvarweight / 10000000.0;
  prog.usedsumweight = prog.usedsumweight / 10000000.0;
}

var outstream = process.stdout
if ( prog.output ) outstream = fs.createWriteStream(prog.output)

var dorder = { mo:1, tu:2, we:3, th:4, fr:5, sa:6, su:7 };


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

var conf = JSON.parse(fs.readFileSync(prog.input || '/dev/stdin','utf8').toString());

var teams = conf.teams;
var coaches = {}
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
function nested_unshift() {
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
    console.log('wowee',v)
    v[aa[0]].unshift( aa[1] );
    console.log('wowee2',v)
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
  tarr = _.map(arro,function(t) { return t === 'dusk' ? parseInt(prog.dusk) : t; }) // convert dusk keyword to late
  tarr = _.map(tarr,function(t) { return t === 'close' ? 2100 : t; }) // convert dusk keyword to late
  var ltime = _.min(tarr)
  var htime = _.max(tarr)
  var ttimes = [];
  if ( ( (htime%100) % prog.timestep ) != 0 ) {
    logger.warning("Field preferences time specified ("+htime+") is not aligned with the timestep ("+prog.timestep+"): "+((htime%100) % prog.timestep) )
    throw new Error("Failed on filling times: "+JSON.stringify(tarr))
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
  if ( f instanceof Array ) 
    return _.map(f,function(ff) { return format_field(ff) }).join(", ")
  return conf.fields && conf.fields[f] ? conf.fields[f].pretty : f;
}


// SETUP

// add dummy request
_.each(conf.teams, function(tmo,tm) {
  if ( prog.alwaysFeasible && ( tmo.req.length == 0 || _.keys(tmo.req[tmo.req.length-1]).length !== 0 )) {
    // last request for this team is not []
    // push a dummy on there
    tmo.req.push([])
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



// spawn lp_solve.  It will listen on child.stdin until we write the program to
// it and close it below
lpopts = prog.args.length ? _.map(prog.args,function(a) { return a.replace(/^--/,"-") }) : ['-presolve']
console.log('lpopts',lpopts)
child = spawn('lp_solve',lpopts)

var allerrs = []
child.stderr.on('data',function(data) {
  var errs = data.split("\n");
  if ( errs ) {
    _.each(errs, function(line) {
      allerrs.push(line)
    });
  }
})

var data = ""

child.stdout.on('data',function(buf) {
  data += buf.toString()
})

function parseResults(data) {
  var cnt = 0;
  var times = {}
  var wetimes = {}
  var sched = {}
  var teams = {}
  var unallocated = {}
  var choices = {}

  // parse the lines of output from lp_solve to get the solution
  _.each(data.split(/\n/), function(line) {
    if ( prog.echo ) console.log(line)
    var m
    if ( m = line.match(/^\s*$/)) {}
    else if ( m = line.match(/infeasible/i) ) {
      console.log("INFEASIBLE!");
      process.exit(1);
    }
    else if ( m = line.match(/Value of the objective function:/) ) {}
    else if ( m = line.match(/Actual values/) ) {}
    else if ( m = line.match(/(\w+)\s+(\d+)/) ) {
      d = 0
      t = 0
      var det = m[1].split(/_/)
      //[team,coach,of,d,t] = 
      var mm;
      if ( det[2] && ( mm = det[2].match(/^o(\d)/) ) && m[2] === "1" ) {
        // store the selected choice (option/request) for each time
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
  _.each(conf.others, function(tmo,tm) {
    _.each(tmo, function(fo,f) {
      _.each(fo,function(dayo,d) {
        var tt = fill_times(dayo)
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



  // Add some diagnostics for unallocated teams to the output
  _.each(_.difference(_.keys(conf.teams),_.keys(teams)),function(tm){
    logger.warning("%s is UNALLOCATED",format_team(tm));

    var opts = conf.teams[tm].req.slice(0,-1)  // grab all requests except for the dummy
    if ( opts.length === 0 ) logger.warning("\tNO OPTIONS PROVIDED")

    unallocated[tm] = { name: tm,
                        conflicts: [] }

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
            // other team is scheduled on day associated with this option
            // see if it conflicts with this team's requested time
            var tarr = _.map( _.keys(teams[otm][d]), function( t ) { return parseInt(t) })
            var intr = _.intersection(tarr, opt[d])
            if ( intr.length > 0 ) {
              // there is a time intersection, this is a conflict
              conflicts.push( { team: otm, day: d, 
                                slot: merge_times(tarr), 
                                field: _.unique(_.values(_.flatten(teams[otm][d]))).join(", ") } );
            }
          }
        });
      });

      // store so we can send to JSON
      unallocated[tm].conflicts.push( conflicts )

      _.each(conflicts, function(c) {
        logger.warning("\t\tconflicts with: "+format_team(c.team)+" on "+c.day+" @ "+format_field(c.field)+": "+c.slot);
      });
    });
  });


  // OUTPUT THE RESULTS

  if ( prog.format === "field" ) {

    outstream.write("FIELD SCHEDULES\n")
    // loop over fields in the schedule
    _.each(sched,function(fo,f) { 
      outstream.write(sprintf("\t%s:\n",format_field(f)));

      // loop over days in the schedule for the field (sorted by week order)
      _.each(_.sortBy(_.keys(fo), function(k) { return dorder[k]; }), function(d) {

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

    // each team
    _.each(teams,function(tmo,tm) {
      outstream.write(sprintf("\t%s: choice %s\n",format_team(tm),choices[tm]))

      // each day
      _.each(_.sortBy(_.keys(teams[tm]),function(k) { return dorder[k] }), function(d) {

        // convert times to integers
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
    // force fields
    _.each(_.keys(conf.fields),
           function(f) { if ( !sched[f] ) sched[f] = {} });
    outstream.write(JSON.stringify(
      {times:ttimes, 
       days:week, sched:sched,
       teams:tt,
       teamsched: teams,
       fields:conf.fields,
       unallocated:unallocated,
       timestep:prog.timestep
      },null,4));

  } else {
    logger.warning( "SOLVED, but no output format specified" );
  }

}

// Check the child's exit code for errors
child.on("close",function(code) {

  parseResults(data)

  setTimeout(function() {
    if ( code ) logger.error("lp_solve process exited with ERROR: "+code)
    if ( allerrs.length ) logger.debug("ERRORS".red)
    _.each(allerrs,function(line) {
      logger.debug(line.red)
    })},2000)
})

// Handle any process exceptions (e.g., a broken pipe if the child dies)
process.on('uncaughtException', function(err) {
  logger.error(util.inspect(err));
  logger.error(err.stack);
  setTimeout(process.exit, 3000)   // let messages clear before exiting
});


// hashes to store variable names
var bvars = {};
var ivars = {}
var vars = {}

// return a binary variable, store the name for later def in the program
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
  if ( ivars[v] !== undefined ) {
    throw new Exception( "Variable "+v+" defined as both a binary variable and an integer variable" )
  }
  bvars[v] = pri
  return v;
}

function rawbvar () {
  var args = _.values(arguments)
  var v = args.join("_");
  bvars[v] = 1;
  return v;
}

function rawvar () {
  var args = _.values(arguments)
  var v = args.join("_");
  vars[v] = 1;
  return v;
}

// return a integer variable, store the name for later def in the program
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
  if ( bvars[v] !== undefined ) {
    throw new Exception( "Variable "+v+" defined as both an integer variable and a binary variable" )
  }
  ivars[v] = pri
  return v;
}


// wrap file i/o so we can send it multiple places
function emit(str) {
  if ( prog.echo ) process.stdout.write(str);
  child.stdin.write(str);
}

// get unique coaches ( assume teams are "([GB]U\d+) ([^\s]+)" where $2 is the coach name
_.each(_.keys(teams), function(tm) {
  var m = /([GB]U\d+)_([^\s]+)/.exec(tm);
  if ( m && m[2] ) {
    if ( !coaches[m[2]] ) coaches[m[2]] = { teams: [] }
    coaches[m[2]].teams.push(tm);
  }
})

// emit objective
emit("min: "+prog.bvarweight+" bvarsum - "+(prog.usedsumweight)+" usedsum\n");
_.each(teams,function(tmo,tm) {
  var pri = 1;
  _.each(_.keys(tmo.req), function(o) {

    // the last request ( the dummy ) will have a high cost
    var mult = 1;
    var tpri = pri
    if ( prog.alwaysFeasible && tpri === tmo.req.length ) mult = _.keys(teams).length*1000000;  // last option is dummy
    //else if ( tpri > 1 ) 
      //tpri = 1+tpri/100

    //emit(" + "+(mult*tpri/pri)+" "+bvar(tm,"o"+pri))
    //emit(" + "+(mult*tpri)+" "+bvar(tm,"o"+pri))

    // explode options to weight by field preference (if any)
    emit(" + "+_.map(_.keys(fields), function(f) {
      // weight by field preference order
      var fpri 
      if ( (fpri = tmo.fpref.indexOf(f)) < 0 ) fpri = tmo.fpref.length
      fpri++
      return mult*(((tpri-1)*10)+fpri) + " " + bvar(tm,"o"+pri,f)
    }).join("+"))

    pri++
  });
  emit("\n")
});
emit(";\n")


// There be constraints below... 

function field_is_avail(f,d,t) {
  return _.find(fields[f].slots[d], function(tt) { 
    return tt === t 
  }) != undefined
}

var invalid = []
var unreq = []

emit( "\n/* team options */" );
_.each(_.keys(teams), function(tm) {
  var to = teams[tm]
  var pri = 1
  _.each(_.keys( teams[tm].req ), function(o) {
    // allow exactly one option to be chosen
    emit( "\n"+bvar(tm,"o"+pri)+" = "+_.map(_.keys(fields), function(f) {
      return  bvar(tm,"o"+pri,f)
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
        // if the field is not available at that day and time
        var iv = _.map(_.filter(times,function(t) { return !field_is_avail( f, d, t ) }),
                       function(t) {
                         return bvar(tm,f,d,t)
                       })
        if (iv.length > 0) { invalid.push( iv ) }
        
      });
      if ( tot ) {
        emit(tot+" "+bvar(tm,"o"+pri,f)+" < "+_.flatten(slots).join(" + ")+";\n");
      }

    });
    
    pri++;
  })
    });

function tdem(tm) {
  return teams[tm].dem || 1
}

emit("\n\n/* DON'T OVERBOOK FIELDS */");
_.each(_.keys(fields), function(f) {
  _.each(_.keys(fields[f].slots), function(d) {
    _.each(fields[f].slots[d], function(t) {
      emit( "\n" )
      emit( ivar(f,d,t)+" >= " )
      emit( _.map(_.keys(teams), function(tm) { return tdem(tm)+" "+bvar(tm,f,d,t) } ).join(" + ") );
      emit( ";\n" )
      emit( ivar(f,d,t)+" <= "+(field_is_avail( f, d, t )?fields[f].cap+0.5:0)+";\n" )
    });
  });
});


if ( prog.limitToPrefs ) {
  emit("\n\n/* DISALLOW NON-PREFERRED FIELDS */\n");
  _.each(teams,function(to,tm) {
    var notfields = _.difference(_.keys(fields), to.fpref);
    _.each(notfields,function(f) {
      emit(_.map(to.req,function(r,prim) {return bvar(tm,"o"+(prim+1),f)}).join(" + ")+" = 0;\n")
    });
  });
}

emit("\n\n/* MINIMIZE IDLE FIELD SLOTS (MAXIMIZE SPREAD) */\n")
_.each(_.keys(fields), function(f) {
  _.each(_.keys(fields[f].slots), function(d) {
    _.each(fields[f].slots[d], function(t) {
      emit(rawvar("used",f,d,t) + " < " + _.map( _.keys(teams), function(tm) { return bvar(tm,f,d,t)} ).join( " + " ) + ";\n")
      emit(rawvar("used",f,d,t) + " < 1;\n")
    });
  });
});

emit("\n\n/* DISALLOW COACH CONFLICTS */\n")
_.each(coaches, function(co,c) {
  emit("/* COACH "+c+" */\n");
  if ( co.teams.length > 1 ) {
    var ttimes = fill_times([0,2400]);
    _.each(ttimes, function ( t ) {
      _.each(["mo", "tu", "we", "th", "fr"], function(d) {
        var vvs = []
        _.each(fields, function(fo,f) {             // loop over all fields
          if ( field_is_avail( f, d, t ) ) {  /* Only need this constraint if field is available */
            _.each(co.teams, function(tm) {
              vvs.push(bvar(tm,f,d,t))
            });
          }
        });
        if ( vvs.length > 0 ) emit(vvs.join(" + ")+" < 1.5; /* "+[d,t]+" */\n");
      });
    });
  }
})

emit("\n\n/* CREATE used SUM */\n")
emit("usedsum = 0")
_.each(_.keys(fields), function(f) {
  _.each(_.keys(fields[f].slots), function(d) {
    _.each(fields[f].slots[d], function(t) {
      emit(" + "+rawvar("used",f,d,t))
    });
  });
});
emit(";\n")

emit("\n\n/* CREATE BVAR SUM */\n")
emit("bvarsum = " + _.map(
  _.filter(_.keys(bvars),function(k) { return !k.match(/^used/) } ), /* omit "used" variables" */
  function(v) { return bvars[v]+" "+v; }).join( " + " ) + ";")

//emit("\n\n/* CREATE IVAR SUM */\n")
//emit("ivarsum = " + _.map(_.keys(ivars),function(v) { return ivars[v]+" "+v; }).join( " + " ) + ";")

if ( invalid.length ) {
  emit( "\n\n/* ZERO THE DISALLOWED TIMES */\n" );
  emit( _.flatten(invalid).join(" + " )+" = 0;");
}
if ( unreq.length ) {
  emit( "\n\n/* ZERO THE UNREQUESTED TIMES */\n" );
  emit( _.flatten(unreq).join(" + " )+" = 0;");
}



if ( prog.force ) {
  var vv = prog.force.split(",");
  emit( "\n\n/* VARIABLES FORCED */\n" );
  emit( vv.join(" + ") + " > "+(vv.length-0.5)+";\n");
}


// these are at the end because they're ranges
emit("\n\n/* Must pick one option for each team */\n");
_.each(_.keys(teams),function(tm) {
  var pri = 0
  emit('0.5 < '+_.map(_.keys(teams[tm].req),function(o) { 
    pri++; return bvar(tm, "o"+pri)
  }).join(" + ")+" < 1.5;\n" );
});

// dump binary variables
emit( "\n\n/* BINARY VARS */" );
emit( "\nbin "+_.keys(bvars).join(", ")+";\n");

// dump binary variables
emit( "\n\n/* INTEGER VARS */" );
emit( "\nint "+_.keys(ivars).join(", ")+";\n");

// close the stream to child.stdin, this will cause lp_solve to execute and solve
child.stdin.end();
