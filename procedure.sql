--процедура видаляє авторів, що не мають книг

drop procedure if exists clean_author();
create or replace procedure clean_author()
language plpgsql
as $$
begin
delete from author
 where author.id_author in
 (select author.id_author from author left join
 author_book using(id_author) where author_book.id_author is null);
end;
$$;