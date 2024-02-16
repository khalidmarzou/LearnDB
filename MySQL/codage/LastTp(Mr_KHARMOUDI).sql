#create database GestionCinema;
use gestioncinema;
#create table ACTEUR (numa int primary key,prea varchar(10),noma varchar(10),vila varchar(10));
#create table REALISATEUR (numr int primary key,prer varchar(10),nomr varchar(10),vilr varchar(10));
#create table FILM (numf int primary key,titre varchar(10),datep date,numr int,foreign key (numr) references realisateur (numr));
#create table AF (numa int primary key,numf int); numf primary key
#create table CINEMA (numc int primary key,nomc varchar(10),adresse varchar(30),telc varchar(10));
#create table HORAIRE (jour date primary key,heure time); heure primary key
#create table SALLE (nums int primary key,place varchar(10),typecran varchar(10),numc int,foreign key (numc) references cinema (numc));
#create table PROJECTEURH (jour date primary key,heure time,numf int); heure and numf primary key
#create table PROJECTEURS (nums int primary key,numf int); numf primary key
#ALTER TABLE `gestioncinema`.`salle` 
#CHANGE COLUMN `place` `place` INT NOT NULL;
#DROP PRIMARY KEY,
#ADD PRIMARY KEY (`nums`, `numf`);
#INSERT INTO gestioncinema.acteur (numa, prea, noma, vila) VALUES 
#(1,'ahmed','marzoug','marrakech'),
#(2,'zakaria','sidqui','marrakech')
#,(3,'khalid','marzoug','casablanca')
#,(4,'youssef','mabrouk','agadir')
#,(5,'ziyad','lahssen','agadir')
#,(6,'abdo','banan','casablanca')
#,(7,'mohamed','ouafik','casablanca')
#,(8,'amine','legedani','tangier')
#,(9,'mohamed','jalal','casablanca')
#,(10,'amina','marzoug','marrakech');
#INSERT INTO FILM (numf,titre,datep,numr) VALUES
#(1, 'The Godfather', '1972-03-24',102),
#(2, 'Forrest Gump', '1994-07-06',106),
#(3, 'The Shawshank Redemption', '1994-09-23',101),
#(4, 'Pulp Fiction', '1994-10-14',103),
#(5, 'Titanic', '1997-12-19',104),
#(6, 'The Dark Knight', '2008-07-18',105),
#(7, 'Inception', '2010-07-16',107),
#(8, 'The Avengers', '2012-05-04',110),
#(9, 'Interstellar', '2014-11-07',108),
#(10, 'Joker', '2019-10-04',109);
#insert into af (numa,numf) values
#(1,3),
#(2,5),
#(3,1),
#(4,2),
#(5,6),
#(6,10),
#(7,9),
#(8,8),
#(9,4),
#(10,7);
#INSERT INTO CINEMA (numc, nomc, adresse, telc) VALUES
#(1, 'Megarama', 'Avenue Mohammed VI', '0522334455'),
#(2, 'Imax Rabat', 'Avenue Hassan II', '0537668899'),
#(3, 'Cinema Rif', 'Avenue Mohammed V', '0539401020'),
#(4, 'Cinema Megarama', 'Boulevard Mohamed Zerktouni', '0524223344'),
#(5, 'Cinema Rialto', 'Avenue Mohammed V', '0522998877'),
#(6, 'Cinema Colisee', 'Boulevard Mohammed VI', '0528756432'),
#(7, 'Cinema Royal', 'Avenue Mohammed V', '0535778899'),
#(8, 'Cinema Renaissance', 'Avenue Hassan II', '0522990099'),
#(9, 'Cinema Eden', 'Avenue Mohammed VI', '0524768899'),
#(10, 'Cinema Le Plaza', 'Avenue Mohammed V', '0522556677');
#INSERT INTO HORAIRE (jour, heure) VALUES
#('2024-02-01', '08:00:00'),
#('2024-02-02', '10:30:00'),
#('2024-02-03', '12:15:00'),
#('2024-02-04', '14:45:00'),
#('2024-02-05', '16:20:00'),
#('2024-02-06', '18:00:00'),
#('2024-02-07', '20:30:00'),
#('2024-02-08', '09:45:00'),
#('2024-02-09', '11:00:00'),
#('2024-02-10', '13:20:00');
#INSERT INTO SALLE (nums, place, typecran, numc) VALUES
#(201, 150, 'Standard', 1),
#(202, 200, '3D', 2),
#(203, 100, 'Standard', 3),
#(204, 180, 'IMAX', 4),
#(205, 120, 'Standard', 5),
#(206, 250, '3D', 6),
#(207, 180, 'Standard', 7),
#(208, 220, 'IMAX', 8),
#(209, 200, 'Standard', 9),
#(210, 150, '3D', 10);
#INSERT INTO PROJECTEURH (jour, heure, numf) VALUES
#('2024-02-01', '08:00:00', 1),
#('2024-02-02', '10:30:00', 2),
#('2024-02-03', '12:15:00', 3),
#('2024-02-04', '14:45:00', 4),
#('2024-02-05', '16:20:00', 5),
#('2024-02-06', '18:00:00', 6),
#('2024-02-07', '20:30:00', 7),
#('2024-02-08', '09:45:00', 8),
#('2024-02-09', '11:00:00', 9),
#('2024-02-10', '13:20:00', 10);
#INSERT INTO PROJECTEURS (nums, numf) VALUES
#(201, 1),
#(202, 2),
#(203, 3),
#(204, 4),
#(205, 5),
#(206, 6),
#(207, 7),
#(208, 8),
#(209, 9),
#(210, 10);
#requete 4 :
#select af.numa, film.titre, film.datep from film join af where film.numf = af.numf;
#requete 5 :
#select realisateur.nomr, film.datep from film join realisateur where film.numr = realisateur.numr;
#requete 6 :
#select cinema.nomc, salle.place, salle.typecran from cinema join salle where cinema.numc = salle.numc;
#requete 7 :
#SELECT salle.numc, salle.MAX(place) AS max_place, salle.MIN(place) AS min_place
#FROM SALLE
#GROUP BY numc;
#requete 8 :
#select cinema.nomc, cinema.adresse, max(salle.place) as max_place from cinema join salle where cinema.numc = salle.numc;