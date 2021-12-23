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
		DECLARE book_genre book.title%TYPE;
	BEGIN
		FOR book_genre IN
			SELECT title
			FROM book
			JOIN genre ON genre.genre_id = book.genre_id
			WHERE genre_name = name_of_genre
		LOOP
			RAISE INFO 'Title: %',
			TRIM(book_genre);
		END LOOP;
	END;
$$

CALL book_by_genre('Diary fiction');

--trigger
CREATE TRIGGER new_title_insert 
AFTER INSERT ON book
FOR EACH ROW EXECUTE FUNCTION new_title()

CREATE OR REPLACE FUNCTION new_title() 
RETURNS trigger 
AS $$
     BEGIN
          UPDATE book 
          SET title = '2021 ' || title WHERE book.book_id = NEW.book_id; 
		  RETURN NULL; 
     END;
$$ LANGUAGE 'plpgsql';


select * from book

INSERT INTO book(book_id, title, author_id, genre_id, period_id) 
VALUES ('14', 'A Stolen Life', '102b', '01', '01j');

select * from book
