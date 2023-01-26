create table authors(
	id serial primary key,
	name varchar(255)
);

create table books(
	id serial primary key,
	model varchar(255),
	author_id integer references authors(id)
);

insert into authors
	(name)
values 
	('William Shakespeare'),
	('Jane Austen'),
	('Emest Miller Hemingway'),
	('Friendrich Willhelm Nietzsche')
;

insert into books 
	(model, author_id)
values
	('Romeo and Juliet', 1),
	('Pride and Prejudice', 2),
	('The old man and the Sea', 3),
	('MEin Kampf', null)
;

-- Inner JOIN
select 
	*
from books 
join authors on
	books.author_id = authors.id
;

-- Left JOIN
select 
	*
from books 
left join authors on
	books.author_id = authors.id
;

-- Right JOIN
select
	*
from books 
right join authors on
	books.author_id = authors.id
;

-- Full JOIN
select 
	*
from books 
full join authors on
	books.author_id = authors.id
;


