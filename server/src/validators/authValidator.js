const { check } = require("express-validator");
const types = require("../config/types.config");

const register = [
  check("email")
    .trim()
    .notEmpty()
    .withMessage("Email is required.")
    .isEmail()
    .withMessage("Please Enter valid email."),
  check("fullname")
    .notEmpty()
    .withMessage("Fullname is required.")
    .isLength({ min: 4, max: 80 })
    .withMessage(
      "Fullname must atleast 4 characters and maximal of 80 characters."
    )
    .matches("^[a-zA-Z0-9_ ]+$")
    .withMessage("Fullname can only contain letter, number, white space, and underscore"),
  check("password")
    .notEmpty()
    .withMessage("Password is required.")
    .isLength({ min: 8, max: 20 })
    .withMessage(
      "Password must atleast 8 characters and maximal of 20 characters."
    )
    .trim()
    .escape(),
  check("age")
    .optional()
    .isInt({ min: 0 })
    .withMessage("Please enter valid age."),
  check("role")
    .notEmpty()
    .withMessage("Role is required.")
    .isIn([types.role.eo, types.role.user])
    .withMessage("Role must USER or EO."),
];

const login = [
  check("email")
    .trim()
    .notEmpty()
    .withMessage("Email is required.")
    .isEmail()
    .withMessage("Please Enter valid email"),
  check("password")
    .notEmpty()
    .withMessage("Password is required.")
    .trim()
    .escape(),
];

module.exports = {register, login}

