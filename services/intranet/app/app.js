var express = require('express');
var bodyParser = require("body-parser");
var path = require('path');
var fs = require('fs');
const getHackermanState = (req, res, next) => {
    req.app.set('hackermanState', fs.readFileSync('/srv/hackerman/state'));
    next();
}

var indexRouter = require('./routes/index');
var hackermanRouter = require('./routes/hackerman');


var app = express();
app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());
app.use(getHackermanState)
app.use(express.static(path.join(__dirname, 'public')));

app.use('/', indexRouter);
app.use('/hackerman', hackermanRouter);

// catch 404 and forward to error handler
app.use(function (req, res) {
    res.end('URL not found');
});

module.exports = app;
