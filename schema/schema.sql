Create Table item (
id serial PRIMARY KEY,
genre varchar(100),
author varchar(100),
source varchar(100),
label varchar(100),
publish_date date,
archived boolean
)

CREATE TABLE genre (
    id serial primary key,
    item_id INT REFERENCES item(id),
    name varchar(200)
)

Create Table author (
    id serial primary key,
    item_id INT REFERENCES item(id),
    first_name varchar,
    last_name varchar
)

CREATE TABLE source (
    id serial primary key,
    item_id INT REFERENCES item(id),
    name varchar(200)
)

Create Table labels(
    id serial primary key,
    item_id INT REFERENCES item(id),
    title varchar,
    color varchar(200)
)

Create Table book(
    id serial Primary key,
    publisher varchar,
    cover_state varchar,
    item_id INT REFERENCES item(id),
    genre_id INT REFERENCES genre(id),
    author_id INT REFERENCES author(id),
    source_id INT REFERENCES source(id),
    labels_id INT REFERENCES labels(id),
    publish_date Date,
    archived Boolean
)

 Create Table musicalbum (
    id serial primary key,
    item_id INT REFERENCES item(id),
    genre_id INT REFERENCES genre(id),
    author_id INT REFERENCES author(id),
    source_id INT REFERENCES source(id),
    labels_id INT REFERENCES labels(id),
    on_spotify boolean,
    publish_date Date Not NULL,
    archived boolean
 )

 CREATE TABLE Game (
    id SERIAL PRIMARY KEY,
    genre_id INTEGER,
    label_id INTEGER,
    author_id INTEGER,
    source_id INTEGER,
    archived BOOLEAN,
    multiplayer VARCHAR(5)
    last_played_at DATE,
    FOREIGN KEY (genre_id) REFERENCES Genre (id),
    FOREIGN KEY (author_id) REFERENCES Authors (id),
    FOREIGN KEY (label_id) REFERENCES Label (id),
);


-- index on genre table
 CREATE INDEX genre_item_id_index ON genre(item_id)

 -- index on author table
 CREATE INDEX author_item_id_index ON author(item_id)
 -- index on source table
 CREATE INDEX source_item_id_index ON source(item_id)
 -- index on labels table
 CREATE INDEX labels_item_id_index ON labels(item_id)


-- index on foriegn keys

CREATE INDEX book_item_id_index ON book(item_id)
CREATE INDEX book_genre_id_index ON book(genre_id)
CREATE INDEX book_author_id_index ON book(author_id)
CREATE INDEX book_source_id_index ON book(source_id)
CREATE INDEX book_labels_id_index ON book(labels_id)

-- index on music album table forign keys

CREATE INDEX musicalbum_item_id_index ON musicalbum(item_id)
CREATE INDEX musicalbum_genre_id_index ON musicalbum(genre_id)
CREATE INDEX musicalbum_author_id_index ON musicalbum(author_id)
CREATE INDEX musicalbum_source_id_index ON musicalbum(source_id)
CREATE INDEX musicalbum_labels_id_index ON musicalbum(labels_id)

-- index on game table forign keys

CREATE INDEX Game_genre_id_index ON Game(genre_id)
CREATE INDEX Game_author_id_index ON Game(author_id)
CREATE INDEX Game_labels_id_index ON Game(labels_id)