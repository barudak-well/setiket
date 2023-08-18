const status = {
  verified: "VERIFIED",
  pending: "PENDING",
  rejected: "REJECTED",
};

const role = {
  admin: "ADMIN",
  user: "USER",
  eo: "EO",
};

const notification = {
  ticket: "TICKET_SOLD",
  eo: "NEW_EO",
  event: "NEW_EVENT",
};

const notificationReceiver = {
  admin: "ADMIN",
  eo: "EO",
};

const eventCategory = {
  music: "MUSIC",
  art: "ART",
  sports: "SPORTS",
  culinary: "CULINARY",
  tech: "TECH",
  lifestyle: "LIFESTYLE",
  business: "BUSINESS",
  education: "EDUCATION",
  entertainment: "ENTERTAINMENT",
  charity: "CHARITY",
  other: "OTHER",
};

module.exports = {
  status,
  role,
  notification,
  eventCategory,
  notificationReceiver
};
