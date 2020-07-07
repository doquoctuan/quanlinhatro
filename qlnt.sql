
-- 1. Thống kê tiền sử dụng dịch vụ của mỗi khách hàng ứng mỗi hợp đồng
select hoa_don.TenKhachHang, hoa_don.MaHopDong, SUM(chi_tiet_hoa_don.ThanhTien) as tongtien
from khach_hang, chi_tiet_hoa_don, hoa_don, dich_vu
where hoa_don.MaHopDong = chi_tiet_hoa_don.MaHopDong and
dich_vu.MaDichVu = chi_tiet_hoa_don.MaDV
group by hoa_don.TenKhachHang,hoa_don.MaHopDong

-- 2. Tìm những phòng mà khách đang thuê có họ 'Nguyễn'
SELECT *
FROM phong_tro
WHERE MAPHONG IN (
SELECT HD.MaPhong
FROM HOP_DONG HD, KHACH_HANG KH
WHERE HD.MAKHACHHANG = KH.MAKHACHHANG AND
KH.HOTEN LIKE N'Nguyễn%' and hd.hientrang = 1 
)

-- 3. Tìm thông tin khách hàng có hóa đơn cao nhất
SELECT *
FROM khach_hang
WHERE MaKhachHang IN (
SELECT hdg.MaKhachHang
FROM HOA_DON HDN, HOP_DONG HDG
WHERE HDN.MAHOPDONG = HDG.MAHOPDONG AND
TONGTIEN = (SELECT MAX(hoa_don.TongTien) FROM hoa_don)
)

-- 4. Tìm phòng có nhiều thiết bị nhất
SELECT TOP 1 phong_co_tb.MaPhong, COUNT (MATB) AS 'TONG'
FROM PHONG_CO_TB
GROUP BY MAPHONG
ORDER BY TONG DESC

-- 5. Tìm những khách hàng đã thuê trọ 2 lần trở lên
select * from khach_hang
where MaKhachHang IN (
select MaKhachHang 
from hop_dong 
group by MaKhachHang 
having COUNT(MaKhachHang) > 1
)

-- 6. Tìm doanh thu trung bình trong tháng 7 năm 2020 
SELECT AVG(TONGTIEN) as 'Doanh thu'
FROM HOA_DON
where YEAR(NgayLapHoaDon) = 2020 and MONTH(NgayLapHoaDon) = 7

-- 7. Xuất ra thông tin các hợp đồng đang thuê với ngày thuê giảm dần
SELECT *
FROM HOP_DONG
where GETDATE() >= NgayThue and GETDATE() <= NgayTra
order by hop_dong.NgayThue desc

-- 8. Tìm những khách hàng có ngày tháng năm sinh là 12-02-2000
SELECT *
FROM KHACH_HANG
WHERE khach_hang.NgaySinh LIKE '2000-12-02'

-- 9. Tìm những phòng đang trống
select *
from phong_tro
where phong_tro.HienTrang = 1

-- 10. Tìm những phòng trả vào ngày 31-07-2020
select *
from phong_tro
where phong_tro.MaPhong IN (select MaPhong
from hop_dong
where hop_dong.NgayTra = '2020-06-30')

-- 11. Tìm dịch vụ được sử dụng nhiều nhất
SELECT *
FROM dich_vu
WHERE dich_vu.MaDichVu IN (
select top 1 madv
from chi_tiet_hoa_don
group by madv
order by  count(*) desc 
)

-- 12. Tính tổng tiền thu được trong tháng 7 - 2020
SELECT SUM (TONGTIEN) as 'Tong Tien'
FROM HOA_DON
WHERE YEAR(NgayLapHoaDon) = 2020 and MONTH(NgayLapHoaDon) = 7

-- 13. Tìm hóa đơn cao nhất 
select *
from hoa_don
where TongTien = (SELECT MAX(TONGTIEN) as 'Tong'
from hoa_don
)

-- 14. Đưa ra tất cả các dịch vụ mà phòng P0001 sử dụng
select *
from dich_vu
where dich_vu.MaDichVu IN (select chi_tiet_hoa_don.MaDV
from chi_tiet_hoa_don, hop_dong
where chi_tiet_hoa_don.MaHopDong = hop_dong.MaHopDong and hop_dong.MaPhong = 'P0001')


-- 15. Đưa ra thông tin các khách hàng đang thuê là sinh viên
select *
from khach_hang
where khach_hang.Nghe = N'Sinh viên' and makhachhang IN (
select makhachhang
from hop_dong
where hientrang = 1)

-- 16. Đưa ra mã khách hàng, họ tên khách hàng và mã phòng 1 tháng nữa sẽ hết hạn hợp đồng
SELECT KHACH_HANG.MAKHACHHANG, KHACH_HANG.HOTEN, HOP_DONG.MAPHONG
FROM KHACH_HANG, PHONG_TRO, HOP_DONG
WHERE HOP_DONG.MAKHACHHANG = KHACH_HANG.MAKHACHHANG 
AND HOP_DONG.MAPHONG = PHONG_TRO.MAPHONG 
AND (MONTH(NGAYTRA) - MONTH(GETDATE()) = 1) AND YEAR(NGAYTRA) = YEAR(GETDATE())

-- 17. Đưa ra thông tin phòng có sử dụng dịch vụ WiFi trong tháng này
SELECT *
FROM PHONG_TRO
WHERE MAPHONG IN (
SELECT DISTINCT HOP_DONG.MAPHONG
FROM CHI_TIET_HOA_DON, DICH_VU, PHONG_TRO, HOP_DONG
WHERE CHI_TIET_HOA_DON.MADV = DICH_VU.MADICHVU AND HOP_DONG.MAPHONG = PHONG_TRO.MAPHONG AND CHI_TIET_HOA_DON.MADV = 'DV0001'
AND CHI_TIET_HOA_DON.MAHOPDONG = HOP_DONG.MAHOPDONG
)

-- 18. Đưa ra tên mã phòng thuê và số điện thoại của các khách hàng đang thuê trọ 
select hop_dong.MaPhong, khach_hang.SoDienThoai
from hop_dong, khach_hang
where hop_dong.MaKhachHang = khach_hang.MaKhachHang and hop_dong.HienTrang = 1


-- 19. Tìm mã khách hàng, tên khách hàng sử dụng nhiều hơn 3 dịch vụ trong tháng 7 - 2020
SELECT KHACH_HANG.MAKHACHHANG, KHACH_HANG.HOTEN
FROM HOP_DONG, KHACH_HANG
WHERE HOP_DONG.MAKHACHHANG = KHACH_HANG.MAKHACHHANG AND HOP_DONG.MAHOPDONG IN (
SELECT MAHOPDONG
FROM CHI_TIET_HOA_DON
GROUP BY MAHOPDONG
HAVING COUNT(*) > 2
) AND HOP_DONG.MAHOPDONG IN (
SELECT MAHOPDONG
FROM HOA_DON
WHERE MONTH(NGAYLAPHOADON) = 7 AND YEAR(NGAYLAPHOADON) = 2020
)

-- 20. Tìm khách hàng có thời gian thuê trọ lâu nhất
SELECT *
FROM KHACH_HANG
WHERE MAKHACHHANG IN (SELECT H1.MAKHACHHANG
FROM HOP_DONG H1
WHERE (SELECT COUNT(*) FROM HOP_DONG H2 WHERE DATEDIFF(DAY,H1.NGAYTRA, H1.NGAYTHUE) > DATEDIFF(DAY,H2.NGAYTRA, H2.NGAYTHUE)) < 1)

