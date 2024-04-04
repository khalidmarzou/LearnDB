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