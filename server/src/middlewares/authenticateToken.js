const jwt = require('jsonwebtoken');
const utils = require('../utils')

function authenticateToken(req, res, next) {
  const authHeader = req.headers["authorization"];
  const token = authHeader && authHeader.split(" ")[1];
  if (!token) {
    return utils.apiResponse(401, req, res, {
      status: false,
      message: "Access token not found.",
    });
  }

  // bikin access token di environment variable
  jwt.verify(token, process.env.ACCESS_TOKEN_SECRET, (err, user) => {
    if (err) {
      return utils.apiResponse(403, req, res, {
        status: false,
        message: "Invalid token.",
      });
    }
    req.user = user;
    next();
  });
}

module.exports = authenticateToken;