// Layer buat handling bisnis logic

const bcrypt = require("bcryptjs");
const types = require("../../config/types.config");
const authRepository = require("./auth.repository");
const utils = require("../../utils");

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
      throw utils.customError("404", "User not found");
    }
    return user;
  };


module.exports = { register, getUserByEmail };

