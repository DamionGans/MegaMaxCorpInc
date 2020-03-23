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

// for now hackaton style
function checkChallengeCompletionString(challengeCompletionString) {
  switch (challengeCompletionString) {
    case `Hey a new server, let's hack this! ....... What!!!??? wVEJWhZDdnOUcI8D4oD50aI5HPXmY18WT6u8e4Z09qPYQqYcA4nX7Pf2SiRdVKVDBWYYj7KmwsFg1TmGdnTd7DOoRDlXAFkfLMxyXiKVx08Cw3lltNC9fs1M27mrBnINZKKfDMMfWUBQjyIhko2Xs0UIsyIshxXvkiLYjJPrkNUMkfmbftpNulo1f3Qb8npTBuSENSMG`:
      return '00';
    case `I have never seen an entity such as badly secured as this server, I have to do something...`:
      return '01';
    case `I believe this work isn't a mistake. Who is the administrator? Why isn't he fired yet? Who am I to leave this company so vulnerable? What are my ethics? Hmmmmmm................`:
      return '02';
    default:
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
