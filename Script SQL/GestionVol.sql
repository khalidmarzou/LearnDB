-- Creation des tables :
CREATE TABLE
  AVION (
    NA INT PRIMARY key,
    Nom VARCHAR(12),
    capacite INT,
    Localite VARCHAR(10)
  );



CREATE TABLE
  PILOTE (
    NP INT PRIMARY key,
    Nom VARCHAR(25),
    Adresse VARCHAR(40)
  );



CREATE TABLE
  VOL (
    NV INT PRIMARY key,
    NP INT,
    NA INT,
    VD VARCHAR(10),
    VA VARCHAR(10),
    HD INT,
    HA INT,
    FOREIGN key (NA) REFERENCES AVION (NA),
    FOREIGN key (NP) REFERENCES PILOTE (NP)
  );



-- change type of an attribut :
ALTER TABLE VOL
ALTER COLUMN NV type VARCHAR(6);



-- insert into the table :
INSERT INTO
  AVION
VALUES
  (100, 'AIRBUS', 300, 'RABAT'),
  (101, 'B737', 220, 'CASA'),
  (102, 'B737', 220, 'RABAT');



-- Afficher tous les avions :
SELECT
  *
FROM
  avion;



-- Afficher tous les avions par ordre sur le nom :
SELECT
  *
FROM
  avion
ORDER BY
  Nom;



-- Afficher les noms te les capacites des avion :
SELECT
  Nom,
  capacite
FROM
  avion;



-- Afficher les localites des avions sans redondance:
SELECT DISTINCT
  localite
FROM
  avion;



-- Afficher les avions dans la localite et Rabat ou Casa :
SELECT
  *
FROM
  avion
WHERE
  localite='RABAT' OR
  localite='CASA';



SELECT
  *
FROM
  avion
WHERE
  localite IN ('RABAT', 'CASA');



-- Modifier une valeur :
UPDATE avion
SET
  capacite=220
WHERE
  NA=101;



-- supprimer les avions dont la capacite est inferieure a 200 :
DELETE FROM avion
WHERE
  capacite<200;



-- Afficher la capacite max, min et moy des avions :
SELECT
  MAX(capacite),
  MIN(capacite),
  AVG(capacite)
FROM
  avion;



------------------------------------------------------------
INSERT INTO
  vol (NV, NA, VD, VA, HD, HA)
VALUES
  (
    'IT100',
    100,
    'Casablanca',
    'Marrakech',
    1200,
    1400
  ),
  (
    'IT101',
    101,
    'Rabat',
    'Casablanca',
    1330,
    1500
  ),
  (
    'IT102',
    101,
    'Casablanca',
    'Rabat',
    1400,
    1530
  ),
  (
    'IT103',
    100,
    'Marrakech',
    'Casablanca',
    1500,
    1700
  ),
  (
    'IT104',
    101,
    'Casablanca',
    'Marrakech',
    1600,
    1800
  );



SELECT
  *
FROM
  vol;



INSERT INTO
  pilote
VALUES
  (
    1,
    'Karim IDRISSI',
    '12 Rue Atlas Casablanca'
  ),
  (
    2,
    'Fatima Benali',
    '789 Sahara Avenue Marrakech'
  ),
  (
    3,
    'Ahmed Oujdaoui',
    '42 Rif Road Rabat'
  ),
  (4, 'Amal', 'Tanger');



SELECT
  *
FROM
  pilote;



UPDATE vol
SET
  NP=1
WHERE
  nv='IT100';



UPDATE vol
SET
  NP=2
WHERE
  nv='IT101';



UPDATE vol
SET
  NP=3
WHERE
  nv='IT102';



UPDATE vol
SET
  NP=1
WHERE
  nv='IT103';



UPDATE vol
SET
  NP=2
WHERE
  nv='IT104';



-- selectionner les pilotes quit conduit les vol 100 et 104 :
SELECT
  pilote.nom,
  pilote.adresse
FROM
  pilote
  JOIN vol ON (vol.np=pilote.np)
WHERE
  vol.NV IN ('IT100', 'IT104');



-- where :  est pour ajouter une condition ; null ; is not null ; between ; like : where first_name like 'A%' 
-- on utilise % pour signife plusieurs caracteres ; _e_n__ on utilise _ si en connais la position exact des caracteres
-- where price between 10 and 15 ; we can use between date , 10 and 15 est inclus dans range;
-- AS (Alias) : select product_name AS "Mes Produits" from products, creer une neauvaux colone temporaire;
-- EX d'APP :
-- Afficher tous les enregistrements de la table VOL :
SELECT
  *
FROM
  vol;



-- Afficher le nom et l'adresse de tous les pilotes :
SELECT
  nom,
  adresse
FROM
  pilote;



-- Afficher les vols dont l'heures de départ est apres 14h :
SELECT
  *
FROM
  vol
WHERE
  hd>=1400;



-- Afficher les pilotes dont le nom commence par "A" :
SELECT
  *
FROM
  pilote
WHERE
  nom LIKE 'A%';



-- Afficher les avions bases a Rabat, avec la localité renommée en "Emplacement" :
SELECT
  na,
  nom,
  capacite,
  localite AS Emplacement
FROM
  avion
WHERE
  localite='RABAT';



-- Afficher tous les vols tries par la ville de depart :
SELECT
  *
FROM
  vol
ORDER BY
  vd;



-- desc descendent ; asc ascendent ;
-- group by est utilise pour grouper plusieurs resultats et utiliser une fonction sur un groupe de resultat.
-- group by on utilise having au place du where ;
-- limit utilise pour specifier le nombre max de resultats que l on sauhaite obtenir.
-- selct * from table limit 10 offset 5 , limit c est le nembre de lignes afficher et offset est witch line de depart.
-- Jointures :
/* inner join ; from table1 inner join table2 on (condition of the same column in the two tables);
on resume dans : table1 jointure avec table2 on condition         ,
il est possible de fait select from table1,table2 where condition*/
-- EX APP :
-- Afficher le nom et l'adresse des pilotes assuant les vols IT104 et IT100 :
SELECT
  nom,
  adresse
FROM
  pilote
  INNER JOIN vol ON pilote.np=vol.np
WHERE
  vol.nv IN ('IT100', 'IT104');



-- Afficher le nombre total de vols effectués par chaque pilote avec le nom du pilote :
SELECT
  pilote.nom,
  COUNT(vol.np) AS nombreVol -- on work with group by always when we have a function in the requette
FROM
  pilote
  INNER JOIN vol ON pilote.np=vol.np
GROUP BY
  pilote.nom;



--chaque est automatiquement un group by;
-- Afficher les noms des pilotes qui conduisent un AIRBUS :
-- Ma Methode :
SELECT DISTINCT
  pilote.nom
FROM
  (
    SELECT
      *
    FROM
      vol
      INNER JOIN avion ON vol.na=avion.na
  ) AS avionVolTable
  INNER JOIN pilote ON pilote.np=avionVolTable.np
WHERE
  avionVolTable.nom LIKE 'AIRBUS';



-- Methode Simple :
SELECT DISTINCT
  pilote.nom
FROM
  pilote
  JOIN vol ON pilote.np=vol.np
  INNER JOIN avion ON vol.na=avion.na
WHERE
  avion.nom LIKE 'AIRBUS';