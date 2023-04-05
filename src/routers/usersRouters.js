const router = require("express").Router();
const { getAllUsers } = require("../controllers/usersControllers");

// start route
router.get("/userlist", getAllUsers);

module.exports = router;
