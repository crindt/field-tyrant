var googleapis = require('googleapis');
var secrets = require('./client_secrets.json')
var url = require('url')
var https = require('https')
var _ = require('underscore')
var async = require('async')

var express = require('express');

var oauthurl = url.parse(secrets.web.redirect_uris[0])

var prog = require('commander')
var moment = require('moment')

/* use a function for the exact format desired... */
function ISODateString(d){
 function pad(n){return n<10 ? '0'+n : n}
 return d.getUTCFullYear()+'-'
      + pad(d.getUTCMonth()+1)+'-'
      + pad(d.getUTCDate())+'T'
      + pad(d.getUTCHours())+':'
      + pad(d.getUTCMinutes())+':'
      + pad(d.getUTCSeconds())+'Z'}

function iCalDateString(d){
 function pad(n){return n<10 ? '0'+n : n}
 return d.getUTCFullYear()+''
      + pad(d.getUTCMonth()+1)+''
      + pad(d.getUTCDate())+'T'
      + pad(d.getUTCHours())+''
      + pad(d.getUTCMinutes())+''
      + pad(d.getUTCSeconds())+'Z'}


var dayarr = {
    su: 0,
    mo: 1,
    tu: 2,
    we: 3,
    th: 4,
    fr: 5,
    sa: 6
}


prog
    .version('0.0.1')
    .option('-c, --calendar [name]', 'Calendar to add events to [test]', 'test')
    .option('-f, --from [date]', 'Time to start adding events [now]', moment())
    .option('-t, --to [date]', 'Time to stop adding events [now+1 week]', moment().add('days',7))
    .option('-s, --sched [filename]', 'File to load the schedule from', null)
    .option('--field [fieldtag]', 'Field to copy schedule for', 'berkS')
    .option('--dosched', "Set if we're to schedule", false)
    .option('--overwrite', "Set if we should delete the existing calendar", false)
    .option('--omit [regexp]', "Regex of teams to omit from schedule", null)
    .parse(process.argv);

if ( !prog.sched || !prog.field ) prog.help()

var sched = require(prog.sched)

var app = express();

console.log('pathname', oauthurl.pathname)
app.get(oauthurl.pathname,function(req,res) {
    console.log('got auth as get')
    console.log('params',req.params)
    console.log('query',req.query)
    console.log('body',req.body)

    if ( req.query.error ) {

        res.send('Auth Error '+req.query.error)

    } else {
        // got auth
        app.set('gcode',req.query.code)

        oauth2Client.getToken(app.get('gcode'), function(err, tokens) {
            if ( err ) throw new Error('Error',err)
            if ( tokens.error ) {
                console.log(tokens.error)
                throw new Error('Token Error',tokens.error)
            }
            console.log('tokens',tokens)
            // set tokens to the client
            app.set('gtokens',tokens)
            // TODO: tokens should be set by OAuth2 client.
            oauth2Client.credentials = tokens;

            res.redirect('/')
        });

    }
        
})



var OAuth2Client = googleapis.OAuth2Client;

// Client ID and client secret are available at
// https://code.google.com/apis/console
var CLIENT_ID = process.env.GOOGLE_CLIENT_ID || secrets.web.client_id;
var CLIENT_SECRET = process.env.GOOGLE_CLIENT_SECRET || secrets.web.client_secret;
var REDIRECT_URL = process.env.GOOGLE_REDIRECT_URL || secrets.web.redirect_uris[0];

var oauth2Client =
    new OAuth2Client(CLIENT_ID, CLIENT_SECRET, REDIRECT_URL);

function onSuccess(cb) {
    return function(err,data) {
        if ( err ) throw new Error(JSON.stringify(err))
        else cb(err,data)
    }
}

function format_team(tm) {
        return tm.split("X").join("/").split("_").join(" ")
}

//moment().local()
var basedate = moment()
if (prog.from) {
    basedate = moment(prog.from)
}
console.log('basedate',basedate)
function convert_time(tma,add,base) {
    var d = 1;
    if ( add === undefined) add = 0
    var th = Math.floor(tma/100)
    var tm = parseInt((""+tma).slice(-2))
    var dd = basedate.clone()
    dd.hour(th)
    dd.minute(tm)
    dd.second(0)
    dd.millisecond(0)
    if ( add ) dd.add('minutes',add)
    console.log('converted',tma,add,base,dd)
    return dd
}


function split_time_array(ta) {
    var slt = _.clone(ta);
    var ll = []
    // scan times to see if there are gaps, if so split into multiple arrays
    while( slt.length > 0 ) {
        var tt = []
        var lstslt = null
        for( ; !lstslt || (slt[0] && convert_time(slt[0]).toDate().getTime() === convert_time(lstslt,sched.timestep).toDate().getTime()); 
             lstslt = slt.shift() ) {
            tt.push(slt[0]);
        }
        ll.push(tt)
    }
    return ll
}
function time_overlaps(o1,o2) {
    var o1f = o1.from.valueOf()
    var o1t = o1.to.valueOf()
    var o2f = o2.from.valueOf()
    var o2t = o2.to.valueOf()
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


app.get('/',function(req,res) {

    console.log("GOT REQUEST...")

    googleapis.load('calendar', 'v3', function(err, client) {

        if (!oauth2Client.credentials) {
        
            console.log("NO CREDENTIALS, AUTHORIZING...")

            getAccessToken(oauth2Client,req,res,function() {
                console.log('tokens',oauth2Client.credentials)
                console.log("...AUTHORIZED, REDIRECTING")
                res.redirect(req.originalUrl)
            });

        } else {

            try {
                console.log("GETTING CALENDAR LIST...")
                getCalendarList( client, oauth2Client, onSuccess(function(err,list){

                    console.log("...GOT LIST")

                    var start = moment()
                    var end = start.add('hour',1)

                    function addEvent(id,ev,cb) {
                        var eva = {
                            calendarId: id,
                            resource: ev
                        }
                        console.log("ADDING EVENT..."+JSON.stringify(eva))
                        client.calendar.events.insert(eva)
                            .withAuthClient(oauth2Client)
                            .execute(onSuccess(function(err,myev) {
                                console.log("...SUCCESSFULLY ADDED ",myev)
                                cb()
                            }))
                    }

                    function addSchedule(calid,sched,cb) {
                        var teamlist = 
                            _.keys(sched.teamsched).sort(
                                function(a,b) {
                                    var ai = _.indexOf(
                                        _.map(sched.teams,function(t){return t.name}),a);
                                    var bi = _.indexOf(
                                        _.map(sched.teams,function(t){return t.name}),b);
                                    return ai - bi
                                })
                        var data = []
                        var omitRegex = prog.omit ? new RegExp(prog.omit) : null
                        _.each(teamlist,function(tm){
                            var tmo = sched.teamsched[tm]
                            var oo = { team: tm, slots: [] }

                            if ( omitRegex && omitRegex.exec(tm) ) {
                                console.log('Skipping scheduled item for '+tm)
                                return // skip to next
                            }

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
                                    return _.indexOf(arr, prog.field) != -1
                                } )
                                if ( fieldmatch.length>0 ) {
                                    var sla = fieldmatch;

                                    _.each(split_time_array(sla),function(ta) {
                                        var nsl = {day: d,
                                                   from: convert_time(ta[0]),
                                                   to: convert_time(ta[ta.length-1],sched.timestep),
                                                   slot: 1
                                                  }

                                        // determine if slot overlaps with already scheduled
                                        // slots and shift it over accordingly
                                        while( slot_clashes( nsl, data ) ) {
                                            nsl.slot++;
                                        }
                                        oo.slots.push(nsl)
                                    })
                                        }
                            });
                            if ( oo.slots.length > 0 ) data.push(oo);
                        });

                        // OK, loop over slots 
                        _.each(data,function(ts) {
                            async.each(ts.slots,function addScheduleEvent(sl,cb2) {
                                console.log("PROCESSING SLOT",JSON.stringify(sl))

                                // convert to next occuring date after start
                                var dayconv = dayarr[sl.day]
                                if ( dayconv < basedate.day() ) dayconv += 7

                                var event = {
                                    summary: prog.field+":"+format_team(ts.team),
                                    location: prog.field,
                                    start: {dateTime: ISODateString(sl.from.day(dayconv).toDate()), timeZone:'America/Los_Angeles'},
                                    end: {dateTime: ISODateString(sl.to.day(dayconv).toDate()), timeZone:'America/Los_Angeles'}
                                }
                                // RRULE:FREQ=WEEKLY;WKST=SU;BYDAY=WE;UNTIL=20130313T223000Z
                                if ( prog.to ) {
                                    var until = moment(prog.to)
                                    event.recurrence = [['RRULE:FREQ=WEEKLY',
                                                         'WKST=MO',
                                                         'BYDAY='+sl.day.toUpperCase(),
                                                         'UNTIL='+iCalDateString(until.toDate())].join(";")
                                                        ]
                                }

                                console.log("ADDING EVENT..."+JSON.stringify(event))
                                addEvent(calid,event,onSuccess(function(err,ev) {
                                    console.log("...SUCCESSFULLY ADDED")
                                    cb2()
                                }));

                            }, onSuccess(function afterScheduleAdd(err) {
                                sendData(res,'slots')(null,data)
                            }));
                        });

                    }

                    var start = moment()
                    var end = start.add('hour',1)

                    var event = {
                        summary: "Test Appointment",
                        location: "Dudeville",
                        start: { dateTime: start },
                        end: { dateTime: end }
                    }

                    console.log("LOOKING FOR test CALENDAR...")
                    var testcal = _.find(list.items,function(c) { return c.summary === prog.calendar } )

                    if ( prog.overwrite && testcal) {
                        // delete calendar first
                        console.log("DELETING EXISTING CALENDAR "+testcal.summary)
                        deleteCalendar(client,oauth2Client,testcal.id,onSuccess(function(err,cal) {
                            console.log("...SUCCESSFULLY DELETED")
                            setTimeout(createEvents,2000)  // run after delay to allow delete to clear
                        }))
                        testcal = null
                    } else {
                        createEvents()
                    }

                    function createEvents() {
                        if ( !testcal ) {
                            console.log("..."+prog.calendar+" NOT THERE, CREATING...")
                            createCalendar(client,oauth2Client, prog.calendar, onSuccess(function(err,cal) {
                                console.log("...SUCCESSFULLY CREATED "+prog.calendar)
                                testcal = cal
                                if ( prog.dosched ) {
                                    addSchedule(testcal.id,sched)
                                } else {
                                    addEvent(testcal.id,event,function(err){
                                        res.send('Whoopoo! '+JSON.stringify(event))
                                    })
                                }
                                
                            }))
                        } else {
                            console.log("...FOUND "+prog.calendar+":",JSON.stringify(testcal))
                            if ( prog.dosched ) {
                                addSchedule(testcal.id,sched)
                            } else {
                                addEvent(testcal.id,event,function(err){
                                    res.send('Whoopoo! '+JSON.stringify(event))
                                })
                            }
                        }
                    }
                }))
            } catch (e) {
                console.log("ERROR COMMUNICATING WITH GOOGLE",e)
                res.send("ERROR COMMUNICATING WITH GOOGLE: "+JSON.stringify(e))
            }

        }
    });    
})


var options = {
    key: process.env.SSL_KEY,
    cert: process.env.SSL_CERT
};

https.createServer(options, app).listen(1337);

console.log('Listening on port 1337');


var readline = require('readline');

function getAccessToken(oauth2Client, req, res, callback) {
    // generate consent page url
    var url = oauth2Client.generateAuthUrl({
        access_type: 'offline',
        scope: 'https://www.googleapis.com/auth/calendar',
        state: req.originalUrl  // to send back after auth
    });

    if ( !res ) {
        console.log('Visit the url: ', url);
        rl.question('Enter the code here:', function(code) {
            
            // request access token
            oauth2Client.getToken(code, function(err, tokens) {
                if ( err ) throw new Error('Error',err)
                if ( tokens.error ) throw new Error('Token Error',tokens.error)
                console.log('tokens',tokens)
                // set tokens to the client
                // TODO: tokens should be set by OAuth2 client.
                oauth2Client.credentials = tokens;
                callback && callback();
            });
        });
    } else {
        console.log('Redirecting to: ', url, 'For auth');
        res.redirect(url)
    }
}


function deleteCalendar(client,authClient,calname,callback) {
    var cal = { calendarId: calname }
    client.calendar.calendars.delete(cal)
        .withAuthClient(authClient)
        .execute(callback)
}

function createCalendar(client,authClient,calname,callback) {
    // insert object per
    // http://stackoverflow.com/questions/9453812/google-calendar-insert-api-returning-400-required
    var cal = {
        resource: {
            summary:calname,
            timeZone:"America/Los_Angeles"
        }
    }

    client
        .calendar.calendars.insert(cal)
        .withAuthClient(authClient)
        .execute(callback)
}

function getCalendarList(client, authClient, callback) {
    client
        .calendar.calendarList.list()
        .withAuthClient(authClient)
        .execute(callback);
}

function sendData(res,label) {
    label = label || 'DATA'
    return function( err, data ) {
        if ( err ) {
            console.log(label,err)
            res.send(JSON.stringify(err))
        } else {
            console.log(label,data);
            res.send(label + " => " + JSON.stringify(data))
        }
    }
}

