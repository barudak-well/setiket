// Layer buat handling bisnis logic

const { findUserByUsername } = require("./auth.repository");

const getUserByUsername = async (username) => {
    const user = await findUserByUsername(username);
    if (!user) {
      throw Error("User tidak ditemukan");
    }
    return user;
  };

module.exports = { getUserByUsername }