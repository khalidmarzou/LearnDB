CREATE TABLE
  employes (
    id INT PRIMARY key,
    first_name VARCHAR(20),
    last_name VARCHAR(20),
    email VARCHAR(20),
    hire_date DATE,
    gender VARCHAR(1),
    salary INT /* coffeShop_id int foreign key from table shops */
  );



CREATE TABLE
  shops (
    coffeeshop_id INT PRIMARY key,
    coffeeshop_name VARCHAR(20)
    /* city_id int foreign key from table city*/
  );



/* ON DELETE CASCADE is used to specify that when a row is deleted from the parent table,
all rows in the child table that reference the deleted row should also be deleted.
This is useful for maintaining the integrity of the database. */
-- to  create a new column :
ALTER TABLE employes
ADD COLUMN coffeeshop INT;



-- to add a foreign key :
ALTER TABLE employes add FOREIGN key (coffeeshop) REFERENCES shops (coffeeshop_id);



ALTER TABLE employes
RENAME COLUMN coffeeshop TO coffeeshop_id;



SELECT
  *
FROM
  employes;



SELECT
  *
FROM
  shops;



/* The ON DELETE CASCADE is a referential action that can be specified when defining a foreign key constraint in a database.
When applied to a foreign key relationship between two tables, it indicates that if a record in the parent table (referenced table) is deleted,
then all corresponding records in the child table (referencing table) will be automatically deleted as well.*/
/* **RESTRICT**: This option prevents the deletion or update of a referenced row if there are any dependent rows in the child table. It acts as
a safeguard against accidental deletion or modification of important data.
 **SET NULL**: With this option, if a referenced row is deleted or updated, the foreign key column in the child table will be set to NULL.
This is useful when you want to allow rows in the child table to exist without a corresponding parent row.
 **SET DEFAULT**: Similar to `SET NULL`, this option sets the foreign key column in the child table to a default value specified during
table creation if the referenced row is deleted or updated.
 **NO ACTION**: This option is similar to `RESTRICT` in that it prevents the deletion or update of a referenced row
if dependent rows exist in the child table. It's often the default behavior if no action is explicitly specified.*/