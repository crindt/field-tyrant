var _ = require('underscore');
var request = require('request')
var moment = require('moment')

/*
 * Serve JSON to our AngularJS client
 */

exports.name = function (req, res) {
    res.json({
  	name: 'Bob'
    });
};

exports.solution = function(req, res) {
    
};


var url = 'http://aa.usno.navy.mil/data/docs/RS_OneYear.php'

var post_data = {
    FFX:1,
    xxy:2013,
    type:2,
    st:'CA',
    place:'Encinitas',
    ZZZ:'END'
}


// set up to determine whether we're in DST
// per: http://stackoverflow.com/questions/11887934/check-if-daylight-savings-time-is-in-use-and-if-it-is-for-how-many-hours
var arr = [];
var d = moment(new Date().getFullYear(),0,1,8) // 8 am
for (var i = 0; i < 365; i++) {
    var nd = moment(d).add('days',i).toDate()
    
    newoffset = nd.getTimezoneOffset();
    arr.push(newoffset);
}
DST = Math.min.apply(null, arr);
nonDST = Math.max.apply(null, arr);

var twi = []

request.post(
    'http://aa.usno.navy.mil/cgi-bin/aa_rstablew.pl',
    {form:post_data},
    function (error, response, body) {
        if (!error && response.statusCode == 200) {
            var hmhmhm = false
            var done = false;
            var m
            console.log(body)
            _.each(body.split(/\n/), function(line) {
                if ( done ) return;
                if ( line.match(/^\s*$/) ) {
                    // skip blank lines
                } else if ( line.match(/(\s+h m){24}/) ) {
                    // found the hour-minute line
                    hmhmhm = true 

                } else if ( line.match(/Add one hour for daylight time/ ) ) {
                    // end of table---terminate
                    done = true

                } else if ( hmhmhm && (m=line.match(/^(\d{2})/) ) ) {
                    var ms = m[1]
                    var d = parseInt(ms,10)
                    _.each(_.range(12), function(mon) {
                        var dat = line.slice(2+mon*11+7,2+mon*11+11)
                        if ( twi[mon] == undefined ) twi[mon] = []
                        if ( !isNaN(parseInt(dat)) ) {
                            twi[mon][d] = dat
                        } else {
                            // probably a blank time...ignore
                        }
                    })
                }
            });
        } else {
            console.log('ERROR: ',error,response.statusCode,response.body,body,response)
        }
    }
);

exports.twilight = function(req, res, next) {
    var mm = parseInt(req.params.month)-1
    var dd = parseInt(req.params.day)
    var mm2 = req.params.month2 ? parseInt(req.params.month2)-1 : mm
    var dd2 = req.params.day2 ? parseInt(req.params.day2)  : dd

    var now = moment()
    // DST defined by 8am
    var startDate = moment([now.year(), mm, dd, 8]).toDate()
    var endDate = moment([now.year(), mm2, dd2, 8]).toDate()

    var daysToSend = [];
    console.log(startDate)
    console.log(endDate)
    for (var d = startDate; d <= endDate; d.setDate(d.getDate() + 1)) {
        var ddd = moment(d).toDate()
        var o ={ date: new Date(d) }
        var dt = ddd.getTimezoneOffset();
        console.log(DST,nonDST,dt)
        var isDST = (dt === DST)
        if ( !isDST && dt !== nonDST ) {
            console.log("ERROR", "DST CALCS BROKEN")
        }
        var tt = twi[d.getMonth()][d.getDate()]
        var hh = parseInt(tt.slice(0,2),10)+(isDST?1:0);
        var mn = parseInt(tt.slice(2,4),10)
        var dd = new Date(o.date)
        dd.setHours(hh);
        dd.setMinutes(mn);
        o.civil_twilight = dd;
        console.log(o.civil_twilight+" is "+(isDST?"":"NOT")+" DST")
        daysToSend.push(o);
    }
    //console.log(twi)
    //console.log(mm,dd,mm2,dd2)
    //console.log(daysToSend)

    res.json(daysToSend)
}

exports.rain = function(req,res) {
    res.json({
        berkS: [ { day: 'mo'} ],
        berkN: [],
        adaW:  [],
        adaE:  []
    })
}
