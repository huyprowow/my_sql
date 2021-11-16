/*ONDELETE SET NULL*/
CREATE TABLE branch (
    branch_id INT PRIMARY KEY,
    branch_name VARCHAR(40),
    mgr_id INT,
    mgr_start_date DATE,
    FOREIGN KEY (mgr_id)
        REFERENCES employee (emp_id)
        ON DELETE SET NULL
);

# ONDELETE SET NULL: neu xoa nhan vien (row) khi do mgr_id(khoa ngoai) co lien quan 
# den nhan vien do se dc dat thanh NULL

# dat ON DELETE SET NULL boi vi mgr_id cua bang branch chi la khoa ngoai,
#k phai khoa chinh, mgr_id k hoan toan can thiet cho bang branch

DELETE FROM employee 
WHERE
    emp_id = 102;
    
# ktra h cai mgr_id dat thanh null
SELECT 
    *
FROM
    branch;

#cac nv dc ql boi michael scott cung dat sup_id thah null
SELECT 
    *
FROM
    employee;
    
    
/*ON DELETE CASCADE:*/
    CREATE TABLE branch_supplier (
    branch_id INT,
    supplier_name VARCHAR(40),
    supply_type VARCHAR(40),
    PRIMARY KEY (branch_id , supplier_name),
    FOREIGN KEY (branch_id)
        REFERENCES branch (branch_id)
        ON DELETE CASCADE
);
#ON DELETE CASCADE: neu branch_id luu tru khoa ngoai o trong branch supplier bi xoa 
#no se xoa toan bo hang trong database

#vi branch_id khoa ngoai o day la 1 phan cua khoa chinh cua bang branch_supplier
#no co nghia la branch_id o trong bang branch_sup hoan toan quan trong trong hang nay o database
#chung ta k the dat no thanh NULL vi khoa chinh k the NULL

#(neu xoa nhanh co id = 2 trong bang nhanh thi 
#no se xoa tat ca cac hang co branch_id = 2 trong bang nguoi ho tro nhanh)

DELETE FROM branch 
WHERE
    branch_id = 2;
    
-- h tat ca cac hang co branch_id=2 trong bang branch_supplier da bi xoa
SELECT 
    *
FROM
    branch_supplier;