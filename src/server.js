require('dotenv').config();
const express = require("express");
const path = require("path");
const cors = require("cors");
const sequelize = require("./config/db");
require("./models/associations");


const userRoutes = require("./routes/userRoutes");

const commentRoutes = require("./routes/comment.routes");
const authRoutes = require("./routes/authRoutes");
const passport = require("./config/passport");
const musicRoutes = require("./routes/music.routes");
const trackRoutes = require("./routes/trackRoutes");

const app = express();
app.use(cors());
app.use(express.json());

// Rotas
app.use("/user", userRoutes);
app.use("/comments", commentRoutes);
app.use("/auth", authRoutes);
app.use("/music", musicRoutes);
app.use("/tracks", trackRoutes);
app.use("/audio", express.static("public/audio"));
app.use("/img", express.static(path.join(__dirname, "..", "public", "img")));
// Teste conexão
sequelize.authenticate()
  .then(() => console.log("Conectado ao MySQL"))
  .catch(err => console.error("Erro no MySQL:", err));

const PORT = process.env.PORT;

app.get("/", (req, res) => {
  res.send("API funcionando 🚀");
});

app.listen(PORT, () => {
  console.log("==========================================");
  console.log(`🚀 Servidor rodando em: http://localhost:${PORT}`);
  console.log("==========================================");
});
