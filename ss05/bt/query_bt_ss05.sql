-- tao database 
create database demo;
-- sd database
use demo;
-- tao bang Product
create table Products(
	id  int  primary key ,-- auto_increment: tự dộng tăng
    productCode varchar(5) ,
    productName varchar(50),
    productPrice int,
    productAmount int,
    productDescription text,
    productStatus bit
);

-- insert Product
insert into products 
		values(1,'A0001','cong tan',1000,30,'no problem',1),
        (2,'A0002','cong tan1',3000,60,'no problem',1),
        (3,'A0003','cong tan2',4000,40,'no problem',0),
        (4,'A0004','cong tan3',5000,35,'no problem',0),
        (5,'A0005','cong tan4',6000,30,'no problem',1);
        
-- Tạo Unique Index trên bảng Products (sử dụng cột productCode để tạo chỉ mục)
create unique index index_code on products(productCode);
explain select * from products where productCode='A0001';

-- Tạo Composite Index trên bảng Products (sử dụng 2 cột productName và productPrice)
create index index_composite on products(productName,productPrice);
explain select * from products where productName='cong tan 2' and productPrice=4000;

-- Tạo view lấy về các thông tin: productCode, productName, productPrice, productStatus từ bảng products.
create view view_a as 
select productCode, productName, productPrice, productStatus from products;

-- Tiến hành sửa đổi view
update view_a
set productName='van b'
where productCode='A0005';

-- Tiến hành xoá view
delete from view_a
where productCode='A0004';

-- check view
select * from view_a;

-- Tạo store procedure lấy tất cả thông tin của tất cả các sản phẩm trong bảng product
DELIMITER //
CREATE PROCEDURE findAllProducts()
BEGIN
  SELECT * FROM Products;
END //
DELIMITER ;

call findAllProducts;

-- Tạo store procedure thêm một sản phẩm mới
DELIMITER //
CREATE PROCEDURE addNewProduct(in id_a  int,in productCode_a varchar(5) ,in productName_a varchar(50),in productPrice_a int,in productAmount_a int,in productDescription_a text,in productStatus_a bit)
BEGIN
  insert into products 
		value(id_a,productCode_a,productName_a,productPrice_a,productAmount_a,productDescription_a,productStatus_a);
END //
DELIMITER ;

call addNewProduct(6,'A0006','cong tan5',1000,30,'no problem',0);

-- Tạo store procedure sửa thông tin sản phẩm theo id
DELIMITER //
CREATE PROCEDURE updateProduct(in id_u  int,in productCode_u varchar(5) ,in productName_u varchar(50),in productPrice_u int,in productAmount_u int,in productDescription_u text,in productStatus_u bit)
BEGIN
	update products
	set id=id_u,productCode=productCode_u,productName=productName_u,productPrice=productPrice_u,productAmount=productAmount_u,productDescription=productDescription_u,productStatus=productStatus_u
	where id = id_u;
END //
DELIMITER ;

call updateProduct(6,'A0006','van c',1000,30,' problem',1);

-- Tạo store procedure xoá sản phẩm theo id
DELIMITER //
CREATE PROCEDURE deleteProduct(in id_d  int)
BEGIN
	delete from Products where id=id_d;
END //
DELIMITER ;

call deleteProduct(3);