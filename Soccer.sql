DROP DATABASE IF EXISTS soccer;

CREATE DATABASE soccer;

\c soccer

CREATE TABLE teams
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  region TEXT NOT NULL,
  total_score FLOAT NOT NULL,
);

CREATE TABLE players
(
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL,
  team_id INTEGER NOT NULL
    REFERENCES teams,
);

CREATE TABLE seasons
(
  id SERIAL PRIMARY KEY,
  start_date TEXT NOT NULL,
  end_date TEXT NOT NULL,
);

CREATE TABLE refs
(
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL,
);

CREATE TABLE games
(
  id SERIAL PRIMARY KEY,
  team1_id INTEGER NOT NULL
    REFERENCES teams,
  team2_id INTEGER NOT NULL
    REFERENCES teams,
  season_id INTEGER NOT NULL
    REFERENCES seasons,
  ref_id TEXT NOT NULL
    REFERENCES refs,
);

CREATE TABLE goals
(
  id SERIAL PRIMARY KEY,
  player_id INTEGER NOT NULL
    REFERENCES players,
  game_id INTEGER NOT NULL
    REFERENCES games,
  scoring_team INTEGER NOT NULL
    REFERENCES teams,
);