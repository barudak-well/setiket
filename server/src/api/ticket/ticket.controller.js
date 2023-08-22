// Layer Buat Handle Request dan Response, Validasi body juga disini.

const express = require("express");
const ticketService = require("./ticket.service");
const utils = require("../../utils");
const router = express.Router();

router.get("/", async (req, res) => {
  const template = "Masih Template";
  res.send(template);
});

router.post("/", async (req, res) => {
  try {
    // const template = "Masih Template Post";
    const sanitizeTicket = {
      quantity: req.body.quantity,
      eventId: req.body.eventId,
      userId: req.body.userId,
    };

    // price itu kita ambil aja dari db eventsnya, buat mastiin keamanan
    const tickets = await ticketService.createTicket(sanitizeTicket);
    return utils.apiResponse(201, req, res, {
      status: true,
      message: "Success buying tickets",
      body: tickets,
    });

    // Add Notifications

  } catch (err) {
    if (err.isCustomError) {
      return utils.apiResponse(err.statusCode, req, res, {
        status: false,
        message: err.message,
      });
    } else {
      return utils.apiResponse("500", req, res, {
        status: false,
        message: err.message ? err.message : "Sorry Something Error",
      });
    }
  }
});

module.exports = router;
