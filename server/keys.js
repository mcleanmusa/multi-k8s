module.exports = {
  redisHost: process.env.REDIS_HOST,
  redisPort: process.env.REDIS_PORT,
  pgUser: process.env.DB_USER,
  pgHost: process.env.DB_HOST,
  pgDatabase: process.env.DB_DATABASE,
  pgPassword: process.env.DB_PASSWORD,
  pgPort: process.env.DB_PORT
};
