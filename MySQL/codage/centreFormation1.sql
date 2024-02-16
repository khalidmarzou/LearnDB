
#create database CENTERFORMATION ;
#use CENTERFORMATION ;
#create table etudiant(numcinetu varchar (10) primary key, nometu varchar (10), prenometu varchar(10), teletu varchar (10), adresseetu varchar (15),filiereetu varchar (10));
#create table sessions (codesess varchar(15) primary key,nomsess varchar(10),datedebut date )
#create table formation (codeform varchar(15)primary key ,titreform varchar(10),dureeform varchar(8))
#create table specialite(codespec varchar(15) primary key,nomspec varchar(10))
#create table inscription (numcinetu varchar (10),codesess varchar(15),typecours varchar(10),foreign key(numcinetu) references etudiant(numcinetu), foreign key(codesess) references sessions(codesess))
#create table combinaison (codespec varchar(15),codeform varchar(15),foreign key(codespec) references specialite(codespec),foreign key(codeform) references formation(codeform))
#insert into etudiant value ("m01","EL HAIDI","MOHAMED","06123456","hay osra","reseaux")
#insert into etudiant value ("m02","Bennis","SOUFIANE","064565","hay lfala7","gestion")
#insert into etudiant value ("m03","SALMAM","ABDELAH","06138768","drisia","dd")
#insert into etudiant value ("m04","DEROUI","SAAD","0634456","sbata","id")
#insert into sessions value ("a1","python","2024-04-15")
#insert into sessions value ("a2","html","2023-05-05")
#insert into sessions value ("a3","css","2024-09-13")
#insert into sessions value ("a4","php","2024-10-19")
#insert into formation value ("100","formation1","6 mois")
#insert into formation value ("200","formation2"," 1 ans")
#insert into formation value ("300","formation3","3 mois");
#insert into formation value ("400","formation4","2 ans")
#insert into specialite value ("s1","rv");
#insert into specialite value ("s2","mobile")
#insert into specialite value ("s3","coding");
#insert into specialite value ("s4","dantiste")
#insert into inscription value ("m01","a1","presentiel");
#insert into inscription value ("m02","a2","enligne");
#insert into inscription value ("m03","a3","hybrid");
#insert into inscription value ("m04","a4","enligne")
#insert into combinaison value ("s1","100");
#insert into combinaison value ("s2","200");
#insert into combinaison value ("s3","300");
#insert into combinaison value ("s4","400");
#select nomEtu ,prenomEtu, typecours from etudiant, inscription where etudiant.numcinetu = inscription.numcinetu;
#select distinct nomsess, titreform from sessions, formation ,inscription where sessions.codesess=inscription.codesess and datedebut < "2024-05-05" and dureeform = " 1 ans";
#select distinct nomspec, dureeform from combinaison, specialite, formation where formation.codeform = combinaison.codeform and specialite.codespec = combinaison.codespec;
#select distinct datedebut, dureeform from sessions, formation, inscription where sessions.codesess=inscription.codesess ;
#select distinct datedebut, dureeform from sessions, formation;
#select sum(dureeform) as dureetotal, avg(dureeform) as moyenne from formation;
#select titreform from formation where dureeform = (select max(dureeform) from formation);
#select typecours, nomsess from inscription, sessions where inscription.codesess=sessions.codesess and datedebut between '2024-04-15' and '2024-10-19';