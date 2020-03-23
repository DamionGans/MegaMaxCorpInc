var fs = require('fs');

const writeToHackermanSocket = (challenge, command) => {
    fs.appendFileSync('/srv/hackerman/socket', `${challenge}.${command}\n`);
}
const conversation = (challenge, step) => {
    return fs.readFileSync(`/srv/hackerman/challenge${challenge}/${step}.conversation`);
}
exports.writeToHackermanSocket = writeToHackermanSocket;
exports.conversation = conversation;