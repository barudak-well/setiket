const express = require("express");
const dotenv = require("dotenv");
const helmet = require("helmet");
const swaggerJsdoc = require("swagger-jsdoc");
const swaggerUi = require("swagger-ui-express");
const morgan = require("morgan");
const cors = require("cors");

const { api } = require("./config/prefix.config");
const cors_options = require("./config/cors.config");
const swagger_options = require("./config/swagger.config");

const eventController = require("./api/event/event.controller");
const ticketController = require("./api/ticket/ticket.controller");
const notificationController = require("./api/notification/notification.controller");
const authController = require("./api/auth/auth.controller");
const userController = require("./api/user/user.controller");
const profileController = require("./api/profile/profile.controller");

const app = express();

const specs = swaggerJsdoc(swagger_options);

app.use(express.json());
app.use(morgan("tiny"));
app.use(helmet());
app.use(cors(cors_options));
app.disable("x-powered-by");

dotenv.config();

app.use(
  "/api-docs",
  swaggerUi.serve,
  swaggerUi.setup(specs, {
    explorer: true,
  })
);

app.get("/", (req, res) => {
  res.send("Selamat Datang Cuy, Cek /api-docs");
});

app.use(`${api}/events`, eventController);
app.use(`${api}/tickets`, ticketController);
app.use(`${api}/users`, userController);
app.use(`${api}/profile`, profileController);
app.use(`${api}/notification`, notificationController);
app.use(`${api}/auth`, authController);

module.exports = app;
