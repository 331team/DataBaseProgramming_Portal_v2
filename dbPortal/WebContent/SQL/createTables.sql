
DROP TABLE Enroll;
DROP TABLE Teach;
DROP TABLE Course;
DROP TABLE UserInfo;

CREATE TABLE UserInfo(
	isStudent INT(1) DEFAULT 0,
	major VARCHAR(30),
	name VARCHAR(20),
	usrPW VARCHAR(30),
	usrID VARCHAR(10),
	usrEmail varchar(50),
	usrEmailHash varchar(64),
  	usrEmailChecked boolean,
	PRIMARY KEY (usrID)
);

INSERT INTO UserInfo VALUES (0, '컴퓨터과학전공', '심세령', '0000', '1715437');
SELECT * FROM UserInfo;

CREATE TABLE Course(
	category INT(1),
	major VARCHAR(30),
	credit INT(1),
	PF INT(1),
	cyber INT(1),
	courseName VARCHAR(30),
	courseNo INT(20),
	PRIMARY KEY (courseNo)
);

CREATE TABLE Teach(
	prof INT(10) REFERENCES UserInfo (usrID),
	room VARCHAR(30),
	day VARCHAR(10),
	startTime INT(4),
	endTime INT(4),
	year INT(4),
	semester INT(1),
	courseNo INT(20),
	classNo INT(2),
	PRIMARY KEY (year, semester, courseNo, classNo),
	FOREIGN KEY (courseNo) REFERENCES Course (courseNo) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Enroll(
	year INT(4),
	semester INT(1),
	courseNo INT(20),
	classNo INT(2),
	studentID VARCHAR(10),
	PRIMARY KEY (year, semester, courseNo, classNo),
	FOREIGN KEY (year, semester, courseNo, classNo) REFERENCES Teach (year, semester, courseNo, classNo) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (studentID) REFERENCES UserInfo (usrID)
);

