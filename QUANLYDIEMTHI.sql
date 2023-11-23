CREATE DATABASE QUANLYDIEMTHI;
USE QUANLYDIEMTHI;

CREATE TABLE STUDENT(
studentId VARCHAR(4) PRIMARY KEY NOT NULL,
studentName VARCHAR(100) NOT NULL,
birthday DATE NOT NULL,
gender BIT(1) NOT NULL,
address TEXT NOT NULL,
phoneNumber VARCHAR(45) UNIQUE
);

CREATE TABLE SUBJECT(
subjectId VARCHAR(4) PRIMARY KEY NOT NULL,
subjectName VARCHAR(45) NOT NULL,
priority INT(11) NOT NULL
);

CREATE TABLE MARK (
subjectID VARCHAR(4) NOT NULL,
FOREIGN KEY(subjectID) REFERENCES SUBJECT(subjectId),
studentId VARCHAR(4) NOT NULL,
FOREIGN KEY(studentId) REFERENCES STUDENT(studentId),
PRIMARY KEY(subjectID,studentId),
point DOUBLE NOT NULL
);

INSERT INTO STUDENT(studentId,studentName,birthday,gender,address,phoneNumber) VALUES
('S001','Nguyễn Thế Anh','1999-1-11',1,'Hà Nội',984678082),
('S002','Đặng Bảo Trâm','1998-12-22',0,'Lào Cai',904982654),
('S003','Trần Hà Phương','2000-5-5',0,'Nghệ An',947645363),
('S004','Đỗ Tiến Mạnh','1999-3-26',1,'Hà Nội',983665353),
('S005','Phạm Duy Nhất','1998-10-4',1,'Tuyên Quang',987242678),
('S006','Mai Văn Thái','2002-6-22',1,'Nam Định',982654268),
('S007','Giang gia hân','1996-11-10',0,'Phú Thọ',982364753),
('S008','Nguyễn Ngọc Bảo My','1999-1-22',0,'Hà Nam',927867453),
('S009','Nguyễn Tiến Đạt','1998-8-7',1,'Tuyên Quang',989274673),
('S010','Nguyễn Thiều Quang','2000-9-18',1,'Hà Nội',984378291);

INSERT INTO SUBJECT (subjecTId,subjectNAME,priority) VALUES
	('MH01','Toán',2),
    ('MH02','Vật Lý',2),
    ('MH03','Hóa Học',1),
    ('MH04','Ngữ Văn',1),
    ('MH05','Tiếng Anh',2);
    
INSERT INTO MARK (SUbjecTID,stuDentId,pOINT) VALUES
	('MH01','S001',8.5),
    ('MH02','S001',7),
    ('MH03','S001',9),
    ('MH04','S001',9),
    ('MH05','S001',5),
    
    ('MH01','S002',9),
    ('MH02','S002',8),
    ('MH03','S002',6.5),
    ('MH04','S002',8),
    ('MH05','S002',6),
    
    ('MH01','S003',7.5),
    ('MH02','S003',6.5),
    ('MH03','S003',8),
    ('MH04','S003',7),
    ('MH05','S003',7),
    
    ('MH01','S004',6),
    ('MH02','S004',7),
    ('MH03','S004',5),
    ('MH04','S004',6.5),
    ('MH05','S004',8),
    
    ('MH01','S005',5.5),
    ('MH02','S005',8),
    ('MH03','S005',7.5),
    ('MH04','S005',8.5),
    ('MH05','S005',9),
    
    ('MH01','S006',8),
    ('MH02','S006',10),
    ('MH03','S006',9),
    ('MH04','S006',7.5),
    ('MH05','S006',6.5),
    
    ('MH01','S007',8.5),
    ('MH02','S007',9),
    ('MH03','S007',6),
    ('MH04','S007',9),
    ('MH05','S007',4),
    
    ('MH01','S008',10),
    ('MH02','S008',8.5),
    ('MH03','S008',8.5),
    ('MH04','S008',6),
    ('MH05','S008',9.5),
    
    ('MH01','S009',7.5),
    ('MH02','S009',8),
    ('MH03','S009',5.5),
    ('MH04','S009',4),
    ('MH05','S009',7),
    
    ('MH01','S010',6.5),
    ('MH02','S010',8),
    ('MH03','S010',5.5),
    ('MH04','S010',4),
    ('MH05','S010',7);

-- 2.CẬp nhẬT dữ lIỆu [10 ĐIỂM]:
-- SỬa tên Sinh vIÊN Có mã `S004` Thành “ĐỖ Đức Mạnh”.
update student set studentName = 'Đỗ Đức Mạnh' where studentId='S004';

-- Sửa tên và hệ số môn học có mã `MH05` THành “NgoẠINGữ” và hệ số LÀ 1.
update subject set SUBJEctName = 'Ngoại Ngữ',priority=1 where subjectId='MH05';

-- Cập nhật lại điỂM CỦa học sinh có mã `S009` thành (MH01 : 8.5, MH02 : 7,MH03 : 5.5, MH04 : 6, MH05 : 9).
updaTe mark sET 
POINt=case
wheN subjectID ='MH01' then 8.5
when subjectID ='MH02' then 7
when subjectID ='MH03' then 5.5
when subjectID ='MH04' then 6
when subjectID ='MH05' thEN 9
end
wHERE sTUDEntId='S009';

-- 3. XOÁ DỮ lIỆU[10 điểm]:
-- Xoá toÀN Bộ tHÔNG tin của họC sinh cÓ MÃ `S010` Bao gồm điểm thi ở bẢNG MARK VÀ thông tin Học sinh NÀY Ở BẢNg STUDENT.
deletE from mark where studentId ='S010';
delete from student where studentId ='S010';

-- Bài 3: Truy vấn dữ liệu [25 điểm]:
-- 1. Lấy ra tất cả thông tin của sinh viên trong bảng Student . [4 điểm]
seLECT * FROM studeNT;

-- 2. Hiển Thị tên vÀ MÃ MôN HỌc của nhữNG MÔn có hệ số Bằng 1. [4 điểm]
select subjectName,priority from subject where priority=1;

-- 3. Hiển thị thông tin học sinh bào gồm: mã học sinh, tên học sinh, TUỔI (bẰnG NĂm hiện tại trừ năm sinh) , giới tính (hiển thị nam hoặc nữ) và quê quán của tất cả học sinh. [4 điểm]
select studentId, studentName, year(current_date())- year(birthday) as age, 
       case when gender = 1 then 'Nam' else 'Nữ' end as gender, address
from STUDENT;

-- 4. Hiển thị thông tin bao gồm: tên học sinh, tên môn học , điểm thi của tất cả học sinh của môn Toán và sắp xếp theo điểm giảm dần. [4 điỂM]
select s.studentName, sub.subjectName, m.point
from STUDENT s
join MARK m on s.studentId = m.studentId
join SUBJECT sub on m.subjectId = sub.subjectId
where sub.subjectName = 'Toán'
order by m.point DESC;

-- 5. Thống Kê số lượng hỌc SINH THEO GIỚI TÍNH Ở TRONG bảng (GỒm 2 cột: giới tínH VÀ SỐ Lượng). [4 ĐiỂM]
select
    case
        when gender = 1 then 'Nam'
        when gender = 0 then 'Nữ'
        else 'Khác'
    end as gender,
    COUNT(*) AS count
from STUDENT
group by gender;

-- 6. TÍNH tổng điểM Và Điểm truNg bình củA CÁc môn học theo từng học sinh (yêu cầu sử dụng hàm để tính toán) , bảng gồm mã học sinh, tên hoc sinh, tổng điểm và điểm trung bình. [5 điểm]
select
    s.studentId,
    s.studentName,
    SUM(m.point) as totalPoint,
    AVG(m.point) as averagePoint
from STUDENT s
join MARK m on s.studentId = m.studentId
group by s.studentId, s.studentName;


-- Bài 4: Tạo View, Index, Procedure [20 điểm]:
-- 1. Tạo VIEW có tên STUDENT_VIEW lấy thông tin sinh viên bao gồm : mã học sinh, tên học sinh, giới tính , quê quán . [3 điểm]
create view STUDENT_VIEW as
select studentId, studentName, gender, address
from STUDENT;

select * from STUDENT_VIEW;

-- 2. Tạo VIEW có tên AVERAGE_MARK_VIEW lấy thông tin gồm:mã học sinh, tên học sinh, điểm trung bình các môn học . [3 điểm]
create VIEW AVERAGE_MARK_VIEW AS
select s.studentId, s.studentName, AVG(m.point) AS averageMark
from STUDENT s
join MARK m ON s.studentId = m.studentId
group by s.studentId, s.studentName;

select * from AVERAGE_MARK_VIEW;
-- 3. Đánh Index cho trường `phoneNumber` của bảng STUDENT. [2 điểm]
create INDEX idx_phoneNumber ON STUDENT (phoneNumber);

-- 4. Tạo các PROCEDURE sau:
-- Tạo PROC_INSERTSTUDENT dùng để thêm mới 1 học sinh bao gồm tất cả thông tin học sinh đó. [4 điểm]
delimiter &&
create procedure PROC_INSERTSTUDENT (
    in student_id varchar(4),
    in student_name varchar(100),
    in birthday_s date,
    in gender_s bit(1),
    in address_s text,
    in phoneNumber_s varchar(45)
)
BEGIN
    INSERT INTO STUDENT (studentId,studentName,birthday,gender,address,phoneNumber)
    VALUES (student_id, student_name, birthday_s, gender_s,address_s, phoneNumber_s);
END;
delimiter;

-- Tạo PROC_UPDATESUBJECT dùng để cập nhật tên môn học theo mã môn học. [4 điểm]
delimiter &&
create procedure PROC_UPDATESUBJECT( in subject_Id varchar(4), in new_name varchar(100))
begin
update SUBJECT set subjectName = new_name where subjectId = subject_Id ;
end;
delimiter;

-- Tạo PROC_DELETEMARK dùng để xoá toàn bộ điểm các môn học theo mã học sinh và trả về số bản ghi đã xóa. [4 điểm]
delimiter &&
create procedure PROC_DELETEMARK( in student_id varchar(4),out deletaCount int)
begin
delete from MARK where studentId=student_id;
set deletaCount = row_count();
end;
&&


