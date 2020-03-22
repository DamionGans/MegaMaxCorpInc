var express = require('express');
var router = express.Router();

/* GET home page. */
router.get('/', function(req, res, next) {
  let hackermanState = req.app.get('hackermanState');
  if (hackermanState === null) {
    // TODO: think about what to do.
  }
  if (hackermanState.includes('00.installed'))
  {
    
  }
  res.redirect('/hackerman.html');
});

module.exports = router;
