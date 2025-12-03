const { DataTypes } = require("sequelize");
const sequelize = require("../config/db");

const User = sequelize.define(
  "User",
  {
    username: {
      type: DataTypes.STRING,
      allowNull: false,
    },

    email: {
      type: DataTypes.STRING,
      unique: true,
      allowNull: false,
    },

    password_hash: {
      type: DataTypes.STRING,
      allowNull: true, // permite nulo para Google
    },

    avatar_url: {
      type: DataTypes.STRING,
      allowNull: true,
    },

    bio: {               // ← nova coluna
      type: DataTypes.TEXT,
      allowNull: true,
    },

   

    auth_provider: {
      type: DataTypes.STRING,
      defaultValue: "local",
    },
  },
  {
    tableName: "users", // nome real da tabela no banco
    timestamps: true,   // ativa timestamps
    createdAt: "created_at", // coluna real no banco
    updatedAt: "updated_at", // coluna real no banco
  }
);

module.exports = User;
