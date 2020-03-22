var express = require('express');
var router = express.Router();

/* GET home page. */
router.get('/', function (req, res) {
    let hackermanState = req.app.get('hackermanState');
    if (hackermanState === null) {
        res.redirect('/');
    }
    if (hackermanState.includes('00.installed')) {
        res.redirect('/login.html');
    }
    else {
        res.redirect('/hackerman');
    }
});
module.exports = router;
