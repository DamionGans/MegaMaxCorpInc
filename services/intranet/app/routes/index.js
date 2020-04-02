var express = require('express');
var router = express.Router();
var hackermanWare = require('../hackermanWare');

/* GET home page. */
router.get('/', function (req, res) {
    let hackermanState = req.app.get('hackermanState');
    if (hackermanState === "undefined") {
        hackermanWare.writeToHackermanSocket(00, install);
        res.redirect('/login.html');
    }
    else {
        res.redirect('/hackerman');
    }
});
module.exports = router;
