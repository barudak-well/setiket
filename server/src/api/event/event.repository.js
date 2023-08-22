// Layer Handling Request Ke DB

const prisma = require("../../db");

const findAllEvents = async ({ where, sort, skip, take }) => {
  const events = await prisma.event.findMany({
    orderBy: {
      createdAt: sort,
    },
    where,
    skip,
    take,
  });
  return events;
};

const subtractEventCapacity = async ({ eventId, quantity }) => {
  await prisma.event.update({
    where: {
      id: eventId,
    },
    data: {
      remainingCapacity: {
        decrement: quantity,
      },
    },
  });
};

const findEventById = async (id) => {
  const event = await prisma.event.findUnique({
    where: {
      id,
    },
  });
  return event;
};

const findEventAndTheTicketById = async (id) => {
  const eventAndTicket = await prisma.event.findFirst({
    where: {
      id,
    },
    include: {
      tickets: true,
    },
  });
  return eventAndTicket;
};

module.exports = {
  findAllEvents,
  findEventById,
  findEventAndTheTicketById,
  subtractEventCapacity,
};
