/* UNION co ban nhu la 1 toan tu SQL dac biet 
 su dung de hop nhat ket qua cua nhieu cau lenh chon thanh 1 kq chung*/

-- tim danh sach ten tat ca nhan vien va nhanh
SELECT 
    first_name 
FROM
    employee 
UNION SELECT 
    branch_name
FROM
    branch;
#union phai cung so cot (select), cac cot nen cung kieu du lieu

-- tim danh sach tat ca nhan vien,nhanh,khach hang
SELECT 
    first_name AS Company_Names
FROM
    employee 
UNION SELECT 
    branch_name
FROM
    branch 
UNION SELECT 
    client_name
FROM
    client;
    
-- tim ten tat ca khach hang va nguoi ho tro nhanh
SELECT 
    client_name, client.branch_id
FROM
    client 
UNION SELECT 
    supplier_name, branch_supplier.branch_id
FROM
    branch_supplier;
# co the them ten bang o trc cho de doc nhung k can cung dc

-- tim ds tat ca khoan tieu hoac kiem dc cua cong ty
select salary from employee union select total_sales from works_with;