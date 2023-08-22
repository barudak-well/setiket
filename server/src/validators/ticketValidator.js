const { check } = require("express-validator");

const createTicket = [
  check("quantity")
    .notEmpty()
    .withMessage("Quantity is required.")
    .isInt({ min: 1 })
    .withMessage("Quantity must be an integer")
    .toInt(),
  check("eventId")
    .notEmpty()
    .withMessage("Event Id is required.")
    .isInt()
    .withMessage("Event Id must be an integer")
    .toInt(),
  check("userId")
    .notEmpty()
    .withMessage("User Id is required.")
    .isInt()
    .withMessage("User Id must be an integer")
    .toInt(),
];

module.exports = { createTicket };
