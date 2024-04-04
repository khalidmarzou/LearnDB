CREATE TABLE
	employes (
		id INT PRIMARY KEY,
		first_name VARCHAR(20),
		last_name VARCHAR(20),
		email VARCHAR(20),
		hire_date date,
		gender VARCHAR(1),
		salary INT /* coffeShop_id int foreign key from table shops */
	)
;


CREATE TABLE
	shops (
		coffeeshop_id INT PRIMARY KEY,
		coffeeshop_name VARCHAR(20)
		/* city_id int foreign key from table city*/
	)
;


/* ON DELETE CASCADE is used to specify that when a row is deleted from the parent table,
all rows in the child table that reference the deleted row should also be deleted.
This is useful for maintaining the integrity of the database. */
-- to  create a new column :
ALTER TABLE employes
ADD COLUMN coffeeshop INT
;


-- to add a foreign key :
ALTER TABLE employes
ADD FOREIGN KEY (coffeeshop) REFERENCES shops (coffeeshop_id)
;


ALTER TABLE employes
RENAME COLUMN coffeeshop TO coffeeshop_id
;


SELECT
	*
FROM
	employes
;


SELECT
	*
FROM
	shops
;


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
CREATE TABLE
	locations (city_id INT PRIMARY KEY, city VARCHAR(10), country VARCHAR(10))
ALTER TABLE shops
ADD city_id INT
;


ALTER TABLE shops
ADD FOREIGN KEY (city_id) REFERENCES locations (city_id)
;


CREATE TABLE
	fourniseurs (
		coffeshop_id INT,
		supplier_name VARCHAR(10),
		PRIMARY KEY (coffeshop_id, supplier_name),
		FOREIGN KEY (coffeshop_id) REFERENCES shops (coffeeshop_id),
		cofee_type VARCHAR(10)
	)
;


SELECT
	*
FROM
	employes
;


INSERT INTO
	employes
VALUES
	(501559, 'carson', 'Mosconi', 'cmosconi0@census.gov', '2015/08/29', 'M', 32973, NULL),
	(144108, 'khalil', 'corr', 'kcorr1@github.io', '2014/04/23', 'M', 52802, NULL)
;


INSERT INTO
	shops
VALUES
	(1, 'Common Grounds', NULL),
	(2, 'Early Rise', NULL),
	(3, 'Accident Bean', NULL),
	(4, 'Urban Gring', NULL),
	(5, 'Trembling Cup', NULL)
;


SELECT
	*
FROM
	locations
;


ALTER TABLE locations
ALTER COLUMN country
TYPE VARCHAR(30)
;


INSERT INTO
	locations
VALUES
	(1, 'Los Angeles', 'United States'),
	(2, 'New York', 'United States'),
	(3, 'London', 'United Kingdom')
UPDATE shops
SET
	city_id=1
WHERE
	coffeeshop_id=1
;


UPDATE shops
SET
	city_id=2
WHERE
	coffeeshop_id=2
;


UPDATE shops
SET
	city_id=3
WHERE
	coffeeshop_id=3
;


UPDATE shops
SET
	city_id=1
WHERE
	coffeeshop_id=4
;


UPDATE shops
SET
	city_id=2
WHERE
	coffeeshop_id=5
;


UPDATE employes
SET
	coffeeshop_id=1
WHERE
	id=501559
;


UPDATE employes
SET
	coffeeshop_id=1
WHERE
	id=144108
;


SELECT
	*
FROM
	fourniseurs
;


ALTER TABLE fourniseurs
ALTER COLUMN supplier_name
TYPE VARCHAR(30)
;


INSERT INTO
	fourniseurs
VALUES
	(2, 'Vanilia Bean', 'Liberica'),
	(2, 'Beans and Barley', 'Arabica'),
	(2, 'Cool Beans', 'Robusta'),
	(3, 'Bean Me UP', 'Excelsa'),
	(3, 'Vanilla Bean', 'Liberica'),
	(3, 'Cool Beans', 'robusta'),
	(3, 'Beans and Balery', 'Arabica'),
	(4, 'Vanilla Bean', 'Liberica'),
	(4, 'Bean Me Up', 'Excelsa'),
	(5, 'Beans and Barley', 'Arabica')
;


SELECT
	*
FROM
	fourniseurs
;


UPDATE fourniseurs
SET
	supplier_name='Beans and Barley'
WHERE
	supplier_name IN ('Beans and Berley', 'Beans and Barley', 'Beans and Balery')
;


SELECT
	*
FROM
	fourniseurs
WHERE
	supplier_name='Beans and Barley'
;


SELECT
	first_name,
	last_name,
	coffeeshop_name
FROM
	employes
	INNER JOIN shops ON employes.coffeeshop_id=shops.coffeeshop_id
;


SELECT
	first_name,
	last_name,
	coffeeshop_name
FROM
	shops
	LEFT JOIN employes ON shops.coffeeshop_id=employes.coffeeshop_id
;


SELECT
	first_name,
	last_name,
	coffeeshop_name
FROM
	shops
	NATURAL JOIN employes
;


SELECT
	first_name,
	coffeeshop_name
FROM
	shops -- tous les cas possible
	CROSS JOIN employes
;


SELECT
	first_name
FROM
	employes
UNION -- on ajout all pour afficher les doubles
SELECT
	coffeeshop_name
FROM
	shops
;


-- intersect pour afficher tous qui dans les deux tables
-- except table minus table2
-- Question 4:
SELECT
	coffeeshop_name,
	SUM(salary)     AS Total_Salaires
FROM
	employes
	NATURAL JOIN shops
GROUP BY
	coffeeshop_name
;


-- Question 5:
SELECT
	supplier_name,
	cofee_type,
	coffeeshop_name
FROM
	fourniseurs
	NATURAL JOIN shops
WHERE
	coffeeshop_name='Urban Gring'
;


-- sous requette scalaire sont des sous requette qui retourner des valeurs (requette inmbriqué)
-- we use where seul valeur | in plusieurs valeurs | exists (si exist return true) 1+
-- condition > all (sous requette) condition on all return true si tous respect la condition
-- any au moins une seul valeur return true si au mois une respect la condition
-- les sous requette pour tous qui calcule
-- Liste des CoffeShops ayant au moins un employe avec salaire > 30000
SELECT
	coffeeshop_name
FROM
	shops
WHERE
	coffeeshop_id IN ( -- in === =any
		SELECT
			coffeeshop_id
		FROM
			employes
		WHERE
			salary>20000
	)
;


-- coffeeshop haves Tous les employes ayant salaire > 20000 :
SELECT
	coffeeshop_name
FROM
	shops
WHERE
	coffeeshop_id IN (
		SELECT
			e.coffeeshop_id
		FROM
			employes e
		GROUP BY
			e.coffeeshop_id
		HAVING
			COUNT(*)=(
				SELECT
					COUNT(*)
				FROM
					employes
				WHERE
					coffeeshop_id=e.coffeeshop_id
					AND salary>20000
			)
	)
;


SELECT
	coffeeshop_name
FROM
	shops
WHERE
	coffeeshop_id=(
		SELECT
			coffeeshop_id
		FROM
			(
				SELECT
					*
				FROM
					(
						SELECT
							COUNT(*)      AS countALL,
							coffeeshop_id
						FROM
							employes
						GROUP BY
							coffeeshop_id
					)
					NATURAL JOIN (
						SELECT
							COUNT(*)      AS countCondition,
							coffeeshop_id
						FROM
							employes
						WHERE
							salary>20000
						GROUP BY
							coffeeshop_id
					)
			)
		WHERE
			countall=countCondition
	)
;


INSERT INTO
	employes
VALUES
	(166671576, 'Harry', 'Daniel', 'edo@havzawuz.gl', '2015-01-20', 'M', 17000, 3)
;


-- Liste des coffeshops ayant au moins un employe dont
-- le salaire depasse le salaire moyen de tous les employes
SELECT
	coffeeshop_name
FROM
	shops
WHERE
	coffeeshop_id IN (
		SELECT
			coffeeshop_id
		FROM
			employes
		WHERE
			salary>(
				SELECT
					AVG(salary)
				FROM
					employes
			)
	)
;


SELECT
	last_name,
	salary
FROM
	employes
WHERE
	coffeeshop_id=(
		SELECT
			coffeeshop_id
		FROM
			shops
		WHERE
			city_id=(
				SELECT
					city_id
				FROM
					locations
				WHERE
					city='London'
			)
	)
;


SELECT
	coffeeshop_name,
	COUNT(id)
FROM
	employes
	FULL JOIN shops ON employes.coffeeshop_id=shops.coffeeshop_id
GROUP BY
	shops.coffeeshop_id
; --  full join to display 0 when no match is found