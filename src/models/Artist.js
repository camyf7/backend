const { DataTypes } = require("sequelize");
const sequelize = require("../config/db");

const Artist = sequelize.define(
  "Artist",
  {
    id: {
      type: DataTypes.INTEGER,
      primaryKey: true,
      autoIncrement: true,
    },

    name: {
      type: DataTypes.STRING(255),
      allowNull: false,
    },

    bio: {
      type: DataTypes.TEXT,
      allowNull: true,
    },

    image_url: {
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
    tableName: "artists",
    timestamps: false,
  }
);

module.exports = Artist;
