const User = require("../models/User");
const jwt = require("jsonwebtoken");
const { OAuth2Client } = require("google-auth-library");

const client = new OAuth2Client(process.env.GOOGLE_CLIENT_ID);

module.exports = {
  async googleLogin(req, res) {
    try {
      const { token } = req.body;

      if (!token) {
        return res.status(400).json({ error: "Token não enviado" });
      }

      // 1) Verificar o token do Google
      const ticket = await client.verifyIdToken({
        idToken: token,
        audience: process.env.GOOGLE_CLIENT_ID,
      });

      const payload = ticket.getPayload();

      const {
        email,
        name,
        picture: avatar_url,
      } = payload;

      // 2) Verifica se já existe usuário com esse email
      let user = await User.findOne({ where: { email } });

      // 3) Se não existir, cria usuário
      if (!user) {
        user = await User.create({
          username: name,
          email,
          avatar_url,
          banner_url: null,
          bio: "",
          password_hash: null // Usuário Google não usa senha local
        });
      }

      // 4) Gerar token JWT da sua API
      const authToken = jwt.sign(
        { id: user.id, email: user.email },
        process.env.JWT_SECRET,
        { expiresIn: "7d" }
      );

      // 5) Sanitiza usuário para o front
      const sanitizedUser = {
        id: user.id,
        username: user.username,
        email: user.email,
        avatar_url: user.avatar_url,
        banner_url: user.banner_url,
        bio: user.bio
      };

      return res.json({
        message: "Login Google bem-sucedido",
        token: authToken,
        user: sanitizedUser
      });

    } catch (error) {
      console.error("Erro no Google Login:", error);
      return res.status(500).json({ error: "Erro ao autenticar com Google" });
    }
  }
};