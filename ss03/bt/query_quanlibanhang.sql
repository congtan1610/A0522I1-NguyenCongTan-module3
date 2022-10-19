use quanlybanhang;

insert into Customer values(1,'Minh Quan',10),
							(2,'Ngoc Oanh',20),
							(3,'Hong Ha',50);
                            
insert into `Order` values(1,1,'2006-3-21',Null),
							(2,2,'2006-3-23',Null),
							(3,1,'2006-3-16',Null);
                            
insert into Product values(1,'May Giat',3),
							(2,'Tu Lanh',5),
                            (3,'Dieu Hoa',7),
                            (4,'Quat',1),
                            (5,'Bep Dien',2);
                            
insert into OrderDetail values(1,1,3),
								(1,3,7),
                                (1,4,2),
                                (2,1,1),
                                (3,1,8),
                                (2,5,4),
                                (2,3,3);
                                
-- Hiển thị các thông tin  gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng Order

select o.oID, o.oDate, p.pPrice
from `Order` as o,Product as p,OrderDetail as od
where o.oID=od.oID and p.pID=od.pID;

-- Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách

select c.cName,p.pName
from `Order` as o,Product as p,OrderDetail as od,Customer as c
where o.oID=od.oID and p.pID=od.pID and o.cID=c.cID;

-- Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách(c2)

select c.cName,p.pName
from OrderDetail as od  join Product as p on p.pID=od.pID  join `Order` as o on o.oID=od.oID join Customer as c on o.cID=c.cID ;


-- Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào

select cName
from Customer
where Customer.cID  not in ( select cID from `Order`);

-- 	Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn (giá một hóa đơn được tính bằng tổng giá bán 
-- của từng loại mặt hàng xuất hiện trong hóa đơn. Giá bán của từng loại được tính = odQTY*pPrice)

select od.oID,o.oDate,sum( od.odQTY*p.pPrice ) as thanhtien
from `Order` as o join OrderDetail as od on o.oID=od.oID join Product as p on p.pID=od.pID
group by o.oID;
