const { DataTypes } = require("sequelize");
const sequelize = require("../config/db");

const Artist = require("./Artist"); // relação 1:N com artistas

const Album = sequelize.define(
  "Album",
  {
    id: {
      type: DataTypes.INTEGER,
      primaryKey: true,
      autoIncrement: true,
    },

    artist_id: {
      type: DataTypes.INTEGER,
      allowNull: false,
      references: {
        model: "artists",
        key: "id",
      },
    },

    title: {
      type: DataTypes.STRING(255),
      allowNull: false,
    },

    release_date: {
      type: DataTypes.DATE,
      allowNull: true,
    },

    cover_url: {
      type: DataTypes.STRING(255),
      allowNull: true,
    },

    created_at: {
      type: DataTypes.DATE,
      defaultValue: DataTypes.NOW,
    },

    updated_at: {
      type: DataTypes.DATE,
      defaultValue: DataTypes.NOW,
    },
  },
  {
    tableName: "albums",
    timestamps: false,
  }
);

// Relacionamentos
Album.belongsTo(Artist, { foreignKey: "artist_id" });

module.exports = Album;
