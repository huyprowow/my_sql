-- tim so luong nhan vien
SELECT 
    COUNT(emp_id)
FROM
    employee;

-- so luong nhan vien co nguoi giam sat
SELECT 
    COUNT(super_id)
FROM
    employee;
    
-- tim so nhan vien nu sinh sau nam 1970
SELECT 
    COUNT(emp_id)
FROM
    employee
WHERE
    sex = 'F' AND birth_date > '1971-01-01';
#phai so sanh ngay phai truyen dinh dang yyy-mm-dd
    
-- tim luong trung binh tat ca nhan vien
SELECT 
    AVG(salary)
FROM
    employee;
    
-- trung binh luong nhan vien nam
SELECT 
    AVG(salary)
FROM
    employee
WHERE
    SEX = 'M';

-- tong tat luong tat ca nhan vien (cty tieu bn tien de tra luong cho nhan vien)
SELECT 
    SUM(salary)
FROM
    employee;
    
/*(aggeration:tap hop) giup hien thi du lieu chung ta lay ra theo cach huu ich hon
gq 1 so van de, tim ra tat thong tin kha nhau tu bang*/
-- tim co bao nhieu nhan vien nam va nu
SELECT 
    COUNT(sex), sex
FROM
    employee
GROUP BY sex; 
#cout(sex), sex tra ve 9,M nhung ma day k phai thu chung ta muon =>su dung GROUP BY
#GROUD BY: nhom thong tin dc lay ra theo cai gi do (o day la gioi tinh)
#3  M
#6  F
#dem xem co bn nv dc dua vao hoac co bao nhiêu employee dc ghi nhan trong cot sex
#cuoi cung in ra dl cung voi viec ho la nam hay nu

-- tim tong hang ban dc (totale_sales) cua moi nhan vien ban hang
SELECT 
    SUM(total_sales), emp_id
FROM
    works_with
GROUP BY emp_id;

-- tim tien da tieu cua khach hang (totale_sales) voi nhanh
SELECT 
    SUM(total_sales), client_id
FROM
    works_with
GROUP BY client_id;