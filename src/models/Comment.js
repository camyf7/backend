const { DataTypes } = require("sequelize");
const sequelize = require("../config/db");
const User = require("./User");

const Comment = sequelize.define(
  "Comment",
  {
    conteudo: {
      type: DataTypes.TEXT,
      allowNull: false,
    },
    user_id: {
      type: DataTypes.INTEGER,
      allowNull: false,
    },
    track_id: {
      type: DataTypes.INTEGER,
      allowNull: true,
    },
    comunidade_id: {
      type: DataTypes.INTEGER,
      allowNull: true,
    },
  },
  {
    tableName: "comentarios",
    timestamps: true,
    createdAt: "created_at",
    updatedAt: "updated_at",
  }
);

// associações
Comment.belongsTo(User, {
  foreignKey: "user_id",
  as: "user",
});

module.exports = Comment;
