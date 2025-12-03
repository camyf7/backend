const sequelize = require("../config/db");
const { DataTypes } = require("sequelize");

// MODELS
const User = require("./User"); // este já vem pronto
const CommentFactory = require("./Comment"); // este é factory

// inicializa o model
const Comment = CommentFactory(sequelize, DataTypes);

// associações
if (Comment.associate) {
  Comment.associate({ User });
}

// Music -> Album -> Artist
Music.belongsTo(Album, { foreignKey: "album_id", as: "album" });
Album.belongsTo(Artist, { foreignKey: "artist_id", as: "artist" });


module.exports = {
  sequelize,
  User,
  Comment,
};
