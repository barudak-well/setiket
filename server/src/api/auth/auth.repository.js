// Layer Handling Request Ke DB

const prisma = require("../../db");

const createUser = async (userData) => {
    const user = await prisma.user.create({
      data: userData,
    });
  // Jangan Lupa Tambah Notifikasi
  // const notification = await
  return user;
};

const findUserByUsername = async (username) => {
    const user = await prisma.user.findFirst({
      where: {
        username : username
      },
    });
    return user;
  };

  module.exports = { findUserByUsername, createUser }
