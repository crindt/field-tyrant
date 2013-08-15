var SS = require('edit-google-spreadsheet')

var ts = require('./public/sched/fall-2013-sched.json')
var _ = require('underscore')


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
  ,adaW: "Ada (West)"
  ,berkS: "Berkich (South)"
  ,berkN: "Berkich (North)"
}

_.each(_.keys(ts.sched), function(ff) {
  var f = longF[ff]

  console.log("Processing field "+f)

  SS.create({
    debug: true,
    username: 'crindt',
    password: 'caT0996Feet',
    spreadsheetName: 'Cardiff Soccer Fall Practice Schedule',
    worksheetName: f,
    callback: sheetReady
  });

  function sheetReady(err,ss) {
    if (err) throw err

    _.each(_.range(3,20),function(r) {
      _.each(_.range(2,17),function(c) {
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
      })


      _.each(ts.sched[ff][d],function(s,t) {
        var ti = parseInt( t.substring(0,2) ) + parseInt( t.substring(2) )/60;

        var r = ti*2-30+3

        var c0 = days[d]*3+2

        var minc = _.max(_.map(s,function(tm) { return col[tm] || 0 }))+1

        _.each(s, function(tm,i) {
          var isExt = tm.match(/(Warner|Encinitas|Softball|Rugby|Lacrosse)/) 
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
            cmax = c0+2
          }
          console.log(tm,i,c,cmax)
          _.each(_.range(c,cmax+1), function(cc) {
            v[r][cc] = tm.replace(/_/g,rtnstr).replace(/X/g,"/")
          })
          console.log(JSON.stringify(v))
          ss.add(v)
        })
          
          })
        })


      ss.send(function(err) {
        if(err) throw err;
        console.log("Updated");
      });


    ss.receive(function(err, rows, info) {
      if(err) throw err;
      console.log("Found rows:", JSON.stringify(rows));
      // Found rows: { '3': { '5': 'hello!' } }
    });
  }
})
