CREATE database CENTREFORMATION;



use centreformation;



CREATE TABLE
  ETUDIANT (
    numCINETU INT PRIMARY key,
    nomETU VARCHAR(20),
    prenomETU VARCHAR(20),
    adressETU VARCHAR(100),
    telETU VARCHAR(10),
    filiereETU VARCHAR(20)
  );



CREATE TABLE
  formation (
    codeForm INT PRIMARY key,
    titreForm VARCHAR(100),
    dureeForm DECIMAL(5, 2)
  );



CREATE TABLE
  session (
    codeSess INT PRIMARY key,
    nomSess VARCHAR(20),
    dateDebut DATE,
    codeForm INT,
    FOREIGN key (codeForm) REFERENCES formation (codeForm)
  );



CREATE TABLE
  INSCRIPTION (
    numCINETU INT PRIMARY key,
    codeSess INT,
    typeCour VARCHAR(20),
    FOREIGN key (numCINETU) REFERENCES etudiant (numCINETU),
    FOREIGN key (codeSess) REFERENCES session (codeSess)
  );



CREATE TABLE
  specialite (
    codeSpec INT PRIMARY key,
    nomSpec VARCHAR(20)
  );



CREATE TABLE
  combinaison (
    codeSpec INT PRIMARY key,
    codeForm INT,
    FOREIGN key (codeSpec) REFERENCES specialite (codeSpec),
    FOREIGN key (codeForm) REFERENCES formation (codeForm)
  );



DESCRIBE combinaison;



INSERT INTO
  etudiant (
    numCINETU,
    nomETU,
    prenomETU,
    adressETU,
    telETU,
    filiereETU
  ) VALUE (
    22452,
    'sidqui',
    'zakaria',
    "casablanca",
    '0611517456',
    "dd"
  ),
  (
    456465,
    "lokhmi",
    'rayan',
    'casablanca',
    "454671546",
    "di"
  ),
  (
    545315315,
    "hilmi",
    "zakaria",
    "marrakech",
    "01457458723",
    "id"
  ),
  (
    32653,
    "gedani",
    "amine",
    "settat",
    "0745846952",
    "prof"
  );



UPDATE etudiant
SET
  telETU="0611517876"
WHERE
  numCINETU=223262;



INSERT INTO
  formation (
    codeForm,
    titreForm,
    dureeForm
  ) VALUE (101, "metier", "20"),
  (106, "html", "60"),
  (104, 'sgbd', '120'),
  (105, 'algorithme', "100");



ALTER TABLE combinaison
ADD COLUMN codeSpec INT;



ALTER TABLE combinaison add CONSTRAINT codeSpec FOREIGN key (codeSpec) REFERENCES specialite (codeSpec);



INSERT INTO
  specialite (codeSpec, nomSpec) VALUE (105, 'digital'),
  (106, 'infographie'),
  (107, 'gestion');



INSERT INTO
  combinaison (codeForm, codeSpec) VALUE (101, 105),
  (106, 105),
  (104, 105),
  (101, 106),
  (104, 107),
  (101, 107);



INSERT INTO
  session (dateDebut) VALUE ("2023-10-26");



("2023-11-26"),
("2024-02-26"),
("2024-06-26");



UPDATE session
SET
  dateDebut="2024-06-26"
WHERE
  codeSess=44;



DELETE FROM session
WHERE
  codeSess=0;



SELECT
  *
FROM
  centreformation.session;



INSERT INTO
  inscription (codeSess, typecour, numCINETU) VALUE (11, "prive", 223262),
  (22, "public", 22452),
  (33, 'public', 456465),
  (44, 'prive', 545315315),
  (11, "prive", 32653);



show databases;



SELECT
  database centreformation
FROM
  sys.databases;



SELECT
  nomETU,
  prenomETU,
  typeCour
FROM
  etudiant,
  inscription
WHERE
  etudiant.numCINETU=inscription.numCINETU;



Q1EXAM
UPDATE `centreformation`.`formation`
SET
  `dureeForm`='04.00'
WHERE
  (`codeForm`='101');



UPDATE `centreformation`.`formation`
SET
  `dureeForm`='03.00'
WHERE
  (`codeForm`='106');



UPDATE `centreformation`.`formation`
SET
  `dureeForm`='05.00'
WHERE
  (`codeForm`='104');



UPDATE `centreformation`.`formation`
SET
  `dureeForm`='06.00'
WHERE
  (`codeForm`='105');



SELECT
  nomSess,
  titreForm,
  dateDebut,
  dureeForm
FROM
  session,
  formation
WHERE
  dateDebut<'2022-01-15' AND
  dureeForm=4;



SELECT
  session.codeForm,
  formation.codeForm,
  dateDebut,
  dureeFor+9+3.m
FROM
  session,
  formation
WHERE
  session.codeForm=formation.codeForm;



SELECT
  session.codeForm,
  MIN(dateDebut)   AS debutForm
FROM
  session
GROUP BY
  session.codeForm;



SELECT
  formation.codeForm,
  dureeForm
FROM
  formation
  INNER JOIN (
    SELECT
      session.codeForm,
      MIN(dateDebut)   AS debutForm
    FROM
      session
    GROUP BY
      session.codeForm
  ) ON formation.codeFrom=b.codeForm;



SELECT
  codeForm.min (dateDebut) AS debutForm
FROM
  session
GROUP BY
  codeForm;



SELECT
  codeForm,
  titreForm,
  dureeForm,
  debutForm
FROM
  formation,
  codeForm;



SELECT
  dureeForm,
  debutform
FROM
  (
    SELECT
      session.codeform,
      MIN(datedebut)   AS debutform
    FROM
      session
    GROUP BY
      codeform
  ) AS p
  INNER JOIN formation ON p.codeform=formation.codeform;



SELECT
  dureeForm,
  dateDebut
FROM
  formation,
  session
WHERE
  session.codeForm=formation.CodeForm;



reate TABLE combinaison (
  codeForm INT,
  codeSpec INT,
  FOREIGN key (codeForm) REFERENCES formation (codeForm),
  FOREIGN key (codeSpec) REFERENCES specialite (codeSpec)
);



INSERT INTO
  combinaison VALUE (1, 2001),
  (2, 2002),
  (3, 2003),
  (4, 2004),
  (5, 2005),
  (1, 2006),
  (2, 2001);