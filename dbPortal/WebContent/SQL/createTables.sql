
DROP TABLE Enroll;
DROP TABLE Teach;
DROP TABLE Course;
DROP TABLE UserInfo;

CREATE TABLE UserInfo(
	isStudent INT(1) DEFAULT 0,
	major VARCHAR(30),
	name VARCHAR(20),
	usrPW VARCHAR(30),
	usrID VARCHAR(50),
	usrEmail varchar(50),
	usrEmailHash varchar(64),
  	usrEmailChecked boolean,
	PRIMARY KEY (usrID)
);

CREATE TABLE Course(
	category VARCHAR(20),
	major VARCHAR(30),
	credit INT(1),
	PF INT(1),
	cyber INT(1),
	courseName VARCHAR(30),
	courseNo INT(20) AUTO_INCREMENT,
	PRIMARY KEY (courseNo)
); 

CREATE TABLE Teach(
	prof VARCHAR(50) REFERENCES UserInfo (usrID),
	room VARCHAR(30),
	day VARCHAR(10),
	startTime VARCHAR(4),
	endTime VARCHAR(4),
	year INT(4),
	semester INT(1),
	courseNo INT(20),
	classNo INT(2),
	num INT(3),
	PRIMARY KEY (year, semester, courseNo, classNo),
	FOREIGN KEY (courseNo) REFERENCES Course (courseNo) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Enroll(
	year INT(4),
	semester INT(1),
	courseNo INT(20),
	classNo INT(2),
	studentID VARCHAR(50),
	PRIMARY KEY (year, semester, courseNo, classNo, studentID),
	FOREIGN KEY (year, semester, courseNo, classNo) REFERENCES Teach (year, semester, courseNo, classNo) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (studentID) REFERENCES UserInfo (usrID) ON DELETE CASCADE
);

CREATE TABLE EVALUATION (

  evaluationID int PRIMARY KEY AUTO_INCREMENT, 
  usrID varchar(10), 
  courseName VARCHAR(30),
  professorName varchar(10),
  year INT(4), 
  semester varchar(20),
  category varchar(20),
  evaluationTitle varchar(50),
  evaluationContent varchar(2048),
  totalScore varchar(10),
  creditScore varchar(10),
  homeworkScore varchar(10),
  lectureScore varchar(10),
  likeCount int 
);
CREATE TABLE LIKEY(
	usrID VARCHAR(50),
	evaluationID INT,
	usrIP VARCHAR(50)
);
