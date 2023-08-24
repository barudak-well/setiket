// Layer Handling Request Ke DB

const prisma = require("../../db");

const createTicket = async (ticketData) => {
  const ticket = await prisma.ticket.create({
    data: ticketData,
  });
  return ticket;
};

const findMyTicketAndEvents = async (userId) => {
  const ticketAndEvents = await prisma.ticket.findMany({
    where: {
      userId: userId,
    },
    include: {
      event: true,
    },
    orderBy: {
      createdAt: "desc"
    }
  });
  return ticketAndEvents
};

module.exports = { createTicket, findMyTicketAndEvents };
