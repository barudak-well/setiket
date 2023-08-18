// Layer Buat Handle Request dan Response, Validasi body juga disini.
const express = require("express");
const authService = require("./auth.service");
const jwt = require("jsonwebtoken");
const authValidator = require("../../validators/authValidator");
const validatorCatcher = require("../../middlewares/validatorCatcher");
const utils = require("../../utils");
const bcrypt = require("bcryptjs");

const router = express.Router();

router.get("/", async (req, res) => {
  const template = "Masih Template";
  res.send(template);
});

/**
 * @swagger
 * components:
 *   schemas:
 *     User:
 *       type: object
 *       properties:
 *         id:
 *           type: integer
 *           description: The ID of the user.
 *         email:
 *           type: string
 *           format: email
 *           description: The email address of the user.
 *         fullname:
 *           type: string
 *           description: The full name of the user.
 *         age:
 *           type: integer
 *           format: int32
 *           description: The age of the user.
 *         password:
 *           type: string
 *           description: The password of the user.
 *         status:
 *           type: string
 *           description: The status of the user.
 *         role:
 *           type: string
 *           enum:
 *             - USER
 *             - EO
 *           description: The role of the user.
 *         createdAt:
 *           type: string
 *           format: date-time
 *           description: The creation date of the user.
 */

/**
 * @swagger
 * /auth/register:
 *   post:
 *     summary: Register a new user
 *     tags: [Users]
 *     requestBody:
 *       description: User registration details
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             $ref: '#/components/schemas/User'
 *           example:
 *             email: halocuy@gmail.com
 *             fullname: halo cuy
 *             password: 123palocuygaskeun
 *             role: USER
 *             age: 12
 *     responses:
 *       200:
 *         description: Successful user registration
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 header:
 *                   type: object
 *                   properties:
 *                     time_request:
 *                       type: string
 *                       format: date-time
 *                 body:
 *                   type: object
 *                   properties:
 *                     status:
 *                       type: boolean
 *                     message:
 *                       type: string
 *                     body:
 *                       $ref: '#/components/schemas/User'
 *                       example:
 *                         id: 1
 *                         email: halocuy@gmail.com
 *                         fullname: halo cuy
 *                         age: null
 *                         password: "$2a$10$FOMELsoT1vMJX2OPwV3riO.8oOfxr.EjS36VqT6mdurype6xdkm/i"
 *                         status: VERIFIED
 *                         role: USER
 *                         createdAt: "2023-08-16T12:06:40.569Z"
 */

/**
 * @swagger
 * /auth/login:
 *   post:
 *     summary: Logging in a user
 *     tags: [Users]
 *     requestBody:
 *       description: User login details
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             $ref: '#/components/schemas/User'
 *           example:
 *             email: halocuy@gmail.com
 *             password: 123palocuygaskeun
 *     responses:
 *       200:
 *         description: Successful user login
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 header:
 *                   type: object
 *                   properties:
 *                     time_request:
 *                       type: string
 *                       format: date-time
 *                 body:
 *                   type: object
 *                   properties:
 *                     status:
 *                       type: boolean
 *                     message:
 *                       type: string
 *                     body:
 *                       $ref: '#/components/schemas/User'
 *                       example:
 *                         accessToken: eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NDAsImVtYWlsIjoibW5lb2NpY2Vyb2tAZ21haWwuY29tIiwiZnVsbG5hbWUiOiJOZW8gTmVvIiwiYWdlIjoxOCwicGFzc3dvcmQiOiIkMmEkMTAkNm9yN0pXRmdVTGxYNTM5b3E0L0x3T0p6S2VEaC9CdmxtOU1NZThtQVRsbGlkSHBRdzBuNjIiLCJzdGF0dXMiOiJWRVJJRklFRCIsInJvbGUiOiJVU0VSIiwiY3JlYXRlZEF0IjoiMjAyMy0wOC0xOFQwNjoyMTo1My43MTFaIiwiaWF0IjoxNjkyMzQzNDg0fQ.e8hUthiojrUHxQUHrQqgdIQxvG5-V11SMzurRskRRU0
 */

router.post(
  "/register",
  authValidator.register,
  validatorCatcher,
  async (req, res) => {
    try {
      const sanitizeUser = {
        email: req.body.email,
        password: req.body.password,
        fullname: req.body.fullname,
        role: req.body.role,
        age: req.body.age ? req.body.age : null,
      };
      const newUser = await authService.register(sanitizeUser);
      return utils.apiResponse(201, req, res, {
        status: true,
        message: "success adding new user",
        body: newUser,
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
  }
);

router.post("/login",
  authValidator.login,
  validatorCatcher,
  async (req, res) => {
  try {
    const sanitizeUser = {
      email: req.body.email,
      password: req.body.password,
    };

    const user = await authService.getUserByEmail(sanitizeUser.email);

    if (!bcrypt.compareSync(sanitizeUser.password, user.password)) {
      throw utils.customError("401", "Wrong password");
    } else {
      const accessToken = jwt.sign(user, process.env.ACCESS_TOKEN_SECRET);

      return utils.apiResponse(200, req, res, {
        status: true,
        message: "successfully logged in",
        body: { accessToken : accessToken },
      });
    }

  } catch (err) {
    if (err.isCustomError) {
      return utils.apiResponse(err.statusCode, req, res, {
        status: false,
        message: err.message,
      });
    } else {
      return utils.apiResponse(500, req, res, {
        status: false,
        message: err.message ? err.message : "Sorry Something Error",
      });
    }
  }
});

function authenticateToken(req, res, next) {
  const authHeader = req.headers["authorization"];
  const token = authHeader && authHeader.split(" ")[1];
  if (!token) {
    return res.sendStatus(401);
  }

  // bikin access token di environment variable
  jwt.verify(token, process.env.ACCESS_TOKEN_SECRET, (err, user) => {
    if (err) {
      return res.sendStatus(403);
    }
    req.user = user;
    next();
  });
}

// router.get("/login/:email", async (req, res) => {
//     try {
//         const targetEmail = req.params.email;
//         const targetUser = await authService.getUserByEmail(targetEmail);
//         res.send(targetUser);
//       } catch (err) {
//         res.status(400).send(err.message);
//       }
// })

module.exports = router;
