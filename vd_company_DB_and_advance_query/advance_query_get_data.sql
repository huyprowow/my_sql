-- tim tat ca nhan vien
SELECT 
    *
FROM
    employee;

-- tim tat ca khach hang
SELECT 
    *
FROM
    client;

-- tim tat ca nhan vien, sap xep theo luong
SELECT 
    *
FROM
    employee
ORDER BY salary DESC;

-- tim tat ca nhan vien, sap xep theo gioi tinh sau do la ten
SELECT 
    *
FROM
    employee
ORDER BY sex , first_name , last_name;

-- tim 5 nhan vien dau tien trong bang
SELECT 
    *
FROM
    employee
LIMIT 5;

-- tim firt_name, last_name tat ca nhan vien
SELECT 
    first_name, last_name
FROM
    employee;

-- tim forename(ten) va surname(ho) cua tat ca nhan vien
SELECT 
    first_name AS forename, last_name AS surname
FROM
    employee;
#tu khoa AS: tra ve cot dc truy van voi ten cot dc dat(dat ten cot phu hop vs y muon)

-- tim tat ca cac gioi tinh khac nhau
SELECT DISTINCT
    sex
FROM
    employee;
#DISTINCT tra ve cac gia tri khac nhau trong cot
-- tim tat ca cac nhanh khac nhau
SELECT DISTINCT
    branch_id
FROM
    branch;