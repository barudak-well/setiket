const allowed = ["http://localhost:8000", "http://localhost:3000"];

const option = {
  origin: (origin, callback) => {
    if (allowed.includes(origin) || !origin) {
      return callback(null, true);
    } else {
      return callback(new Error("Not allowed by CORS"));
    }
  },
};

module.exports = option;
