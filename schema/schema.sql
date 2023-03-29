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

 Create Table musicalbum(
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