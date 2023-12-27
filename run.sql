--функція
select * from get_books('eng');
select * from get_books('fre');


--процедура
call clean_author();

--тригер
insert into book (isbn, title, data_publication, language) 
values (140178139, 'Leviathan', TO_DATE('9/1/1993', 'MM/DD/YYYY'), 'fre');

update book set language = 'eng' where isbn = 140178139;

delete from book where isbn = 140178139;

select * from book;
select * from books_audit; 