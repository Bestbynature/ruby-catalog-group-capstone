--Create Database
DROP DATABASE IF EXISTS Ruby-Catalog-Group-Capstone-Project;
CREATE DATABASE Ruby-Catalog-Group-Capstone-Project;

-- Use Database
USE Ruby-Catalog-Group-Capstone-Project;

-- Table: Item
CREATE TABLE Item (
  id INT PRIMARY KEY,
  genre_id INT,
  author_id INT,
  source_id INT,
  label_id INT,
  publish_date DATE,
  archived BOOLEAN,
  FOREIGN KEY (genre_id) REFERENCES Genre(id),
  FOREIGN KEY (author_id) REFERENCES Author(id),
  FOREIGN KEY (source_id) REFERENCES Source(id),
  FOREIGN KEY (label_id) REFERENCES Label(id)
);

-- Table: Genre
CREATE TABLE Genre (
  id INT PRIMARY KEY,
  name VARCHAR(255)
);

-- Table: Source
CREATE TABLE Source (
  id INT PRIMARY KEY,
  name VARCHAR(255)
);

-- Table: Author
CREATE TABLE Author (
  id INT PRIMARY KEY,
  first_name VARCHAR(255),
  last_name VARCHAR(255)
);

-- Table: Label
CREATE TABLE Label (
  id INT PRIMARY KEY,
  title VARCHAR(255),
  color VARCHAR(255)
);

-- Table: Book
CREATE TABLE Book (
  item_id INT PRIMARY KEY,
  publisher VARCHAR(255),
  cover_state VARCHAR(255),
  FOREIGN KEY (item_id) REFERENCES Item(id)
);

-- Table: MusicAlbum
CREATE TABLE MusicAlbum (
  item_id INT PRIMARY KEY,
  on_spotify BOOLEAN,
  FOREIGN KEY (item_id) REFERENCES Item(id)
);

-- Table: Movie
CREATE TABLE Movie (
  item_id INT PRIMARY KEY,
  silent BOOLEAN,
  FOREIGN KEY (item_id) REFERENCES Item(id)
);

-- Table: Game
CREATE TABLE Game (
  item_id INT PRIMARY KEY,
  multiplayer BOOLEAN,
  last_played_at DATE,
  FOREIGN KEY (item_id) REFERENCES Item(id)
);
