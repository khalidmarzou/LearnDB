-- Create table Voiture
CREATE TABLE
  Voiture (
    numSerie SERIAL PRIMARY KEY,
    denomination VARCHAR(100),
    marque VARCHAR(100),
    prixAffiche NUMERIC,
    prixRevient NUMERIC,
    numMagasin INT,
    FOREIGN KEY (numMagasin) REFERENCES Magasin (numMagasin)
  );



-- Create table Client
CREATE TABLE
  Client (
    nomC VARCHAR(100) PRIMARY KEY,
    prenom VARCHAR(100),
    adresse VARCHAR(255),
    ville VARCHAR(100)
  );



-- Create table Vendeur
CREATE TABLE
  Vendeur (
    nomV VARCHAR(100),
    prenom VARCHAR(100),
    adresse VARCHAR(255),
    salaireFixe NUMERIC,
    numMagasin INT,
    PRIMARY KEY (nomV, numMagasin),
    FOREIGN KEY (numMagasin) REFERENCES Magasin (numMagasin)
  );



ALTER TABLE vendeur
DROP CONSTRAINT vendeur_pkey;



ALTER TABLE vendeur add PRIMARY key (nomV);



-- Create table Vente
CREATE TABLE
  Vente (
    prixAchatReel NUMERIC,
    dateVente DATE,
    nomC VARCHAR(100),
    nomV VARCHAR(100),
    numSerie INT,
    PRIMARY KEY (nomC, nomV, numSerie),
    FOREIGN KEY (nomC) REFERENCES Client (nomC),
    FOREIGN KEY (numSerie) REFERENCES Voiture (numSerie)
  );



ALTER TABLE vente add CONSTRAINT vk FOREIGN key (nomV) REFERENCES vendeur (nomV);



-- Create table Magasin
CREATE TABLE
  Magasin (
    numMagasin SERIAL PRIMARY KEY,
    nomM VARCHAR(100),
    adresseM VARCHAR(255),
    dateArrive DATE,
    dateDepart DATE
  );



SELECT
  voiture.numSerie,
  marque,
  denomination,
  dateVente
FROM
  voiture
  INNER JOIN vente ON vente.numserie=voiture.numserie
WHERE
  dateVente>'2024-03-15';



SELECT
  COUNT(*),
  magasin.nomm
FROM
  (
    SELECT
      *
    FROM
      voiture
      INNER JOIN vente ON vente.numSerie=voiture.numSerie
  ) AS vendus
  INNER JOIN magasin ON magasin.numMagasin=vendus.numMagasin
GROUP BY
  magasin.numMagasin;



SELECT
  COUNT(*),
  magasin.nomm
FROM
  voiture
  INNER JOIN vente ON vente.numSerie=voiture.numSerie
  INNER JOIN magasin ON magasin.numMagasin=voiture.numMagasin
GROUP BY
  magasin.numMagasin;



SELECT
  countVendeur,
  nomv
FROM
  (
    SELECT
      COUNT(nomv) AS countVendeur,
      nomv
    FROM
      vente
    WHERE
      dateVente>'2023-10-20'
    GROUP BY
      nomv
  )
ORDER BY
  countVendeur DESC
LIMIT
  1;



SELECT
  *
FROM
  vente;



UPDATE vente
SET
  nomv='Thomas'
WHERE
  nomv='Wilson';



SELECT
  COUNT(voiture.marque) AS countVoiture,
  voiture.marque
FROM
  voiture
  INNER JOIN vente ON voiture.numSerie=vente.numserie
WHERE
  datevente>'2023-10-23'
GROUP BY
  voiture.marque
ORDER BY
  countVoiture ASC
LIMIT
  1;



SELECT
  *
FROM
  voiture;



UPDATE voiture
SET
  marque='Mercedes-Benz'
WHERE
  marque IN ('Toyota', 'Nissan');



SELECT
  (
    SUM(voiture.prixaffiche)-SUM(voiture.prixRevient)
  ) AS somme,
  voiture.marque
FROM
  voiture
  INNER JOIN vente ON vente.numserie=voiture.numserie
WHERE
  vente.datevente>'2023-10-20'
GROUP BY
  voiture.marque
ORDER BY
  somme DESC
LIMIT
  1;