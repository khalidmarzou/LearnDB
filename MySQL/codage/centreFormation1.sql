CREATE database CENTERFORMATION;



use CENTERFORMATION;



CREATE TABLE
  etudiant (
    numcinetu VARCHAR(10) PRIMARY key,
    nometu VARCHAR(10),
    prenometu VARCHAR(10),
    teletu VARCHAR(10),
    adresseetu VARCHAR(15),
    filiereetu VARCHAR(10)
  );



CREATE TABLE
  sessions (
    codesess VARCHAR(15) PRIMARY key,
    nomsess VARCHAR(10),
    datedebut DATE
  )
CREATE TABLE
  formation (
    codeform VARCHAR(15) PRIMARY key,
    titreform VARCHAR(10),
    dureeform VARCHAR(8)
  )
CREATE TABLE
  specialite (
    codespec VARCHAR(15) PRIMARY key,
    nomspec VARCHAR(10)
  )
CREATE TABLE
  inscription (
    numcinetu VARCHAR(10),
    codesess VARCHAR(15),
    typecours VARCHAR(10),
    FOREIGN key (numcinetu) REFERENCES etudiant (numcinetu),
    FOREIGN key (codesess) REFERENCES sessions (codesess)
  )
CREATE TABLE
  combinaison (
    codespec VARCHAR(15),
    codeform VARCHAR(15),
    FOREIGN key (codespec) REFERENCES specialite (codespec),
    FOREIGN key (codeform) REFERENCES formation (codeform)
  )
INSERT INTO
  etudiant VALUE (
    "m01",
    "EL HAIDI",
    "MOHAMED",
    "06123456",
    "hay osra",
    "reseaux"
  )
INSERT INTO
  etudiant VALUE (
    "m02",
    "Bennis",
    "SOUFIANE",
    "064565",
    "hay lfala7",
    "gestion"
  )
INSERT INTO
  etudiant VALUE (
    "m03",
    "SALMAM",
    "ABDELAH",
    "06138768",
    "drisia",
    "dd"
  )
INSERT INTO
  etudiant VALUE (
    "m04",
    "DEROUI",
    "SAAD",
    "0634456",
    "sbata",
    "id"
  )
INSERT INTO
  sessions VALUE ("a1", "python", "2024-04-15")
INSERT INTO
  sessions VALUE ("a2", "html", "2023-05-05")
INSERT INTO
  sessions VALUE ("a3", "css", "2024-09-13")
INSERT INTO
  sessions VALUE ("a4", "php", "2024-10-19")
INSERT INTO
  formation VALUE ("100", "formation1", "6 mois")
INSERT INTO
  formation VALUE ("200", "formation2", " 1 ans")
INSERT INTO
  formation VALUE ("300", "formation3", "3 mois");



INSERT INTO
  formation VALUE ("400", "formation4", "2 ans")
INSERT INTO
  specialite VALUE ("s1", "rv");



INSERT INTO
  specialite VALUE ("s2", "mobile")
INSERT INTO
  specialite VALUE ("s3", "coding");



INSERT INTO
  specialite VALUE ("s4", "dantiste")
INSERT INTO
  inscription VALUE ("m01", "a1", "presentiel");



INSERT INTO
  inscription VALUE ("m02", "a2", "enligne");



INSERT INTO
  inscription VALUE ("m03", "a3", "hybrid");



INSERT INTO
  inscription VALUE ("m04", "a4", "enligne")
INSERT INTO
  combinaison VALUE ("s1", "100");



INSERT INTO
  combinaison VALUE ("s2", "200");



INSERT INTO
  combinaison VALUE ("s3", "300");



INSERT INTO
  combinaison VALUE ("s4", "400");



SELECT
  nomEtu,
  prenomEtu,
  typecours
FROM
  etudiant,
  inscription
WHERE
  etudiant.numcinetu=inscription.numcinetu;



SELECT DISTINCT
  nomsess,
  titreform
FROM
  sessions,
  formation,
  inscription
WHERE
  sessions.codesess=inscription.codesess AND
  datedebut<"2024-05-05" AND
  dureeform=" 1 ans";



SELECT DISTINCT
  nomspec,
  dureeform
FROM
  combinaison,
  specialite,
  formation
WHERE
  formation.codeform=combinaison.codeform AND
  specialite.codespec=combinaison.codespec;



SELECT DISTINCT
  datedebut,
  dureeform
FROM
  sessions,
  formation,
  inscription
WHERE
  sessions.codesess=inscription.codesess;



SELECT DISTINCT
  datedebut,
  dureeform
FROM
  sessions,
  formation;



SELECT
  SUM(dureeform) AS dureetotal,
  AVG(dureeform) AS moyenne
FROM
  formation;



SELECT
  titreform
FROM
  formation
WHERE
  dureeform=(
    SELECT
      MAX(dureeform)
    FROM
      formation
  );



SELECT
  typecours,
  nomsess
FROM
  inscription,
  sessions
WHERE
  inscription.codesess=sessions.codesess AND
  datedebut BETWEEN '2024-04-15' AND '2024-10-19';