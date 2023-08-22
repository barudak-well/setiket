// Layer Buat Handle Request dan Response, Validasi body juga disini.

const express = require("express");
const eventValidator = require("../../validators/eventValidator");
const validatorCatcher = require("../../middlewares/validatorCatcher");
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
 * /api/events:
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

module.exports = router;
