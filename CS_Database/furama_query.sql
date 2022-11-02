
use furama;
-- cau 2:	Hiển thị thông tin của tất cả nhân viên có trong hệ thống có tên bắt đầu là một trong các ký tự “H”, “T” hoặc “K” và có tối đa 15 kí tự.
select * from nhan_vien
where ho_ten like 'T%'or ho_ten like 'H%'or ho_ten like 'K%'and length(ho_ten)<=15;

-- cau 3: 	Hiển thị thông tin của tất cả khách hàng có độ tuổi từ 18 đến 50 tuổi và có địa chỉ ở “Đà Nẵng” hoặc “Quảng Trị”.
select * from khach_hang
where datediff(curdate(),ngay_sinh)<=50*365 and datediff(curdate(),ngay_sinh)>=18*365 and dia_chi like '%Đà Nẵng%' or dia_chi like '%Quảng Trị%' ;

-- 4.	Đếm xem tương ứng với mỗi khách hàng đã từng đặt phòng bao nhiêu lần. Kết quả hiển thị được sắp xếp tăng dần theo số lần đặt phòng của khách hàng. Chỉ đếm những khách hàng nào có Tên loại khách hàng là “Diamond”.
select h.ma_khach_hang,k.ho_ten,count(h.ma_khach_hang) as so_lan_dat_phong 
from khach_hang k
join hop_dong h on k.ma_khach_hang=h.ma_khach_hang
join loai_khach l on l.ma_loai_khach=k.ma_loai_khach
group by  h.ma_khach_hang,l.ten_loai_khach
having l.ten_loai_khach like 'Diamond'
order by so_lan_dat_phong asc;

-- 5.Hiển thị ma_khach_hang, ho_ten, ten_loai_khach, ma_hop_dong, ten_dich_vu, ngay_lam_hop_dong, ngay_ket_thuc, tong_tien 
-- (Với tổng tiền được tính theo công thức như sau: Chi Phí Thuê + Số Lượng * Giá, với Số Lượng và Giá là từ bảng dich_vu_di_kem, hop_dong_chi_tiet) cho tất cả các khách hàng đã từng đặt phòng. (những khách hàng nào chưa từng đặt phòng cũng phải hiển thị ra).
select kh.ma_khach_hang,kh.ho_ten,lk.ten_loai_khach,hd.ma_hop_dong,dv.ten_dich_vu,hd.ngay_lam_hop_dong,hd.ngay_ket_thuc,(dv.chi_phi_thue + ifnull(sum(hdct.so_luong*dvdk.gia), 0)) as Tong_Tien
from khach_hang kh
left join hop_dong hd on kh.ma_khach_hang=hd.ma_khach_hang
left join loai_khach lk on kh.ma_loai_khach=lk.ma_loai_khach
left join dich_vu dv on hd.ma_dich_vu=dv.ma_dich_vu
left join hop_dong_chi_tiet hdct on hd.ma_hop_dong=hdct.ma_hop_dong
left join dich_vu_di_kem dvdk on hdct.ma_dich_vu_di_kem=dvdk.ma_dich_vu_di_kem
group by hd.ma_hop_dong
order by kh.ma_khach_hang;

-- 6.	Hiển thị ma_dich_vu, ten_dich_vu, dien_tich, chi_phi_thue, ten_loai_dich_vu của tất cả các loại dịch vụ chưa từng được khách hàng thực hiện đặt từ quý 1 của năm 2021 (Quý 1 là tháng 1, 2, 3).
select dv.ma_dich_vu, dv.ten_dich_vu, dv.dien_tich, dv.chi_phi_thue, ldv.ten_loai_dich_vu
from dich_vu dv
join loai_dich_vu ldv on dv.ma_loai_dich_vu=ldv.ma_loai_dich_vu
join hop_dong hd on hd.ma_dich_vu=dv.ma_dich_vu
where dv.ma_dich_vu not in (select hd.ma_dich_vu from hop_dong hd where date(hd.ngay_lam_hop_dong) >='2021-01-01' and date(hd.ngay_lam_hop_dong)  <='2021-04-01')
group by dv.ma_dich_vu;

-- 7.	Hiển thị thông tin ma_dich_vu, ten_dich_vu, dien_tich, so_nguoi_toi_da, chi_phi_thue, ten_loai_dich_vu 
-- của tất cả các loại dịch vụ đã từng được khách hàng đặt phòng trong năm 2020 nhưng chưa từng được khách hàng đặt phòng trong năm 2021.
select dv.ma_dich_vu, dv.ten_dich_vu, dv.dien_tich,dv.so_nguoi_toi_da, dv.chi_phi_thue, ldv.ten_loai_dich_vu
from dich_vu dv
join loai_dich_vu ldv on dv.ma_loai_dich_vu=ldv.ma_loai_dich_vu
join hop_dong hd on hd.ma_dich_vu=dv.ma_dich_vu
where dv.ma_dich_vu not in (select hd.ma_dich_vu from hop_dong hd where year(hd.ngay_lam_hop_dong) ='2021') and year(hd.ngay_lam_hop_dong)  ='2020'
group by dv.ma_dich_vu;

-- 8.	Hiển thị thông tin ho_ten khách hàng có trong hệ thống, với yêu cầu ho_ten không trùng nhau.
-- Học viên sử dụng theo 3 cách khác nhau để thực hiện yêu cầu trên.
select ho_ten from khach_hang group by ho_ten; -- c1
select distinct ho_ten from khach_hang ; -- c2
select ho_ten from khach_hang union select ho_ten from khach_hang; -- c3

-- 9.Thực hiện thống kê doanh thu theo tháng, nghĩa là tương ứng với mỗi tháng trong năm 2021 thì sẽ có bao nhiêu khách hàng thực hiện đặt phòng.
select month(ngay_lam_hop_dong) as thang,count(ma_khach_hang) as so_luong_khach_hang
from hop_dong
where year(ngay_lam_hop_dong)='2021'
group by thang
order by thang;

-- 10.	Hiển thị thông tin tương ứng với từng hợp đồng thì đã sử dụng bao nhiêu dịch vụ đi kèm. Kết quả hiển thị bao gồm 
-- ma_hop_dong, ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc, so_luong_dich_vu_di_kem (được tính dựa trên việc sum so_luong ở dich_vu_di_kem).
select hd.ma_hop_dong,hd.ngay_lam_hop_dong,hd.ngay_ket_thuc,hd.tien_dat_coc,sum(hdct.so_luong) as so_luong_dich_vu_di_kem
from dich_vu_di_kem dvdk
left join hop_dong_chi_tiet hdct on dvdk.ma_dich_vu_di_kem=hdct.ma_dich_vu_di_kem
right join hop_dong hd on hdct.ma_hop_dong =hd.ma_hop_dong
 group by hd.ma_hop_dong;

-- 11.	Hiển thị thông tin các dịch vụ đi kèm đã được sử dụng bởi những khách hàng có ten_loai_khach là “Diamond” và có dia_chi ở “Vinh” hoặc “Quảng Ngãi”.
select dvdk.ma_dich_vu_di_kem,dvdk.ten_dich_vu_di_kem
from dich_vu_di_kem dvdk
join hop_dong_chi_tiet hdct on hdct.ma_dich_vu_di_kem=dvdk.ma_dich_vu_di_kem
join hop_dong hd on hdct.ma_hop_dong=hd.ma_hop_dong
join khach_hang kh on hd.ma_khach_hang=kh.ma_khach_hang
join loai_khach lk on kh.ma_loai_khach=lk.ma_loai_khach
where lk.ten_loai_khach='Diamond' and kh.dia_chi like '%Vinh%' or kh.dia_chi like '%Quãng Ngãi%';

-- 12.Hiển thị thông tin ma_hop_dong, ho_ten (nhân viên), ho_ten (khách hàng), so_dien_thoai (khách hàng), ten_dich_vu,
-- so_luong_dich_vu_di_kem (được tính dựa trên việc sum so_luong ở dich_vu_di_kem), tien_dat_coc của tất cả các dịch vụ 
-- đã từng được khách hàng đặt vào 3 tháng cuối năm 2020 nhưng chưa từng được khách hàng đặt vào 6 tháng đầu năm 2021.
select hd.ma_hop_dong,nv.ho_ten as ho_ten_nhan_vien,kh.ho_ten as ho_ten_khach_hang,kh.so_dien_thoai,dv.ma_dich_vu,dv.ten_dich_vu,sum(so_luong)as so_luong_dich_vu_di_kem,hd.tien_dat_coc
from hop_dong hd
left join khach_hang kh on hd.ma_khach_hang=kh.ma_khach_hang
left join nhan_vien nv on nv.ma_nhan_vien=hd.ma_nhan_vien
left join dich_vu dv on dv.ma_dich_vu=hd.ma_dich_vu
left join hop_dong_chi_tiet hdct on hdct.ma_hop_dong=hd.ma_hop_dong
left join dich_vu_di_kem dvdk on dvdk.ma_dich_vu_di_kem=hdct.ma_dich_vu_di_kem
where (date(hd.ngay_lam_hop_dong) >= '2020-10-01' and date(hd.ngay_lam_hop_dong) <= '2020-12-31') and not (date(hd.ngay_lam_hop_dong) >= '2021-01-01' and date(hd.ngay_lam_hop_dong) <= '2021-06-30')
group by hd.ma_hop_dong;

-- 13.	Hiển thị thông tin các Dịch vụ đi kèm được sử dụng nhiều nhất bởi các Khách hàng đã đặt phòng. 
-- (Lưu ý là có thể có nhiều dịch vụ có số lần sử dụng nhiều như nhau).
select dvdk.ma_dich_vu_di_kem,dvdk.ten_dich_vu_di_kem,sum(hdct.so_luong)as so_luong_dich_vu_di_kem
from hop_dong_chi_tiet hdct
join dich_vu_di_kem dvdk on dvdk.ma_dich_vu_di_kem=hdct.ma_dich_vu_di_kem
group by hdct.ma_dich_vu_di_kem
having  sum(hdct.so_luong)=(select max(tam.a) from (select  sum(hdct.so_luong)as a from hop_dong_chi_tiet hdct group by hdct.ma_dich_vu_di_kem)as tam);

-- 14.	Hiển thị thông tin tất cả các Dịch vụ đi kèm chỉ mới được sử dụng một lần duy nhất.Thông tin hiển thị 
-- bao gồm ma_hop_dong, ten_loai_dich_vu, ten_dich_vu_di_kem, so_lan_su_dung (được tính dựa trên việc count các ma_dich_vu_di_kem).
select  hd.ma_hop_dong,ldv.ten_loai_dich_vu,dvdk.ten_dich_vu_di_kem,count(hdct.ma_dich_vu_di_kem) as so_lan_su_dung
from hop_dong hd
join dich_vu dv on hd.ma_dich_vu=dv.ma_dich_vu
join loai_dich_vu ldv on dv.ma_loai_dich_vu=ldv.ma_loai_dich_vu
right join hop_dong_chi_tiet hdct on hd.ma_hop_dong=hdct.ma_hop_dong
join dich_vu_di_kem dvdk on dvdk.ma_dich_vu_di_kem=hdct.ma_dich_vu_di_kem
group by hdct.ma_dich_vu_di_kem
having count(hdct.ma_dich_vu_di_kem)=1
order by hdct.ma_hop_dong;

-- 15.	Hiển thi thông tin của tất cả nhân viên bao gồm 
-- ma_nhan_vien, ho_ten, ten_trinh_do, ten_bo_phan, so_dien_thoai, dia_chi mới chỉ lập được tối đa 3 hợp đồng từ năm 2020 đến 2021.
select nv.ma_nhan_vien,nv.ho_ten,td.ten_trinh_do,bp.ten_bo_phan,nv.so_dien_thoai,nv.dia_chi
from nhan_vien nv
join trinh_do td on nv.ma_trinh_do=td.ma_trinh_do
join bo_phan bp on nv.ma_bo_phan=bp.ma_bo_phan
join hop_dong hd on nv.ma_nhan_vien=hd.ma_nhan_vien
group by nv.ma_nhan_vien
having count(hd.ma_nhan_vien)<=3;

-- 16.	Xóa những Nhân viên chưa từng lập được hợp đồng nào từ năm 2019 đến năm 2021.
delete from nhan_vien
where ma_nhan_vien not in (select ma_nhan_vien from hop_dong group by ma_nhan_vien);

-- 17.	Cập nhật thông tin những khách hàng có ten_loai_khach từ Platinum lên Diamond, chỉ cập nhật những khách hàng đã từng đặt phòng với Tổng Tiền thanh toán trong năm 2021 là lớn hơn 10.000.000 VNĐ.
update khach_hang
set ma_loai_khach=1
where ma_khach_hang =(select tam.a from (select kh.ma_khach_hang as a from hop_dong hd
						right join khach_hang kh on hd.ma_khach_hang=kh.ma_khach_hang
						 join nhan_vien nv on nv.ma_nhan_vien=hd.ma_nhan_vien
						 join dich_vu dv on dv.ma_dich_vu=hd.ma_dich_vu
						 join hop_dong_chi_tiet hdct on hdct.ma_hop_dong=hd.ma_hop_dong
						 join dich_vu_di_kem dvdk on dvdk.ma_dich_vu_di_kem=hdct.ma_dich_vu_di_kem
                         where chi_phi_thue+so_luong*gia>=10000000 and  year(hd.ngay_lam_hop_dong)=2021)as tam);
-- 18.	Xóa những khách hàng có hợp đồng trước năm 2021 (chú ý ràng buộc giữa các bảng). =>  chưa đúng
delete  hop_dong_chi_tiet from hop_dong join hop_dong_chi_tiet on hop_dong_chi_tiet.ma_hop_dong=hop_dong.ma_hop_dong join khach_hang on khach_hang.ma_khach_hang=hop_dong.ma_khach_hang
where khach_hang.ma_khach_hang  in (select tam.a from (select hop_dong.ma_khach_hang as a from hop_dong where date(hop_dong.ngay_lam_hop_dong)<'2021-01-01') as tam);
delete  hop_dong,khach_hang from hop_dong join khach_hang on khach_hang.ma_khach_hang=hop_dong.ma_khach_hang
where khach_hang.ma_khach_hang  in (select tam.a from (select hop_dong.ma_khach_hang as a from hop_dong where date(hop_dong.ngay_lam_hop_dong)<'2021-01-01') as tam) 
and hop_dong.ma_khach_hang in (select tam.a from (select hop_dong.ma_khach_hang as a from hop_dong where date(hop_dong.ngay_lam_hop_dong)<'2021-01-01') as tam);

-- 19.	Cập nhật giá cho các dịch vụ đi kèm được sử dụng trên 10 lần trong năm 2020 lên gấp đôi.
update dich_vu_di_kem
set gia=gia*2
where ma_dich_vu_di_kem in (select tam.a from (
						select hop_dong_chi_tiet.ma_dich_vu_di_kem as a from hop_dong_chi_tiet 
						join dich_vu_di_kem on dich_vu_di_kem.ma_dich_vu_di_kem=hop_dong_chi_tiet.ma_dich_vu_di_kem 
						join hop_dong on hop_dong.ma_hop_dong=hop_dong_chi_tiet.ma_hop_dong 
                        where year(hop_dong.ngay_lam_hop_dong)='2020'
						group by hop_dong_chi_tiet.ma_dich_vu_di_kem 
						having sum(so_luong)>10 )as tam);

-- 20.	Hiển thị thông tin của tất cả các nhân viên và khách hàng có trong hệ thống, thông tin hiển thị bao gồm
-- id (ma_nhan_vien, ma_khach_hang), ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi.
select ma_nhan_vien,ho_ten,email, so_dien_thoai, ngay_sinh, dia_chi
from nhan_vien
union all
select ma_khach_hang,ho_ten,email, so_dien_thoai, ngay_sinh, dia_chi
from khach_hang;

-- 21.	Tạo khung nhìn có tên là v_nhan_vien để lấy được thông tin của tất cả các nhân viên có địa chỉ là “Đà Nẵng” 
-- và đã từng lập hợp đồng cho một hoặc nhiều khách hàng bất kì với năm lập hợp đồng là “2021”.
create view  v_nhan_vien as
select nv.ma_nhan_vien,ho_ten,ngay_sinh,so_cmnd,luong,so_dien_thoai,email,dia_chi,ma_vi_tri,ma_trinh_do,ma_bo_phan  
from nhan_vien nv join hop_dong hd on nv.ma_nhan_vien=hd.ma_nhan_vien
where year(hd.ngay_lam_hop_dong)='2021' and nv.dia_chi like '%Đà Nẵng%'
group by nv.ma_nhan_vien;

select * from v_nhan_vien;

-- 22.	Thông qua khung nhìn v_nhan_vien thực hiện cập nhật địa chỉ thành “Long An” đối với tất cả các nhân viên được nhìn thấy bởi khung nhìn này.
update nhan_vien 
set dia_chi= 'Long An'
where ma_nhan_vien in (select tam.a from (select nv.ma_nhan_vien as a
						from nhan_vien nv join hop_dong hd on nv.ma_nhan_vien=hd.ma_nhan_vien
						where year(hd.ngay_lam_hop_dong)='2021' and nv.dia_chi like '%Đà Nẵng%'
						group by nv.ma_nhan_vien)as tam);

-- 23.	Tạo Stored Procedure sp_xoa_khach_hang dùng để xóa thông tin của một khách hàng nào đó với ma_khach_hang được truyền vào 
-- như là 1 tham số của sp_xoa_khach_hang.
DELIMITER //
CREATE PROCEDURE sp_xoa_khach_hang(in ma_xoa  int)
BEGIN
	delete  hop_dong_chi_tiet from hop_dong join hop_dong_chi_tiet on hop_dong_chi_tiet.ma_hop_dong=hop_dong.ma_hop_dong join khach_hang on khach_hang.ma_khach_hang=hop_dong.ma_khach_hang
	where khach_hang.ma_khach_hang  =ma_xoa;
	delete  hop_dong,khach_hang from hop_dong join khach_hang on khach_hang.ma_khach_hang=hop_dong.ma_khach_hang
	where khach_hang.ma_khach_hang  =ma_xoa 
	and hop_dong.ma_khach_hang =ma_xoa;
END //
DELIMITER ;

call sp_xoa_khach_hang(7);

-- 24.	Tạo Stored Procedure sp_them_moi_hop_dong dùng để thêm mới vào bảng hop_dong với yêu cầu sp_them_moi_hop_dong phải thực hiện 
-- kiểm tra tính hợp lệ của dữ liệu bổ sung, với nguyên tắc không được trùng khóa chính và đảm bảo toàn vẹn tham chiếu đến các bảng liên quan.

