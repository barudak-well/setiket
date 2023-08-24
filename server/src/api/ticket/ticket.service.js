// Layer buat handling bisnis logic

const utils = require("../../utils");
const eventRepository = require("../event/event.repository");
const ticketRepository = require("../ticket/ticket.repository");
const notificationRepository = require("../notification/notification.repository");
const types = require("../../config/types.config");

const createTicket = async (ticketData) => {
  try {
    // Buat Cek Kapasitas Nanti
    const event = await eventRepository.findEventById(ticketData.eventId);
    if (!event) throw utils.customError(404, "Sorry the event is already full");
    if (event.remainingCapacity === 0)
      throw utils.customError(409, "Sorry the event is already full");
    if (event.remainingCapacity < ticketData.quantity)
      throw utils.customError(
        409,
        `Sorry, you book ${ticketData.quantity} ticket, but only ${event.remainingCapacity} ticket is remaining`
      );
    const tickets = await ticketRepository.createTicket({
      ...ticketData,
      price: event.ticketPrice,
    });

    if (!tickets) throw utils.customError("400", "Failed to buy tickets");

    await eventRepository.subtractEventCapacity({
      eventId: ticketData.eventId,
      quantity: ticketData.quantity,
    });

    const notification = await notificationRepository.createNotification({
      fromId: ticketData.userId,
      toId: event.userId,
      type: types.notification.ticket,
      receiver: types.notificationReceiver.eo,
      message: `A new ticket purchase for ${event.title} event`,
    });

    if (!notification)
      throw utils.customError("400", "Failed to add notification");

    return tickets;
  } catch (err) {
    if (err.isCustomError) throw err;
    throw new Error(err);
  }
};

module.exports = { createTicket };
