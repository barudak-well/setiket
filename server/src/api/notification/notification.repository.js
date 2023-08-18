// Layer Handling Request Ke DB

const prisma = require("../../db");

const createNotification = async ({
  message,
  fromId,
  toId,
  type,
  receiver,
}) => {
  const notification = await prisma.notification.create({
    data: {
      fromId,
      message,
      toId,
      type,
      receiver,
    },
  });
  return notification;
};

module.exports = { createNotification };
