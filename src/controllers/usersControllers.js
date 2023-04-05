const userModel = require("../models/usersModels");
const { response } = require("../helpers/response");
const searching = require("../helpers/search");
const sorting = require("../helpers/sort");
const paging = require("../helpers/pagination");

const getAllUsers = async (req, res) => {
  try {
    const { searchKey, searchValue } = searching.name(req.query.search);
    const { sortKey, sortBy } = sorting.name(req.query.sort);
    const count = await userModel.countModel([searchKey, searchValue]);
    const page = paging(req, count[0].count);
    const { offset, pageInfo } = page;
    const { limitData: limit } = pageInfo;
    const results = await userModel.getListUsers(
      [searchKey, searchValue, sortKey, sortBy],
      [limit, offset]
    );
    if (results.length) {
      return response(
        res,
        "List of list Users",
        { results, pageInfo },
        200,
        true
      );
    } else {
      return response(res, "There is no data in list", {}, 404, false);
    }
  } catch (error) {
    return response(res, error, {}, 500, false);
  }
};

module.exports = {
  getAllUsers,
};
