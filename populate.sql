
INSERT INTO authors (author_id, first_name, last_name)
VALUES 
('101', 'Jeff', 'Kinney'),
('102', 'Suzanne', 'Collins'),
('103', 'Elie', 'Wiesel'),
('104', 'Charlaine', 'Harris'),
('105', 'Walter', 'Isaacson'),
('106', 'Michelle', 'Obama'),
('107', 'Rupi', 'Kaur'),
('108', 'Andy', 'Weir'),
('109', 'James', 'Dashner'),
('110', 'Marion', 'Wiesel');

INSERT INTO genres (genre_id, genre_name)
VALUES 
('01', 'Memoir'),
('02', 'Diary fiction'),
('03', 'Science fiction'),
('04', 'Fantasy Fiction'),
('05', 'Drama'),
('06', 'Poetry'),
('07', 'Comedy');

INSERT INTO books(book_id, book_name, data_published)
VALUES 
('1', 'Becoming', to_date('2009-12-12', 'yyyy-mm-dd')),
('2', 'Dog Days (Diary of a Wimpy Kid)', to_date('2018-01-01', 'yyyy-mm-dd')),
('3', 'Double Down (Diary of a Wimpy Kid)',to_date('2012-02-02', 'yyyy-mm-dd')),
('4', 'Old School (Diary of a Wimpy Kid )', to_date('2018-01-01', 'yyyy-mm-dd')),
('5', 'Catching Fire (The Hunger Games)', to_date('2017-12-13', 'yyyy-mm-dd')),
('6', 'Mockingjay (The Hunger Games)', to_date('2017-10-23', 'yyyy-mm-dd')),
('7', 'Night (Night)', to_date('2013-05-13', 'yyyy-mm-dd')),
('8', 'Steve Jobs', to_date('2011-06-04', 'yyyy-mm-dd')),
('9', 'Milk and Honey',to_date('2010-04-04', 'yyyy-mm-dd')),
('10', 'Milk and Vine',to_date('2014-03-01', 'yyyy-mm-dd'));

INSERT INTO book_genres(id, book_id, genre_id)
VALUES 
('201', '1', '01'),
('202', '2', '02'),
('203', '2', '07'),
('204', '3', '02'),
('205', '4', '02'),
('206', '5', '03'),
('207', '6', '03'),
('208', '6', '04'),
('209', '7', '01'),
('210', '8', '05'),
('211', '9', '06'),
('212', '10', '06');

INSERT INTO book_author(id, book_id, author_id)
VALUES 
('301', '1', '106'),
('302', '2', '101'),
('303', '3', '101'),
('304', '4', '101'),
('305', '5', '102'),
('306', '6', '102'),
('307', '7', '103'),
('308', '7', '109'),
('309', '8', '105'),
('310', '9', '107'),
('311', '10', '107');
