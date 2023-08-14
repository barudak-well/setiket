// Layer buat handling bisnis logic

const { findEvents, findEventById, findEventAndTheTicketById } = require("./event.repository");

const getAllEvents = async () => {
  const event = await findEvents();
  return event;
};

const getEventById = async (id) => {
  const event = findEventById(id);
  if (!event) {
    throw Error("Event tidak ditemukan");
  }
  return event;
};

const getEventAndTheTicketById = async (id) => {
    const eventAndTicket = findEventAndTheTicketById(id);
    if (!eventAndTicket) {
      throw Error("Event tidak ditemukan");
    }
    return eventAndTicket;
}

module.exports = {
  getAllEvents,
  getEventById,
  getEventAndTheTicketById
};
