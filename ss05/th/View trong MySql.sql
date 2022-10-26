use classicmodels;
-- tao view
CREATE VIEW customer_views AS
SELECT customerNumber, customerName, phone
FROM  customers;
-- goi view
select * from customer_views;

-- cap nhap view
CREATE OR REPLACE VIEW customer_views AS
SELECT customerNumber, customerName, contactFirstName, contactLastName, phone
FROM customers
WHERE city = 'Nantes';

-- Xoá view
DROP VIEW customer_views;