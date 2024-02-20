-- Creation des tables :
create table AVION (NA int primary key, Nom varchar(12), capacite int, Localite varchar(10));
create table PILOTE (NP int primary key, Nom varchar(25), Adresse varchar(40));
create table VOL (NV int primary key, NP int, NA int, VD varchar (10), VA varchar(10),HD int,HA int,
				  foreign key (NA) references AVION(NA), foreign key (NP) references PILOTE(NP));
-- change type of an attribut :
alter table VOL
	alter column NV type varchar(6);
-- insert into the table :
insert into AVION values (100, 'AIRBUS',300,'RABAT'), (101,'B737',220,'CASA'), (102, 'B737',220, 'RABAT');
-- Afficher tous les avions :
select * from avion;
-- Afficher tous les avions par ordre sur le nom :
select * from avion order by Nom;
-- Afficher les noms te les capacites des avion :
select Nom,capacite from avion;
-- Afficher les localites des avions sans redondance:
select distinct localite from avion;
-- Afficher les avions dans la localite et Rabat ou Casa :
select * from avion where localite = 'RABAT' or localite = 'CASA';
select * from avion where localite in ('RABAT','CASA');
-- Modifier une valeur :
update avion set capacite = 220 where NA = 101;
-- supprimer les avions dont la capacite est inferieure a 200 :
delete from avion where capacite < 200;
-- Afficher la capacite max, min et moy des avions :
select max(capacite),min(capacite),avg(capacite) from avion;

------------------------------------------------------------
insert into vol (NV, NA, VD, VA,HD,HA) values ('IT100', 100, 'Casablanca', 'Marrakech', 1200, 1400),
						('IT101', 101, 'Rabat', 'Casablanca', 1330, 1500),
						('IT102', 101, 'Casablanca', 'Rabat', 1400, 1530),
						('IT103', 100, 'Marrakech', 'Casablanca', 1500, 1700),
						('IT104', 101, 'Casablanca', 'Marrakech', 1600, 1800);
select * from vol;
insert into pilote values (1, 'Karim IDRISSI', '12 Rue Atlas Casablanca'),
							(2, 'Fatima Benali', '789 Sahara Avenue Marrakech'),
							(3, 'Ahmed Oujdaoui', '42 Rif Road Rabat'),
							(4, 'Amal','Tanger');
select * from pilote;
update vol set NP = 1 where nv = 'IT100';
update vol set NP = 2 where nv = 'IT101';
update vol set NP = 3 where nv = 'IT102';
update vol set NP = 1 where nv = 'IT103';
update vol set NP = 2 where nv = 'IT104';
-- selectionner les pilotes quit conduit les vol 100 et 104 :
select pilote.nom, pilote.adresse from pilote
	join vol on (vol.np = pilote.np)
	where vol.NV in ('IT100','IT104');
-- where :  est pour ajouter une condition ; null ; is not null ; between ; like : where first_name like 'A%' 
-- on utilise % pour signife plusieurs caracteres ; _e_n__ on utilise _ si en connais la position exact des caracteres
-- where price between 10 and 15 ; we can use between date , 10 and 15 est inclus dans range;
-- AS (Alias) : select product_name AS "Mes Produits" from products, creer une neauvaux colone temporaire;
-- EX d'APP :
-- Afficher tous les enregistrements de la table VOL :
select * from vol;
-- Afficher le nom et l'adresse de tous les pilotes :
select nom, adresse from pilote;
-- Afficher les vols dont l'heures de départ est apres 14h :
select * from vol where hd >= 1400;
-- Afficher les pilotes dont le nom commence par "A" :
select * from pilote where nom like 'A%';
-- Afficher les avions bases a Rabat, avec la localité renommée en "Emplacement" :
select na,nom,capacite,localite as Emplacement from avion where localite = 'RABAT';
-- Afficher tous les vols tries par la ville de depart :
select * from vol order by vd; -- desc descendent ; asc ascendent ;
-- group by est utilise pour grouper plusieurs resultats et utiliser une fonction sur un groupe de resultat.
-- group by on utilise having au place du where ;
-- limit utilise pour specifier le nombre max de resultats que l on sauhaite obtenir.
-- selct * from table limit 10 offset 5 , limit c est le nembre de lignes afficher et offset est witch line de depart.
-- Jointures :
/* inner join ; from table1 inner join table2 on (condition of the same column in the two tables);
on resume dans : table1 jointure avec table2 on condition ,
il est possible de fait select from table1,table2 where condition*/
-- EX APP :
-- Afficher le nom et l'adresse des pilotes assuant les vols IT104 et IT100 :
select nom, adresse from pilote inner join vol on pilote.np = vol.np where vol.nv in ('IT100','IT104');
-- Afficher le nombre total de vols effectués par chaque pilote avec le nom du pilote :
select pilote.nom, count(vol.np) as nombreVol -- on work with group by always when we have a function in the requette
	from pilote inner join vol on pilote.np = vol.np group by pilote.nom; --chaque est automatiquement un group by;
-- Afficher les noms des pilotes qui conduisent un AIRBUS :
	-- Ma Methode :
select distinct pilote.nom from (select * from vol inner join avion on vol.na = avion.na)  as avionVolTable
	inner join pilote on pilote.np = avionVolTable.np where avionVolTable.nom like 'AIRBUS';
	-- Methode Simple :
select distinct pilote.nom from pilote join vol on pilote.np = vol.np
	inner join avion on vol.na = avion.na where avion.nom like 'AIRBUS';