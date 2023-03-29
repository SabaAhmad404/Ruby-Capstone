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

    
)