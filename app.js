
/**
 * Module dependencies.
 */

var express = require('express'),
  routes = require('./routes'),
  api = require('./routes/api')
  marked = require('marked')

var hl = require("highlight").Highlight;


marked.setOptions({
  gfm: true,
  tables: true,
  breaks: false,
  pedantic: false,
  sanitize: true,
  smartLists: true,
  langPrefix: 'language-',
  highlight: function(code, lang) {
      var html = hl(code);
      return html
  }
});

var app = module.exports = express();

// Configuration

app.configure(function(){
    app.set('views', __dirname + '/views');
    app.set('view engine', 'jade');
    app.use(express.bodyParser());
    app.use(express.methodOverride());
    app.use(express.static(__dirname + '/public'));
    app.use(app.router);
});

app.configure('development', function(){
    app.use(express.errorHandler({ dumpExceptions: true, showStack: true }));
});

app.configure('production', function(){
  app.use(express.errorHandler());
});

// Routes

app.get('/', routes.index);
app.get('/partials/:name', routes.partials);

// JSON API

app.get('/api/name', api.name);

app.get('/api/solution', api.solution);

app.get('/api/twilight/:month/:day', api.twilight);
app.get('/api/twilight/:month/:day/:month2/:day2', api.twilight);

app.get('/api/rain', api.rain)

// redirect all others to the index (HTML5 history)
app.get('*', routes.index);

// Start server

var port = process.env.PORT || 3000
app.listen(port, function(){
  console.log("Express server listening on port %d in %s mode", this.address().port, app.settings.env);
});
