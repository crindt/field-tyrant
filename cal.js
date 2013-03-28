var googleapis = require('googleapis');
var secrets = require('./client_secrets.json')
var url = require('url')
var https = require('https')
var _ = require('underscore')

var express = require('express');

var oauthurl = url.parse(secrets.web.redirect_uris[0])

var sched = require('./public/sched/april-2013-sched.json')

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

                    var start = new Date()
                    var end = new Date(start.getTime()+3600000)

                    var event = {
                        summary: "Test Appointment",
                        location: "Dudeville",
                        start: { dateTime: start },
                        end: { dateTime: end }
                    }

                    function addEvent(id,ev) {
                        console.log("ADDING EVENT..."+JSON.stringify(event))
                        client.calendar.events.insert({
                            calendarId: testcal.id,
                            resource: event
                        })
                            .withAuthClient(oauth2Client)
                            .execute(onSuccess(function(err,ev) {
                                console.log("...SUCCESSFULLY ADDED")
                                sendData(res,'event')
                            }))
                    }

                    console.log("LOOKING FOR test CALENDAR...")
                    var testcal
                    if ( !(testcal = _.find(list.items,function(c) { return c.summary === 'test' } )) ) {
                        console.log("...test NOT THERE, CREATING...")
                        createCalendar(client,oauth2Client, 'test', onSuccess(function(err,cal) {
                            console.log("...SUCCESSFULLY CREATED TEST")

                            addEvent(testcal.id,event)
                        }))
                    } else {
                        console.log("...FOUND test:",JSON.stringify(testcal))
                        addEvent(testcal.id,event)
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

