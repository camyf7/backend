const Music = require("../models/Music");
const Album = require("../models/Album");
const Artist = require("../models/Artist");
const { Op } = require("sequelize");

module.exports = {
  async searchMusic(req, res) {
    try {
      const query = req.query.q;

      if (!query || query.trim() === "") {
        return res.status(400).json({ error: "A pesquisa não pode ser vazia" });
      }

      // Busca músicas pelo título OU pelo artista
    const results = await Music.findAll({
  include: [
    {
      model: Album,
      attributes: ["title", "cover_url"],
      include: [
        {
          model: Artist,
          attributes: ["name"],
          required: false,
        },
      ],
    },
  ],
  where: {
    [Op.or]: [
      { title: { [Op.like]: `%${query}%` } },
      // Aqui vamos remover '$album.artist.name$' temporariamente
    ],
  },
});


      // Formata o resultado para enviar ao front
      const formatted = results.map(track => ({
        id: track.id,
        title: track.title,
        duration: track.duration,
        audio_url: track.audio_url,
        album: track.album?.title || "Álbum desconhecido",
        cover: track.cover_url || track.album?.cover_url || "/default-cover.jpg",
        artist: track.album?.artist?.name || "Artista desconhecido",
      }));

      return res.json(formatted);
    } catch (err) {
      console.error("Erro searchMusic:", err);
      return res.status(500).json({ error: "Erro interno no servidor" });
    }
  },
};
