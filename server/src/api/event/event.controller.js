// Layer Buat Handle Request dan Response, Validasi body juga disini.

const express = require("express");
const eventService = require("./event.service");
const authValidator = require("../../validators/authValidator");
const validatorCatcher = require("../../middlewares/validatorCatcher");
const utils = require("../../utils");

const router = express.Router();

/**
 * @swagger
 * components:
 *   schemas:
 *     Event:
 *       type: object
 *       properties:
 *         id:
 *           type: integer
 *           description: The ID of the event.
 *         title:
 *           type: string
 *           description: The title of the event.
 *         description:
 *           type: string
 *           description: A description of the event.
 *         date:
 *           type: string
 *           format: date-time
 *           description: The date and time of the event.
 *         ticketPrice:
 *           type: number
 *           description: The ticket price for the event.
 *         createdAt:
 *           type: string
 *           format: date-time
 *           description: The creation date of the event.
 *         updatedAt:
 *           type: string
 *           format: date-time
 *           description: The last update date of the event.
 */

/**
 * @swagger
 * /events:
 *   get:
 *     summary: Get a list of events
 *     tags: [Events]
 *     responses:
 *       200:
 *         description: Successful response
 *         content:
 *           application/json:
 *             schema:
 *               type: array
 *               items:
 *                 $ref: '#/components/schemas/Event'
 *             example:
 *               - id: 2
 *                 title: CompFest SEA Academy
 *                 description: COMPFEST adalah acara IT Tahunan Terbesar yang diselenggarakan mahasiswa Fakultas Ilmu Komputer Universitas Indonesia.
 *                 date: "2023-10-10T12:00:00.000Z"
 *                 ticketPrice: 0
 *                 createdAt: "2023-08-13T16:13:26.683Z"
 *                 updatedAt: "2023-01-12T12:00:00.000Z"
 *               - id: 3
 *                 title: Konser Dewa 19
 *                 description: konser spesial dari dewa 19
 *                 date: "2023-08-12T12:00:00.000Z"
 *                 ticketPrice: 60000
 *                 createdAt: "2023-08-13T16:15:02.587Z"
 *                 updatedAt: "2023-08-12T12:00:00.000Z"
 *               - id: 4
 *                 title: Meet & Greet Ronaldo dan Messi
 *                 description: Meet and Greet sekali seumur hidup bang ronaldo dan juga Messi
 *                 date: "2023-10-13T12:00:00.000Z"
 *                 ticketPrice: 150000
 *                 createdAt: "2023-08-13T16:17:34.264Z"
 *                 updatedAt: "2023-08-13T12:00:00.000Z"
 */

/**
 * @swagger
 * /events/{id}:
 *   get:
 *     summary: Get an event and its details
 *     tags: [Events]
 *     parameters:
 *       - in: path
 *         name: id
 *         required: true
 *         description: The ID of the event to retrieve
 *         schema:
 *           type: integer
 *     responses:
 *       200:
 *         description: Successful response
 *         content:
 *           application/json:
 *             schema:
 *               type: '#/components/schemas/Event'
 *             example:
 *               id: 2
 *               title: CompFest SEA Academy
 *               description: COMPFEST adalah acara IT Tahunan Terbesar yang diselenggarakan mahasiswa Fakultas Ilmu Komputer Universitas Indonesia.
 *               imageUrl: https://image-url.com
 *               datetime: 2023-08-19T19:00:00.000Z
 *               city: BANDUNG
 *               ticketPrice: 200000
 *               capacity: 100
 *               category: ART
 *               status: VERIFIED
 *               createdAt: 2023-08-13T16:13:26.683Z
 */


router.get("/", async (req, res) => {
  const events = await getAllEvents();
  res.send(events);
});

router.get("/:id", async (req, res) => {
  try {
    const eventId = parseInt(req.params.id);
    const event = await eventService.getEventById(eventId);
    return utils.apiResponse(200, req, res, {
      status: true,
      message: "fetched event",
      body: event,
    });

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

router.get("/:id/tickets", async (req, res) => {
  // Apakah try catch disini atau mending di bagian service?
  try {
    const eventId = parseInt(req.params.id);
    const events = await getEventAndTheTicketById(eventId);
    res.send(events);
  } catch (err) {
    res.status(400).send(err.message);
  }
});

module.exports = router;
