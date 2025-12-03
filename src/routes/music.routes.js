const express = require("express");
const router = express.Router();
const { Op } = require("sequelize");
const Track = require("../models/Track");
const Album = require("../models/Album");
const Artist = require("../models/Artist");

router.get("/search", async (req, res) => {
  try {
    const query = req.query.q;

    if (!query || query.trim() === "") {
      return res.json([]);
    }

    const tracks = await Track.findAll({
      where: {
        title: { [Op.like]: `%${query}%` }
      },
      include: [
        {
          model: Album,
          include: [
            {
              model: Artist,
              attributes: ["name"]
            }
          ]
        }
      ]
    });

    const formatted = tracks.map(t => ({
      id: t.id,
      title: t.title,
      duration: t.duration,
      audio_url: t.audio_url,
      cover: t.cover_url || t.album?.cover_url || "/default-cover.jpg",
      album: t.album?.title || "Álbum desconhecido",
      artist: t.album?.artist?.name || "Artista desconhecido",
    }));

    res.json(formatted);

  } catch (err) {
    console.error("Erro na busca:", err);
    res.status(500).json({ error: "Erro ao buscar músicas" });
  }
});

module.exports = router;
