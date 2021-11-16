/*wild card: cach co ban de dinh nghia cac mau(partens) khac*/

-- tim bat ki khach hang nao la LLC(cong ty tn huu han)
SELECT 
    *
FROM
    client
WHERE
    client_name LIKE '%LLC';
-- %: dai dien cho nhieu # ktu, _ : dai dien cho 1 ktu
-- (bat ki so hoac t nao)
#LIKE:tra ve true cho neu du lieu khop parten (tra ve dl)

-- tim tat ca nguoi ho tro nhanh nguoi ma co nhan doanh nhan (label business)
SELECT 
    *
FROM
    branch_supplier
WHERE
    supplier_name LIKE '% Lable%';

-- tim bat ki nhan vien nao sinh trong thang 10
SELECT 
    *
FROM
    employee
WHERE
    birth_date LIKE '____-10%';
    
-- tim bat ki nhan vien nao sinh trong thang 2
SELECT 
    *
FROM
    employee
WHERE
    birth_date LIKE '____-02%';
    
-- tim tat ca khach hang nao la truong hoc
SELECT 
    *
FROM
    client
WHERE
    client_name LIKE '%school%';