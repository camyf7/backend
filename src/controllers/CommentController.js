const Comentario = require("../models/Comment");
const User = require("../models/User");

module.exports = {
  async create(req, res) {
    try {
      if (!req.user || !req.user.id) {
        return res.status(401).json({ error: "Usuário não autenticado" });
      }

      const { texto, track_id, comunidade_id } = req.body;

      if (!texto || (!track_id && !comunidade_id)) {
        return res.status(400).json({
          error: "Texto e track_id ou comunidade_id são obrigatórios",
        });
      }

      const novo = await Comentario.create({
        conteudo: texto,
        track_id,
        comunidade_id,
        user_id: req.user.id,
      });

      const comentarioComUser = await Comentario.findByPk(novo.id, {
        include: [
          { model: User, as: "user", attributes: ["id", "username", "email"] }
        ],
      });

      return res.json(comentarioComUser);
    } catch (error) {
      console.error(error);
      return res.status(500).json({ error: "Erro ao criar comentário" });
    }
  },

  async list(req, res) {
    try {
      const all = await Comentario.findAll({
        include: [
          { model: User, as: "user", attributes: ["id", "username", "email"] }
        ],
        order: [["created_at", "ASC"]],
      });

      return res.json(all);
    } catch (error) {
      console.error(error);
      return res.status(500).json({ error: "Erro ao listar comentários" });
    }
  },

  async listByTrack(req, res) {
    try {
      const { trackId } = req.params;

      const comentarios = await Comentario.findAll({
        where: { track_id: trackId },
        include: [
          { model: User, as: "user", attributes: ["id", "username", "email"] }
        ],
        order: [["created_at", "ASC"]],
      });

      return res.json(comentarios);
    } catch (error) {
      console.error(error);
      return res.status(500).json({ error: "Erro ao listar comentários" });
    }
  },

  async listByComunidade(req, res) {
    try {
      const { comunidadeId } = req.params;

      const comentarios = await Comentario.findAll({
        where: { comunidade_id: comunidadeId },
        include: [
          { model: User, as: "user", attributes: ["id", "username", "email"] }
        ],
        order: [["created_at", "ASC"]],
      });

      return res.json(comentarios);
    } catch (error) {
      console.error(error);
      return res.status(500).json({ error: "Erro ao listar comentários" });
    }
  },

  async update(req, res) {
    try {
      if (!req.user || !req.user.id) {
        return res.status(401).json({ error: "Usuário não autenticado" });
      }

      const { id } = req.params;
      const { texto } = req.body;

      const comentario = await Comentario.findByPk(id);

      if (!comentario) {
        return res.status(404).json({ error: "Comentário não encontrado" });
      }

      if (comentario.user_id !== req.user.id) {
        return res.status(403).json({ error: "Você não pode editar esse comentário" });
      }

      comentario.conteudo = texto || comentario.conteudo;
      await comentario.save();

      const atualizado = await Comentario.findByPk(id, {
        include: [
          { model: User, as: "user", attributes: ["id", "username", "email"] }
        ]
      });

      return res.json(atualizado);
    } catch (error) {
      console.error(error);
      return res.status(500).json({ error: "Erro ao atualizar comentário" });
    }
  },

  async delete(req, res) {
    try {
      if (!req.user || !req.user.id) {
        return res.status(401).json({ error: "Usuário não autenticado" });
      }

      const { id } = req.params;

      const comentario = await Comentario.findByPk(id);

      if (!comentario) {
        return res.status(404).json({ error: "Comentário não encontrado" });
      }

      if (comentario.user_id !== req.user.id) {
        return res.status(403).json({ error: "Você não pode excluir esse comentário" });
      }

      await comentario.destroy();

      return res.json({ message: "Comentário excluído com sucesso" });
    } catch (error) {
      console.error(error);
      return res.status(500).json({ error: "Erro ao excluir comentário" });
    }
  },
};
