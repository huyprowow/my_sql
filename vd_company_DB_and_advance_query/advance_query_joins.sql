/*JOIN co ban dung de ket hop cac hang cua 2 hoac nhieu bang co cot lien quan*/

INSERT INTO branch VALUES(4,'Buffalo',NULL,NULL);#chen them ti dl de lay min hoa cho right join

/*nomal JOIN*/
-- tim tat ca cac nhanh va ten quan li cua cac nhanh do
SELECT 
    employee.emp_id, employee.first_name, branch.branch_name
FROM
    employee
        JOIN
    branch ON employee.emp_id = branch.mgr_id;
#tra ve chi nhung nv la manager
#join 2 bang lai = 1 cot dat biet(khoa chinh,khoa ngoai) thanh 1 bang don
# ON: dieu kien de lay thong tin tren select

/*LEFT JOIN*/
SELECT 
    employee.emp_id, employee.first_name, branch.branch_name
FROM
    employee
        LEFT JOIN
    branch ON emp_id = branch.mgr_id;
#LEFT JOIN: bao gom tat ca cac cot join vao o bang trai (sau from)
# nhung chi nhung chinh nhung cot khop

/*RIGHT JOIN*/
SELECT 
    employee.emp_id, employee.first_name, branch.branch_name
FROM
    employee
        RIGHT JOIN
    branch ON emp_id = branch.mgr_id;

#RIGHT JOIN: bao gom tat ca cac cot join vao o bang phai 
# nhung chi nhung chinh nhung cot khop

/*FULL OUTER JOIN*/#(k dung dc trong mysql)
#ve co ban la ca LEFT JOIN va RIGHT JOIN  ke ca khop vs dk ON hoac k