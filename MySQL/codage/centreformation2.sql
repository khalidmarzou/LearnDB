#create database CENTREFORMATION;
use centreformation;
#create table ETUDIANT(numCINETU int primary key,nomETU varchar(20),prenomETU varchar(20),adressETU varchar(100),
#						telETU varchar(10),filiereETU varchar(20));
#create table formation(codeForm int primary key,
#						titreForm varchar(100),dureeForm decimal(5,2));
#create table session(codeSess int primary key, nomSess varchar(20),dateDebut date, codeForm int,
#				foreign key (codeForm) references formation (codeForm));
#create table INSCRIPTION(numCINETU int primary key, codeSess int,typeCour varchar(20),
#							foreign key (numCINETU) references etudiant (numCINETU), foreign key (codeSess) references session (codeSess));
#create table specialite (codeSpec int primary key, nomSpec varchar(20));
#create table combinaison(codeSpec int primary key,codeForm int,foreign key (codeSpec) references specialite (codeSpec),
#							foreign key (codeForm) references formation(codeForm));
#describe combinaison;
#insert into etudiant(numCINETU,nomETU,prenomETU,adressETU,telETU,filiereETU)
#	value (22452,'sidqui','zakaria',"casablanca",'0611517456',"dd"),
#			(456465,"lokhmi",'rayan','casablanca',"454671546","di"),
#            (545315315,"hilmi","zakaria","marrakech","01457458723","id"),
#            (32653,"gedani","amine","settat","0745846952","prof");
#update etudiant set telETU="0611517876" where numCINETU=223262;
#insert into formation (codeForm,titreForm,dureeForm)
#	value (101,"metier","20"),
#		  (106,"html","60"),
#		  (104,'sgbd','120'),
#         (105,'algorithme',"100");
#alter table combinaison
#	add column codeSpec int;
#alter table combinaison
#	add constraint codeSpec foreign key (codeSpec) references specialite(codeSpec);
#insert into specialite (codeSpec,nomSpec)
#	value (105,'digital'),
#		(106,'infographie'),
#		(107,'gestion');
#insert into combinaison (codeForm,codeSpec)
#	value (101,105),
#			(106,105),
#            (104,105),
#            (101,106),
#            (104,107),
#            (101,107);
#insert into session(dateDebut)
#	value    ("2023-10-26");
#			 ("2023-11-26"),
#            ("2024-02-26"),
#            ("2024-06-26");
#update session set dateDebut="2024-06-26" where codeSess=44;
#delete from session where codeSess=0;
#select * from centreformation.session;
#insert into inscription(codeSess,typecour,numCINETU) value
#	 (11,"prive",223262),
#    (22,"public",22452),
#    (33,'public',456465),
#    (44,'prive',545315315),
#    (11,"prive",32653);
#show databases;
#select database centreformation from sys.databases;
#select nomETU,prenomETU,typeCour from etudiant,inscription where etudiant.numCINETU=inscription.numCINETU; #Q1EXAM
#UPDATE `centreformation`.`formation` SET `dureeForm` = '04.00' WHERE (`codeForm` = '101');
#UPDATE `centreformation`.`formation` SET `dureeForm` = '03.00' WHERE (`codeForm` = '106');
#UPDATE `centreformation`.`formation` SET `dureeForm` = '05.00' WHERE (`codeForm` = '104');
#UPDATE `centreformation`.`formation` SET `dureeForm` = '06.00' WHERE (`codeForm` = '105');
#select nomSess,titreForm,dateDebut,dureeForm from session,formation where dateDebut<'2022-01-15' and dureeForm=4;
#select session.codeForm,formation.codeForm,dateDebut,dureeFor+9+3.m from session,formation  where session.codeForm = formation.codeForm ;
#select session.codeForm,min(dateDebut) as debutForm from session group by session.codeForm;
#select formation.codeForm,dureeForm from formation inner join ( select session.codeForm,min(dateDebut) as debutForm from session group by session.codeForm) on formation.codeFrom= b.codeForm;
#select codeForm.min(dateDebut) as debutForm from session group by codeForm;
#select codeForm,titreForm,dureeForm,debutForm from formation,codeForm;
#select dureeForm,debutform from  (select session.codeform , min(datedebut) as debutform from session group by codeform) as p
#inner join
#formation on p.codeform = formation.codeform;
#select dureeForm,dateDebut from formation,session where session.codeForm=formation.CodeForm ;
#reate table combinaison (codeForm int,codeSpec int,foreign key (codeForm) references formation(codeForm),foreign key (codeSpec) references specialite(codeSpec));
#insert into combinaison value
#				(1,2001),
#                (2,2002),
#                (3,2003),
#                (4,2004),
#                (5,2005),
#                (1,2006),
#                (2,2001);