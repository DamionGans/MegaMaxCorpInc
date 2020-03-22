var fs = require('fs');
const getHackermanState = (req, res, next) => {
    req.app.set('hackermanState', fs.readFileSync('/srv/hackerman/state'));
    next();

}
exports.getHackermanState = getHackermanState;