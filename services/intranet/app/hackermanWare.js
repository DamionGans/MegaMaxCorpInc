var fs = require('fs');
const getHackermanState = (req, res, next) => {
    req.app.set('hackermanState', fs.readFileSync('/srv/hackerman/state'));
    next();
}
const writeToHackermanSocket = (command) => {
    fs.appendFileSync('/srv/hackerman/socket', `\n${command}`);
}
exports.getHackermanState = getHackermanState;
exports.writeToHackermanSocket = writeToHackermanSocket;