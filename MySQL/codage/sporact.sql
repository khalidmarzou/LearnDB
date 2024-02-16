#create database SPORACT;
#use SPORACT;

#create table centre(
#	 numc int,
#    nomc varchar(20),
#    vilc varchar(20),
#	 coutins decimal(5,2));
#insert into sporact.centre(numc,nomc,vilc,coutins) values(1584,"Gymtastic", "Casablanca",120.00);
#insert into sporact.centre(numc,nomc,vilc,coutins) values(1447,"cityClub","Rabat",350.60);
#insert into sporact.centre(numc,nomc,vilc,coutins) values(3254,"cityClub","Tanger",350.60);
#insert into sporact.centre(numc,nomc,vilc,coutins) values(9954,"cityClub","Marrakech",350.60);
#insert into sporact.centre(numc,nomc,vilc,coutins) values(6745,"cityClub","Agadir",350.60);
#insert into sporact.centre(numc,nomc,vilc,coutins) values(3321,"cityClub","Settat",350.60);
#insert into sporact.centre(numc,nomc,vilc,coutins) values(7775,"cityClub","Casablanca",350.60);
#insert into sporact.centre(numc,nomc,vilc,coutins) values(5541,"cityClub","Tetouane",350.60);
#insert into sporact.centre(numc,nomc,vilc,coutins) values(0021,"cityClub","Rabat",350.60);
#insert into sporact.centre(numc,nomc,vilc,coutins) values(9465,"cityClub","Salé",350.60);


#create table adherant(numa int,
	#noma varchar(20),
	#prenoma varchar(20),
    #vila varchar(20));
#insert into adherant(numa,noma,prenoma,vila) values(123,"BAI","Said","Casablanca");
#insert into adherant(numa,noma,prenoma,vila) values(456,"Bouchra","AHRICH","Marrakech");
#insert into adherant(numa,noma,prenoma,vila) values(118,"MGHIMED","fahd","Tetouane");
#insert into adherant(numa,noma,prenoma,vila) values(745,"GHAMRAOUI","anas","Agadir");
#insert into adherant(numa,noma,prenoma,vila) values(998,"FALLAH","mohammed","Marrakech");
#insert into adherant(numa,noma,prenoma,vila) values(130,"HIWANI","abdel","Marrakech");
#insert into adherant(numa,noma,prenoma,vila) values(750,"OUBAID","zyad","Settet");
#insert into adherant(numa,noma,prenoma,vila) values(914,"BILAD","soufiane","Casablanca");
#insert into adherant(numa,noma,prenoma,vila) values(911,"HEKKI","haitam","Casablanca");
#insert into adherant(numa,noma,prenoma,vila) values(115,"BASLI","amine","Casablanca");


#create table sport(noms varchar(20) primary key);
#insert into sport(noms) value("Tennis");
#insert into sport(noms) value("Football");
#insert into sport(noms) value("Musclation");
#insert into sport(noms) value("equitation");
#insert into sport(noms) value("basketball");
#insert into sport(noms) value("volleyball");
#insert into sport(noms) value("natation");
#insert into sport(noms) value("hockey");
#insert into sport(noms) value("rugby");
 
 
#create table est_membre(numa int,
#numc int,
#dateEng date);
#insert into est_membre(numa,numc,dateEng) values(123,1584,"2020-09-12");
#insert into est_membre(numa,numc,dateEng) values(456,1584,"2023-11-04");
#insert into est_membre(numa,numc,dateEng) values(118,3254,"2023-11-04");
#insert into est_membre(numa,numc,dateEng) values(745,1584,"2023-11-04");
#insert into est_membre(numa,numc,dateEng) values(998,0021,"2023-11-04");
#insert into est_membre(numa,numc,dateEng) values(130,9465,"2023-11-04");
#insert into est_membre(numa,numc,dateEng) values(750,1584,"2023-11-04");
#insert into est_membre(numa,numc,dateEng) values(914,7775,"2023-11-04");
#insert into est_membre(numa,numc,dateEng) values(911,7775,"2023-11-04");
#insert into est_membre(numa,numc,dateEng) values(115,7775,"2023-11-04");
 
#create table propose(numc int,
#noms varchar(20));
#insert into propose(numc,noms) values(1584,"Musclation");
#insert into propose(numc,noms) values(6745,"Football");
#insert into propose(numc,noms) values(1447,"rugby");
#insert into propose(numc,noms) values(1447,"natation");
#insert into propose(numc,noms) values(6745, "HandBall");

#create table pratique(numa int,
#numc int,
#noms varchar(20));
#insert into pratique(numa,numc,noms) values(123,1584,"Musclation");
#insert into pratique(numa,numc,noms) values(456,1447,"Football");
#insert into pratique(numa,numc,noms) values(456,1447,"natation");
#insert into pratique(numa,numc,noms) values(456,1447,"HandBall");

#######################################################################################################################

#use sporact;
#select noms from propose;
#select nomc,vilc from centre;
#select * from centre where vilc="Casablanca";
#select nomc from centre where vilc="Rabat";
#select CENTRE.numc from CENTRE,PROPOSE where CENTRE.numc = PROPOSE.noms and CENTRE.vilc ="agadir" and PROPOSE.noms #= "Football" and PROPOSE.noms="HandBall";
#select numc, nomc,vilc,coutins, coutins*1/5 as tva, coutins*120/100 as ttc, coutins*5/100 as remise, #coutins*120/100*95/100 as net from centre;
#select*from centre,propose where centre.numc=propose.numc;
#select numc from propose where noms="Musclation" AND noms="equitation";
#select centre.numc,centre.nomc,centre.vilc from propose,centre where centre.numc=propose.numc;
#alter table centre 
      #add tel varchar(10),
      #add adresse varchar(45);
#alter table centre
	#change column numc numeroc INT ;
#alter table centre add cp varchar(5);

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

#select *, MAX(coutins) as maximum from centre;
#select *,max(coutins) as maximum, min(coutins) as minimum from centre;
#select * from centre where coutins=(select max(coutins) as maximum from centre);
#use sporact;
#update centre set cp=20000 where numeroc=1584;
#select * from centre,adherant where adherant.numa>centre.numeroc;
#delete from centre where vilc='Tanger';
####################################################################################"