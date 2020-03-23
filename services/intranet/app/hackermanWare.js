var fs = require('fs');

const writeToHackermanSocket = (challenge, command) => {
    fs.appendFileSync('/srv/hackerman/socket', `${challenge}.${command}\n`);
}
const conversation = (challenge) => {
    return fs.readFileSync(`/srv/hackerman/challenge${challenge}/conversation.txt`);
}
exports.writeToHackermanSocket = writeToHackermanSocket;
exports.conversation = conversation;