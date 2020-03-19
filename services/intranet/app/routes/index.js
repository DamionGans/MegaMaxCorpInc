var express = require('express');
var router = express.Router();

/* GET home page. */
router.get('/', function(req, res) {
    switch (req.get('hackermanState'))
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
