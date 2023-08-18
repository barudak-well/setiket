// Layer buat handling bisnis logic

const bcrypt = require("bcryptjs");
const types = require("../../config/types.config");
const authRepository = require("./auth.repository");
const notificationRepository = require("../notification/notification.repository");
const utils = require("../../utils");

const register = async (userData) => {
  try {
    const userWithEmail = await authRepository.findUserByEmail(userData.email);
    if (userWithEmail)
      throw utils.customError("400", "User with that email already exist");

    const role = userData.role;
    const hashedPassword = bcrypt.hashSync(userData.password);

    const userWithStatus = {
      ...userData,
      status:
        role === types.role.user ? types.status.verified : types.status.pending,
      password: hashedPassword,
    };

    const newUser = await authRepository.createUser(userWithStatus);
    if (!newUser)
      throw utils.customError("400", "Failed to register new account");

    if (role === types.role.user) return newUser;

    // Buat kirim notifikasi dibawah
    const notification = await notificationRepository.createNotification({
      fromId: newUser.id,
      receiver: types.notificationReceiver.admin,
      message: `New EO Registration with ID ${newUser.id} and Email ${newUser.email}`,
      toId: -999,
      type: types.notification.eo,
    });

    if (!notification)
      throw utils.customError("400", "Failed to add notification");

    return newUser;
  } catch (err) {
    // console.log(err);
    if (err.isCustomError) throw err;
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

