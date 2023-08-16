const apiResponse = (status, req, res, body) => {
  return res.status(status).json({
    header: {
      time_request: new Date(),
      ip_address: req.connection.remoteAdress,
    },
    body,
  });
};

module.exports = { apiResponse };
