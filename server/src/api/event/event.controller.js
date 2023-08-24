// Layer Buat Handle Request dan Response, Validasi body juga disini.

const express = require("express");
const eventValidator = require("../../validators/eventValidator");
const validatorCatcher = require("../../middlewares/validatorCatcher");
const authenticateToken = require("../../middlewares/authenticateToken");
const eventService = require("../event/event.service");
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
 *         userId:
 *           type: integer
 *         title:
 *           type: string
 *         description:
 *           type: string
 *         datetime:
 *           type: string
 *           format: date-time
 *         city:
 *           type: string
 *         locationDetail:
 *           type: string
 *         ticketPrice:
 *           type: number
 *           format: float
 *         capacity:
 *           type: integer
 *         category:
 *           type: string
 *         status:
 *           type: string
 *         createdAt:
 *           type: string
 *           format: date-time
 */

/**
 * @swagger
 * components:
 *   schemas:
 *     Event:
 *       type: object
 *       properties:
 *         id:
 *           type: integer
 *         userId:
 *           type: integer
 *         title:
 *           type: string
 *         description:
 *           type: string
 *         datetime:
 *           type: string
 *           format: date-time
 *         city:
 *           type: string
 *         locationDetail:
 *           type: string
 *         ticketPrice:
 *           type: number
 *           format: float
 *         capacity:
 *           type: integer
 *         category:
 *           type: string
 *         status:
 *           type: string
 *         createdAt:
 *           type: string
 *           format: date-time
 *     ApiResponse:
 *       type: object
 *       properties:
 *         header:
 *           type: object
 *           properties:
 *             time_request:
 *               type: string
 *               format: date-time
 *         body:
 *           type: object
 *           properties:
 *             status:
 *               type: boolean
 *             message:
 *               type: string
 *             body:
 *               type: array
 *               items:
 *                 $ref: '#/components/schemas/Event'
 */

/**
 * @swagger
 * /events:
 *   get:
 *     summary: Get events based with optional query for more specific
 *     tags: [Events]
 *     parameters:
 *       - in: query
 *         name: search
 *         schema:
 *           type: string
 *         description: Search query for event title
 *       - in: query
 *         name: location
 *         schema:
 *           type: string
 *           enum: [BANDUNG, JAKARTA, SURABAYA, OTHER]
 *         description: Event City
 *       - in: query
 *         name: sort
 *         schema:
 *           type: string
 *           enum: [asc, desc]
 *         description: Sorting order default desc
 *       - in: query
 *         name: category
 *         schema:
 *           type: string
 *           enum: [MUSIC, ART, SPORTS, CULINARY, TECH, LIFESTYLE, BUSINESS, EDUCATION, ENTERTAINMENT, CHARITY, OTHER]
 *         description: Event category
 *       - in: query
 *         name: page
 *         schema:
 *           type: integer
 *         description: Page number for pagination default 1
 *       - in: query
 *         name: limit
 *         schema:
 *           type: integer
 *         description: Number of events per page for pagination default 30
 *       - in: query
 *         name: date_lte
 *         schema:
 *           type: string
 *           format: date
 *         description: End date for event range (YYYY-MM-DD format)
 *       - in: query
 *         name: date_gte
 *         schema:
 *           type: string
 *           format: date
 *         description: Start date for event range (YYYY-MM-DD format)
 *     responses:
 *       '200':
 *         description: Successful response containing a list of events
 *         content:
 *           application/json:
 *             schema:
 *               $ref: '#/components/schemas/ApiResponse'
 *             example:
 *               header:
 *                 time_request: "2023-08-21T15:16:36.723Z"
 *               body:
 *                 status: true
 *                 message: success get all events
 *                 body:
 *                   - id: 7
 *                     userId: 1
 *                     title: Car Meet Bandung
 *                     description: null
 *                     datetime: "2023-09-25T00:12:00.000Z"
 *                     city: BANDUNG
 *                     locationDetail: Bandung Convention Center
 *                     ticketPrice: 0
 *                     capacity: 200
 *                     category: LIFESTYLE
 *                     status: VERIFIED
 *                     createdAt: "2023-08-21T07:29:18.605Z"
 *                   # ... (other event objects)
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

/**
 * @swagger
 * /events/my-events:
 *   get:
 *     summary: Get user-specific upcoming and past events
 *     tags:
 *       - Events
 *     security:
 *       - BearerAuth: []
 *     responses:
 *       '200':
 *         description: Successful response containing user-specific events
 *         content:
 *           application/json:
 *             example:
 *               header:
 *                 time_request: "2023-08-24T12:05:02.199Z"
 *               body:
 *                 status: true
 *                 message: Success get your events
 *                 body:
 *                   upcomingEvents:
 *                     - id: 16
 *                       eventId: 5
 *                       userId: 2
 *                       quantity: 1
 *                       price: 50000
 *                       createdAt: "2023-08-24T10:46:43.275Z"
 *                       event:
 *                         id: 5
 *                         userId: 1
 *                         title: Pensi SMA X Kolaborasi SMK Y
 *                         description: Datang dan saksikan banyak artis di Pensi Kolaborasi ini
 *                         imageUrl: https://fastly.picsum.photos/id/452/4096/2722.jpg?hmac=VFr5l8FshPX1LW4DCpHm99QQgWMsHW5Lr70-6ZQZuFg
 *                         startDatetime: "2023-08-31T21:00:00.000Z"
 *                         endDatetime: "2023-08-31T17:00:00.000Z"
 *                         city: BANDUNG
 *                         locationDetail: Lapangan Pusenif, Bandung
 *                         ticketPrice: 50000
 *                         capacity: 200
 *                         remainingCapacity: 199
 *                         category: MUSIC
 *                         status: VERIFIED
 *                         createdAt: "2023-08-21T07:22:00.000Z"
 *                   pastEvents:
 *                     - id: 17
 *                       eventId: 7
 *                       userId: 2
 *                       quantity: 1
 *                       price: 0
 *                       createdAt: "2023-08-24T10:46:52.749Z"
 *                       event:
 *                         id: 7
 *                         userId: 1
 *                         title: Car Meet Bandung
 *                         description: null
 *                         imageUrl: https://fastly.picsum.photos/id/1071/3000/1996.jpg?hmac=rPo94Qr1Ffb657k6R7c9Zmfgs4wc4c1mNFz7ND23KnQ
 *                         startDatetime: "2023-08-08T12:00:00.000Z"
 *                         endDatetime: "2023-08-08T08:30:00.000Z"
 *                         city: BANDUNG
 *                         locationDetail: BANDUNG
 *                         ticketPrice: 0
 *                         capacity: 200
 *                         remainingCapacity: 199
 *                         category: LIFESTYLE
 *                         status: VERIFIED
 *                         createdAt: "2023-08-21T07:29:00.000Z"
 *                   # ... other past event objects ...
 */

router.get(
  "/",
  eventValidator.allEvents,
  validatorCatcher,
  async (req, res) => {
    try {
      const sanitizeQuery = {
        category: req.query.category ? req.query.category : null,
        location: req.query.location ? req.query.location : null,
        search: req.query.search ? req.query.search : null,
        page: req.query.page ? parseInt(req.query.page) : null,
        limit: req.query.limit ? parseInt(req.query.limit) : null,
        date_lte: req.query.date_lte ? req.query.date_lte : null,
        date_gte: req.query.date_gte ? req.query.date_gte : null,
        sort: req.query.sort ? req.query.sort : null,
      };

      const events = await eventService.getAllEvents(sanitizeQuery);

      return utils.apiResponse(200, req, res, {
        status: true,
        message: "success get all events",
        body: events,
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
  }
);

router.get("/my-events", authenticateToken, async (req, res) => {
  try {
    // const myEvents=
    const userId = req.user.id;
    const myEventAndTicket = await eventService.getMyEventAndTicket(userId);
    return utils.apiResponse("200", req, res, {
      status: true,
      message: "Success get your events",
      body: myEventAndTicket,
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

router.get("/:id", async (req, res) => {
  try {
    const eventId = Number(req.params.id);
    if (!eventId) {
      return utils.apiResponse(400, req, res, {
        status: false,
        message: "Bad id parameter",
      });
    }
    const event = await eventService.getEventById(eventId);
    return utils.apiResponse(200, req, res, {
      status: true,
      message: "Fetched event",
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

module.exports = router;
