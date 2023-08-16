const { validationResult } = require("express-validator");
const { apiResponse } = require("../utils/apiResponse");

const validatorCatcher = (req, res, next) => {
  const errorValidator = validationResult(req, { strictParams: ["body"] });
  if (!errorValidator.isEmpty()) {
    return apiResponse(422, req, res, {
      status: false,
      message: "Body request error",
      body: errorValidator.array(),
    });
  }

  next();
};

module.exports = validatorCatcher;
