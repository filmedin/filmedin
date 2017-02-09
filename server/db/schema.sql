-- USE heroku_a82769b4f508eba;

DROP DATABASE IF EXISTS filmedin;

CREATE DATABASE filmedin;

USE filmedin;

DROP TABLE IF EXISTS rating;
DROP TABLE IF EXISTS friends;
DROP TABLE IF EXISTS film;
DROP TABLE IF EXISTS profile;
DROP TABLE IF EXISTS user;

CREATE TABLE user (
  id INTEGER NOT NULL AUTO_INCREMENT,
  username VARCHAR(255) NOT NULL,
  password MEDIUMTEXT NOT NULL,
  createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id)
);

-- ---
-- Table profile
--
-- ---

DROP TABLE IF EXISTS profile;

CREATE TABLE profile (
  id INTEGER NOT NULL AUTO_INCREMENT,
  userID INTEGER NOT NULL,
  firstName VARCHAR(20) NOT NULL,
  lastName VARCHAR(25) NOT NULL,
  email VARCHAR(50) NULL,
  profileURL VARCHAR(255) NULL,
  DOB DATE NULL,
  createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id)
);

-- ---
-- Table movie
--
-- ---

DROP TABLE IF EXISTS film;

CREATE TABLE film (
 id INTEGER NOT NULL AUTO_INCREMENT,
  guideBox INTEGER NOT NULL,
  name VARCHAR(255) NOT NULL,
  releaseDate DATE NULL,
  overview VARCHAR(1200) NULL,
  directors VARCHAR(255) NULL,
  writers VARCHAR(255) NULL,
  actors VARCHAR(1200) NULL,
  posterURL VARCHAR(511) NULL,
  runtime VARCHAR(50) NULL,
  genre VARCHAR(255) NULL,
  trailer VARCHAR(255) NULL,
  rt VARCHAR(255) NULL,
  netflix VARCHAR(255) NULL,
  hbo VARCHAR(255) NULL,
  amazon VARCHAR(255) NULL,
  itunes VARCHAR(255) NULL,
  imdb VARCHAR(50) NULL,
  wiki VARCHAR(50) NULL,
  createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id)
);

-- ---
-- Table topic
--
-- ---
DROP TABLE IF EXISTS topic;

CREATE TABLE topic (
  id INTEGER NOT NULL AUTO_INCREMENT,
  topic VARCHAR(255) NOT NULL,
  createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updatedAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id)
);

-- ---
-- Table message
--
-- ---
DROP TABLE IF EXISTS message;

CREATE TABLE message (
  id INTEGER NOT NULL AUTO_INCREMENT,
  userID INTEGER NOT NULL,
  topicID INTEGER NOT NULL UNIQUE,
  message VARCHAR(1200) NOT NULL,
  createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updatedAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id)
);

-- ---
-- Table rating
--
-- ---

DROP TABLE IF EXISTS rating;

CREATE TABLE rating (
  id INTEGER NOT NULL AUTO_INCREMENT,
  profileID INTEGER NOT NULL,
  filmID INTEGER NOT NULL,
  rating INTEGER NOT NULL DEFAULT 0,
  review VARCHAR(200) NULL DEFAULT NULL,
  createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id)
);

-- ---
-- Table friends
--
-- ---

DROP TABLE IF EXISTS friends;

CREATE TABLE friends (
  id INTEGER NOT NULL AUTO_INCREMENT,
  primaryID INTEGER NOT NULL,
  friendID INTEGER NOT NULL,
  createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id)
);

-- ---
-- Foreign Keys
-- ---

ALTER TABLE profile ADD FOREIGN KEY (userID) REFERENCES user (id);
ALTER TABLE rating ADD FOREIGN KEY (profileID) REFERENCES profile (id);
ALTER TABLE rating ADD FOREIGN KEY (filmID) REFERENCES film (id);
ALTER TABLE friends ADD FOREIGN KEY (primaryID) REFERENCES profile (id);
ALTER TABLE friends ADD FOREIGN KEY (friendID) REFERENCES profile (id);
ALTER TABLE message ADD FOREIGN KEY (userID) REFERENCES user (id);
ALTER TABLE message ADD FOREIGN KEY (topicID) REFERENCES topic (id);
