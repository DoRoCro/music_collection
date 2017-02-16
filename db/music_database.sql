DROP TABLE IF EXISTS albums;
DROP TABLE IF EXISTS artists;

CREATE TABLE artists (
  artist_id SERIAL4 PRIMARY KEY,
  name VARCHAR(255) UNIQUE
);


CREATE TABLE albums (
  album_id SERIAL4 PRIMARY KEY,
  title VARCHAR(255),
  genre VARCHAR(255),
  artist_id INT4 REFERENCES artists(artist_id) -- Foreign Key
);


INSERT INTO artists ( name )
  VALUES ('David Bowie');
INSERT INTO artists ( name )
  VALUES ('Nirvana');
INSERT INTO artists ( name )
  VALUES ('Half Man, Half Biscuit');

--below only works on fresh empty database...

INSERT INTO albums ( title, genre, artist_id )
  VALUES ('Back in the DHSS', 'Indie' , 3);
INSERT INTO albums ( title, genre, artist_id )
  VALUES ('Nevermind', '90s' , 2);
INSERT INTO albums ( title, genre, artist_id )
  VALUES ('Hunky Dory', '70s' , 1);
