var createError = require('http-errors');
var express = require('express');
var path = require('path');
var cookieParser = require('cookie-parser');
var logger = require('morgan');
const fs = require('fs');
const hackermanStateGetter = async function(req, res, next) {
  fs.readFile('/srv/hackerman/state', 'utf8', (err, data) => {
    if (err)
    throw err;
    app.set('hackermanStatus', data);
  });
  next();
}

var indexRouter = require('./routes/index');
var hackermanRouter = require('./routes/hackerman');


var app = express();

// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'pug');

app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));
app.use(hackermanStateGetter)

app.use('/', indexRouter);
app.use('/hackerman', hackermanRouter);

// catch 404 and forward to error handler
app.use(function (req, res) {
  res.end('URL not found');
});

module.exports = app;
