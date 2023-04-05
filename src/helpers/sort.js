module.exports = {
  name: (sort) => {
    if (typeof sort === "object") {
      const sortKey = Object.keys(sort)[0];
      const sortBy = Object.values(sort)[0];
      return { sortKey, sortBy };
    } else {
      const sortKey = "fullname";
      const sortBy = sort || "ASC";
      return { sortKey, sortBy };
    }
  },
};
