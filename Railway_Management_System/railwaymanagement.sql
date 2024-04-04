CREATE TABLE
	LocoPilot (
		PilotID INT PRIMARY KEY,
		pilot_name VARCHAR(30),
		age INT,
		contact VARCHAR(12),
		adress VARCHAR(60),
		licence VARCHAR(30),
		experience INT
	)
;


ALTER TABLE locopilot
ALTER COLUMN contact
SET DATA TYPE VARCHAR(30)
;


CREATE TABLE
	Train (
		TrainID INT PRIMARY KEY,
		Train_name VARCHAR(30),
		source VARCHAR(30),
		destination VARCHAR(30),
		departure_Time TIMESTAMP,
		arrival_time TIMESTAMP,
		type_train VARCHAR(30),
		PilotID INT,
		FOREIGN KEY (PilotID) REFERENCES LocoPilot (PilotID)
	)
;


CREATE TABLE
	Passenger (PassengerId INT PRIMARY KEY, age INT)
;


CREATE TABLE
	Billet (
		BilletId INT PRIMARY KEY,
		Source VARCHAR(255),
		destination VARCHAR(255),
		departureTime TIME,
		arrivalTime TIME,
		numSeat INT,
		dateReservation DATE,
		-- carriegeId INT,
		PassengerId INT,
		FOREIGN KEY (PassengerId) REFERENCES Passenger (PassengerId)
	)
;


ALTER TABLE Billet
ADD COLUMN carriageID INT,
ADD CONSTRAINT fk_carriageID FOREIGN KEY (carriageID) REFERENCES carriage (carriageID)
;


CREATE TABLE
	Carriage (
		carriageId INT PRIMARY KEY,
		numberSeats INT,
		inService BOOLEAN,
		CLASS INT,
		numberCarriage INT,
		TrainID INT,
		FOREIGN KEY (TrainID) REFERENCES Train (TrainID)
	)
;


ALTER TABLE billet
DROP COLUMN PassengerId
;


ALTER TABLE billet
ADD COLUMN PassengerId INT,
ADD CONSTRAINT fk_passengerID FOREIGN KEY (PassengerId) REFERENCES Passenger (PassengerId) ON DELETE CASCADE ON UPDATE CASCADE
;


INSERT INTO
	locopilot (PilotID, pilot_name, age, contact, adress, licence, experience)
VALUES
	(
		769432598,
		'Fatima Zahra Benali',
		45,
		'+212661234567',
		'56 Rue Abdelkrim El Khattabi, Agadir, Morocco',
		'XLBA214578',
		10
	),
	(
		123456789,
		'Mohamed Amine El Khattabi',
		35,
		'+212612345678',
		'23 Avenue Hassan II, Rabat, Morocco',
		'ABC123456',
		8
	),
	(
		987654321,
		'Amina Zidane',
		40,
		'+212623456789',
		'7 Rue Ahmed Ben Kassimi, Marrakech, Morocco',
		'XYZ789012',
		12
	),
	(
		456789123,
		'Youssef Haddad',
		50,
		'+212632345678',
		'10 Rue Mohammed V, Fes, Morocco',
		'DEF456789',
		15
	),
	(
		135792468,
		'Sofia El Mahdi',
		38,
		'+212641234567',
		'42 Boulevard Mohammed VI, Tangier, Morocco',
		'GHI789012',
		9
	)
;


SELECT
	*
FROM
	locopilot
;


INSERT INTO
	train (trainID, Train_name, source, destination, departure_Time, arrival_time, type_train, PilotID)
VALUES
	(
		124,
		'atlas',
		'tanger',
		'marrakech',
		'2024-01-03 06:11:00',
		'2024-01-03 15:46:00',
		'normal',
		769432598
	),
	(
		211,
		'boraq',
		'tanger',
		'casablanca',
		'2024-01-03 09:11:00',
		'2024-01-03 11:00:00',
		'express',
		123456789
	),
	(
		110,
		'atlas',
		'casablanca',
		'marrakech',
		'2024-01-03 11:10:00',
		'2024-01-03 14:03:00',
		'normal',
		987654321
	),
	(225, 'atlas', 'fes', 'oujda', '2024-01-03 06:00:00', '2024-01-03 18:30:00', 'steam', 456789123),
	(
		100,
		'boraq',
		'casablanca',
		'tanger',
		'2024-01-03 08:00:00',
		'2024-01-03 10:00:00',
		'express',
		135792468
	),
	(345, 'atlas', 'marrakech', 'fes', '2024-01-03 16:00:00', '2024-01-03 22:00:00', 'normal', 769432598)
;


INSERT INTO
	train
VALUES
	(
		533,
		'sahara',
		'casablanca',
		'airport mohammed V',
		'2024-01-03 11:30:00',
		'2024-01-03 12:00:00',
		'normal',
		123456789
	)
;


SELECT
	*
FROM
	train
;


INSERT INTO
	carriage
VALUES
	-- Train with 3 carriages
	(1, 50, TRUE, 1, 1, 124),
	(2, 60, TRUE, 2, 2, 124),
	(3, 70, TRUE, 2, 3, 124),
	-- Train with 4 carriages
	(4, 40, TRUE, 1, 1, 211),
	(5, 45, TRUE, 2, 2, 211),
	(6, 50, TRUE, 2, 3, 211),
	(7, 55, TRUE, 2, 4, 211),
	-- Train with 5 carriages
	(8, 55, TRUE, 1, 1, 110),
	(9, 60, TRUE, 2, 2, 110),
	(10, 65, TRUE, 2, 3, 110),
	(11, 70, TRUE, 2, 4, 110),
	(12, 75, TRUE, 2, 5, 110),
	-- Train with 3 carriages
	(13, 30, TRUE, 1, 1, 225),
	(14, 35, TRUE, 2, 2, 225),
	(15, 40, TRUE, 1, 3, 225),
	-- Train with 4 carriages
	(16, 40, TRUE, 1, 1, 100),
	(17, 45, TRUE, 2, 2, 100),
	(18, 50, TRUE, 2, 3, 100),
	(19, 55, TRUE, 1, 4, 100),
	-- Train with 5 carriages
	(20, 60, TRUE, 1, 1, 345),
	(21, 65, TRUE, 2, 2, 345),
	(22, 70, TRUE, 2, 3, 345),
	(23, 75, TRUE, 2, 4, 345),
	(24, 80, TRUE, 2, 5, 345),
	-- Train with 3 carriages
	(25, 55, TRUE, 1, 1, 533),
	(26, 60, TRUE, 2, 2, 533),
	(27, 65, TRUE, 2, 3, 533),
	-- carriages Not in service
	(28, 55, FALSE, 1, 1, NULL),
	(29, 50, FALSE, 2, 2, NULL),
	(30, 30, FALSE, 2, 3, NULL)
;


SELECT
	*
FROM
	carriage
;


INSERT INTO
	Passenger (passengerID, age)
SELECT
	(ROW_NUMBER() OVER ())+(
		SELECT
			COALESCE(MAX(passengerID), 0)
		FROM
			Passenger
	) AS passengerID,
	FLOOR(RANDOM()*(95 - 5+1))+5 AS age
FROM
	GENERATE_SERIES(1, 100)
;


SELECT
	*
FROM
	passenger
;


ALTER TABLE billet
DROP COLUMN arrival_time
;


ALTER TABLE billet
ADD COLUMN arrival_time TIMESTAMP
;


ALTER TABLE billet
ALTER COLUMN arrival_time
SET DATA TYPE TIMESTAMP
;


ALTER TABLE billet
ALTER COLUMN BilletId
SET DATA TYPE INT,
ALTER COLUMN source
SET DATA TYPE VARCHAR(255),
ALTER COLUMN destination
SET DATA TYPE VARCHAR(255),
ALTER COLUMN departure_Time
SET DATA TYPE TIMESTAMP,
ALTER COLUMN arrival_time
SET DATA TYPE TIMESTAMP,
ALTER COLUMN numSeat
SET DATA TYPE INT,
ALTER COLUMN dateReservation
SET DATA TYPE date,
ALTER COLUMN carriageID
SET DATA TYPE INT,
ALTER COLUMN passengerID
SET DATA TYPE INT
;


INSERT INTO
	billet (
		BilletId,
		Source,
		destination,
		departure_Time,
		arrival_time,
		numSeat,
		dateReservation,
		carriageID,
		passengerID
	)
VALUES
	(169, 'tanger', 'rabat', '2024-01-03 06:11:00', '2024-01-03 09:11:00', 11, '2024-01-01', 1, 50),
	(153, 'tanger', 'marrakech', '2024-01-03 06:11:00', '2024-01-03 15:46:00', 27, '2024-01-02', 2, 49),
	(
		62,
		'casablanca',
		'marrakech',
		'2024-01-03 11:11:00',
		'2024-01-03 15:46:00',
		13,
		'2023-12-27',
		2,
		48
	),
	(
		43,
		'casablanca',
		'benguerir',
		'2024-01-03 11:11:00',
		'2024-01-03 14:46:00',
		22,
		'2024-01-01',
		2,
		47
	),
	(29, 'tanger', 'casablanca', '2024-01-03 09:11:00', '2024-01-03 11:00:00', 10, '2024-01-01', 4, 46),
	(112, 'rabat', 'casablanca', '2024-01-03 10:23:00', '2024-01-03 11:00:00', 11, '2023-10-12', 5, 45),
	(172, 'kenitra', 'casablanca', '2024-01-03 10:00:00', '2024-01-03 11:00:00', 12, '2024-01-01', 5, 44),
	(
		66,
		'casablanca',
		'marrakech',
		'2024-01-03 11:10:00',
		'2024-01-03 14:03:00',
		30,
		'2024-01-01',
		8,
		43
	),
	(252, 'casablanca', 'settat', '2024-01-03 11:10:00', '2024-01-03 12:00:00', 46, '2023-12-10', 9, 42),
	(
		225,
		'berrechid',
		'benguerir',
		'2024-01-03 11:37:00',
		'2024-01-03 13:11:00',
		19,
		'2024-01-01',
		10,
		41
	)
;


INSERT INTO
	billet
VALUES
	(
		231,
		'casablanca',
		'airport mohammed V',
		22,
		'2023-10-11',
		25,
		46,
		'2024-01-03 11:30:00',
		'2024-01-03 12:00:00'
	),
	(
		226,
		'casablanca',
		'bouskoura',
		11,
		'2023-10-11',
		26,
		45,
		'2024-01-03 11:30:00',
		'2024-01-03 11:45:00'
	)
;


UPDATE passenger
SET
	passengerName='Edward Burton'
WHERE
	passengerID=40
;


SELECT
	*
FROM
	passenger
;


ALTER TABLE passenger
ADD COLUMN passengerName VARCHAR(255)
;


-- select all passenger names travel in first class :
SELECT
	passengername,
	age,
	source,
	destination,
	CLASS
FROM
	passenger
	INNER JOIN (
		SELECT
			*
		FROM
			billet
			INNER JOIN carriage ON billet.carriageid=carriage.carriageid
	) AS billetCarriage ON passenger.passengerid=billetCarriage.passengerid
WHERE
	CLASS=1
;


-- select all passenger travel from casablanca apres 10:00:00 :
SELECT * FROM passenger WHERE passengerid IN (
		SELECT passengerID FROM billet WHERE
			source LIKE 'casablanca'
			AND EXTRACT(HOUR FROM departure_Time)>=10);


-- Les Train disponible apres 22:15:00 et leurs localisation :
SELECT
	trainID,
	Train_name,
	destination  AS Localisation,
	arrival_time AS disponible_a
FROM
	train
WHERE
	EXTRACT(
		HOUR
		FROM
			arrival_time
	)<=22
	AND EXTRACT(
		MINUTE
		FROM
			arrival_time
	)<15
;


-- Les passagier qui change le train :
SELECT
	*,
	COUNT(billet.passengerID) AS nombreBillets
FROM
	passenger
	NATURAL JOIN billet
GROUP BY
	billet.billetid
HAVING
	COUNT(billet.passengerid)>1
;


-- Nombre des 
SELECT
	destination        AS station,
	COUNT(destination) AS nombre_passenger
FROM
	billet
WHERE
	Date (arrival_time) BETWEEN '2024-01-01' AND '2024-02-01'
GROUP BY
	station order by nombre_passenger DESC
;


-- add price :
SELECT
	*,
	CASE
		WHEN age>12 THEN (
			(
				EXTRACT(
					HOUR
					FROM
						arrival_time
				)-EXTRACT(
					HOUR
					FROM
						departure_Time
				)
			)+(
				(
					EXTRACT(
						MINUTE
						FROM
							arrival_time
					)-EXTRACT(
						MINUTE
						FROM
							departure_Time
					)
				)/60
			)
		)*60*1.25
		ELSE (
			EXTRACT(
				HOUR
				FROM
					arrival_time
			)-EXTRACT(
				HOUR
				FROM
					departure_Time
			)
		)+(
			(
				EXTRACT(
					MINUTE
					FROM
						arrival_time
				)-EXTRACT(
					MINUTE
					FROM
						departure_Time
				)
			)/60
		)*60
	END AS trip_price
FROM
	billet
	NATURAL JOIN passenger
;