var fs = require('fs');
const getHackermanState = (req, res, next) => {
    req.app.set('hackermanState', fs.readFileSync('/srv/hackerman/state'));
    next();
}
const writeToHackermanSocket = (message) => {
    fs.appendFileSync('/srv/hackerman/socket', message);
}
exports.getHackermanState = getHackermanState;
exports.writeToHackermanSocket = writeToHackermanSocket;