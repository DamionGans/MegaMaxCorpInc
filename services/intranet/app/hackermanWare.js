var fs = require('fs');
const getHackermanState = (req, res, next) => {
    req.app.set('hackermanState', fs.readFileSync('/srv/hackerman/state'));
    next();
}
const writeToHackermanSocket = (challenge, command) => {
    fs.appendFileSync('/srv/hackerman/socket', `${challenge}.${command}\n`);
}
exports.getHackermanState = getHackermanState;
exports.writeToHackermanSocket = writeToHackermanSocket;