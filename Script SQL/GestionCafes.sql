create table employes (id int primary key, first_name varchar(20),
					   last_name varchar(20), email varchar(20), hire_date date,
					   gender varchar(1), salary int /* coffeShop_id int foreign key from table shops */);
					   
create table shops (coffeeshop_id int primary key, coffeeshop_name varchar(20)
					/* city_id int foreign key from table city*/);
					
/* ON DELETE CASCADE is used to specify that when a row is deleted from the parent table,
	all rows in the child table that reference the deleted row should also be deleted.
	This is useful for maintaining the integrity of the database. */
-- to  create a new column :
alter table employes 
	add column coffeeshop int;
-- to add a foreign key :
alter table employes
	add foreign key (coffeeshop) references shops(coffeeshop_id);
	