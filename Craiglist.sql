DROP DATABASE IF EXISTS craigslist;

CREATE DATABASE craigslist;

\c craigslist

CREATE TABLE regions
(
  id SERIAL PRIMARY KEY,
  state_name TEXT NOT NULL,
  region_name TEXT NOT NULL
);

CREATE TABLE users
(
  id SERIAL PRIMARY KEY,
  username TEXT NOT NULL,
  region_id INTEGER NOT NULL
    REFERENCES regions
);

CREATE TABLE categories
(
  id SERIAL PRIMARY KEY,
  category_name TEXT NOT NULL,
);

CREATE TABLE posts
(
  id SERIAL PRIMARY KEY,
  user_id INTEGER NOT NULL
    REFERENCES users ON DELETE CASCADE
  post_title TEXT NOT NULL,
  post_name TEXT NOT NULL,
  category_id INTEGER NOT NULL
    REFERENCES categories,
  post_region_id INTEGER NOT NULL
    REFERENCES regions ON DELETE CASCADE
);