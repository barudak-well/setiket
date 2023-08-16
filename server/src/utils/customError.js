const customError = (statusCode, message) => ({
  statusCode,
  message,
  isCustomError: true,
});


module.exports = { customError };
