const { DataTypes } = require("sequelize");
const sequelize = require("../config/db");
const Album = require("./Album");

const Track = sequelize.define(
  "Track",
  {
    id: { type: DataTypes.INTEGER, primaryKey: true, autoIncrement: true },
    album_id: { type: DataTypes.INTEGER },
    title: { type: DataTypes.STRING, allowNull: false },
    cover_url: { type: DataTypes.STRING },   // exemplo: "minha-capa.png"
    audio_url: { type: DataTypes.STRING },   // exemplo: "musica.mp3"
  },
  { tableName: "tracks", timestamps: false }
);

Track.belongsTo(Album, { foreignKey: "album_id" });

module.exports = Track;
