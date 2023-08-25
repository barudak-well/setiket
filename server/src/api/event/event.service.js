// Layer buat handling bisnis logic
const eventRepository = require("./event.repository");
const ticketRepository = require("../ticket/ticket.repository");
const utils = require("../../utils");

const formatQueryParams = (queryParams) => {
  const where = {};
  where.startDatetime = {};
  where.endDatetime = {};
  where.title = {};
  where.status = "VERIFIED";

  if (queryParams.category) {
    where.category = queryParams.category;
  }
  if (queryParams.location) {
    where.city = queryParams.location;
  }
  if (queryParams.search) {
    where.title.contains = queryParams.search;
    where.title.mode = "insensitive";
  }
  if (queryParams.date_lte && queryParams.date_gte) {
    where.startDatetime.lte = new Date(queryParams.date_lte);
    where.endDatetime.gte = new Date(queryParams.date_gte);
  }

  const sort = queryParams.sort ? queryParams.sort : "desc";

  const skip =
    queryParams.page && queryParams.limit
      ? (queryParams.page - 1) * queryParams.limit
      : 0;
  const take = queryParams.page && queryParams.limit ? queryParams.limit : 30;

  return { where, sort, skip, take };
};

const separateEventsByTime = (eventsArray) => {
  const currentTime = new Date();

  const upcomingEvents = [];
  const pastEvents = [];

  eventsArray.forEach((ticket) => {
    const eventEndDatetime = new Date(ticket.event.endDatetime);
    if (eventEndDatetime < currentTime) {
      pastEvents.push(ticket);
    } else {
      upcomingEvents.push(ticket);
    }
  });

  return [upcomingEvents, pastEvents];
};

const getAllEvents = async (queryParams) => {
  try {
    const { where, sort, skip, take } = formatQueryParams(queryParams);
    const events = await eventRepository.findAllEvents({
      where,
      sort,
      skip,
      take,
    });
    return events;
  } catch (err) {
    if (err.isCustomError) throw err;
    throw new Error(err);
  }
};

const getEventById = async (id) => {
  const event = await eventRepository.findEventById(id);
  if (!event) {
    throw utils.customError("404", "Event not found");
  }
  return event;
};

const getMyEventAndTicket = async (userId) => {
  try {
    const myEventAndTicket = await ticketRepository.findMyTicketAndEvents(
      userId
    );
    // if (!myEventAndTicket) return myEventAndTicket;
    const [upcomingEvents, pastEvents] = separateEventsByTime(myEventAndTicket);
    return {
      upcomingEvents: upcomingEvents,
      pastEvents: pastEvents,
    };
  } catch (err) {
    if (err.isCustomError) throw err;
    throw new Error(err);
  }
};

const getEventAndTheTicketById = async (id) => {
  const eventAndTicket = eventRepository.findEventAndTheTicketById(id);
  if (!eventAndTicket) {
    throw Error("Event tidak ditemukan");
  }
  return eventAndTicket;
};

module.exports = {
  getAllEvents,
  getEventById,
  getEventAndTheTicketById,
  getMyEventAndTicket,
};
