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

app.use(express.urlencoded({ extended: true }));
app.use(express.json());
app.use(morgan("tiny"));
app.use(helmet());
app.use(cors(cors_options));
app.disable("x-powered-by");
app.use(function (req, res, next) {
  // Request methods you wish to allow
  res.setHeader(
    "Access-Control-Allow-Methods",
    "GET, POST, OPTIONS, PUT, PATCH, DELETE"
  );

  // Request headers you wish to allow
  res.setHeader(
    "Access-Control-Allow-Headers",
    "X-Requested-With,content-type"
  );

  // Set to true if you need the website to include cookies in the requests sent
  // to the API (e.g. in case you use sessions)
  res.setHeader("Access-Control-Allow-Credentials", true);

  // Pass to next layer of middleware
  next();
});

dotenv.config();

const CSS_URL = "https://cdnjs.cloudflare.com/ajax/libs/swagger-ui/4.1.0/swagger-ui.min.css";

app.use(
  "/api-docs",
  swaggerUi.serve,
  swaggerUi.setup(specs, {
    explorer: true,
    customSiteTitle: 'Backend Generator',
    customfavIcon: 'https://avatars.githubusercontent.com/u/6936373?s=200&v=4',
    customJs: [
      'https://cdnjs.cloudflare.com/ajax/libs/swagger-ui/4.15.5/swagger-ui-bundle.min.js',
      'https://cdnjs.cloudflare.com/ajax/libs/swagger-ui/4.15.5/swagger-ui-standalone-preset.min.js',
    ],
    customCssUrl: [
      'https://cdnjs.cloudflare.com/ajax/libs/swagger-ui/4.15.5/swagger-ui.min.css',
      'https://cdnjs.cloudflare.com/ajax/libs/swagger-ui/4.15.5/swagger-ui-standalone-preset.min.css',
      'https://cdnjs.cloudflare.com/ajax/libs/swagger-ui/4.15.5/swagger-ui.css',
    ],
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
app.use(express.static("."));

module.exports = app;
