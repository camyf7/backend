const express = require("express");
const router = express.Router();

const UserController = require("../controllers/userController");
const OAuthController = require("../controllers/OAuthController");

// ----------- Rotas Normais -----------
router.post("/register", UserController.register);
router.post("/login", UserController.login);

// ----------- Login Google -----------
router.post("/auth/google", OAuthController.googleLogin);

module.exports = router;