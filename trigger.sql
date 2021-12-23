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
