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
