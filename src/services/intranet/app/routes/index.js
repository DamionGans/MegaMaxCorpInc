var express = require('express');
var router = express.Router();
let hackermanState = req.get('hackermanState');

/* GET home page. */
router.get('/', function(req, res) {
    switch (hackermanState)
    {
        case "00.installed":
            {
                res.redirect('/login.html');
            }
        default:
            {
                res.redirect('/hackerman');
            }
       
    }
});
module.exports = router;
