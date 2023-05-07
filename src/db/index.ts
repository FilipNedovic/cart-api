import { Pool, Client } from 'pg';

const config = {
  user: process.env.DB_USER_NAME,
  host: process.env.HOST,
  database: process.env.DB_NAME,
  password: process.env.DB_PASSWORD,
  port: process.env.DB_PORT,
};

const pool = new Pool(config);
const client = new Client(config);

client.connect(err => {
  if (err) {
    console.error('Client error', err.stack);
  }
});

export const poolQuery = (text, params) => {
  return pool.query(text, params);
};

export const clientQuery = (text, params, callback) => {
  return client.query(text, params, callback);
};
