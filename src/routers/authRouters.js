const router = require("express").Router();
const {
  registerAccount,
  loginAccount,
} = require("../controllers/authControllers");

// Start ROUTE
router.post("/signup", registerAccount);
router.post("/login", loginAccount);

module.exports = router;
