// Layer Handling Request Ke DB

const prisma = require("../../db");

const findUserByUsername = async (username) => {
    const user = await prisma.user.findFirst({
      where: {
        username : username
      },
    });
    return user;
  };

  module.exports = { findUserByUsername }