create database Session3_Th2_QuanlySinhVien;
use Session3_Th2_QuanlySinhVien;

CREATE TABLE Class (
    ClassID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    ClassName VARCHAR(30) NOT NULL,
    StartDate DATETIME NOT NULL,
    Status BIT DEFAULT 0
);
CREATE TABLE Student (
    StudentID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    StudentName VARCHAR(20) NOT NULL,
    Address VARCHAR(30) NOT NULL,
    Phone VARCHAR(10),
    status BIT DEFAULT 1,
    ClassID INT NOT NULL,
    FOREIGN KEY (ClassID)
        REFERENCES Class (ClassID)
);

CREATE TABLE Subject (
    SubID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    SubName VARCHAR(20),
    Credit TINYINT NOT NULL DEFAULT(1) CHECK(Credit >=1),
    Status BIT DEFAULT 1
);

CREATE TABLE Mark (
    SubId INT NOT NULL ,
    FOREIGN KEY (SubId) REFERENCES Subject (SubID),
    StudentId INT NOT NULL,
    FOREIGN KEY (StudentId) REFERENCES Student (StudentID),
    Mark FLOAT DEFAULT(0) CHECK(1 <= Mark <= 100),
   ExamTimes TINYINT DEFAULT(1)
);

INSERT INTO Class
VALUES (1, 'A1', '2008-12-20', 1);
insert into Class values (2, 'A2', '2008-12-22',1);
insert into Class values (3, 'B3', curdate(),0);

INSERT INTO Student (StudentName, Address, Phone, Status, ClassId)
VALUES ('Hung', 'Ha Noi', '0912113113', 1, 1);
INSERT INTO Student (StudentName, Address, Status, ClassId)
VALUES ('Hoa', 'Hai phong', 1, 1);
INSERT INTO Student (StudentName, Address, Phone, Status, ClassId)
VALUES ('Manh', 'HCM', '0123123123', 0, 2);

INSERT INTO Subject
VALUES (1, 'CF', 5, 1),
       (2, 'C', 6, 1),
       (3, 'HDJ', 5, 1),
       (4, 'RDBMS', 10, 1);
       
INSERT INTO Mark (SubId, StudentId, Mark, ExamTimes)
VALUES (1, 1, 8, 1),
       (1, 2, 10, 2),
       (2, 1, 12, 1);
 /* Hiển thị danh sách tất cả học viên*/
SELECT * FROM Student
/* Hiển thị tất cả danh sách học viên đang học*/
SELECT * FROM Student WHERE status = 1

/* Hiển thị các môn học có thời gian học nhỏ hơn 10*/
SELECT * FROM Subject WHERE Credit < 10

/* Hiển thị danh sách học viên lớp A1*/
Select Student.StudentID, Student.StudentName, Class.ClassName From Student
join Class on Student.ClassId = Class.ClassID
where  ClassName Like 'A1'

/* Hiển thị điểm môn CF của các học viên*/
Select Student.StudentID, Student.StudentName, Mark.Mark, Subject.SubName from Student
join Mark on Mark.StudentId = Student.StudentID
join Subject on Subject.SubID = Mark.SubId
where SubName LIKE 'CF'