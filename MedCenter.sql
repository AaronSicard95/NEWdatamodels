DROP DATABASE IF EXISTS med_center;

CREATE DATABASE med_center;

\c med_center

CREATE TABLE doctors
(
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL,
);

CREATE TABLE patients
(
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL,
);

CREATE TABLE diagnosis
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  treatment TEXT NOT NULL DEFAULT "None",
);

CREATE TABLE visits
(
  id SERIAL PRIMARY KEY,
  doctor_id INTEGER NOT NULL
    REFERENCES doctors,
  patient_id INTEGER NOT NULL
    REFERENCES patients,
  diagnosis_id INTEGER NOT NULL
    REFERENCES diagnosis,
);