// Layer Handling Request Ke DB

const { Prisma } = require("@prisma/client");
const prisma = require("../../db");

const createUser = async (userData) => {
  const user = await prisma.user.create({
    data: userData,
  });
  return user;
};

const findUserByEmail = async (email) => {
    const user = await prisma.user.findFirst({
      where: {
        email : email
      },
    });
    return user;
  };

  module.exports = { findUserByEmail, createUser }
