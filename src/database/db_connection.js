const { Pool } = require("pg");

const db = new Pool({
  user: process.env.DB_USERNAME,
  password: process.env.DB_PASSWORD,
  host: process.env.DB_HOST,
  dialect: process.env.DB_CONNECTION,
  database: process.env.DB_DATABASE,
  port: process.env.DB_PORT,
});

db.connect((err, client, done) => {
  if (err) {
    console.error("Error connecting to the database", err.stack);
  } else {
    console.log("Connected to the database");
  }
  done();
});

module.exports = db;
