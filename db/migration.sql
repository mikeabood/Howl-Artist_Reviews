--psql -a -f migration.sql

CREATE DATABASE howl; 

\c howl;

CREATE TABLE users (id SERIAL PRIMARY KEY, username varchar(255), password_digest varchar(255));

CREATE TABLE artists (id SERIAL PRIMARY KEY, name varchar(255), genre varchar(255), picture varchar(255));

CREATE TABLE comments (id SERIAL PRIMARY KEY, content varchar(255), show_date date, score INT, user_id INT references users(id), artist_id INT references artists(id)); 