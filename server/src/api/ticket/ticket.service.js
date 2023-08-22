// Layer buat handling bisnis logic

const utils = require("../../utils");
const eventRepository = require("../event/event.repository");
const ticketRepository = require("../ticket/ticket.repository");

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

    if (!tickets)
      throw utils.customError("400", "Failed to buy tickets");

    return tickets

    // ADD NOTIFIKASI JUGA DIBAWAH
    
  } catch (err) {
    if (err.isCustomError) throw err;
    throw new Error(err);
  }
};

module.exports = { createTicket };
