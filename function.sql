CREATE OR REPLACE FUNCTION genre_count(genre text) 
RETURNS int
LANGUAGE plpgsql
AS
$$
	DECLARE
		res integer;

	BEGIN
		SELECT COUNT(*) INTO res
		FROM book
		INNER JOIN genre ON genre.genre_id = genre.genre_id
		WHERE genre.genre_name = genre;

		RETURN res;
	END;
$$;
