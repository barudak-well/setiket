// Layer buat handling bisnis logic

const bcrypt = require("bcryptjs");
<<<<<<< HEAD

const { roleTypes } = require("../../config/roles.config");
const { statusTypes } = require("../../config/status.config");
const { createUser } = require("./auth.repository");
const { findUserByEmail } = require("./auth.repository");
const { customError } = require("../../utils/customError");
=======
const types = require("../../config/types.config");
const authRepository = require("./auth.repository");
const utils = require("../../utils");
>>>>>>> 748abbc26ba014266fe46c2753f66acc830f8708

const register = async (userData) => {
  try {
    const role = userData.role;
    const hashedPassword = bcrypt.hashSync(userData.password);

    const userWithStatus = {
      ...userData,
      status:
        role === types.role.user ? types.status.verified : types.status.pending,
      password: hashedPassword,
    };

    const newUser = authRepository.createUser(userWithStatus);
    if (!newUser) throw utils.customError("400", "Failed to register new account");

    if (role === types.role.user) return newUser;

    // Buat kirim notifikasi dibawah
    return newUser;
  } catch (err) {
    throw new Error(err);
  }
};

const getUserByEmail = async (email) => {
    const user = await authRepository.findUserByEmail(email);
    if (!user) {
      throw Error("User tidak ditemukan");
    }
    return user;
  };


module.exports = { register, getUserByEmail };

