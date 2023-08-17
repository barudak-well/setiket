const { check } = require("express-validator");
const types = require("../config/types.config");

const register = [
  check("email")
    .trim()
    .notEmpty()
    .withMessage("Email is required.")
    .isEmail()
    .withMessage("Please Enter valid email"),
  check("fullname")
    .notEmpty()
    .withMessage("Fullname is required.")
    .isLength({ min: 4, max: 80 }),
  check("password")
    .notEmpty()
    .withMessage("Password is required.")
    .isLength({ min: 8, max: 20 })
    .withMessage("Password must be more than 8 and less than 20 characters.")
    .trim()
    .escape(),
  check("age").optional(),
  check("role")
    .notEmpty()
    .withMessage("Role is required.")
    .isIn([types.role.eo, types.role.user])
    .withMessage("Role must USER or EO"),
];

module.exports = {register}
