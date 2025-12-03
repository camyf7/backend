const passport = require("passport");
const GoogleStrategy = require("passport-google-oauth20").Strategy;
const User = require("../models/User");
const jwt = require("jsonwebtoken");

passport.use(
  new GoogleStrategy(
    {
      clientID: process.env.GOOGLE_CLIENT_ID,
      clientSecret: process.env.GOOGLE_CLIENT_SECRET,
      callbackURL: "http://localhost:3000/auth/google/callback",
    },
    async (accessToken, refreshToken, profile, done) => {
      try {
        let user = await User.findOne({ where: { email: profile.emails[0].value } });

        if (!user) {
          // cria usuário automático
          user = await User.create({
            username: profile.displayName,
            email: profile.emails[0].value,
            avatar_url: profile.photos[0].value,
            password_hash: "google_oauth_user",
          });
        }

        // gera JWT
        const token = jwt.sign(
          { id: user.id, email: user.email },
          process.env.JWT_SECRET,
          { expiresIn: "7d" }
        );

        return done(null, { user, jwt: token });
      } catch (error) {
        return done(error, null);
      }
    }
  )
);

module.exports = passport;