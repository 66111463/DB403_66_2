-- 1. เรียกดูชื่อสินค้าที่เลิกผลิตแล้ว แต่ยังมีจำนวนสินค้าคงเหลือค้างอยู่ใน Stock
SELECT ProductName, UnitsInStock, Discontinued
FROM products
WHERE Discontinued=1 AND UnitsInStock>0;

-- 2. เรียกดูชื่อสินค้าที่มียอดสั่งซื้อมูลค่าเกิน 500
SELECT ProductName, UnitPrice * UnitsOnOrder AS `Total Order`
FROM products
WHERE UnitPrice * UnitsOnOrder > 500;

-- 3. ลูกค้าจากประเทศ France มาจากเมือง (city) อะไรบ้าง
SELECT DISTINCT City, Country
FROM customers
WHERE Country = 'France';

-- 4. เรียกดูรายชื่อผู้ติดต่อ (ContactName) และชื่อบริษัท (CompanyName) ของลูกค้า เฉพาะบริษัทที่มีชื่อขึ้นต้นด้วย a 
SELECT ContactName, CompanyName
FROM customers
WHERE CompanyName LIKE 'a%';

-- 5. เรียกดูชื่อผู้ติดต่อ (ContactName) และชื่อบริษัท (CompanyName) ของลูกค้า เฉพาะบริษัทที่ชื่อลงท้ายว่า markets
SELECT ContactName, CompanyName
FROM customers
WHERE CompanyName LIKE '%markets';

-- 6. เรียกดูชื่อผู้ติดต่อ (ContactName) และชื่อบริษัท (CompanyName) ของลูกค้า เฉพาะบริษัทที่มีตัวอักษร et อยู่ในชื่อบริษัท
SELECT ContactName, CompanyName
FROM customers
WHERE CompanyName LIKE '%et%';

-- 7. เรียกดูชื่อผู้ติดต่อ (ContactName) และชื่อบริษัท (CompanyName) ของลูกค้า เฉพาะชื่อบริษัทที่มีตัวอักษร e และ t โดยมีตัวอักษร 1 ตัว คั่นกลางระหว่าง e และ t เช่น ect, ent, est
SELECT ContactName, CompanyName
FROM customers
WHERE CompanyName LIKE '%e_t%';

-- 8. เรียกดูชื่อผู้ติดต่อ (ContactName) และชื่อบริษัท (CompanyName) ของลูกค้า เฉพาะบริษัทที่มีชื่อขึ้นต้นด้วยตัวอักษร b และลงท้ายด้วย s
SELECT ContactName, CompanyName
FROM customers
WHERE CompanyName LIKE 'b%s';

-- 9. รายชื่อสินค้าและราคาต่อหน่วย เฉพาะสินค้าที่มีราคาต่อหน่วยตั้งแต่ 20 ถึง 50
SELECT ProductName, UnitPrice
FROM products
WHERE UnitPrice BETWEEN 20 AND 50;

-- 10.1 จากตารางข้อมูลลูกค้า เรียกดูชื่อผู้ติดต่อ (ContactName), ตำแหน่งผู้ติดต่อ (ContactTitle), ประเทศ (Country) โดยเรียกดูเฉพาะลูกค้าที่มีตำแหน่งเป็น Owner และอยู่ในประเทศ Mexico, Spain, France
SELECT ContactName, ContactTitle, Country
FROM customers
WHERE ContactTitle LIKE 'Owner'
	AND (Country = 'Mexico'
    OR Country = 'Spain'
    OR Country = 'France');

-- 10.2 จากตารางข้อมูลลูกค้า เรียกดูชื่อผู้ติดต่อ (ContactName), ตำแหน่งผู้ติดต่อ (ContactTitle), ประเทศ (Country) โดยเรียกดูเฉพาะลูกค้าที่มีตำแหน่งเป็น Owner และอยู่ในประเทศ Mexico, Spain, France
SELECT ContactName, ContactTitle, Country
FROM customers
WHERE ContactTitle LIKE 'Owner'
	AND Country IN ('Mexico', 'Spain', 'France');

-- 11.1 จากตารางข้อมูลลูกค้า เรียกดูชื่อบริษัท (CompanyName), ตำแหน่งผู้ติดต่อ (ContactTitle), ประเทศ (Country) โดยเรียกดูเฉพาะลูกค้าที่มีตำแหน่งเป็น Owner และอยู่ในประเทศ Mexico, Spain, France เรียงลำดับตามชื่อบริษัทจาก A-Z
-- ORDER BY column1, column2, ... ASC|DESC;
-- สามารถ ORDER BY ให้ column เป็นลำดับๆ โดยใช้ลำดับเลขของแต่ละ column ที่ต้องการได้ และการใช้ ASC|DESC ต้องระบุเป็น column ใคร column มัน
SELECT CompanyName, ContactTitle, Country
FROM customers
WHERE ContactTitle LIKE 'Owner'
	AND Country IN ('Mexico', 'Spain', 'France')
ORDER BY CompanyName ASC;

-- 11.2 จากตารางข้อมูลลูกค้า เรียกดูชื่อบริษัท (CompanyName), ตำแหน่งผู้ติดต่อ (ContactTitle), ประเทศ (Country) โดยเรียกดูเฉพาะลูกค้าที่มีตำแหน่งเป็น Owner และอยู่ในประเทศ Mexico, Spain, France เรียงลำดับตามชื่อบริษัท จาก Z-A
SELECT CompanyName, ContactTitle, Country
FROM customers
WHERE ContactTitle LIKE 'Owner'
	AND Country IN ('Mexico', 'Spain', 'France')
ORDER BY CompanyName DESC;

-- 11.3 จากตารางข้อมูลลูกค้า เรียกดูชื่อบริษัท (CompanyName), ตำแหน่งผู้ติดต่อ (ContactTitle), ประเทศ (Country) โดยเรียกดูเฉพาะลูกค้าที่มีตำแหน่งเป็น Owner และอยู่ในประเทศ Mexico, Spain, France เรียงลำดับตามชื่อบริษัท โดยแสดงข้อมูลแค่ 2 รายการแรก
SELECT CompanyName, ContactTitle, Country
FROM customers
WHERE ContactTitle LIKE 'Owner'
	AND Country IN ('Mexico', 'Spain', 'France')
LIMIT 2;

-- 11.4 จากตารางข้อมูลลูกค้า เรียกดูชื่อบริษัท (CompanyName), ตำแหน่งผู้ติดต่อ (ContactTitle), ประเทศ (Country) โดยเรียกดูเฉพาะลูกค้าที่มีตำแหน่งเป็น Owner และอยู่ในประเทศ Mexico, Spain, France เรียงลำดับตามชื่อบริษัท โดยแสดงข้อมูลรายการที่ 5-6
SELECT CompanyName, ContactTitle, Country
FROM customers
WHERE ContactTitle LIKE 'Owner'
	AND Country IN ('Mexico', 'Spain', 'France')
ORDER BY CompanyName ASC
LIMIT 4, 2;
-- LIMIT 2 OFFSET 4;

-- 12. แสดงชื่อสินค้า ราคาต่อหน่วย และจำนวนสินค้าต่อหน่วย โดยแสดงเฉพาะสินค้าที่มีหน่วยเป็นกล่อง (box) 5 รายการที่มีราคาต่อหน่วยสูงสุด
SELECT ProductName, UnitPrice, QuantityPerUnit
FROM products
WHERE QuantityPerUnit LIKE '%box%'
ORDER BY UnitPrice DESC
LIMIT 5;

-- 13.1 นับว่ามีลูกค้าทั้งหมดกี่คน
-- COUNT() | SUM() | MIN() | MAX() | AVG()
--------------------
--- SELECT COUNT(DISTINCT Region)
--- FROM `customers`;
--------------------
SELECT COUNT(*) AS `Number of Customers`
FROM `customers`;


-- 13.2 นับว่ามีลูกค้าทั้งหมดกี่คน ในแต่ละประเทศ
-- เงื่อนไข GROUP BY อะไร SELECT ต้องดึง column นั้นๆ มาเรียกเสมอ
SELECT Country, COUNT(*) AS `Number of Customers`
FROM `customers`
GROUP BY Country;

-- 13.3 นับจำนวนลูกค้าที่อยู่ในแต่ละประเทศ UK, France หรือ Spain
SELECT Country, COUNT(*) AS `Number of Customers`
FROM `customers`
WHERE Country IN ('UK', 'France', 'Spain')
GROUP BY Country;

-- 13.4 นับจำนวนลูกค้าที่อยู่ในแต่ละประเทศ UK, France หรือ Spain เรียงลำดับตามจำนวนลูกค้า
SELECT Country, COUNT(*) AS `Number of Customers`
FROM `customers`
WHERE Country IN ('UK', 'France', 'Spain')
GROUP BY Country
ORDER BY 2 ASC;

-- 14. นับจำนวนลูกค้าจากประเทศ UK, France หรือ Spain  โดยแสดงเฉพาะประเทศที่มีลูกค้ามากกว่า 5 ราย และแสดงผลเรียงลำดับตามจำนวนลูกค้าจากมากไปน้อย
-- HAVING เป็นเงื่อนไขที่ทำได้หลังจากจัดกลุ่ม หรือ Aggregate แล้ว 
SELECT Country, COUNT(*) AS `Number of Customers`
FROM `customers`
WHERE Country IN ('UK', 'France', 'Spain')
GROUP BY Country
HAVING `Number of Customers` > 5
ORDER BY 2 DESC;

-- 15.1 ราคาเฉลี่ยของสินค้าในแต่ละหมวด (CategoryID)
SELECT CategoryID, AVG(UnitPrice) AVG_UnitPrice
FROM products
GROUP BY CategoryID;

-- 15.2 ราคาเฉลี่ยของสินค้าที่มีค้างอยู่ใน Stock จำแนกตามหมวดหมู่ (CategoryID)
SELECT CategoryID, AVG(UnitPrice) AVG_UnitPrice
FROM products
WHERE UnitsInStock > 0
GROUP BY CategoryID;
