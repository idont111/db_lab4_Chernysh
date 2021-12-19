CREATE OR REPLACE FUNCTION new_title() 
RETURNS trigger 
AS $$
     BEGIN
          UPDATE book 
          SET title = '2021' || title WHERE book.book_id = NEW.book_id; 
		  RETURN NULL; 
     END;
$$ LANGUAGE 'plpgsql';

CREATE TRIGGER new_title_insert 
AFTER INSERT ON book
FOR EACH ROW EXECUTE FUNCTION new_title()

INSERT INTO Book(book_id, title, author_id, genre_id, period_id) 
VALUES ('14', 'A Stolen Life', '102b', '01', '01j');
