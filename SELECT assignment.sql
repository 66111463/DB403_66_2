-- DATABASE FUNCTIONS STRING
---- CONCAT() เป็นการนำข้อความมารวมกัน เช่น > SELECT CONCAT(FirstName, ' ', LastName)
---- CHAR_LENGTH() วัดความยาวของตัวอักษรในจ้อความ เช่น > WHERE CHAR_LENGTH(CompanyName) <= 10
---- LOWER() หรือ UPPER() เป็นฟังก์ชั่นเพื่อเปลี่ยน Case sensitive เป็นตามที่ต้องการได้ เช่น > WHERE LOWER(Country) in ('maxico', 'spain', 'france')
---- REPREAT() ใช้ทำข้อความซ้ำๆ เช่น หากต้องการใช้ Space ทั้งหมด 3 ครั้ง > SELECT CONCAT(FirstName, repreat(' ', 3), LastName)
-- DATABASE FUNCTIONS DATE & TIME
---- NOW() เป็นฟังก์ชั่นให้ค่าเป็นวันเวลาเป็นปัจจุบันโดยเริ่มจาก ปี-เดือน-วัน ช.ม.:นาที:วินาที
---- CURDATE() แสดงเฉพาะวันที่ปัจจุบัน
---- CURTIME() แสดงเฉพาะเวลาปัจจุบัน
---- TIMESTAMP() แสดงผลคล้าย NOW() แต่แสดงในลักษณะของตัวเลข (Format เดียวกันกับ CURRENT_TIMESTAMP)
---- DATEDIFF() ใช้หาเวลาที่ต่างกันของคู่เทียบข้อมูล เช่น > SELECT DATEDIFF(NOW(), '1948-12-08 00:00:00')
---- DAYOFWEEK(), MONTH(), YEAR() เมื่อต้องการสกัดวันออกมาเป็นในรูปแบบของ Week, Month, หรือ Year
-- DATABASE FUNCTIONS NUMERIC
---- ROUND() คือปัดเศษตัวเลขหากเลขทศนิยมมีเศษมากกว่า 0.5 ก็จะปัดตัวเลขขึ้น และหากเลขทศนิยมมีเศษน้อยกว่า 0.5 ก็จะปัดตัวเลขลง
---- CEILING() ปัดตัวเลขเศษขึ้น
---- FLOOR() ปัดตัวเลขเศษลง
---- RAND() ตัวเลขสุ่ม เช่น > WHERE EmployeeID = FLOOR(RAND()*9)+1
---- LEAST() เปรียบเทียบมากกว่าหนึ่ง Column เพื่อใช้หาค่าที่น้อยที่สุด
---- GREATEST() เปรียบเทียบมากกว่าหนึ่ง Column เพื่อใช้หาค่าที่มากที่สุด
---- SQRT() Square Root
---- POWER() เลขยกกำลัง

---------------------------------------------------------

-- 1. แสดงจำนวนวันเฉลี่ยที่ใช้ในการขนส่งสินค้านับจากวันที่มีการสั่งสินค้าถึงวันที่ส่งสินค้า (เศษของวันนับเป็น 1 วัน) ของแต่ละประเทศ เรียงลำดับจากมากไปหาน้อย
SELECT CEILING(AVG(DATEDIFF(ShippedDate, OrderDate))) AS TotalShippedDate, ShipCountry
FROM orders
GROUP BY ShipCountry
ORDER BY TotalShippedDate DESC;

-- 2. แสดงจำนวนรายการสั่งซื้อของแต่ละเดือน ในปี 1995
SELECT MONTH(OrderDate) AS `Month no. in 1995`, COUNT(*) AS `Total Orders`
FROM orders
WHERE YEAR(OrderDate) = 1995
GROUP BY `Month no. in 1995`;

-- 3. ค้นหาว่าประเทศใดมีลูกค้ามากที่สุด
SELECT COUNT(*) TotalCustomers, Country
FROM customers
GROUP BY Country
ORDER BY TotalCustomers DESC
LIMIT 10;
