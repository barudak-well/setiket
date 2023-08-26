// Layer Buat Handle Request dan Response, Validasi body juga disini.

const express = require("express");
const authenticateToken = require("../../middlewares/authenticateToken");
const utils = require("../../utils");

const router = express.Router();

/**
 * @swagger
 * /profile:
 *   get:
 *     summary: Get user profile using bearer token
 *     tags: [Profile]
 *     security:
 *       - bearerAuth: []
 *     responses:
 *       '200':
 *         description: Successful user profile retrieval
 *         content:
 *           application/json:
 *             schema:
 *               $ref: '#/components/schemas/ApiResponse'
 *             example:
 *               header:
 *                 time_request: "2023-08-26T14:19:39.807Z"
 *               body:
 *                 status: true
 *                 message: successfully got user info from token
 *                 body:
 *                   id: 2
 *                   email: sasuke@gmail.com
 *                   password: "$2a$10$bA1Jav54RBtC1K2YlNKbn.8Zf5v7//ziuJlYV8Gk/aopmUwnDWHNu"
 *                   fullname: Sasuke Uchiha
 *                   role: USER
 *                   status: PENDING
 *                   age: 18
 */

router.get("/", authenticateToken, async (req, res) => {
  try {
    const sanitizeUser = {
      id: req.user.id,
      email: req.user.email,
      password: req.user.password,
      fullname: req.user.fullname,
      role: req.user.role,
      status: req.user.status,
      age: req.user.age ? req.user.age : null,
    };
    return utils.apiResponse(200, req, res, {
      status: true,
      message: "successfully got user info from token",
      body: sanitizeUser,
    });
  } catch (err) {
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
});

module.exports = router;
