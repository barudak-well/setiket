// Layer Buat Handle Request dan Response, Validasi body juga disini.

const express = require("express")

const router = express.Router()

router.get("/", async (req, res) => {
    const template  = "Masih Template"
    res.send(template)
})

module.exports = router;