create database Session3_bt1_QuanlySinhVien;
use Session3_bt1_QuanlySinhVien;

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
 /* Hiển thị danh sách tất cả học viên bắt đầu bằng ký tự 'h'*/
SELECT 
    *
FROM
    Student
WHERE
    StudentName LIKE 'h%'
/* Hiển thị các lớp học bắt đầu vào tháng 12*/
SELECT 
    *
FROM
    Class
WHERE
    MONTH(StartDate) = 12
/* Hiển thị tất cả môn học có credit trong khoảng từ 3-5 */
select * from Subject where Credit between 3 and 5
update Student set ClassID = 2 where StudentName = 'Hung';
/*• Hiển thị các thông tin: StudentName, SubName, Mark. Dữ liệu sắp xếp 
theo điểm thi (mark) giảm dần. nếu trùng sắp theo tên tăng dần.*/
select StudentName, SubName, Mark.Mark from Student
join Mark on Mark.StudentId = Student.StudentID
order by mark desc


