const User = require("../models/User");
const bcrypt = require("bcrypt");
const jwt = require("jsonwebtoken");

module.exports = {

  // -------------------------------
  // 1️⃣ Cadastro manual
  // -------------------------------
  async register(req, res) {
    try {
      const { username, email, password, avatar_url } = req.body;

      if (!username || !email || !password) {
        return res
          .status(400)
          .json({ error: "Campos obrigatórios: username, email, password" });
      }

      const existingUser = await User.findOne({ where: { email } });
      if (existingUser) {
        return res.status(400).json({ error: "Email já está em uso" });
      }

      const hashed = await bcrypt.hash(password, 10);

      const newUser = await User.create({
        username,
        email,
        password_hash: hashed,
        avatar_url: avatar_url || null,
        auth_provider: "local",
      });

      const token = jwt.sign(
        { id: newUser.id, email: newUser.email },
        process.env.JWT_SECRET,
        { expiresIn: "7d" }
      );

      return res.status(201).json({
        message: "Usuário criado com sucesso",
        token,
        user: {
          id: newUser.id,
          username: newUser.username,
          email: newUser.email,
          avatar_url: newUser.avatar_url,
          bio: newUser.bio, // ✅ Adicionado
        },
      });

    } catch (error) {
      console.error("Erro no register:", error);
      return res.status(500).json({ error: "Erro ao criar usuário" });
    }
  },

  // -------------------------------
  // 2️⃣ Login manual
  // -------------------------------
  async login(req, res) {
    try {
      const { email, password } = req.body;

      if (!email || !password) {
        return res.status(400).json({ error: "Email e senha são obrigatórios" });
      }

      const user = await User.findOne({ where: { email } });
      if (!user) return res.status(404).json({ error: "Usuário não encontrado" });

      if (user.auth_provider !== "local") {
        return res.status(400).json({
          error: `Conta registrada via ${user.auth_provider}. Use login pelo ${user.auth_provider}`,
        });
      }

      const match = await bcrypt.compare(password, user.password_hash);
      if (!match) return res.status(400).json({ error: "Senha incorreta" });

      const token = jwt.sign(
        { id: user.id, email: user.email },
        process.env.JWT_SECRET,
        { expiresIn: "7d" }
      );

      return res.status(200).json({
        message: "Login realizado",
        token,
        user: {
          id: user.id,
          username: user.username,
          email: user.email,
          avatar_url: user.avatar_url,
          bio: user.bio, // ✅ Adicionado
        },
      });

    } catch (error) {
      console.error("Erro no login:", error);
      return res.status(500).json({ error: "Erro no login" });
    }
  },

  // -------------------------------
  // 3️⃣ Login/cadastro Google
  // -------------------------------
  async googleLogin(req, res) {
    try {
      const { username, email, avatar_url } = req.body;

      if (!email) return res.status(400).json({ error: "Email é obrigatório" });

      let user = await User.findOne({ where: { email } });

      if (!user) {
        user = await User.create({
          username: username || email.split("@")[0],
          email,
          avatar_url: avatar_url || null,
          password_hash: null,
          auth_provider: "google",
        });
      }

      const token = jwt.sign(
        { id: user.id, email: user.email },
        process.env.JWT_SECRET,
        { expiresIn: "7d" }
      );

      return res.status(200).json({
        message: "Login Google realizado",
        token,
        user: {
          id: user.id,
          username: user.username,
          email: user.email,
          avatar_url: user.avatar_url,
          bio: user.bio, // ✅ Adicionado
        },
      });

    } catch (error) {
      console.error("Erro no login Google:", error);
      return res.status(500).json({ error: "Erro no servidor" });
    }
  },

  // -------------------------------
  // 4️⃣ Atualizar perfil
  // -------------------------------
  async update(req, res) {
    try {
      const { username, email, avatar_url, bio } = req.body;
      const userId = req.user.id;

      console.log("📥 Dados recebidos no backend:", { username, email, avatar_url, bio }); // Debug

      const user = await User.findByPk(userId);
      if (!user) return res.status(404).json({ error: "Usuário não encontrado" });

      // Verificação para contas Google
      if (user.auth_provider === "google" && email && email !== user.email) {
        return res.status(400).json({
          error: "Contas Google não podem alterar o email",
        });
      }

      // ✅ Atualiza com verificação explícita
      await user.update({
        username: username !== undefined ? username : user.username,
        email: email !== undefined ? email : user.email,
        avatar_url: avatar_url !== undefined ? avatar_url : user.avatar_url,
        bio: bio !== undefined ? bio : user.bio, // ✅ Atualiza bio
      });

      // ✅ Recarrega do banco para ter certeza
      await user.reload();

      console.log("📤 Usuário após salvar:", {
        id: user.id,
        username: user.username,
        email: user.email,
        bio: user.bio
      }); // Debug

      return res.status(200).json({
        message: "Perfil atualizado",
        user: {
          id: user.id,
          username: user.username,
          email: user.email,
          avatar_url: user.avatar_url,
          bio: user.bio, // ✅ Retorna bio
        },
      });

    } catch (error) {
      console.error("Erro ao atualizar perfil:", error);
      return res.status(500).json({ error: "Erro ao atualizar perfil" });
    }
  },

  // -------------------------------
  // 5️⃣ Deletar conta do usuário logado
  // -------------------------------
  async deleteUser(req, res) {
    try {
      if (!req.user?.id) {
        return res
          .status(401)
          .json({ error: "Você precisa estar autenticado para deletar a conta." });
      }

      await User.destroy({ where: { id: req.user.id } });

      return res.json({ success: true, message: "Conta deletada com sucesso!" });

    } catch (err) {
      console.error("Erro ao deletar usuário:", err);
      return res.status(500).json({ error: "Erro interno ao deletar conta." });
    }
  },

  // -------------------------------
  // 6️⃣ Pegar dados do usuário logado
  // -------------------------------
  async getMe(req, res) {
    try {
      const userId = req.user.id;
      const user = await User.findByPk(userId, {
        attributes: ["id", "username", "email", "avatar_url", "bio"], // ✅ ADICIONADO "bio"
      });

      if (!user) return res.status(404).json({ error: "Usuário não encontrado" });

      return res.status(200).json({ user });

    } catch (error) {
      console.error("Erro ao buscar usuário:", error);
      return res.status(500).json({ error: "Erro no servidor" });
    }
  },
};