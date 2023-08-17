const { validationResult } = require("express-validator");
const utils = require("../utils");

const validatorCatcher = (req, res, next) => {
  const errorValidator = validationResult(req, { strictParams: ["body"] });
  if (!errorValidator.isEmpty()) {
    return utils.apiResponse(422, req, res, {
      status: false,
      message: "Body request error",
      body: errorValidator.array(),
    });
  }

  next();
};

module.exports = validatorCatcher;
