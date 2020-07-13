
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

INSERT INTO UserInfo VALUES (0, '컴퓨터과학전공', '심세령', '0000', '1715437');
SELECT * FROM UserInfo;
DELETE FROM UserInfo WHERE usrID = '1715437';

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
	prof VARCHAR(50) REFERENCES UserInfo (usrID),
	room VARCHAR(30),
	day VARCHAR(10),
	startTime VARCHAR(4),
	endTime VARCHAR(4),
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
	studentID VARCHAR(50),
	PRIMARY KEY (year, semester, courseNo, classNo),
	FOREIGN KEY (year, semester, courseNo, classNo) REFERENCES Teach (year, semester, courseNo, classNo) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (studentID) REFERENCES UserInfo (usrID)
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
SELECT * FROM Evaluation;
DROP TABLE Evaluation;

CREATE TABLE LIKEY(
	usrID VARCHAR(50),
	evaluationID INT,
	usrIP VARCHAR(50)
);

SELECT * FROM Enroll NATURAL JOIN Teach NATURAL JOIN Course INNER JOIN UserInfo WHERE UserInfo.name = Teach.prof AND Enroll.studentID = '1715437' AND Enroll.year = 2020 AND Enroll.semester = 1
INSERT INTO UserInfo VALUES (1, '컴퓨터과학전공', '이현자', '0000', '17654', 'a', 'a', true);
INSERT INTO Course VALUES (0, '컴퓨터과학전공', 3, 0, 0, '프로그래밍개론', 204852);
INSERT INTO Teach VALUES ('17654', '명신 413', '화목', '0900', '1015', 2020, 1, 204852, 1);	
INSERT INTO Enroll VALUES (2020, 1, 204852, 1, '1715437');

INSERT INTO Course VALUES (0, '컴퓨터과학전공', 3, 1, 0, '소프트웨어인생', 204860);
INSERT INTO Teach VALUES ('17654', '명신 413', '월수', '0900', '1015', 2020, 1, 204860, 1);	

SELECT * FROM Enroll NATURAL JOIN Teach NATURAL JOIN Course INNER JOIN UserInfo WHERE UserInfo.usrID = Teach.prof AND Enroll.studentID = '1715437' AND Enroll.year = 2020 AND Enroll.semester = 1 
INSERT INTO Enroll VALUES (2020, 1, 204860, 1, '1715437');


