const app = require("./app");
const dotenv = require("dotenv");

dotenv.config();

const PORT = process.env.PORT ? process.env.PORT : 3000;

app.listen(PORT, () => {
  console.log("Express API running in port: " + PORT);
});
