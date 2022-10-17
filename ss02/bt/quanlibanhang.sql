create database QuanLyBanHang;
use QuanLyBanHang;
create table Customer(
cID varchar(7) primary key,
cName nvarchar(50),
cAge int 
);
create table `Order`(
oID varchar(7) primary key,
cID varchar(7),
oDate datetime,
oTotalPrice float,
 foreign key (cID) references Customer(cID)
);
create table Product(
pID varchar(7) primary key,
pName nvarchar(50),
pPrice float
);
create table OrderDetail(
oID varchar(7),
pID varchar(7),
odQTY  nvarchar(255),
primary key (oID,pID),
foreign key (oID) references `Order`(oID),
foreign key (pID) references Product(pID)
);