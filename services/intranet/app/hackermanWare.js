var fs = require('fs');

const writeToHackermanSocket = (challenge, command) => {
    fs.appendFileSync('/srv/hackerman/socket', `${challenge}.${command}\n`);
}
const getConversation = (challenge) => {
    return fs.readFileSync(`/srv/hackerman/challenge${challenge}/conversation.txt`);
}
exports.writeToHackermanSocket = writeToHackermanSocket;
exports.getConversation = getConversation;