CREATE OR REPLACE FUNCTION genre_count(genre VARCHAR(20)) 
RETURNS int
LANGUAGE plpgsql
AS
$$
	DECLARE
		res integer;

	BEGIN
		SELECT COUNT(*) INTO res
		FROM book
		INNER JOIN genre ON book.genre_id = genre.genre_id
		WHERE genre.genre_name = genre;

		RETURN res;
	END;
$$;
