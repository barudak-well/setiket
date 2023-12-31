const { query } = require("express-validator");
const types = require("../config/types.config");
const utils = require("./../utils");

const allEvents = [
  query("page")
    .optional()
    .custom((value, { req }) => {
      if (typeof req.query.limit === "undefined")
        throw new Error(
          "When using page query, you almost include limit query."
        );
      return true;
    })
    .isInt()
    .withMessage("page query must be a number."),
  query("limit")
    .optional()
    .custom((value, { req }) => {
      if (typeof req.query.page === "undefined")
        throw new Error(
          "When using limit query, you almost include page query."
        );
      return true;
    })
    .isInt()
    .withMessage("limit query must be a number."),
  query("category")
    .optional()
    .isIn(Object.values(types.eventCategory))
    .withMessage(
      `Category must one of this: ${Object.values(types.eventCategory).join(
        ", "
      )}`
    ),
  query("sort")
    .optional()
    .isIn(["asc", "desc"])
    .withMessage(`Sort must be "asc" or "desc"`),
  query("date_lte")
    .optional()
    .custom((value, { req }) => {
      if (typeof req.query.date_gte === "undefined")
        throw new Error(
          "When using page query, you almost include date_gte query."
        );
      return true;
    })
    .custom((value, { req }) => {
      if (utils.isGreaterThan(req.query.date_gte, value))
        throw new Error("date_lte must greater than date_gte");
      return true;
    })
    .isDate()
    .withMessage("page query must be a date."),
  query("date_gte")
    .optional()
    .custom((value, { req }) => {
      if (typeof req.query.date_lte === "undefined")
        throw new Error(
          "When using limit query, you almost include date_lte query."
        );
      return true;
    })
    .custom((value, { req }) => {
      if (utils.isGreaterThan(value, req.query.date_lte))
        throw new Error("date_lte must greater than date_gte");
      return true;
    })
    .isDate()
    .withMessage("page query must be a date."),
  query("location")
    .optional()
    .isIn(Object.values(types.eventCity))
    .withMessage(
      `Category must one of this: ${Object.values(types.eventCity).join(", ")}`
    ),
  query("location")
    .optional()
    .isIn(Object.values(types.eventCity))
    .withMessage(
      `Category must one of this: ${Object.values(types.eventCity).join(", ")}`
    ),
  query("search").optional().isString().withMessage("Search must be a string."),
];

module.exports = { allEvents };
