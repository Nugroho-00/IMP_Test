const db = require("../database/db_connection");

const createAccount = (username, password) => {
  return new Promise((resolve, reject) => {
    const qs = `INSERT INTO data_test.auth (username, password) values ($1, $2) RETURNING id`;
    db.query(qs, [username, password], (error, result) => {
      if (error) {
        reject(error);
      } else {
        resolve(result);
      }
    });
  });
};

const checkUserAccount = (username) => {
  return new Promise((resolve, reject) => {
    const queryString =
      "SELECT username, password FROM data_test.auth WHERE username = $1";
    db.query(queryString, [username], (error, results) => {
      if (error) {
        reject(error);
      } else {
        resolve(results.rows);
      }
    });
  });
};

module.exports = {
  createAccount,
  checkUserAccount,
};
