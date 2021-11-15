/*-------------------------Table---------------------*/
/*tao bang*/
CREATE TABLE student (
    student_id INT PRIMARY KEY,
    name VARCHAR(20) ,
    major VARCHAR(20)
);

/*bang co dk*/
CREATE TABLE student (
    student_id INT PRIMARY KEY,
    name VARCHAR(20) NOT NULL,
    major VARCHAR(20) UNIQUE
); #NOT NULL (k the chen gia tri null cho truong)
#UNIQUE chi co duy nhat cho 1 hang trong bang (neu them hang khac co cung gia tri cua truong se bi tu choi)
#PRIMARY KEY khoa chinh cua bang (ket hop cua NOT NULL va UNIQUE)

/*bang co gtri mac dinh*/
CREATE TABLE student (
    student_id INT AUTO_INCREMENT,
    name VARCHAR(20),
    major VARCHAR(20) DEFAULT 'undecided',
    PRIMARY KEY (student_id)
);#DEFAULT k truyen thi dua gtri mac dinh vao
#AUTO_INCERMENT dung de tu dong tang (vd khoa chinh tu tang k can truyen tu tang)

/*xem bang*/
DESCRIBE student;

/*xoa bang*/
DROP TABLE student;

/*thay doi bang*/
ALTER TABLE student ADD gpa DECIMAL(3,2);#them cot
ALTER TABLE student DROP COLUMN gpa;#xoa cot

/*-------------------------Data---------------------*/
/*xem thong tin bang*/
#tat ca
SELECT 
    *
FROM
    student;#chon tat ca tu bang student
    
#tt 1 so truong
SELECT 
    name,major
FROM
    student;

#voi dk
SELECT 
    *
FROM
    student
ORDER BY student_id DESC;
#ORDER (sap xep truong) mac dinh la ACS neu muon co the them DESC sx giam
#co the sx bo truong nao do ma k can phai xuat no ra 
#(sx theo student_id nhung chi xuat ra (SELECT) name,major) 

#ket hop dk
SELECT 
    *
FROM
    student
ORDER BY major, student_id DESC;#sx theo major, neu cung major thi sx theo student_id 

#gio han sluong
SELECT 
    *
FROM
    student
ORDER BY student_id DESC
LIMIT 2;

#loc tt
SELECT 
    name,major
FROM
    student
WHERE
    major = 'Chemistry' OR name='Kate';#WHERE noi dk nay dung
-- :v day la 1 cai comment :))
SELECT 
    *
FROM
    student
WHERE
   student_id <= 3  AND name <> 'jack';
-- toan tu: > < >= <= <> AND OR
SELECT 
    *
FROM
    student
WHERE
    name IN ('Claire' , 'Kate', 'Mike')
        AND student_id < 3; 
#chon tat ca tu bang hs voi truong ... co gia tri trong(IN) ... tap gia tri o trong ngoac

/*chen thong tin*/
#chen du
INSERT INTO student(student_id,name) VALUES(1,'Jack');# co mac dinh
INSERT INTO student VALUES(2,'Kate','Sociology');
INSERT INTO student VALUES(3,NULL,'Chemistry');
INSERT INTO student VALUES(3,'Claire','Chemistry');
INSERT INTO student VALUES(4,'Jack','Biology');
INSERT INTO student VALUES(5,'Mike','Computer Science');
#student_id co AUTO_INCREMENT k can truyen
INSERT INTO student(name,major) VALUES('Jack','Biology');
INSERT INTO student(name,major) VALUES('Kate','Sociology');
#chen 1 phan tt
INSERT INTO student(student_id, name) VALUES(3,'Claire');

/*update tt*/
UPDATE student 
SET 
    major = 'Bio'
WHERE
    major = 'Biology' AND student_id <> 0;#de chac chan rang k co loi 1175 nen chi ra khoa chinh
#hoac tat che do an toan (safe update) trong cai dat SQL editor 
#hoac: SET SQL_SAFE_UPDATES = 0; truoc cau lenh SQL update hoac xoa, sau do: SET SQL_SAFE_UPDATES = 1;
# cac toan tu so sanh: =, <>(k bang), >, <, >=, <= 
UPDATE student 
SET 
    major = 'Comp Sci'
WHERE
    (major = 'Computer Science' AND student_id <> 0);
    
#update bang khoa chinh
UPDATE student 
SET 
    major = 'Comp Sci'
WHERE
    student_id = 4;
    
#update ket hop nhieu dk
UPDATE student 
SET 
    major = 'BioChemistry'
WHERE
    (major = 'Bio' OR major = 'Chemistry')
        AND student_id <> 0;#cap nhap o nhieu noi khac nhau
#update nhieu truong
UPDATE student 
SET 
    name = 'Tom',
    major = 'undecided'
WHERE
    student_id = 1;
    
#update voi tat ca cac hang trong bang (k co WHERE)
SET SQL_SAFE_UPDATES=0;

UPDATE student 
SET major = 'undecided' ;

SET SQL_SAFE_UPDATES=1;

/*xoa tt*/
# xoa tat ca thong tin (hang)
SET SQL_SAFE_UPDATES=0;

DELETE FROM student;

SET SQL_SAFE_UPDATES=1;

# xoa co dk
DELETE FROM student
where student_id=5;#xoa bat ki hang cot nao co student_id=5

#xoa voi nhieu dk
DELETE FROM student 
WHERE
    (name = 'Tom' AND major = 'undecided')
    AND student_id <> 0;#tranh loi 1175