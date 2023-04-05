const db = require("../database/db_connection");

const addUsers = (valuesId, fullname) => {
  return new Promise((resolve, reject) => {
    const qs = `INSERT INTO data_test.users (id_profile, fullname) values ($1, $2)`;
    db.query(qs, [valuesId, fullname], (error, result) => {
      if (error) {
        reject(error);
      } else {
        resolve(result);
      }
    });
  });
};

const countModel = (arr) => {
  return new Promise((resolve, reject) => {
    const qs = `SELECT COUNT(*) as count FROM data_test.users WHERE ${arr[0]} LIKE '%${arr[1]}%' `;
    db.query(qs, (error, result) => {
      if (error) {
        reject(error);
      } else {
        resolve(result.rows);
      }
    });
  });
};

const getListUsers = (arr, data) => {
  return new Promise((resolve, reject) => {
    const qs = `SELECT 
    auth.id as id_profile,
    auth.username,
    users.fullname
    FROM data_test.auth auth
    LEFT JOIN data_test.users users ON auth.id = users.id_profile 
    WHERE users.${arr[0]} LIKE '%${arr[1]}%' 
    GROUP BY 
    auth.id,
    auth.username,
    users.fullname
    ORDER BY users.${arr[2]} ${arr[3]} LIMIT ${data[0]} OFFSET ${data[1]} `;
    db.query(qs, (error, result) => {
      if (error) {
        reject(error);
      } else {
        resolve(result.rows);
      }
    });
  });
};

module.exports = {
  addUsers,
  countModel,
  getListUsers,
};
