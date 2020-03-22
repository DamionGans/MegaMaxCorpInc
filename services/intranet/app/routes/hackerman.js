var express = require('express');
var router = express.Router();
var hackermanWare = require('../hackermanWare')

/* GET home page. */
router.get('/', function (req, res, next) {
  let hackermanState = req.app.get('hackermanState');
  if (hackermanState === null) {
    hackermanWare.writeToHackermanSocket('00', 'hacked');
  }
  if (hackermanState.includes('00.installed')) {
    hackermanWare.writeToHackermanSocket('00', 'hacked');
  }
  res.redirect('/hackerman.html');
});
router.get('/conversation', function (req, res) {
  let hackermanState = req.app.get('hackermanState').toString();
  let challenge = hackermanState.substring(0, hackermanState.indexOf('.'));
  res.end(hackermanWare.conversation(challenge));
});
router.get('/sayings', function (req, res) {
  let hackermanState = req.app.get('hackermanState').toString();
  let challenge = hackermanState.substring(0, hackermanState.indexOf('.'));
  res.end(hackermanWare.sayings(challenge));
});
module.exports = router;
