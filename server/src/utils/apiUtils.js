const apiResponse = (status, req, res, body) => {
  return res.status(status).json({
    header: {
      time_request: new Date(),
      ip_address: req.connection.remoteAdress,
    },
    body,
  });
};

const customError = (statusCode, message) => ({
  statusCode,
  message,
  isCustomError: true,
});

module.exports = { apiResponse, customError };
