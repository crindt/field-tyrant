var googleapis = require('googleapis');
var secrets = require('./client_secrets.json')
var url = require('url')
var https = require('https')
var _ = require('underscore')
var async = require('async')
var redis = require("redis"),
redclient = redis.createClient();

var express = require('express');

var oauthurl = url.parse(secrets.web.redirect_uris[0])

var prog = require('commander')
var moment = require('moment')

// for later def
var sched, basedate

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

var fieldmap = {
    berkS: "CSL Berkich South",
    berkN: "CSL Berkich North",
    adaE: "CSL Ada East",
    adaW: "CSL Ada West",
    lakeU: "CSL Lake Upper",
    adaW: "CSL Lake Lower",
}

var testfieldmap = {
    berkS: "Test Berkich South",
    berkN: "Test Berkich North",
    adaE: "Test Ada East",
    adaW: "Test Ada West",
    lakeU: "Test Lake Upper",
    adaW: "Test Lake Lower",
}


var app = express();

var OAuth2Client = googleapis.OAuth2Client;

// Client ID and client secret are available at
// https://code.google.com/apis/console
var CLIENT_ID = process.env.GOOGLE_CLIENT_ID || secrets.web.client_id;
var CLIENT_SECRET = process.env.GOOGLE_CLIENT_SECRET || secrets.web.client_secret;
var REDIRECT_URL = process.env.GOOGLE_REDIRECT_URL || secrets.web.redirect_uris[0];

var oauth2Client =
    new OAuth2Client(CLIENT_ID, CLIENT_SECRET, REDIRECT_URL);


function receiveOauth2Response(req,res,next) {
    console.log('got auth as get')
    console.log('params',req.params)
    console.log('query',req.query)
    console.log('body',req.body)

    if ( req.query.error ) {

        next(req.query)

    } else {
        // got auth
        console.log('gcode',req.query.code)
        app.set('gcode',req.query.code)

        oauth2Client.getToken(app.get('gcode'), function(err, tokens) {
            if ( err ) throw err
            if ( tokens.error ) {
                console.log(tokens.error)
                throw tokens.error
            }
            console.log('tokens77',tokens)
            // set tokens to the client
            app.set('gtokens',tokens)
            // TODO: tokens should be set by OAuth2 client.
            oauth2Client.credentials = tokens;

            if ( req.query.state === 'COMMANDLINE' ) 
                res.json(JSON.stringify(tokens))
            else {
                console.log("GOT CREDS, REDIRECTING",req.query.state || '/')
                res.redirect(req.query.state || '/')
            }
        });

        //next({error:'Got to unexpected point in program'})
    }
}



function onSuccess(cb) {
    return function(err,data) {
        if ( err ) throw JSON.stringify(err)
        else cb(err,data)
    }
}

function format_team(tm) {
    return tm.split("X").join("/").split("_").join(" ")
}

function format_field(f) {
    return fieldmap[f] || '[Unknown Field]'
}

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

function doSchedule(cb) {
    return function (req,res) {
        var client = req.calclient

        console.log("GETTING CALENDAR LIST...")
        getCalendarList( client, oauth2Client, onSuccess(function(err,list){

            console.log("...GOT LIST")

            var start = moment()
            var end = start.add('hour',1)

            function addEvent(id,ev,addEventCb) {
                var eva = {
                    calendarId: id,
                    resource: ev
                }
                console.log("ADDING EVENT..."+JSON.stringify(eva))
                client.calendar.events.insert(eva)
                    .withAuthClient(oauth2Client)
                    .execute(onSuccess(function(err,myev) {
                        console.log("...SUCCESSFULLY ADDED ",myev)
                        addEventCb()
                    }))
            }

            function addSchedule(calid,sched,addSchedCb) {
                console.log("ADDING SCHEDULE...")
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
                console.log("TEAMLIST",teamlist)
                _.each(teamlist,function(tm){
                    var tmo = sched.teamsched[tm]
                    var oo = { team: tm, slots: [] }

                    if ( omitRegex && omitRegex.exec(tm) ) {
                        console.log('Skipping scheduled item for '+tm)
                        return // skip to next
                    }

                    console.log("DOING TEAM")
                    _.each(tmo, function(sl,d) {
                        console.log("SLOT",d,sl)
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
                        console.log("FIELDMATCH",fieldmatch)
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
                            });
                        }
                    });
                    if ( oo.slots.length > 0 ) data.push(oo);
                });

                // OK, loop over slots 
                var colcnt = 0;
                var cols = {}
                console.log("LOOPING SLOTS",data.length)
                _.each(data,function(ts) {
                    console.log("...SLOTL",ts)
                    async.each(ts.slots,function addScheduleEvent(sl,cb2) {
                        console.log("PROCESSING SLOT",JSON.stringify(sl))

                        // convert to next occuring date after start
                        var dayconv = dayarr[sl.day]
                        if ( dayconv < basedate.day() ) dayconv += 7

                        if ( cols[ts.team] === undefined ) cols[ts.team] = (colcnt++ % 12)+1

                        var event = {
                            //summary: prog.field+":"+format_team(ts.team),
                            summary: format_team(ts.team),
                            location: format_field(prog.field),
                            start: {dateTime: ISODateString(sl.from.day(dayconv).toDate()), timeZone:'America/Los_Angeles'},
                            end: {dateTime: ISODateString(sl.to.day(dayconv).toDate()), timeZone:'America/Los_Angeles'}
                            //colorId: cols[ts.team]
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
                            if ( err ) throw err
                            console.log("...SUCCESSFULLY ADDED")
                            cb2()
                        }));

                    }, onSuccess(function afterScheduleAdd(err) {
                        console.log("DONE ADDING")
                        if ( err ) throw err
                        //sendData(res,'slots')(null,data)
                        addSchedCb()
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

            console.log("LOOKING FOR "+prog.calendar+" CALENDAR...")
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

                        addSchedule(testcal.id,sched,cb)
                        
                    }))
                } else {
                    console.log("...FOUND "+prog.calendar+":",JSON.stringify(testcal))

                    addSchedule(testcal.id,sched,cb)
                }
            }
        }))
    }
}


function handleReply(req,res,next) {
    console.log("GOT REQUEST...")

    googleapis.load('calendar', 'v3', function(err, client) {

        if (!oauth2Client.credentials) {
            
            console.log("NO CREDENTIALS, AUTHORIZING...")

            getAccessToken(oauth2Client,req,res,function() {
                console.log('tokens3',oauth2Client.credentials)
                console.log("...AUTHORIZED, REDIRECTING")
                res.redirect(req.originalUrl)
            });

        } else {

            try {
                redclient.set('gcalcreds',JSON.stringify(oauth2Client))

                req.calclient = client
                next()
            } catch (e) {
                console.log("ERROR COMMUNICATING WITH GOOGLE",e)
                res.send("ERROR COMMUNICATING WITH GOOGLE: "+JSON.stringify(e))
            }

        }
    });    
}

function googleAuth(req,res,next) {

    if ( !oauth2Client.credentials ) {
        console.log("NO CREDENTIALS, AUTHORIZING...")
        
        getAccessToken(oauth2Client,req,res,function() {
            console.log('tokens4',oauth2Client.credentials)
            console.log("...AUTHORIZED, REDIRECTING")
            res.redirect(req.originalUrl)
        });
    } else 
        next()
}


console.log('pathname', oauthurl.pathname)
app.get(oauthurl.pathname,
        receiveOauth2Response)

app.get('/',
        googleAuth,
        handleReply,
        function(req,res) {
            console.log("You're authorized now")
            res.send("You're authorized now")
        })


var options = {
    key: process.env.SSL_KEY,
    cert: process.env.SSL_CERT
};

https.createServer(options, app).listen(1337);
console.log('Listening on port 1337');





var readline = require('readline');
var request = require('superagent')

function getAccessToken(oauth2Client, req, res, callback) {
    // generate consent page url
    var url = oauth2Client.generateAuthUrl({
        access_type: 'offline',
        scope: 'https://www.googleapis.com/auth/calendar',
        state: (req ? req.originalUrl : "/")   // to send back after auth
    });

    if ( prog.noweb ) {

        var rl = readline.createInterface({
            input: process.stdin,
            output: process.stdout
        });

        console.log('Visit the url: ', url);
        rl.question('Enter the code here:', function(code) {
            
            // request access token
            oauth2Client.getToken(code, function(err, tokens) {
                if ( err ) throw err
                if ( tokens.error ) throw tokens.error
                console.log('tokens1',tokens)
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

if ( prog.noweb ) {
    getAccessToken(oauth2Client,{originalUrl:'COMMANDLINE'},null,function() {
        if (!oauth2Client.credentials) {
            throw new Error ('No auth')
        }

        console.log('tokens2',oauth2Client.credentials)
        googleapis.load('calendar', 'v3', function( err, client ) {
            getCalendarList(client,oauth2Client,function(err,list){
                console.log("...GOT LIST")
                console.log("list",list)
                process.exit
            })
        })
    })
}




prog
    .version('0.0.1')
    .option('-c, --calendar [name]', 'Calendar to add events to [test]', 'test')
    .option('-f, --from [date]', 'Time to start adding events [now]', moment())
    .option('-t, --to [date]', 'Time to stop adding events [now+1 week]', moment().add('days',7))
    .option('-s, --sched [filename]', 'File to load the schedule from', null)
    .option('--field [fieldtag]', 'Field to copy schedule for', 'berkS')
    .option('--overwrite', "Set if we should delete the existing calendar", false)
    .option('--omit [regexp]', "Regex of teams to omit from schedule", null)


function ifCredentialed(cb) {
    console.log("CHECKING CREDS...")
    redclient.get("gcalcreds",function(err,creds) {
        if ( err ) throw err
        if ( creds == null ) {
            console.log("...NOT AUTHENTICATED")
            process.exit()

        } else {

            console.log("...ALREADY AUTHENTICATED")
            console.log(JSON.stringify(creds))
            creds = JSON.parse(creds)
            oauth2Client.credentials = creds.credentials;

            cb()
        }
    })
}

function loadSched() {
    console.log("Loading schedule from",prog.sched)
    sched = require(prog.sched)
    basedate = moment()

    if (prog.from) {
        basedate = moment(prog.from)
    }        

}

prog.command('schedule <field> [calendar]')
    .description('upload the schedule for the given field')
    .action(function scheduleField(field,calname) {
        prog.calendar = calname || field
        prog.field = field
        console.log("Request to schedule field",prog.field,"on calendar",prog.calendar)
        loadSched()

        ifCredentialed(function() {
            googleapis.load('calendar', 'v3', function(err, client) {
                doSchedule(function() {
                    console.log("All done!")
                    setTimeout(function(){console.log("CLEARING....");process.exit()},10000)
                })({calclient:client},{})
            })
        })
    })

prog.command('color calendar <color>')
    .description('Set the color of the given calendar')
    .action(function colorCalendar(calname) {
        prog.calendar = calname

        ifCredentialed(function() {
            googleapis.load('calendar', 'v3', function(err,client) {
                client.calendar.colors.get()
                .withAuthClient(oauth2Client)
                .execute(onSuccess(function(err,cols) {
                    console.log('colors',cols)
                    process.exit()
                }))
            })
        })
    })


function getEventList(client,authClient,calendar,cb) {
    getCalendarList( client, authClient, onSuccess( function( err, list ) {
        console.log("LOOKING FOR "+calendar+" CALENDAR...")
        var testcal = _.find(list.items,function(c) { return c.summary === calendar } )

        if ( testcal ) {
            prog.from = prog.from ? moment(prog.from) : moment()
            prog.to = prog.to ? moment(prog.to) : prog.from.add('months',1)
            var req = {
                calendarId: testcal.id
                ,timeMin: ISODateString(prog.from.toDate())
                ,timeMax: ISODateString(prog.to.toDate())
            }
            console.log('req',req)
            client.calendar.events.list(req)
                .withAuthClient(oauth2Client)
                .execute(onSuccess(function(err,items) {
                    console.log('events')
                    cb(items, testcal)
                }))
        }
    }))
}


prog.command('list <calendar> [filter]')
    .description('List events from the given calendar matching the optional filter')
    .action(function listEvents(calname) {
        prog.calendar = calname

        ifCredentialed(function() {
            googleapis.load('calendar', 'v3', function(err,client) {

                getEventList( client, oauth2Client, prog.calendar, function( items ) {
                    console.log('events')
                    console.log(items)
                    process.exit()
                })
            })
        })
    })


prog
    .command('clear <field>')
    .description('clear the calendar for the given field')
    .action(function clearField(field,calname) {
        prog.field = field
        prog.calendar = prog.field

        var rl = readline.createInterface({
            input: process.stdin,
            output: process.stdout
        });

        rl.question('Clear calendar '+prog.calendar+' for field '+prog.field+'? ', function(yn) {
            if ( yn !== 'y' ) {
                console.log("OK, cancelling...")
                process.exit()
            } 
            console.log("OK, clearing...")
            ifCredentialed(function() {
                googleapis.load('calendar', 'v3', function(err,client) {
                    getEventList( client, oauth2Client, prog.calendar, function( list, cal ) {
                        //console.log(_.map(items,function(it) { return JSON.stringify(it); }).join("\n"))
                        //console.log('length',items.length)
                        async.each(list.items,function(it,cb123) {
                            console.log("Deleting ",JSON.stringify(it,null,4))
                            client.calendar.events.delete({calendarId: cal.id,
                                                           eventId: it.id})
                                .withAuthClient(oauth2Client)
                                .execute(function(err,items) {
                                    cb123(err)
                                })
                        },function(err) {
                            if ( err ) throw err

                            console.log("SUCCESSFULLY CLEARED ENTRIES")
                            process.exit()
                        })
                    })
                })
            })
        })

    })


prog.command('reauth')
    .description('Give client an authorization prompt')


prog
    .parse(process.argv);


// no command will start the webserver
