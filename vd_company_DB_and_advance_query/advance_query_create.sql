-- -----------------------------------------------------------------------------
-- tao bang,luoc do (schemal)

/*bang nhan vien*/
CREATE TABLE employee (
  emp_id INT PRIMARY KEY,
  first_name VARCHAR(40),
  last_name VARCHAR(40),
  birth_date DATE,
  sex VARCHAR(1),
  salary INT,
  super_id INT,
  branch_id INT
);
-- bang phai dc tao ms co the tao khoa ngoai
-- nen neu chua tao, dat no la INT, trc 
-- roi sau do ms quay lai (thay doi bang) dat khoa ngoai sau khi tao bang xong

/*bang chi nhanh*/
CREATE TABLE branch (
    branch_id INT PRIMARY KEY,
    branch_name VARCHAR(40),
    mgr_id INT,
    mgr_start_date DATE,
    FOREIGN KEY (mgr_id)
        REFERENCES employee (emp_id)
        ON DELETE SET NULL
);
#FOREIGN KEY: khoa ngoai... REFERENCES: tham chieu den khoa chinh bang ...
# ONDELETE SET NULL: neu xoa nhan vien (row) khi do mgr_id(khoa ngoai) co lien quan 
# den nhan vien do se dc dat thanh NULL
# dat ON DELETE SET NULL boi vi mgr_id cua bang branch chi la khoa ngoai,
#k phai khoa chinh, mgr_id k hoan toan can thiet cho bang branch

/*them khoa ngoai*/
ALTER TABLE employee
ADD FOREIGN KEY(branch_id)
REFERENCES branch(branch_id)
ON DELETE SET NULL;

ALTER TABLE employee
ADD FOREIGN KEY(super_id)
REFERENCES employee(emp_id)
ON DELETE SET NULL;

/*bang khach hang*/
CREATE TABLE client (
  client_id INT PRIMARY KEY,
  client_name VARCHAR(40),
  branch_id INT,
  FOREIGN KEY(branch_id) REFERENCES branch(branch_id) ON DELETE SET NULL
);

/*bang lam viec voi*/
CREATE TABLE works_with (
  emp_id INT,
  client_id INT,
  total_sales INT,
  PRIMARY KEY(emp_id, client_id),
  FOREIGN KEY(emp_id) REFERENCES employee(emp_id) ON DELETE CASCADE,
  FOREIGN KEY(client_id) REFERENCES client(client_id) ON DELETE CASCADE
);
# PRIMARY KEY(nhieu khoa): khoa hon hop(composite key)
-- dung khi ca 2 hay nhieu cot deu la khoa chinh nhung k cai nao duy nhat => ket hop 2 hoac nhieu khoa de thanh duy nhat

/*bang nguoi ho tro nhanh*/
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

-- -----------------------------------------------------------------------------
/* chen dl */
-- corporate cong ty (employee,branch)(deu co khoa ngoai tro den nhau => moi quan he vong tron)
INSERT INTO employee VALUES(100, 'David', 'Wallace', '1967-11-17', 'M', 250000, NULL, NULL);
# dat gtri branch_id = NULL boi vi chua tao ra tt branch ma brand_id chi toi
# nen phai de no la NULL roi sau khi tao tt branch xong moi SET giatri branch_id(foreign key)

INSERT INTO branch VALUES(1, 'Corporate', 100, '2006-02-09');
# the dat gtri mgr_id vi da tao tt employee_id(100) roi

UPDATE employee 
SET 
    branch_id = 1
WHERE
    emp_id = 100;#UPDATE bang de SET giatri brach_id tro toi

INSERT INTO employee VALUES(101, 'Jan', 'Levinson', '1961-05-11', 'F', 110000, 100, 1);

-- chen tt cho nhanh Scranton (nhanh o bang branch, cac nhan vien trong nhanh)
INSERT INTO employee VALUES(102, 'Michael', 'Scott', '1964-03-15', 'M', 75000, 100, NULL);
# tt nguoi quan li nhanh do (nhanh quan li thiet lap sau)

INSERT INTO branch VALUES(2, 'Scranton', 102, '1992-04-06');
#tt nhanh

UPDATE employee
SET branch_id = 2
WHERE emp_id = 102;#dat khoa ngoai cho nv quan li nhanh (chi ra nhanh nv quan li)

INSERT INTO employee VALUES(103, 'Angela', 'Martin', '1971-06-25', 'F', 63000, 102, 2);
INSERT INTO employee VALUES(104, 'Kelly', 'Kapoor', '1980-02-05', 'F', 55000, 102, 2);
INSERT INTO employee VALUES(105, 'Stanley', 'Hudson', '1958-02-19', 'M', 69000, 102, 2);
#chen tt cac nv khac cua nhanh scranton dc giam sat(super_id) boi mgr_id 102

-- nhanh Stamford
INSERT INTO employee VALUES(106, 'Josh', 'Porter', '1969-09-05', 'M', 78000, 100, NULL);

INSERT INTO branch VALUES(3, 'Stamford', 106, '1998-02-13');

UPDATE employee 
SET 
    branch_id = 3
WHERE
    emp_id = 106;

INSERT INTO employee VALUES(107, 'Andy', 'Bernard', '1973-07-22', 'M', 65000, 106, 3);
INSERT INTO employee VALUES(108, 'Jim', 'Halpert', '1978-10-01', 'M', 71000, 106, 3);

-- tt bang BRANCH SUPPLIER
INSERT INTO branch_supplier VALUES(2, 'Hammer Mill', 'Paper');
INSERT INTO branch_supplier VALUES(2, 'Uni-ball', 'Writing Utensils');
INSERT INTO branch_supplier VALUES(3, 'Patriot Paper', 'Paper');
INSERT INTO branch_supplier VALUES(2, 'J.T. Forms & Labels', 'Custom Forms');
INSERT INTO branch_supplier VALUES(3, 'Uni-ball', 'Writing Utensils');
INSERT INTO branch_supplier VALUES(3, 'Hammer Mill', 'Paper');
INSERT INTO branch_supplier VALUES(3, 'Stamford Lables', 'Custom Forms');

-- tt bang CLIENT
INSERT INTO client VALUES(400, 'Dunmore Highschool', 2);
INSERT INTO client VALUES(401, 'Lackawana Country', 2);
INSERT INTO client VALUES(402, 'FedEx', 3);
INSERT INTO client VALUES(403, 'John Daly Law, LLC', 3);
INSERT INTO client VALUES(404, 'Scranton Whitepages', 2);
INSERT INTO client VALUES(405, 'Times Newspaper', 3);
INSERT INTO client VALUES(406, 'FedEx', 2);

-- tt bang WORKS_WITH
INSERT INTO works_with VALUES(105, 400, 55000);
INSERT INTO works_with VALUES(102, 401, 267000);
INSERT INTO works_with VALUES(108, 402, 22500);
INSERT INTO works_with VALUES(107, 403, 5000);
INSERT INTO works_with VALUES(108, 403, 12000);
INSERT INTO works_with VALUES(105, 404, 33000);
INSERT INTO works_with VALUES(107, 405, 26000);
INSERT INTO works_with VALUES(102, 406, 15000);
INSERT INTO works_with VALUES(105, 406, 130000);

-- -------------ktra sua------
DESCRIBE employee;

SELECT 
    *
FROM
    branch_supplier;
    
alter table employee  rename column birth_day to birth_date;#doi ten cot
set sql_safe_updates=0;
delete from works_with;
set sql_safe_updates=1;
