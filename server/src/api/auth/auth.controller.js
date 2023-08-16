// Layer Buat Handle Request dan Response, Validasi body juga disini.

const express = require("express");
const { register } = require("./auth.service");
const { apiResponse } = require("../../utils/apiResponse");
const { registerValidator } = require("../../validators/authValidator");
const validatorCatcher = require("../../middlewares/validatorErrorCatcher");

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
 * /register:
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

router.post(
  "/register",
  registerValidator,
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
      const newUser = await register(sanitizeUser);
      return apiResponse(201, req, res, {
        status: true,
        message: "success adding new user",
        body: newUser,
      });
    } catch (err) {
      if (err.isCustomError) {
        return apiResponse(err.statusCode, req, res, {
          status: false,
          message: err.message,
        });
      } else {
        return apiResponse("500", req, res, {
          status: false,
          message: err.message ? err.message : "Sorry Something Error",
        });
      }
    }
  }
);

module.exports = router;
