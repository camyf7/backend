const Artist = require("./Artist");
const Album = require("./Album");
const Track = require("./Track");

// Artist 1:N Album
Artist.hasMany(Album, {
  foreignKey: "artist_id",
  as: "albums",
});

Album.belongsTo(Artist, {
  foreignKey: "artist_id",
  as: "artist",
});

// Album 1:N Track
Album.hasMany(Track, {
  foreignKey: "album_id",
  as: "tracks",
});

Track.belongsTo(Album, {
  foreignKey: "album_id",
  as: "album",
});

module.exports = { Artist, Album, Track };
