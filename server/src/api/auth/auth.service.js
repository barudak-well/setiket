// Layer buat handling bisnis logic

const bcrypt = require("bcryptjs");

const { roleTypes } = require("../../config/roles.config");
const { statusTypes } = require("../../config/status.config");
const { createUser } = require("./auth.repository");
const { customError } = require("../../utils/customError");

const register = async (userData) => {
  try {
    const role = userData.role;
    const hashedPassword = bcrypt.hashSync(userData.password);

    const userWithStatus = {
      ...userData,
      status:
        role === roleTypes.user ? statusTypes.verified : statusTypes.pending,
      password: hashedPassword,
    };

    const newUser = createUser(userWithStatus);
    if (!newUser) throw customError("400", "Failed to register new account");

    if (role === roleTypes.user) return newUser;

    // Buat kirim notifikasi dibawah
    return newUser

  } catch (err) {
    throw new Error(err);
  }
};

module.exports = { register };
