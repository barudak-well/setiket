// Layer Buat Handle Request dan Response, Validasi body juga disini.

const express = require("express");
const ticketService = require("./ticket.service");
const ticketValidator = require("../../validators/ticketValidator");
const utils = require("../../utils");
const validatorCatcher = require("../../middlewares/validatorCatcher");
const router = express.Router();

router.get("/", async (req, res) => {
  const template = "Masih Template";
  res.send(template);
});

/**
 * @swagger
 * components:
 *   schemas:
 *     Ticket:
 *       type: object
 *       properties:
 *         quantity:
 *           type: integer
 *         eventId:
 *           type: integer
 *         userId:
 *           type: integer
 */

/**
 * @swagger
 * /tickets:
 *   post:
 *     summary: Buy tickets for an event
 *     tags: [Tickets]
 *     requestBody:
 *       description: Ticket purchase details
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             $ref: '#/components/schemas/Ticket'
 *           example:
 *             quantity: 3
 *             eventId: 2
 *             userId: 1
 *     responses:
 *       '200':
 *         description: Successful ticket purchase
 *         content:
 *           application/json:
 *             schema:
 *               $ref: '#/components/schemas/ApiResponse'
 *             example:
 *               header:
 *                 time_request: "2023-08-22T13:55:14.797Z"
 *               body:
 *                 status: true
 *                 message: Success buying tickets
 *                 body:
 *                   id: 4
 *                   eventId: 2
 *                   userId: 1
 *                   quantity: 3
 *                   price: 30000
 *                   createdAt: "2023-08-22T13:55:13.729Z"
 */

router.post(
  "/",
  ticketValidator.createTicket,
  validatorCatcher,
  async (req, res) => {
    try {
      const sanitizeTicket = {
        quantity: req.body.quantity,
        eventId: req.body.eventId,
        userId: req.body.userId,
      };

      const tickets = await ticketService.createTicket(sanitizeTicket);
      return utils.apiResponse(201, req, res, {
        status: true,
        message: "Success buying tickets",
        body: tickets,
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
