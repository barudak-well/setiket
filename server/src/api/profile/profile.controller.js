// Layer Buat Handle Request dan Response, Validasi body juga disini.

const express = require("express")
const authenticateToken = require("../../middlewares/authenticateToken");
const utils = require("../../utils")

const router = express.Router()

router.get("/", authenticateToken, async (req, res) => {
    try {
      const sanitizeUser = {
        id: req.user.id,
        email: req.user.email,
        password: req.user.password,
        fullname: req.user.fullname,
        role: req.user.role,
        status: req.user.status,
        age: req.user.age ? req.user.age : null
      }
      return utils.apiResponse(200, req, res, {
        status: true,
        message: "successfully got user info from token",
        body: sanitizeUser,
      });
    } catch(err) {
        if (err.isCustomError) {
            return utils.apiResponse(err.statusCode, req, res, {
              status: false,
              message: err.message,
            });
          } else {
            return utils.apiResponse("500", req, res, {
              status: false,
              message: err.message ? err.message : "Sorry Something Error",
            });
          }
    }
})

module.exports = router;