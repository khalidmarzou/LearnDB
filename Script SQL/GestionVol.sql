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
update vol set NP = case NV 		when NV = 'IT100' then NP = 1
									when NV = 'IT101' then NP = 2
									when NV = 'IT102' then NP = 3
									when NV = 'IT103' then NP = 1
									when NV = 'IT104' then NP = 2
									end
									where NV = NP;