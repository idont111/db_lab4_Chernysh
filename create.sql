---------------------
-- Create table books
----------------------
CREATE TABLE books(
	book_id CHAR(10) NOT NULL ,
	book_name CHAR(50) NOT NULL,
	data_published DATE NOT NULL
);

----------------------
-- Create table authors
----------------------
CREATE TABLE authors(
	author_id CHAR(10) NOT NULL,
	first_name VARCHAR(20) NOT NULL,
	last_name VARCHAR(20) NOT NULL
);

----------------------
-- Create table genre
----------------------
CREATE TABLE genres(
    genre_id CHAR(10),
    genre_name VARCHAR(20)
);

----------------------
-- Create table genre
----------------------
CREATE TABLE book_genres(
	id CHAR(3) NOT NULL,
    book_id CHAR(10) NOT NULL,
    genre_id CHAR(10) NOT NULL
);

CREATE TABLE book_author(
	id CHAR(3) NOT NULL,
    book_id CHAR(10) NOT NULL,
    author_id CHAR(10) NOT NULL
);

ALTER TABLE books ADD CONSTRAINT PK_books PRIMARY KEY (book_id);
ALTER TABLE authors ADD CONSTRAINT PK_authors PRIMARY KEY (author_id);
ALTER TABLE genres ADD CONSTRAINT PK_genres PRIMARY KEY (genre_id);
ALTER TABLE book_genres ADD CONSTRAINT PK_book_genres PRIMARY KEY (id);
ALTER TABLE book_author ADD CONSTRAINT PK_book_author PRIMARY KEY (id);

ALTER TABLE book_author
ADD CONSTRAINT FK_authors FOREIGN KEY (author_id) REFERENCES authors (author_id);
ALTER TABLE book_author
ADD CONSTRAINT FK_book_author FOREIGN KEY (book_id) REFERENCES books (book_id);

ALTER TABLE book_genres
ADD CONSTRAINT FK_genres FOREIGN KEY (genre_id) REFERENCES genres (genre_id);
ALTER TABLE book_genres
ADD CONSTRAINT FK_book_genres FOREIGN KEY (book_id) REFERENCES books (book_id);
