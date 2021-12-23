--function
CREATE OR REPLACE FUNCTION get_count_of_genre(name_of_genre varchar(20))
RETURNS NUMERIC
LANGUAGE 'plpgsql'
AS $$
DECLARE count_genre NUMERIC;

BEGIN
	count_genre := (SELECT COUNT(*) 
					FROM book_genres 
					JOIN genres ON genres.genre_id = book_genres.genre_id 
					WHERE genre_name = name_of_genre);
	RETURN count_genre;
END;
$$;

SELECT get_count_of_genre('Diary fiction');
--procedure

CREATE OR REPLACE PROCEDURE book_by_genre(name_of_genre varchar(20))
LANGUAGE plpgsql 
AS $$
	DECLARE
		DECLARE book_genre books.book_name%TYPE;
	BEGIN
		FOR book_genre IN
			SELECT book_name
			FROM books
			JOIN book_genres ON books.book_id = book_genres.book_id 
			JOIN genre ON genre.genre_id = book_genres.genre_id
			WHERE genre_name = name_of_genre
		LOOP
			RAISE INFO 'Title: %',
			TRIM(book_genre);
		END LOOP;
	END;
$$

CALL book_by_genre('Diary fiction');

--trigger
CREATE OR REPLACE FUNCTION new_title() 
RETURNS trigger 
AS $$
     BEGIN
          UPDATE books 
          SET book_name = '2021' || book_name WHERE books.book_id = NEW.book_id; 
		  RETURN NULL; 
     END;
$$ LANGUAGE 'plpgsql';

CREATE TRIGGER new_title_insert 
AFTER INSERT ON books
FOR EACH ROW EXECUTE FUNCTION new_title()

SELECT * FROM books 
INSERT INTO books(book_id, book_name, data_published) 
VALUES ('14', 'A Stolen Life', to_date('2021-12-23', 'yyyy-mm-dd'));
SELECT * FROM books 
