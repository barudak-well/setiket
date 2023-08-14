// Layer Buat Handle Request dan Response, Validasi body juga disini.

const express = require("express")
const { getAllEvents, getEventById, getEventAndTheTicketById } = require("./event.service")

const router = express.Router()

router.get("/", async (req, res) => {
    const events  = await getAllEvents()
    res.send(events)
})

router.get("/:id", async (req, res) => {
    // Apakah try catch disini atau mending di bagian service?
    try{
        const eventId = parseInt(req.params.id)
        const events  = await getEventById(eventId)
        res.send(events)
    } catch(err){
        res.status(400).send(err.message)
    }
})

router.get("/:id/tickets", async (req, res) => {
    // Apakah try catch disini atau mending di bagian service?
    try{
        const eventId = parseInt(req.params.id)
        const events  = await getEventAndTheTicketById(eventId)
        res.send(events)
    } catch(err){
        res.status(400).send(err.message)
    }
})

module.exports = router;