CREATE DATABASE art_gallery2;


CREATE TABLE artist(
    artist_id SERIAL PRIMARY KEY,
    full_name VARCHAR(255),
    first_name VARCHAR(100),
    middle_names VARCHAR(100),
    last_name VARCHAR(100),
    nationality VARCHAR(100),
    style VARCHAR(100),
    birth INT,
    death INT
);

CREATE TABLE canvas_size (
    size_id SERIAL PRIMARY KEY,
    width INT,
    height INT,
    label VARCHAR(255)
);

CREATE TABLE image_link (
    work_id INT PRIMARY KEY,
    url TEXT,
    thumbnail_small_url TEXT,
    thumbnail_large_url TEXT
);

CREATE TABLE museum (
    museum_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    address VARCHAR(255) NOT NULL,
    city VARCHAR(100) NOT NULL,
    state VARCHAR(100)NOT NULL,
    postal VARCHAR(50)NOT NULL,
    country VARCHAR(100) NOT NULL,
    phone VARCHAR(50) NOT NULL,
    url TEXT
);

CREATE TABLE museum_hours(
    museum_id INT REFERENCES museum(museum_id) ON DELETE CASCADE,
    day VARCHAR(50),
    open TIME,
    close TIME,
    PRIMARY KEY (museum_id, day)
);

CREATE TABLE subject (
    work_id INT PRIMARY KEY,
    subject VARCHAR(255)
);

CREATE TABLE product_sizes (
	sales_price INT,
	regular_price INT,
	work_id INT REFERENCES work(work_id),
	size_id INT REFERENCES canvas_size(size_id)
);

CREATE TABLE work (
    work_id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    artist_id INT REFERENCES artist(artist_id),
    style VARCHAR(100),
    museum_id INT REFERENCES museum(museum_id)
);

