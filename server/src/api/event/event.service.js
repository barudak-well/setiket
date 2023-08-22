// Layer buat handling bisnis logic

const eventRepository = require("./event.repository");
const types = require("../../config/types.config");
const utils = require("../../utils");

const getAllEvents = async () => {
  const event = await eventRepository.findEvents();
  return event;
};

const getEventById = async (id) => {
  const event = await eventRepository.findEventById(id);
  if (!event) {
    throw utils.customError("404", "Event not found");
  }
  return event;
};

const getEventAndTheTicketById = async (id) => {
    const eventAndTicket = eventRepository.findEventAndTheTicketById(id);
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
