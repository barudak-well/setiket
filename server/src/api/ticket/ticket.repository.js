// Layer Handling Request Ke DB

const prisma = require("../../db");

const createTicket = async (ticketData) => {
  const ticket = await prisma.ticket.create({
    data: ticketData,
  });
  return ticket;
};

module.exports = { createTicket };
