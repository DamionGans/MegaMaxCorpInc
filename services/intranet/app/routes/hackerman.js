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

function checkChallengeCompletionString(challengeCompletionString) {
    if(challengeCompletionString.includes(`lb7WnDcsC8d7HcwGUXbirbKUYIRWkzheU9r8X0Tw`)){
      return '00';
    }

    else if(challengeCompletionString.includes(`d30wzjjfQcraIsiycnBWsn3yMI2iamFkI6ViOvIV`)){
      return '01';
    }
    else if(challengeCompletionString.includes(`6xrcUB9aEcKHsXJHEidRVv1loIjF2rhM5nIMJQjl`)){
      return '02';
    }
    else {
      return null;
  }
}
router.get('/conversation', function (req, res) {
  let hackermanState = req.app.get('hackermanState').toString().split('\n')[0];
  let challenge = hackermanState.split('.')[0];
  let step = hackermanState.split('.')[1];
  res.end(hackermanWare.conversation(challenge, step));
});
router.post('/noobShellEntry', function (req, res) {
  let challenge = checkChallengeCompletionString(req.body.entry);
  if (challenge === null) {
    res.end('invalid');
  }
  else {
    hackermanWare.writeToHackermanSocket(challenge, 'completed');
    res.end(challenge);
  }
});

module.exports = router;