// Layer Handling Request Ke DB

const prisma = require("../../db");

const findEvents = async () => {
  const events = await prisma.event.findMany();
  return events;
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
        }
    })
    return eventAndTicket
}

module.exports = {
  findEvents,
  findEventById,
  findEventAndTheTicketById
};
