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
