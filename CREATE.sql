CREATE TABLE IF NOT EXISTS Performers (id serial primary key, name varchar(50) not null unique);
CREATE TABLE IF NOT EXISTS Jenre (id serial primary key, name varchar(30) not null unique, description text);
CREATE TABLE IF NOT EXISTS Albums (id serial primary key, title varchar(50) not null, year_of_release integer check(year_of_release>1900));    
CREATE TABLE IF NOT EXISTS Tracks (id serial primary key, title varchar(50) not null, duration integer not null, single bool, album_id integer references Albums(id));
CREATE TABLE IF NOT EXISTS Collections (id serial primary key, title varchar(50) not null, year_of_release integer check(year_of_release>1900));
CREATE TABLE IF NOT EXISTS PerformersJenre (performer_id integer references Performers(id), jenre_id integer references Jenre(id), constraint PerformersJenre_pk primary key (performer_id, jenre_id));
CREATE TABLE IF NOT EXISTS PerformersAlbums (performer_id integer references Performers(id), album_id integer references Albums(id), constraint PerformersAlbums_pk primary key (performer_id, album_id));
CREATE TABLE IF NOT EXISTS CollectionsTracks (collection_id integer references Collections(id), track_id integer references Tracks(id), constraint CollectionsTracks_pk primary key (collection_id, track_id));
