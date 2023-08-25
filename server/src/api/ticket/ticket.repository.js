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
      event: {
        include: {
          user: {
            select: {
              email: true,
              fullname: true,
              id: true,
              age: true,
              role: true,
              status: true
            }
          }
        }
      },
    },
    orderBy: {
      createdAt: "desc"
    }
  });
  return ticketAndEvents
};

module.exports = { createTicket, findMyTicketAndEvents };
