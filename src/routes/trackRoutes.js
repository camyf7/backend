const express = require("express");
const router = express.Router();
const { Op } = require("sequelize");

const Track = require("../models/Track");
const Album = require("../models/Album");
const Artist = require("../models/Artist");

// GET /tracks/search
router.get("/search", async (req, res) => {
  const query = req.query.q;

  try {
    if (!query || query.trim() === "") return res.json([]);

    const tracks = await Track.findAll({
      where: { title: { [Op.like]: `%${query}%` } },
      include: [
        {
          model: Album,
          as: "album", // 🔥 PRECISA DO MESMO ALIAS DO MODEL
          include: [
            {
              model: Artist,
              as: "artist", // 🔥 PRECISA DO MESMO ALIAS DO MODEL
              attributes: ["name"]
            }
          ]
        }
      ]
    });

    const formatted = tracks.map((t) => ({
      id: t.id,
      title: t.title,
      artist: t.album?.artist?.name || "Desconhecido",
      album: t.album?.title || "Álbum desconhecido",
      cover: t.cover_url,
      audio_url: t.audio_url,
    }));

    res.json(formatted);

  } catch (err) {
    console.error("Erro na busca:", err);
    res.status(500).json({ error: "Erro ao buscar músicas" });
  }
});

module.exports = router;
