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

