#create database centreformation;
use centreformation;
#create table ETUDIANT(numCINETU int primary key,nomETU varchar(20),prenomETU varchar(20),adressETU varchar(100),
#						telETU varchar(10),filiereETU varchar(20));
#create table formation(codeForm int primary key,
#						titreForm varchar(100),dureeForm decimal(5,2));
#create table session(codeSess int primary key, nomSess varchar(20),dateDebut date, codeForm int,
#				foreign key (codeForm) references formation (codeForm));
#create table INSCRIPTION(numCINETU int primary key, codeSess int,typeCour varchar(20));
#create table specialite (codeSpec int primary key, nomSpec varchar(20));
#create table combinaison(codeSpec int primary key,codeForm int);
#INSERT INTO centreformation.etudiant (numCINETU, nomETU, prenomETU, adressETU, telETU, filiereETU) VALUES 
#(1234, 'marzoug', 'khalid', 'casablanca', '0611517876', 'dev'), 
#(2345, 'sidqui', 'zakaria', 'kech', '0600000001', 'info'),
#(3456, 'mahfoud', 'anass', 'rabat', '0600000005', 'dev'),
#(4576, 'baddioui', 'ilham', 'taza', '0654154876', 'gestion');
#INSERT INTO centreformation.inscription (numCINETU,codeSess,typeCour) VALUES 
#(1234, 101,'presentiel'), 
#(2345, 102,'presentiel'),
#(3456, 103,'presentiel'),
#(4576, 104,'Adistance');
#requete 3:
#select etudiant.nomETU,inscription.typeCour from etudiant join inscription on etudiant.numCINETU = inscription.numCINETU;
#requete 4:
#select session.nomSess,formation.titreForm from session join formation on session.codeForm = formation.codeForm where 
#	session.dateDebut < "2022-01-15" and formation.dureeForm = 4;
#requete 5:
#select specialite.nomSpec,formation.dureeForm from combinaison
#join specialite on combinaison.codeSpec = specialite.codeSpec join formation on combinaison.codeForm = formation.codeForm;
#requete 6:
select dureeForm , debutform from  (select session.codeForm ,
min(dateDebut) as debutForm from session group by codeForm) as p join
formation on p.codeForm = formation.codeForm;
#select session.dateDebut,formation.dureeForm from session join formation on session.codeForm = formation.codeForm;