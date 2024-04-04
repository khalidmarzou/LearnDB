CREATE DATABASE Railway_Management_System
;


CREATE TABLE
	LocoPilot (
		PilotId VARCHAR(4) PRIMARY KEY,
		Pilot_Name VARCHAR(20),
		age INT,
		contact VARCHAR(13),
		adresse VARCHAR(60),
		licence VARCHAR(10),
		Experience INT
	)
;


CREATE TABLE
	Train (
		TrainID VARCHAR(4) PRIMARY KEY,
		PilotId VARCHAR(4),
		Train_Name VARCHAR(10),
		TSource VARCHAR(10),
		Destination VARCHAR(10),
		Departure_Time TIME,
		Arival_Time TIME,
		Type_of_Train BOOLEAN,
		Departure_Date date,
		Arival_Date date,
		FOREIGN KEY (PilotId) REFERENCES LocoPilot (PilotId) ON DELETE SET DEFAULT ON UPDATE CASCADE
	)
;


CREATE TABLE
	Carriage (
		CarriageId VARCHAR(4) PRIMARY KEY,
		TrainId VARCHAR(4),
		Seats_Number INT,
		In_service BOOLEAN,
		Cclass BOOLEAN,
		Number_carrige INT,
		FOREIGN KEY (TrainId) REFERENCES Train (TrainId) ON DELETE SET DEFAULT ON UPDATE CASCADE
	)
;


CREATE TABLE
	schedules (
		SchedulesId VARCHAR(4) PRIMARY KEY,
		Ssource VARCHAR(10),
		Destination VARCHAR(10),
		Departure_Time TIME,
		Arival_time TIME,
		Departure_date date,
		Arival_Date date
	)
;


CREATE TABLE
	contenir (
		schedulesId VARCHAR(4),
		CarriageId VARCHAR(4),
		PRIMARY KEY (schedulesId, CarriageId),
		FOREIGN KEY (schedulesId) REFERENCES schedules (schedulesId) ON DELETE SET DEFAULT ON UPDATE CASCADE,
		FOREIGN KEY (CarriageId) REFERENCES Carriage (CarriageId) ON DELETE SET DEFAULT ON UPDATE CASCADE
	)
;


CREATE TABLE
	Reserver (
		schedulesID VARCHAR(4) PRIMARY KEY,
		Date_reservatio date,
		heure_reservation TIME,
		FOREIGN KEY (schedulesId) REFERENCES schedules (SchedulesId) ON DELETE SET DEFAULT ON UPDATE CASCADE
	)
;


CREATE TABLE
	Passenger (PassengerId VARCHAR(4) PRIMARY KEY, Num_Seat INT, Age INT)
;


ALTER TABLE reserver
DROP COLUMN schedulesID
;


ALTER TABLE reserver
ADD PassengerId VARCHAR(4),
ADD schedulesID VARCHAR(4),
ADD PRIMARY KEY (PassengerId, schedulesID),
ADD FOREIGN KEY (PassengerId) REFERENCES Passenger (PassengerId),
ADD FOREIGN KEY (schedulesID) REFERENCES schedules (schedulesID)
;


DROP TABLE Train
;


ALTER TABLE reserver
ADD PassengerId VARCHAR(4),
FOREIGN KEY (PassengerId) REFERENCES Passenger (PassengerId)
;


ALTER TABLE reserver
ADD PassengerId VARCHAR(4),
ADD CONSTRAINT fk_passenger FOREIGN KEY (PassengerId) REFERENCES Passenger (PassengerId)
;


ALTER TABLE reserver
DROP COLUMN PassengerId
;


ALTER TABLE shedules
RENAME TO schedules
;


SELECT
	*
FROM
	Railway_Management_System
;