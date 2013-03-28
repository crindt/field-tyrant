var googleapis = require('googleapis');
var secrets = require('./client_secrets.json')
var url = require('url')

var express = require('express');

var oauthurl = url.parse(secrets.web.redirect_uris[0])

var app = express();

console.log('pathname', oauthurl.pathname)
app.post('/'+oauthurl.pathname,function(req,res) {
    console.log('got auth',req)
})

app.get('/',function(req,res) {
})

app.listen(1337);
console.log('Listening on port 1337');


var readline = require('readline');

var OAuth2Client = googleapis.OAuth2Client;

// Client ID and client secret are available at
// https://code.google.com/apis/console
var CLIENT_ID = process.env.GOOGLE_CLIENT_ID || secrets.web.client_id;
var CLIENT_SECRET = process.env.GOOGLE_CLIENT_SECRET || secrets.web.client_secret;
var REDIRECT_URL = process.env.GOOGLE_REDIRECT_URL || secrets.web.redirect_uris[0];

var rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

function getAccessToken(oauth2Client, callback, web) {
  // generate consent page url
  var url = oauth2Client.generateAuthUrl({
    access_type: 'offline',
    scope: 'https://www.googleapis.com/auth/plus.me'
  });

  console.log('Visit the url: ', url);
  rl.question('Enter the code here:', function(code) {

    // request access token
    oauth2Client.getToken(code, function(err, tokens) {
        if ( err ) throw new Error('Error',err)
        if ( tokens.error ) throw new Error('Token Error',tokens.error)
      // set tokens to the client
      // TODO: tokens should be set by OAuth2 client.
      oauth2Client.credentials = tokens;
      callback && callback();
    });
  });
}


function getUserProfile(client, authClient, userId, callback) {
    console.log('client',client)
    client
        .calendar.calendarList.list({})
        .withAuthClient(authClient)
        .execute(callback);
}

function printCaldata(err, cal) {
    if (err) {
        console.log('An error occurred',err);
    } else {
      console.log('cal',cal);
  }
}


googleapis.load('calendar', 'v3', function(err, client) {

    var oauth2Client =
        new OAuth2Client(CLIENT_ID, CLIENT_SECRET, REDIRECT_URL);

    
    getAccessToken(oauth2Client,function() {
        console.log('tokens',oauth2Client.credentials)
        getUserProfile(
            client, oauth2Client, 'me', printCaldata);
    });
});