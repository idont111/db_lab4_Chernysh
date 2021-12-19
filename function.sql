CREATE OR REPLACE FUNCTION get_count_of_genre(name_of_genre varchar(20))
RETURNS NUMERIC
LANGUAGE 'plpgsql'
AS $$
DECLARE count_genre NUMERIC;

BEGIN
	count_genre := (SELECT COUNT(*) 
					FROM book 
					JOIN genre ON genre.genre_id = book.genre_id 
					WHERE genre_name = name_of_genre);
	RETURN count_genre;
END;
$$;

SELECT get_count_of_genre('Diary fiction');
