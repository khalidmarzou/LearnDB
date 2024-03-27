CREATE database centreformation;



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
    typeCour VARCHAR(20)
  );



CREATE TABLE
  specialite (
    codeSpec INT PRIMARY key,
    nomSpec VARCHAR(20)
  );



CREATE TABLE
  combinaison (
    codeSpec INT PRIMARY key,
    codeForm INT
  );



INSERT INTO
  centreformation.etudiant (
    numCINETU,
    nomETU,
    prenomETU,
    adressETU,
    telETU,
    filiereETU
  )
VALUES
  (
    1234,
    'marzoug',
    'khalid',
    'casablanca',
    '0611517876',
    'dev'
  ),
  (
    2345,
    'sidqui',
    'zakaria',
    'kech',
    '0600000001',
    'info'
  ),
  (
    3456,
    'mahfoud',
    'anass',
    'rabat',
    '0600000005',
    'dev'
  ),
  (
    4576,
    'baddioui',
    'ilham',
    'taza',
    '0654154876',
    'gestion'
  );



INSERT INTO
  centreformation.inscription (numCINETU, codeSess, typeCour)
VALUES
  (1234, 101, 'presentiel'),
  (2345, 102, 'presentiel'),
  (3456, 103, 'presentiel'),
  (4576, 104, 'Adistance');



--requete 3:
SELECT
  etudiant.nomETU,
  inscription.typeCour
FROM
  etudiant
  JOIN inscription ON etudiant.numCINETU=inscription.numCINETU;



--requete 4:
SELECT
  session.nomSess,
  formation.titreForm
FROM
  session
  JOIN formation ON session.codeForm=formation.codeForm
WHERE
  session.dateDebut<"2022-01-15" AND
  formation.dureeForm=4;



--requete 5:
SELECT
  specialite.nomSpec,
  formation.dureeForm
FROM
  combinaison
  JOIN specialite ON combinaison.codeSpec=specialite.codeSpec
  JOIN formation ON combinaison.codeForm=formation.codeForm;



--requete 6:
SELECT
  dureeForm,
  debutform
FROM
  (
    SELECT
      session.codeForm,
      MIN(dateDebut)   AS debutForm
    FROM
      session
    GROUP BY
      codeForm
  ) AS p
  JOIN formation ON p.codeForm=formation.codeForm;



SELECT
  session.dateDebut,
  formation.dureeForm
FROM
  session
  JOIN formation ON session.codeForm=formation.codeForm;