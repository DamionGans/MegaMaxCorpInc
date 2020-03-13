'use strict';
var debug = require('debug');
var express = require('express');
var path = require('path');
var favicon = require('serve-favicon');
var logger = require('morgan');
var cookieParser = require('cookie-parser');
var bodyParser = require('body-parser');
var indexRouter = require('./routes/index');
var hackermanRouter = require('./routes/hackerman');
const fs = require('fs');

var app = express();

// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'pug');

// uncomment after placing your favicon in /public
//app.use(favicon(__dirname + '/public/favicon.ico'));
app.use(logger('dev'));
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));

app.use('/', indexRouter);
app.get('/hackermanStatus', async function (res) {
    let status = await fs.readFile('/srv/hackerman/status', (err, data) => {
        if (err) throw err;
        console.log(data);
      });
    res.send(status);
})
app.use('/hackerman', hackermanRouter);
app.post('/checkKey', function (req, res) {
    let secret = req.body.secret.toUpperCase();
    if (secret === "7B4DBE9AC3E71126F3483890F17C9C9B94CF5BDD370F5FE16AF5D9B41D2C7784EE5CEED57E13127E6F7D3448131A8A64397210F9D2D6C3639482D4B06F4398D5") {
        res.download('./SSH-Keys/challenge01', 'challenge01');
    }
    else {
            res.end("Invalid secret send.");
        }
    
});

// catch 404 and forward to error handler
app.use(function (req, res) {
    res.end('URL not found');
});



var server = app.listen(80, function () {
   var host = server.address().address
   var port = server.address().port
   
   console.log("Example app listening at http://%s:%s", host, port)
})
