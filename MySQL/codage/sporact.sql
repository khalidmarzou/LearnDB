CREATE database SPORACT;



use SPORACT;



CREATE TABLE
  centre (
    numc INT,
    nomc VARCHAR(20),
    vilc VARCHAR(20),
    coutins DECIMAL(5, 2)
  );



INSERT INTO
  sporact.centre (numc, nomc, vilc, coutins)
VALUES
  (
    1584,
    "Gymtastic",
    "Casablanca",
    120.00
  );



INSERT INTO
  sporact.centre (numc, nomc, vilc, coutins)
VALUES
  (
    1447,
    "cityClub",
    "Rabat",
    350.60
  );



INSERT INTO
  sporact.centre (numc, nomc, vilc, coutins)
VALUES
  (
    3254,
    "cityClub",
    "Tanger",
    350.60
  );



INSERT INTO
  sporact.centre (numc, nomc, vilc, coutins)
VALUES
  (
    9954,
    "cityClub",
    "Marrakech",
    350.60
  );



INSERT INTO
  sporact.centre (numc, nomc, vilc, coutins)
VALUES
  (
    6745,
    "cityClub",
    "Agadir",
    350.60
  );



INSERT INTO
  sporact.centre (numc, nomc, vilc, coutins)
VALUES
  (
    3321,
    "cityClub",
    "Settat",
    350.60
  );



INSERT INTO
  sporact.centre (numc, nomc, vilc, coutins)
VALUES
  (
    7775,
    "cityClub",
    "Casablanca",
    350.60
  );



INSERT INTO
  sporact.centre (numc, nomc, vilc, coutins)
VALUES
  (
    5541,
    "cityClub",
    "Tetouane",
    350.60
  );



INSERT INTO
  sporact.centre (numc, nomc, vilc, coutins)
VALUES
  (
    0021,
    "cityClub",
    "Rabat",
    350.60
  );



INSERT INTO
  sporact.centre (numc, nomc, vilc, coutins)
VALUES
  (
    9465,
    "cityClub",
    "Salé",
    350.60
  );



CREATE TABLE
  adherant (
    numa INT,
    noma VARCHAR(20),
    prenoma VARCHAR(20),
    vila VARCHAR(20)
  );



INSERT INTO
  adherant (numa, noma, prenoma, vila)
VALUES
  (
    123,
    "BAI",
    "Said",
    "Casablanca"
  );



INSERT INTO
  adherant (numa, noma, prenoma, vila)
VALUES
  (
    456,
    "Bouchra",
    "AHRICH",
    "Marrakech"
  );



INSERT INTO
  adherant (numa, noma, prenoma, vila)
VALUES
  (
    118,
    "MGHIMED",
    "fahd",
    "Tetouane"
  );



INSERT INTO
  adherant (numa, noma, prenoma, vila)
VALUES
  (
    745,
    "GHAMRAOUI",
    "anas",
    "Agadir"
  );



INSERT INTO
  adherant (numa, noma, prenoma, vila)
VALUES
  (
    998,
    "FALLAH",
    "mohammed",
    "Marrakech"
  );



INSERT INTO
  adherant (numa, noma, prenoma, vila)
VALUES
  (
    130,
    "HIWANI",
    "abdel",
    "Marrakech"
  );



INSERT INTO
  adherant (numa, noma, prenoma, vila)
VALUES
  (
    750,
    "OUBAID",
    "zyad",
    "Settet"
  );



INSERT INTO
  adherant (numa, noma, prenoma, vila)
VALUES
  (
    914,
    "BILAD",
    "soufiane",
    "Casablanca"
  );



INSERT INTO
  adherant (numa, noma, prenoma, vila)
VALUES
  (
    911,
    "HEKKI",
    "haitam",
    "Casablanca"
  );



INSERT INTO
  adherant (numa, noma, prenoma, vila)
VALUES
  (
    115,
    "BASLI",
    "amine",
    "Casablanca"
  );



CREATE TABLE
  sport (noms VARCHAR(20) PRIMARY key);



INSERT INTO
  sport (noms) VALUE ("Tennis");



INSERT INTO
  sport (noms) VALUE ("Football");



INSERT INTO
  sport (noms) VALUE ("Musclation");



INSERT INTO
  sport (noms) VALUE ("equitation");



INSERT INTO
  sport (noms) VALUE ("basketball");



INSERT INTO
  sport (noms) VALUE ("volleyball");



INSERT INTO
  sport (noms) VALUE ("natation");



INSERT INTO
  sport (noms) VALUE ("hockey");



INSERT INTO
  sport (noms) VALUE ("rugby");



CREATE TABLE
  est_membre (
    numa INT,
    numc INT,
    dateEng DATE
  );



INSERT INTO
  est_membre (numa, numc, dateEng)
VALUES
  (123, 1584, "2020-09-12");



INSERT INTO
  est_membre (numa, numc, dateEng)
VALUES
  (456, 1584, "2023-11-04");



INSERT INTO
  est_membre (numa, numc, dateEng)
VALUES
  (118, 3254, "2023-11-04");



INSERT INTO
  est_membre (numa, numc, dateEng)
VALUES
  (745, 1584, "2023-11-04");



INSERT INTO
  est_membre (numa, numc, dateEng)
VALUES
  (998, 0021, "2023-11-04");



INSERT INTO
  est_membre (numa, numc, dateEng)
VALUES
  (130, 9465, "2023-11-04");



INSERT INTO
  est_membre (numa, numc, dateEng)
VALUES
  (750, 1584, "2023-11-04");



INSERT INTO
  est_membre (numa, numc, dateEng)
VALUES
  (914, 7775, "2023-11-04");



INSERT INTO
  est_membre (numa, numc, dateEng)
VALUES
  (911, 7775, "2023-11-04");



INSERT INTO
  est_membre (numa, numc, dateEng)
VALUES
  (115, 7775, "2023-11-04");



CREATE TABLE
  propose (numc INT, noms VARCHAR(20));



INSERT INTO
  propose (numc, noms)
VALUES
  (1584, "Musclation");



INSERT INTO
  propose (numc, noms)
VALUES
  (6745, "Football");



INSERT INTO
  propose (numc, noms)
VALUES
  (1447, "rugby");



INSERT INTO
  propose (numc, noms)
VALUES
  (1447, "natation");



INSERT INTO
  propose (numc, noms)
VALUES
  (6745, "HandBall");



CREATE TABLE
  pratique (
    numa INT,
    numc INT,
    noms VARCHAR(20)
  );



INSERT INTO
  pratique (numa, numc, noms)
VALUES
  (123, 1584, "Musclation");



INSERT INTO
  pratique (numa, numc, noms)
VALUES
  (456, 1447, "Football");



INSERT INTO
  pratique (numa, numc, noms)
VALUES
  (456, 1447, "natation");



INSERT INTO
  pratique (numa, numc, noms)
VALUES
  (456, 1447, "HandBall");



use sporact;



SELECT
  noms
FROM
  propose;



SELECT
  nomc,
  vilc
FROM
  centre;



SELECT
  *
FROM
  centre
WHERE
  vilc="Casablanca";



SELECT
  nomc
FROM
  centre
WHERE
  vilc="Rabat";



SELECT
  CENTRE.numc
FROM
  CENTRE,
  PROPOSE
WHERE
  CENTRE.numc=PROPOSE.noms AND
  CENTRE.vilc="agadir" AND
  PROPOSE.noms="Football" AND
  PROPOSE.noms="HandBall";



SELECT
  numc,
  nomc,
  vilc,
  coutins,
  coutins*1/5            AS tva,
  coutins*120/100        AS ttc,
  coutins*5/100          AS remise,
  coutins*120/100*95/100 AS net
FROM
  centre;



SELECT
  *
FROM
  centre,
  propose
WHERE
  centre.numc=propose.numc;



SELECT
  numc
FROM
  propose
WHERE
  noms="Musclation" AND
  noms="equitation";



SELECT
  centre.numc,
  centre.nomc,
  centre.vilc
FROM
  propose,
  centre
WHERE
  centre.numc=propose.numc;



ALTER TABLE centre add tel VARCHAR(10),
add adresse VARCHAR(45);



ALTER TABLE centre change COLUMN numc numeroc INT;



ALTER TABLE centre add cp VARCHAR(5);



SELECT
  *,
  MAX(coutins) AS maximum
FROM
  centre;



SELECT
  *,
  MAX(coutins) AS maximum,
  MIN(coutins) AS minimum
FROM
  centre;



SELECT
  *
FROM
  centre
WHERE
  coutins=(
    SELECT
      MAX(coutins) AS maximum
    FROM
      centre
  );



use sporact;



UPDATE centre
SET
  cp=20000
WHERE
  numeroc=1584;



SELECT
  *
FROM
  centre,
  adherant
WHERE
  adherant.numa>centre.numeroc;



DELETE FROM centre
WHERE
  vilc='Tanger';