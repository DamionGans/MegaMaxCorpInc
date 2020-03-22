var express = require('express');
var path = require('path');
var fs = require('fs');
var hackermanStateGetter = function (req, res, next) {
    app.set('hackermanState', fs.readFileSync('/srv/hackerman/state'));
    next();
}

var indexRouter = require('./routes/index');
var hackermanRouter = require('./routes/hackerman');


var app = express();
app.use(hackermanStateGetter)
app.use(express.static(path.join(__dirname, 'public')));

app.use('/', indexRouter);
app.use('/hackerman', hackermanRouter);

// catch 404 and forward to error handler
app.use(function (req, res) {
    res.end('URL not found');
});

module.exports = app;
