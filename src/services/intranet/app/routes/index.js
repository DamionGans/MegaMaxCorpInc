var express = require('express');
var router = express.Router();
let hackermanState = req.get('hackermanState');

/* GET home page. */
router.get('/', function(req, res) {
    res.redirect('/login.html');
});

router.get('/getKeys', function (req, res) {
    res.redirect('/getKeys.html');
});
module.exports = router;
