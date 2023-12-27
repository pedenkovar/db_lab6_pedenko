--тригер виконує аудит змін в таблиці book. 

DROP TABLE IF EXISTS books_audit; 
CREATE TABLE books_audit( 
  id SERIAL PRIMARY KEY, 
  updated TIMESTAMP, 
  user_name varchar(50) NOT NULL,
  operation varchar(10) NOT NULL
); 
 
CREATE OR REPLACE FUNCTION update_book() RETURNS trigger  
LANGUAGE 'plpgsql' 
AS $$ 
BEGIN 
  INSERT INTO books_audit(updated, user_name, operation) 
   VALUES(NOW(), user, 'UPDATE'); 
  RETURN NULL; 
END; 
$$ ; 
 
CREATE OR REPLACE FUNCTION insert_book() RETURNS trigger  
LANGUAGE 'plpgsql' 
AS $$ 
BEGIN 
  INSERT INTO books_audit(updated, user_name, operation) 
   VALUES(NOW(), user, 'INSERT'); 
  RETURN NULL; 
END; 
$$ ; 

CREATE OR REPLACE FUNCTION delete_book() RETURNS trigger  
LANGUAGE 'plpgsql' 
AS $$ 
BEGIN 
  INSERT INTO books_audit(updated, user_name, operation) 
   VALUES(NOW(), user, 'DELETE'); 
  RETURN NULL; 
END; 
$$ ; 


CREATE TRIGGER update_book_list 
AFTER UPDATE ON book 
FOR EACH ROW EXECUTE FUNCTION update_book(); 
 

CREATE TRIGGER insert_book_list  
AFTER INSERT ON book
FOR EACH ROW EXECUTE FUNCTION insert_book(); 

 
CREATE TRIGGER delete_book_list 
AFTER DELETE ON book 
FOR EACH ROW EXECUTE FUNCTION delete_book(); 










