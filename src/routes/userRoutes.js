const express = require("express");
const router = express.Router();

const userController = require("../controllers/userController");
const authenticateToken = require("../middleware/auth");

// Cadastro manual
router.post("/register", userController.register);

// Login manual
router.post("/login", userController.login);

// Login / cadastro Google
router.post("/google", userController.googleLogin);

// Buscar perfil logado
router.get("/me", authenticateToken, userController.getMe);

// Atualizar perfil
router.put("/update", authenticateToken, userController.update);

// Deletar conta
router.delete("/delete", authenticateToken, userController.deleteUser);

module.exports = router;
