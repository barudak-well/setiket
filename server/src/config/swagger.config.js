const options = {
  definition: {
    swagger: "2.0",
    openapi: "3.1.0",
    info: {
      title: "SeTiket Express API with Swagger",
      version: "1.0.0",
      description:
        "This is a SeTiket Server made with Express and documented with Swagger",
    },
    servers: [
      {
        url: "http://localhost:3000/api",
      },
    ],
  },
  apis : ['./src/api/*/*.controller.js']
};

module.exports = options;
