/*nested query: query su dung nhieu cau lenh select de lay cac manh rieng cua tt
su dung ket qua 1 cau lenh select de tao ra ket qua cua cau lenh select khac*/

-- tim tat ca nhan vien nguoi ban dc hon 30,000 cho 1 khac hang don
SELECT 
    employee.first_name, employee.last_name
FROM
    employee
WHERE
    emp_id IN (SELECT 
            works_with.emp_id
        FROM
            works_with
        WHERE
            works_with.total_sales > 30000);
#IN tra ve kq neu gtri co o ben trong dau () => co the long select ben trong ()

-- tim tat khac hang dc xl tai nhanh cua michael scott quan li,
-- (gia dinh rang da biet id cua michael scott)

SELECT 
    client.client_name
FROM
    client
WHERE
    client.branch_id = (SELECT 
            branch.branch_id
        FROM
            branch
        WHERE
            branch.mgr_id = 102);
#(michael scott qli nhieu nhanh)
# nen su dung in thay cho dau bang vi ket qua query co the tra ve nhieu dl
# su dung limit=1 cho query thu 2 vi ket qua query co the tra ve nhieu dl neu chi muon 1
#nen tach cac query ra de viet roi ms long nhau de chac chan k loi