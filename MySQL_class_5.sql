create table customers(
	id int primary key,
	name varchar(20) not null,
	email varchar(20) unique
);

alter table customers add phone int(11);

insert into customers values(1, "john", "john@gmail.com");
insert into customers(id, name) values(2, "jane");

update customers set email="jane@gmail.com" where id=2;

delete from customers; - deletes all the rows
delete from customers where id=2;