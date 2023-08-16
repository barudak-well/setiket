// Layer Buat Handle Request dan Response, Validasi body juga disini.

const jwt = require('jsonwebtoken');
const express = require("express");
const { getUserByUsername } = require("./auth.service");

const router = express.Router();

router.get('/', authenticateToken, (req, res) => {
  res.json(req.user);
})

router.get("/login/:username", async (req, res) => {
    try {
        const targetUsername = req.params.username;
        const targetUser = await getUserByUsername(targetUsername);
        res.send(targetUser);
      } catch (err) {
        res.status(400).send(err.message);
      }
})

router.post("/login", async (req, res) => {
  try {
    const user = await getUserByUsername(req.body.username);
    if (req.body.password !== user.password) {
      throw Error("Password salah");
    } else {
      const accessToken = jwt.sign(user, process.env.ACCESS_TOKEN_SECRET);
      res.json({ accessToken: accessToken });
    }
   } catch (err) {
    res.status(401).send(err.message);
  }  
})

function authenticateToken(req, res, next) {
  const authHeader = req.headers['authorization'];
  const token = authHeader && authHeader.split(" ")[1];
  if (!token) {
    return res.sendStatus(401);
  } 

// bikin access token di environment variable
  jwt.verify(token, process.env.ACCESS_TOKEN_SECRET, (err, user) => {
    if (err) {
      return res.sendStatus(403);
    }
    req.user = user;
    next();
  })
}

module.exports = router