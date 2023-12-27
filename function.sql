--функція повертає ISBN, book_name для заданої мови 

DROP FUNCTION IF EXISTS get_books(char);  
CREATE OR REPLACE FUNCTION get_books(lang_code char)  
    RETURNS TABLE (book_id int, book_name varchar) 
LANGUAGE plpgsql 
AS $$ 
BEGIN 
    RETURN QUERY 
       SELECT isbn::int, title::varchar 
   FROM book  
   WHERE language = lang_code; 
END; 
$$ 

