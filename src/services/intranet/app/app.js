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
let hackermanState;
const hackermanStateGetter = async function(req, res, next) {
    fs.readFile('/srv/hackerman/status', 'utf8', (err, data) => {
        if (err)
            throw err;
        hackermanState = data;
    });
    next();
}
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
app.use(hackermanStateGetter);

app.use('/', indexRouter);
app.use('/hackerman', hackermanRouter);

// catch 404 and forward to error handler
app.use(function (req, res) {
    res.end('URL not found');
});



var server = app.listen(80, function () {
   var host = server.address().address
   var port = server.address().port
   
   console.log("Example app listening at http://%s:%s", host, port)
})
