require("dotenv").config();
const { BACKEND_PORT } = process.env;
const express = require("express");
const cors = require("cors");
const app = express();

// Midllewares
app.use(express.json());
app.use(cors());
app.use(express.urlencoded({ extended: false }));

// acces route
const authRoutes = require("./src/routers/authRouters");
const userRoutes = require("./src/routers/usersRouters");

// endpoint acces
app.use("/auth", authRoutes);
app.use("/user", userRoutes);

// Test Connection
app.get("/", (req, res) => {
  res.send({
    succes: true,
    message: "Backend is Running now!!!",
  });
});

app.listen(BACKEND_PORT, () => {
  console.log(`App listening on port ${BACKEND_PORT}`);
});
