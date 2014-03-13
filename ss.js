var SS = require('edit-google-spreadsheet')
var async = require('async')

var ts = require('./public/sched/spring-2014-sched.json')
var req = require('./data/spring-2014.json')
var _ = require('underscore')

var others = /(Warner|Encinitas|Softball|Rugby|Lacrosse|Closed)/;

function pad(num, size){ return ('000000000' + num).substr(-size); }

var days = {
  "mo": 0
  ,"tu": 1
  ,"we": 2
  ,"th": 3
  ,"fr": 4
}

var rtnstr = "\\&#xA;"

var longF = {
  lakeU: "Lake (Upper)"
  ,lakeL: "Lake (Lower)"
  ,ada: "Ada"
  ,adaE: "Ada (East)"
  ,adaW: "Ada (West)"
  ,berkS: "Berkich (South)"
  ,berkN: "Berkich (North)"
}

async.waterfall([
  function processAllFields(cb) {
    async.eachSeries(
      _.keys(ts.sched)
      , function processField(ff,cb2) {
        
        var f = longF[ff]

        console.log("Processing field "+f)

        SS.create({
          debug: true,
          username: 'crindt',
          password: 'atavatvthjydmcah',
          spreadsheetName: 'Cardiff Soccer Spring Practice Schedule',
          worksheetName: f,
          callback: sheetReady
        });

        function sheetReady(err,ss) {
          if (err) throw err


          var bcols = 3
          if ( ff.match(/lakeU/i) ) bcols = 5
          console.log(ff,'bcols',bcols)

          //clear
          _.each(_.range(3,14),function(r) {
            _.each(_.range(2,1+bcols*5),function(c) {
              var vv = {}
              vv[r] = {}
              vv[r][c] = ""
              ss.add( vv );
            });
          });

          _.each(_.keys(days), function(d) {
            var col = {}

            // figure out start times and slots for each team
            var starts = {}
            var ends = {}
            _.each(ts.sched[ff][d],function(s,t) {
              _.each(s, function(tm) {
                var ti = parseInt( t.substring(0,2) ) + parseInt( t.substring(2) )/60;
                var r = ti*2-30+3
                if ( starts[tm] === undefined ) starts[tm] = r
                ends[tm] = r
              });
            });

            // now loop over starts and place them in slots
            var slot = {}
            function team_clashes(tm,sl) {
              // check to see if slot is taken by any teams
              var clash = false;
              _.each(slot,function(slo,tmo) {
                if ( slo === sl && ( ( starts[tm] >= starts[tmo] ) && ( starts[tm] <= ends[tmo] )
                                     || ( ends[tm] <= ends[tmo] ) && ( ends[tm] >= starts[tmo] ) ) )
                  clash = true
              });
              return clash;
            }

            _.each(_.keys(starts), function(tm) {
              var sl = 1;
              for( sl = 1; team_clashes(tm,sl); sl++ ) {}
              slot[tm] = sl
            });


            _.each(ts.sched[ff][d],function(s,t) {
              var ti = parseInt( t.substring(0,2) ) + parseInt( t.substring(2) )/60;
              
              var r = ti*2-30+3
              
              var bcols = 3
              if ( ff.match(/lakeU/i) ) bcols = 5
              console.log(ff,'bcols',bcols)

              var c0 = days[d]*bcols+2

              var minc = _.max(_.map(s,function(tm) { return col[tm] || 0 }))+1

              _.each(s, function(tm,i) {
                var isExt = tm.match(others) 
                var v = {}
                if (!isExt) {
                  c = c0 + slot[tm]-1
                } else if (isExt) {
                  c = c0 + i
                }


                v[r] = {}
                var cmax = c
                if ( isExt ) {
                  tm = tm.replace(/_/g," ")
                  cmax = c0+bcols-1
                }
                console.log(tm,i,c,cmax)
                _.each(_.range(c,cmax+1), function(cc) {
                  v[r][cc] = tm.replace(/_/g,rtnstr).replace(/X(mon|tue|wed|thu|fri)/g,"").replace(/X/g,"/")
                })
                  console.log(JSON.stringify(v))
                ss.add(v)
              })
                
                });
          });


          ss.send(function(err) {
            if(err) throw err;
            console.log("Updated");
          });
          cb2()
        }
      }
      ,function(err) {
        if (err) throw new Error(err)
        cb()
      })
  },

  function getRecContacts(cb) {
    
    SS.create({
      debug: true,
      username: 'crindt',
      password: 'atavatvthjydmcah',
      spreadsheetName: 'Copy of Cardiff Soccer 2013 Coaches as of 20130710',
      worksheetName: 'Sheet4',
      callback: sheetReady2
    });

    function sheetReady2(err,ss2) {
      if ( err ) throw new Error(err)

      ss2.receive(function(err, rows, info) {
        if(err) throw err;

        var tc = {}
        _.each(rows, function(r,i) {
          if ( r[12] !== undefined && !r[12].match(/REGEX/)) {
            tm = r[12].replace(/\//," ")
            tc[tm] = { team: tm, email: r[11] }
          }
        });
        
        cb(null,tc)
      });
    }
  },

  function getCompContacts(tc,cb) {
    
    SS.create({
      debug: true,
      username: 'crindt',
      password: 'atavatvthjydmcah',
      spreadsheetName: 'Mustangs Competitive Coaches and Managers 2014',
      worksheetName: 'Sheet1',
      callback: sheetReady2b
    });

    function sheetReady2b(err,ss2) {
      if ( err ) throw new Error(err)

      ss2.receive(function(err, rows, info) {
        if(err) throw err;

        _.each(rows, function(r,i) {
          if ( r[1] !== undefined && !r[1].match(/Team/)) {
            tm = r[1].replace(/([BG]U)0/,"$1")
            tc[tm] = { team: tm, email: _.filter([r[2],r[3],r[4]],function(s) { return (s === undefined ? false : !(s.match(/^\s*$/)))}).join(","+rtnstr) }
          }
        });
        
        cb(null,tc)
      });
    }
  },

  function prepareResults(tc,cb) {

    function convert_sched(s) {
      return _.map(s,function(ds,d) {
        var sk = _.keys(ds).sort();
        var st = sk[0]
        var en = sk[sk.length-1]
        var enn = parseInt(en.substring(0,2)) + parseInt(en.substring(2))/60 + 0.5
        en = Math.floor(enn) + pad((enn-Math.floor(enn))*60,2)
        var f = ds[st]
        return d+": "+st+"--"+en+" @ "+longF[f]
      })
    }
    
    var data = []
    var tdata = {}
    
    _.each(ts.teamsched, function(s,tmr) {
      var tm = tmr.replace(/_/," ")
      var tm2 = tm.replace(/([GB]U\d+)r/,"$1")
      tm2 = tm2.replace(/X(mon|tue|wed|thu|fri)/g,"")
      var sarr = convert_sched(s)

      // pad to three assigned practices because we push requests onto the back of the array
      while (sarr.length < 3) sarr.push("");

      if ( !tm.match(others) ) {

        if ( !tdata[tm2] ) {
          tdata[tm2] = _.flatten([tm2,tc[tm2] ? tc[tm2].email : "TEAM NOT FOUND IN CONTACTS",sarr]);
          console.log(tm,':',tc[tm2] ? tc[tm2].email : "TEAM NOT FOUND IN CONTACTS",'==>',sarr.join("; "))
        } else
          tdata[tm2].push(_.flatten(sarr))
      }
    });

    /* Push team requests onto the back of the array */
    _.each(req.teams, function( tmo, tm ) {
      var tm1 = tm.replace(/_/," ")
      var tm2 = tm1.replace(/([GB]U\d+)r/,"$1")
      tm2 = tm2.replace(/X(mon|tue|wed|thu|fri)/g,"")
      _.each(tmo.req, function(r) {
        if ( tdata[tm2] ) {
          tdata[tm2].push(_.map(r, function( tarr, day ) { return day+": "+tarr[0]+"-"+tarr[tarr.length-1]; }).join(","+rtnstr))
        }
      })
    })

    data = _.sortBy(_.values(tdata),function(it) { 
      if ( it[0].match(/micro/i) ) return "00"+it[0];
      if ( it[0].match(/Five/i) ) return "ZZZZ"+it[0];
      if ( it[0].match(/Goalie/i) ) return "ZZZZ"+it[0];
      var m = /([GB]U)(\d+)(.*)/.exec(it[0]); 
      if (m) 
        return m[1]+pad(m[2],2)+m[3];
      else
        return it[0]
    })
    
    cb(null,data)
  }

  ,function pushSummary(data,cb) {
    SS.create({
      debug: true,
      username: 'crindt',
      password: 'atavatvthjydmcah',
      spreadsheetName: 'Cardiff Soccer Spring Practice Schedule',
      worksheetName: 'Summary',
      callback: sheetReady3
    });
    
    function sheetReady3(err,ss) {
      //clear
      _.each(_.range(2,15),function(r) {
        _.each(_.range(2,12),function(c) {
          var vv = {}
          vv[r] = {}
          vv[r][c] = ""
          ss.add( vv );
        });
      });

      console.log(data)

      _.each(data, function(d,i) {
        var vv = {}
        vv[2+i] = {}
        _.each(d,function(cc,j) {
          vv[2+i][2+j] = cc
          ss.add(vv)
        })
      });

      ss.send(function(err) {
        if(err) throw err;
        console.log("Updated");

        cb()
      });

    }
  }
],
                
                function(err) {
                  if ( err ) throw new Error(err)
                })



