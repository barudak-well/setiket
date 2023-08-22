const isGreaterThan = (d1, d2) => {
  let date1 = new Date(d1).getTime();
  let date2 = new Date(d2).getTime();
  return date1 > date2
};

module.exports = {isGreaterThan}