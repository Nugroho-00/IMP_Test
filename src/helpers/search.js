module.exports = {
  name: (search) => {
    if (typeof search === "object") {
      const searchKey = Object.keys(search)[0];
      const searchValue = Object.values(search)[0];
      return { searchKey, searchValue };
    } else {
      const searchKey = "fullname";
      const searchValue = search || "";
      return { searchKey, searchValue };
    }
  },
};
