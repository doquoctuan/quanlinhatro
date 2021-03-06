USE [master]
GO
-- Tạo cơ sở dữ liệu quản lí nhà trọ
CREATE DATABASE [quanlinhatro2]

-- Tạo bảng Chi_tiet_hoa_don
USE [quanlinhatro2]
GO

CREATE TABLE [dbo].[chi_tiet_hoa_don](
	[MaCTHD] [char](10) NOT NULL,
	[MaDV] [char](10) NOT NULL,
	[SoLuong] [int] NOT NULL,
	[DonGia] [float] NOT NULL,
	[ThanhTien] [float] NOT NULL,
	[MaHopDong] [char](10) NOT NULL,
 CONSTRAINT [PK_chi_tiet_hoa_don_1] PRIMARY KEY CLUSTERED 
(
	[MaCTHD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Tạo bảng Dich_vu
CREATE TABLE [dbo].[dich_vu](
	[MaDichVu] [char](10) NOT NULL,
	[TenDichVu] [nvarchar](50) NOT NULL,
	[GiaDichVu] [float] NOT NULL,
 CONSTRAINT [PK_dich_vu] PRIMARY KEY CLUSTERED 
(
	[MaDichVu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Tạo bảng Hoa_don

CREATE TABLE [dbo].[hoa_don](
	[MaHoaDon] [char](10) NOT NULL,
	[TongTien] [float] NOT NULL,
	[NgayLapHoaDon] [date] NOT NULL,
	[TenKhachHang] [nvarchar](50) NOT NULL,
	[MaHopDong] [char](10) NOT NULL,
	[MaPhong] [char](10) NOT NULL,
	[TienDichVu] [float] NULL,
	[TienPhong] [float] NOT NULL,
	[NguoiTao] [nvarchar](50) NULL,
 CONSTRAINT [PK_hoa_don] PRIMARY KEY CLUSTERED 
(
	[MaHoaDon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

-- Tao bảng Hop_dong

CREATE TABLE [dbo].[hop_dong](
	[MaHopDong] [char](10) NOT NULL,
	[NgayThue] [date] NOT NULL,
	[NgayTra] [date] NOT NULL,
	[MaPhong] [char](10) NOT NULL,
	[MaKhachHang] [char](10) NOT NULL,
	[HienTrang] [bit] NOT NULL,
	[NguoiTao] [nvarchar](50) NULL,
 CONSTRAINT [PK_hop_dong] PRIMARY KEY CLUSTERED 
(
	[MaHopDong] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Tao bảng Khach_hang

CREATE TABLE [dbo].[khach_hang](
	[MaKhachHang] [char](10) NOT NULL,
	[HoTen] [nvarchar](50) NOT NULL,
	[CMND] [char](20) NOT NULL,
	[GioiTinh] [bit] NOT NULL,
	[SoDienThoai] [char](10) NOT NULL,
	[Nghe] [nvarchar](20) NOT NULL,
	[DiaChi] [nvarchar](80) NOT NULL,
	[NgaySinh] [date] NOT NULL,
 CONSTRAINT [PK_khach_hang] PRIMARY KEY CLUSTERED 
(
	[MaKhachHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Tạo bảng Nguoi_dung
CREATE TABLE [dbo].[nguoi_dung](
	[taikhoan] [nvarchar](50) NOT NULL,
	[matkhau] [nvarchar](50) NOT NULL,
	[quyen] [nvarchar](20) NULL,
 CONSTRAINT [PK_tai_khoan] PRIMARY KEY CLUSTERED 
(
	[taikhoan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Tạo bảng phòng có thiết bị
CREATE TABLE [dbo].[phong_co_tb](
	[maphong] [char](10) NOT NULL,
	[matb] [char](10) NOT NULL,
	[soluong] [int] NOT NULL
) ON [PRIMARY]
GO

-- Tạo bảng phòng trọ

CREATE TABLE [dbo].[phong_tro](
	[MaPhong] [char](10) NOT NULL,
	[LoaiPhong] [nvarchar](50) NOT NULL,
	[GiaPhong] [float] NOT NULL,
	[HienTrang] [nvarchar](20) NOT NULL,
	[Day] [char](10) NOT NULL,
 CONSTRAINT [PK_phong_tro] PRIMARY KEY CLUSTERED 
(
	[MaPhong] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Tạo bảng thiết bị

CREATE TABLE [dbo].[thiet_bi](
	[matb] [char](10) NOT NULL,
	[tenthietbi] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_thiet_bi] PRIMARY KEY CLUSTERED 
(
	[matb] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Thêm dữ liệu bảng Chi_tiet_hoa_don

INSERT [dbo].[chi_tiet_hoa_don] ([MaCTHD], [MaDV], [SoLuong], [DonGia], [ThanhTien], [MaHopDong]) VALUES (N'DKDV0001  ', N'DV0001    ', 1, 220000, 220000, N'HD0001    ')
INSERT [dbo].[chi_tiet_hoa_don] ([MaCTHD], [MaDV], [SoLuong], [DonGia], [ThanhTien], [MaHopDong]) VALUES (N'DKDV0002  ', N'DV0003    ', 1, 15000, 15000, N'HD0001    ')
INSERT [dbo].[chi_tiet_hoa_don] ([MaCTHD], [MaDV], [SoLuong], [DonGia], [ThanhTien], [MaHopDong]) VALUES (N'DKDV0003  ', N'DV0004    ', 1, 100000, 100000, N'HD0001    ')
INSERT [dbo].[chi_tiet_hoa_don] ([MaCTHD], [MaDV], [SoLuong], [DonGia], [ThanhTien], [MaHopDong]) VALUES (N'DKDV0004  ', N'DV0005    ', 10, 4000, 40000, N'HD0001    ')
INSERT [dbo].[chi_tiet_hoa_don] ([MaCTHD], [MaDV], [SoLuong], [DonGia], [ThanhTien], [MaHopDong]) VALUES (N'DKDV0005  ', N'DV0002    ', 10, 10000, 100000, N'HD0001    ')
INSERT [dbo].[chi_tiet_hoa_don] ([MaCTHD], [MaDV], [SoLuong], [DonGia], [ThanhTien], [MaHopDong]) VALUES (N'DKDV0006  ', N'DV0001    ', 1, 220000, 220000, N'HD0006    ')
INSERT [dbo].[chi_tiet_hoa_don] ([MaCTHD], [MaDV], [SoLuong], [DonGia], [ThanhTien], [MaHopDong]) VALUES (N'DKDV0007  ', N'DV0003    ', 1, 15000, 15000, N'HD0006    ')
INSERT [dbo].[chi_tiet_hoa_don] ([MaCTHD], [MaDV], [SoLuong], [DonGia], [ThanhTien], [MaHopDong]) VALUES (N'DKDV0008  ', N'DV0004    ', 4, 100000, 400000, N'HD0006    ')
INSERT [dbo].[chi_tiet_hoa_don] ([MaCTHD], [MaDV], [SoLuong], [DonGia], [ThanhTien], [MaHopDong]) VALUES (N'DKDV0009  ', N'DV0005    ', 60, 4000, 240000, N'HD0006    ')
INSERT [dbo].[chi_tiet_hoa_don] ([MaCTHD], [MaDV], [SoLuong], [DonGia], [ThanhTien], [MaHopDong]) VALUES (N'DKDV0010  ', N'DV0002    ', 50, 10000, 500000, N'HD0006    ')
INSERT [dbo].[chi_tiet_hoa_don] ([MaCTHD], [MaDV], [SoLuong], [DonGia], [ThanhTien], [MaHopDong]) VALUES (N'DKDV0011  ', N'DV0001    ', 1, 220000, 220000, N'HD0008    ')
INSERT [dbo].[chi_tiet_hoa_don] ([MaCTHD], [MaDV], [SoLuong], [DonGia], [ThanhTien], [MaHopDong]) VALUES (N'DKDV0012  ', N'DV0003    ', 1, 15000, 15000, N'HD0008    ')
INSERT [dbo].[chi_tiet_hoa_don] ([MaCTHD], [MaDV], [SoLuong], [DonGia], [ThanhTien], [MaHopDong]) VALUES (N'DKDV0013  ', N'DV0005    ', 50, 4000, 200000, N'HD0008    ')
INSERT [dbo].[chi_tiet_hoa_don] ([MaCTHD], [MaDV], [SoLuong], [DonGia], [ThanhTien], [MaHopDong]) VALUES (N'DKDV0014  ', N'DV0004    ', 10, 100000, 1000000, N'HD0008    ')

-- Thêm dữ liệu bảng Dich_vu

INSERT [dbo].[dich_vu] ([MaDichVu], [TenDichVu], [GiaDichVu]) VALUES (N'DV0001    ', N'Wifi', 220000)
INSERT [dbo].[dich_vu] ([MaDichVu], [TenDichVu], [GiaDichVu]) VALUES (N'DV0002    ', N'Nước', 10000)
INSERT [dbo].[dich_vu] ([MaDichVu], [TenDichVu], [GiaDichVu]) VALUES (N'DV0003    ', N'Rác', 15000)
INSERT [dbo].[dich_vu] ([MaDichVu], [TenDichVu], [GiaDichVu]) VALUES (N'DV0004    ', N'Dọn phòng', 100000)
INSERT [dbo].[dich_vu] ([MaDichVu], [TenDichVu], [GiaDichVu]) VALUES (N'DV0005    ', N'Điện', 4000)

-- Thêm dữ liệu bảng Hoa_don

INSERT [dbo].[hoa_don] ([MaHoaDon], [TongTien], [NgayLapHoaDon], [TenKhachHang], [MaHopDong], [MaPhong], [TienDichVu], [TienPhong], [NguoiTao]) VALUES (N'HDON001   ', 2475000, CAST(N'2020-07-07' AS Date), N'Nguyễn Văn An', N'HD0001    ', N'P0001     ', 475000, 2000000, N'admin')
INSERT [dbo].[hoa_don] ([MaHoaDon], [TongTien], [NgayLapHoaDon], [TenKhachHang], [MaHopDong], [MaPhong], [TienDichVu], [TienPhong], [NguoiTao]) VALUES (N'HDON002   ', 2419000, CAST(N'2020-06-07' AS Date), N'Trần Văn Long', N'HD0006    ', N'P0007     ', 419000, 2000000, N'admin')
INSERT [dbo].[hoa_don] ([MaHoaDon], [TongTien], [NgayLapHoaDon], [TenKhachHang], [MaHopDong], [MaPhong], [TienDichVu], [TienPhong], [NguoiTao]) VALUES (N'HDON003   ', 2443000, CAST(N'2020-01-07' AS Date), N'Trần Văn Long', N'HD0006    ', N'P0007     ', 443000, 2000000, N'admin')
INSERT [dbo].[hoa_don] ([MaHoaDon], [TongTien], [NgayLapHoaDon], [TenKhachHang], [MaHopDong], [MaPhong], [TienDichVu], [TienPhong], [NguoiTao]) VALUES (N'HDON004   ', 2513000, CAST(N'2020-02-07' AS Date), N'Trần Văn Long', N'HD0006    ', N'P0007     ', 513000, 2000000, N'admin')
INSERT [dbo].[hoa_don] ([MaHoaDon], [TongTien], [NgayLapHoaDon], [TenKhachHang], [MaHopDong], [MaPhong], [TienDichVu], [TienPhong], [NguoiTao]) VALUES (N'HDON005   ', 2813000, CAST(N'2020-03-07' AS Date), N'Trần Văn Long', N'HD0006    ', N'P0007     ', 813000, 2000000, N'admin')
INSERT [dbo].[hoa_don] ([MaHoaDon], [TongTien], [NgayLapHoaDon], [TenKhachHang], [MaHopDong], [MaPhong], [TienDichVu], [TienPhong], [NguoiTao]) VALUES (N'HDON006   ', 3375000, CAST(N'2020-05-07' AS Date), N'Trần Văn Long', N'HD0006    ', N'P0007     ', 1375000, 2000000, N'admin')
INSERT [dbo].[hoa_don] ([MaHoaDon], [TongTien], [NgayLapHoaDon], [TenKhachHang], [MaHopDong], [MaPhong], [TienDichVu], [TienPhong], [NguoiTao]) VALUES (N'HDON007   ', 3555000, CAST(N'2020-06-07' AS Date), N'Trần Lâm Hùng', N'HD0008    ', N'P0009     ', 1055000, 2500000, N'admin')
INSERT [dbo].[hoa_don] ([MaHoaDon], [TongTien], [NgayLapHoaDon], [TenKhachHang], [MaHopDong], [MaPhong], [TienDichVu], [TienPhong], [NguoiTao]) VALUES (N'HDON008   ', 3935000, CAST(N'2020-05-07' AS Date), N'Trần Lâm Hùng', N'HD0008    ', N'P0009     ', 1435000, 2500000, N'admin')
INSERT [dbo].[hoa_don] ([MaHoaDon], [TongTien], [NgayLapHoaDon], [TenKhachHang], [MaHopDong], [MaPhong], [TienDichVu], [TienPhong], [NguoiTao]) VALUES (N'HDON009   ', 3375000, CAST(N'2020-04-07' AS Date), N'Trần Văn Long', N'HD0006    ', N'P0007     ', 1375000, 2000000, N'admin')
INSERT [dbo].[hoa_don] ([MaHoaDon], [TongTien], [NgayLapHoaDon], [TenKhachHang], [MaHopDong], [MaPhong], [TienDichVu], [TienPhong], [NguoiTao]) VALUES (N'HDON010   ', 3935000, CAST(N'2020-02-07' AS Date), N'Trần Lâm Hùng', N'HD0008    ', N'P0009     ', 1435000, 2500000, N'admin')

-- Thêm dữ liệu bảng Hop_dong

INSERT [dbo].[hop_dong] ([MaHopDong], [NgayThue], [NgayTra], [MaPhong], [MaKhachHang], [HienTrang], [NguoiTao]) VALUES (N'HD0001    ', CAST(N'2020-07-07' AS Date), CAST(N'2021-07-07' AS Date), N'P0001     ', N'KH0001    ', 1, N'admin')
INSERT [dbo].[hop_dong] ([MaHopDong], [NgayThue], [NgayTra], [MaPhong], [MaKhachHang], [HienTrang], [NguoiTao]) VALUES (N'HD0002    ', CAST(N'2020-07-07' AS Date), CAST(N'2021-01-07' AS Date), N'P0002     ', N'KH0002    ', 1, N'admin')
INSERT [dbo].[hop_dong] ([MaHopDong], [NgayThue], [NgayTra], [MaPhong], [MaKhachHang], [HienTrang], [NguoiTao]) VALUES (N'HD0003    ', CAST(N'2020-07-07' AS Date), CAST(N'2021-01-07' AS Date), N'P0003     ', N'KH0003    ', 1, N'admin')
INSERT [dbo].[hop_dong] ([MaHopDong], [NgayThue], [NgayTra], [MaPhong], [MaKhachHang], [HienTrang], [NguoiTao]) VALUES (N'HD0004    ', CAST(N'2020-07-07' AS Date), CAST(N'2020-10-07' AS Date), N'P0004     ', N'KH0004    ', 1, N'admin')
INSERT [dbo].[hop_dong] ([MaHopDong], [NgayThue], [NgayTra], [MaPhong], [MaKhachHang], [HienTrang], [NguoiTao]) VALUES (N'HD0005    ', CAST(N'2020-07-07' AS Date), CAST(N'2021-07-07' AS Date), N'P0005     ', N'KH0005    ', 1, N'admin')
INSERT [dbo].[hop_dong] ([MaHopDong], [NgayThue], [NgayTra], [MaPhong], [MaKhachHang], [HienTrang], [NguoiTao]) VALUES (N'HD0006    ', CAST(N'2020-01-01' AS Date), CAST(N'2021-01-01' AS Date), N'P0007     ', N'KH0008    ', 1, N'admin')
INSERT [dbo].[hop_dong] ([MaHopDong], [NgayThue], [NgayTra], [MaPhong], [MaKhachHang], [HienTrang], [NguoiTao]) VALUES (N'HD0007    ', CAST(N'2020-02-07' AS Date), CAST(N'2020-07-07' AS Date), N'P0008     ', N'KH0010    ', 1, N'admin')
INSERT [dbo].[hop_dong] ([MaHopDong], [NgayThue], [NgayTra], [MaPhong], [MaKhachHang], [HienTrang], [NguoiTao]) VALUES (N'HD0008    ', CAST(N'2020-01-08' AS Date), CAST(N'2020-07-08' AS Date), N'P0009     ', N'KH0009    ', 1, N'admin')

-- Thêm dữ liệu bảng Khach_hang

INSERT [dbo].[khach_hang] ([MaKhachHang], [HoTen], [CMND], [GioiTinh], [SoDienThoai], [Nghe], [DiaChi], [NgaySinh]) VALUES (N'KH0001    ', N'Nguyễn Văn An', N'2365897854          ', 1, N'0369874582', N'Sinh Viên', N'Quận 9, TP. HCM', CAST(N'2000-12-02' AS Date))
INSERT [dbo].[khach_hang] ([MaKhachHang], [HoTen], [CMND], [GioiTinh], [SoDienThoai], [Nghe], [DiaChi], [NgaySinh]) VALUES (N'KH0002    ', N'Lê Văn Chí', N'2647845236          ', 1, N'0379854785', N'Sinh Viên', N'Quận 8, TP. HCM', CAST(N'2000-12-02' AS Date))
INSERT [dbo].[khach_hang] ([MaKhachHang], [HoTen], [CMND], [GioiTinh], [SoDienThoai], [Nghe], [DiaChi], [NgaySinh]) VALUES (N'KH0003    ', N'Ngô Văn Long', N'2688997585          ', 1, N'0772697852', N'Công Nhân', N'Quận 1, TP. HCM', CAST(N'2000-12-02' AS Date))
INSERT [dbo].[khach_hang] ([MaKhachHang], [HoTen], [CMND], [GioiTinh], [SoDienThoai], [Nghe], [DiaChi], [NgaySinh]) VALUES (N'KH0004    ', N'Lê Thị Vi', N'2648978561          ', 0, N'0369788954', N'Sinh Viên', N'Quận 10, TP. HCM', CAST(N'2000-12-02' AS Date))
INSERT [dbo].[khach_hang] ([MaKhachHang], [HoTen], [CMND], [GioiTinh], [SoDienThoai], [Nghe], [DiaChi], [NgaySinh]) VALUES (N'KH0005    ', N'Nguyễn Thị Ngọc Yến', N'2648897826          ', 0, N'0369745896', N'Sinh Viên', N'Quận 9, TP. HCM', CAST(N'2000-12-02' AS Date))
INSERT [dbo].[khach_hang] ([MaKhachHang], [HoTen], [CMND], [GioiTinh], [SoDienThoai], [Nghe], [DiaChi], [NgaySinh]) VALUES (N'KH0006    ', N'Nguyễn Chí Tường', N'2063578994          ', 1, N'0369788959', N'SEO', N'Quận 3, TP. HCM', CAST(N'2000-12-02' AS Date))
INSERT [dbo].[khach_hang] ([MaKhachHang], [HoTen], [CMND], [GioiTinh], [SoDienThoai], [Nghe], [DiaChi], [NgaySinh]) VALUES (N'KH0007    ', N'Lê Thị Uyên', N'2036977895          ', 0, N'0773648978', N'Nhân Viên', N'Quận 4, TP. HCM', CAST(N'2000-12-02' AS Date))
INSERT [dbo].[khach_hang] ([MaKhachHang], [HoTen], [CMND], [GioiTinh], [SoDienThoai], [Nghe], [DiaChi], [NgaySinh]) VALUES (N'KH0008    ', N'Trần Văn Long', N'2697899496          ', 1, N'0397897495', N'Sinh Viên', N'Quận 9, TP. HCM', CAST(N'2000-12-02' AS Date))
INSERT [dbo].[khach_hang] ([MaKhachHang], [HoTen], [CMND], [GioiTinh], [SoDienThoai], [Nghe], [DiaChi], [NgaySinh]) VALUES (N'KH0009    ', N'Trần Lâm Hùng', N'2698975499          ', 1, N'0326975465', N'Sinh Viên', N'Quận 9, TP. HCM', CAST(N'2000-12-02' AS Date))
INSERT [dbo].[khach_hang] ([MaKhachHang], [HoTen], [CMND], [GioiTinh], [SoDienThoai], [Nghe], [DiaChi], [NgaySinh]) VALUES (N'KH0010    ', N'Nguyễn Uyên Như', N'2369748955          ', 0, N'2369748955', N'Sinh Viên', N'Quận 9, TP. HCM', CAST(N'2000-12-02' AS Date))

-- Thêm dữ liệu bảng Nguoi_dung
INSERT [dbo].[nguoi_dung] ([taikhoan], [matkhau], [quyen]) VALUES (N'admin', N'admin', N'admin')
INSERT [dbo].[nguoi_dung] ([taikhoan], [matkhau], [quyen]) VALUES (N'chitrung', N'123456', N'nhanvien')

-- Thêm dữ liệu bảng Phong_co_tb
INSERT [dbo].[phong_co_tb] ([maphong], [matb], [soluong]) VALUES (N'P0001     ', N'TB001     ', 1)
INSERT [dbo].[phong_co_tb] ([maphong], [matb], [soluong]) VALUES (N'P0001     ', N'TB002     ', 1)
INSERT [dbo].[phong_co_tb] ([maphong], [matb], [soluong]) VALUES (N'P0001     ', N'TB003     ', 1)
INSERT [dbo].[phong_co_tb] ([maphong], [matb], [soluong]) VALUES (N'P0001     ', N'TB004     ', 1)
INSERT [dbo].[phong_co_tb] ([maphong], [matb], [soluong]) VALUES (N'P0001     ', N'TB005     ', 1)
INSERT [dbo].[phong_co_tb] ([maphong], [matb], [soluong]) VALUES (N'P0001     ', N'TB008     ', 1)
INSERT [dbo].[phong_co_tb] ([maphong], [matb], [soluong]) VALUES (N'P0002     ', N'TB005     ', 1)
INSERT [dbo].[phong_co_tb] ([maphong], [matb], [soluong]) VALUES (N'P0002     ', N'TB004     ', 1)
INSERT [dbo].[phong_co_tb] ([maphong], [matb], [soluong]) VALUES (N'P0002     ', N'TB006     ', 2)
INSERT [dbo].[phong_co_tb] ([maphong], [matb], [soluong]) VALUES (N'P0003     ', N'TB001     ', 1)
INSERT [dbo].[phong_co_tb] ([maphong], [matb], [soluong]) VALUES (N'P0003     ', N'TB006     ', 1)
INSERT [dbo].[phong_co_tb] ([maphong], [matb], [soluong]) VALUES (N'P0004     ', N'TB003     ', 1)
INSERT [dbo].[phong_co_tb] ([maphong], [matb], [soluong]) VALUES (N'P0004     ', N'TB005     ', 1)
INSERT [dbo].[phong_co_tb] ([maphong], [matb], [soluong]) VALUES (N'P0004     ', N'TB009     ', 1)
INSERT [dbo].[phong_co_tb] ([maphong], [matb], [soluong]) VALUES (N'P0005     ', N'TB001     ', 1)
INSERT [dbo].[phong_co_tb] ([maphong], [matb], [soluong]) VALUES (N'P0005     ', N'TB009     ', 1)
INSERT [dbo].[phong_co_tb] ([maphong], [matb], [soluong]) VALUES (N'P0009     ', N'TB003     ', 1)
INSERT [dbo].[phong_co_tb] ([maphong], [matb], [soluong]) VALUES (N'P0009     ', N'TB004     ', 1)
INSERT [dbo].[phong_co_tb] ([maphong], [matb], [soluong]) VALUES (N'P0009     ', N'TB006     ', 1)
INSERT [dbo].[phong_co_tb] ([maphong], [matb], [soluong]) VALUES (N'P0009     ', N'TB007     ', 1)
INSERT [dbo].[phong_co_tb] ([maphong], [matb], [soluong]) VALUES (N'P0009     ', N'TB009     ', 1)
INSERT [dbo].[phong_co_tb] ([maphong], [matb], [soluong]) VALUES (N'P0009     ', N'TB007     ', 1)
INSERT [dbo].[phong_co_tb] ([maphong], [matb], [soluong]) VALUES (N'P0010     ', N'TB003     ', 1)
INSERT [dbo].[phong_co_tb] ([maphong], [matb], [soluong]) VALUES (N'P0010     ', N'TB002     ', 1)
INSERT [dbo].[phong_co_tb] ([maphong], [matb], [soluong]) VALUES (N'P0010     ', N'TB005     ', 1)
INSERT [dbo].[phong_co_tb] ([maphong], [matb], [soluong]) VALUES (N'P0010     ', N'TB006     ', 1)
INSERT [dbo].[phong_co_tb] ([maphong], [matb], [soluong]) VALUES (N'P0010     ', N'TB009     ', 1)
INSERT [dbo].[phong_co_tb] ([maphong], [matb], [soluong]) VALUES (N'P0011     ', N'TB001     ', 1)
INSERT [dbo].[phong_co_tb] ([maphong], [matb], [soluong]) VALUES (N'P0011     ', N'TB003     ', 1)
INSERT [dbo].[phong_co_tb] ([maphong], [matb], [soluong]) VALUES (N'P0011     ', N'TB004     ', 1)
INSERT [dbo].[phong_co_tb] ([maphong], [matb], [soluong]) VALUES (N'P0011     ', N'TB005     ', 1)
INSERT [dbo].[phong_co_tb] ([maphong], [matb], [soluong]) VALUES (N'P0011     ', N'TB006     ', 1)
INSERT [dbo].[phong_co_tb] ([maphong], [matb], [soluong]) VALUES (N'P0011     ', N'TB008     ', 1)
INSERT [dbo].[phong_co_tb] ([maphong], [matb], [soluong]) VALUES (N'P0011     ', N'TB009     ', 1)
INSERT [dbo].[phong_co_tb] ([maphong], [matb], [soluong]) VALUES (N'P0012     ', N'TB001     ', 1)
INSERT [dbo].[phong_co_tb] ([maphong], [matb], [soluong]) VALUES (N'P0012     ', N'TB004     ', 1)
INSERT [dbo].[phong_co_tb] ([maphong], [matb], [soluong]) VALUES (N'P0013     ', N'TB001     ', 1)
INSERT [dbo].[phong_co_tb] ([maphong], [matb], [soluong]) VALUES (N'P0013     ', N'TB004     ', 1)
INSERT [dbo].[phong_co_tb] ([maphong], [matb], [soluong]) VALUES (N'P0013     ', N'TB008     ', 1)
INSERT [dbo].[phong_co_tb] ([maphong], [matb], [soluong]) VALUES (N'P0008     ', N'TB001     ', 1)
INSERT [dbo].[phong_co_tb] ([maphong], [matb], [soluong]) VALUES (N'P0008     ', N'TB003     ', 1)
INSERT [dbo].[phong_co_tb] ([maphong], [matb], [soluong]) VALUES (N'P0001     ', N'TB006     ', 1)
INSERT [dbo].[phong_co_tb] ([maphong], [matb], [soluong]) VALUES (N'P0002     ', N'TB003     ', 1)
INSERT [dbo].[phong_co_tb] ([maphong], [matb], [soluong]) VALUES (N'P0003     ', N'TB002     ', 1)
INSERT [dbo].[phong_co_tb] ([maphong], [matb], [soluong]) VALUES (N'P0004     ', N'TB006     ', 1)
INSERT [dbo].[phong_co_tb] ([maphong], [matb], [soluong]) VALUES (N'P0005     ', N'TB003     ', 1)
INSERT [dbo].[phong_co_tb] ([maphong], [matb], [soluong]) VALUES (N'P0010     ', N'TB004     ', 1)
INSERT [dbo].[phong_co_tb] ([maphong], [matb], [soluong]) VALUES (N'P0011     ', N'TB002     ', 1)
INSERT [dbo].[phong_co_tb] ([maphong], [matb], [soluong]) VALUES (N'P0011     ', N'TB007     ', 1)
INSERT [dbo].[phong_co_tb] ([maphong], [matb], [soluong]) VALUES (N'P0012     ', N'TB006     ', 1)
INSERT [dbo].[phong_co_tb] ([maphong], [matb], [soluong]) VALUES (N'P0012     ', N'TB008     ', 1)
INSERT [dbo].[phong_co_tb] ([maphong], [matb], [soluong]) VALUES (N'P0013     ', N'TB005     ', 1)
INSERT [dbo].[phong_co_tb] ([maphong], [matb], [soluong]) VALUES (N'P0013     ', N'TB006     ', 1)
INSERT [dbo].[phong_co_tb] ([maphong], [matb], [soluong]) VALUES (N'P0001     ', N'TB009     ', 1)
INSERT [dbo].[phong_co_tb] ([maphong], [matb], [soluong]) VALUES (N'P0002     ', N'TB001     ', 1)
INSERT [dbo].[phong_co_tb] ([maphong], [matb], [soluong]) VALUES (N'P0003     ', N'TB003     ', 1)
INSERT [dbo].[phong_co_tb] ([maphong], [matb], [soluong]) VALUES (N'P0004     ', N'TB001     ', 1)
INSERT [dbo].[phong_co_tb] ([maphong], [matb], [soluong]) VALUES (N'P0005     ', N'TB008     ', 1)
INSERT [dbo].[phong_co_tb] ([maphong], [matb], [soluong]) VALUES (N'P0009     ', N'TB001     ', 1)
INSERT [dbo].[phong_co_tb] ([maphong], [matb], [soluong]) VALUES (N'P0009     ', N'TB002     ', 1)
INSERT [dbo].[phong_co_tb] ([maphong], [matb], [soluong]) VALUES (N'P0010     ', N'TB001     ', 1)
INSERT [dbo].[phong_co_tb] ([maphong], [matb], [soluong]) VALUES (N'P0010     ', N'TB008     ', 1)
INSERT [dbo].[phong_co_tb] ([maphong], [matb], [soluong]) VALUES (N'P0012     ', N'TB003     ', 1)
INSERT [dbo].[phong_co_tb] ([maphong], [matb], [soluong]) VALUES (N'P0012     ', N'TB009     ', 1)
INSERT [dbo].[phong_co_tb] ([maphong], [matb], [soluong]) VALUES (N'P0013     ', N'TB002     ', 1)
INSERT [dbo].[phong_co_tb] ([maphong], [matb], [soluong]) VALUES (N'P0013     ', N'TB009     ', 1)
INSERT [dbo].[phong_co_tb] ([maphong], [matb], [soluong]) VALUES (N'P0010     ', N'TB007     ', 1)
INSERT [dbo].[phong_co_tb] ([maphong], [matb], [soluong]) VALUES (N'P0012     ', N'TB002     ', 1)
INSERT [dbo].[phong_co_tb] ([maphong], [matb], [soluong]) VALUES (N'P0013     ', N'TB003     ', 1)

-- Thêm dữ liệu bảng Phong_tro

INSERT [dbo].[phong_tro] ([MaPhong], [LoaiPhong], [GiaPhong], [HienTrang], [Day]) VALUES (N'P0001     ', N'Bình Dân', 2000000, N'0', N'A         ')
INSERT [dbo].[phong_tro] ([MaPhong], [LoaiPhong], [GiaPhong], [HienTrang], [Day]) VALUES (N'P0002     ', N'VIP', 2500000, N'0', N'A         ')
INSERT [dbo].[phong_tro] ([MaPhong], [LoaiPhong], [GiaPhong], [HienTrang], [Day]) VALUES (N'P0003     ', N'Bình Dân', 2000000, N'0', N'A         ')
INSERT [dbo].[phong_tro] ([MaPhong], [LoaiPhong], [GiaPhong], [HienTrang], [Day]) VALUES (N'P0004     ', N'VIP', 2500000, N'0', N'B         ')
INSERT [dbo].[phong_tro] ([MaPhong], [LoaiPhong], [GiaPhong], [HienTrang], [Day]) VALUES (N'P0005     ', N'Bình Dân', 2000000, N'0', N'A         ')
INSERT [dbo].[phong_tro] ([MaPhong], [LoaiPhong], [GiaPhong], [HienTrang], [Day]) VALUES (N'P0007     ', N'Bình Dân', 2000000, N'0', N'B         ')
INSERT [dbo].[phong_tro] ([MaPhong], [LoaiPhong], [GiaPhong], [HienTrang], [Day]) VALUES (N'P0008     ', N'Bình Dân', 2000000, N'2', N'B         ')
INSERT [dbo].[phong_tro] ([MaPhong], [LoaiPhong], [GiaPhong], [HienTrang], [Day]) VALUES (N'P0009     ', N'VIP', 2500000, N'0', N'B         ')
INSERT [dbo].[phong_tro] ([MaPhong], [LoaiPhong], [GiaPhong], [HienTrang], [Day]) VALUES (N'P0010     ', N'VIP', 2500000, N'1', N'C         ')
INSERT [dbo].[phong_tro] ([MaPhong], [LoaiPhong], [GiaPhong], [HienTrang], [Day]) VALUES (N'P0011     ', N'VIP', 2500000, N'1', N'C         ')
INSERT [dbo].[phong_tro] ([MaPhong], [LoaiPhong], [GiaPhong], [HienTrang], [Day]) VALUES (N'P0012     ', N'VIP', 2500000, N'1', N'C         ')
INSERT [dbo].[phong_tro] ([MaPhong], [LoaiPhong], [GiaPhong], [HienTrang], [Day]) VALUES (N'P0013     ', N'VIP', 2500000, N'1', N'C         ')

-- Thêm dữ liệu bảng Thiet_bi

INSERT [dbo].[thiet_bi] ([matb], [tenthietbi]) VALUES (N'TB001     ', N'Tủ lạnh')
INSERT [dbo].[thiet_bi] ([matb], [tenthietbi]) VALUES (N'TB002     ', N'Ti Vi')
INSERT [dbo].[thiet_bi] ([matb], [tenthietbi]) VALUES (N'TB003     ', N'Máy lạnh')
INSERT [dbo].[thiet_bi] ([matb], [tenthietbi]) VALUES (N'TB004     ', N'Máy giặt')
INSERT [dbo].[thiet_bi] ([matb], [tenthietbi]) VALUES (N'TB005     ', N'Quạt')
INSERT [dbo].[thiet_bi] ([matb], [tenthietbi]) VALUES (N'TB006     ', N'Máy hút bụi')
INSERT [dbo].[thiet_bi] ([matb], [tenthietbi]) VALUES (N'TB007     ', N'Bếp từ')
INSERT [dbo].[thiet_bi] ([matb], [tenthietbi]) VALUES (N'TB008     ', N'Quạt trần')
INSERT [dbo].[thiet_bi] ([matb], [tenthietbi]) VALUES (N'TB009     ', N'Bếp ga')

-- Thiết lập khóa ngoại cho các bảng
ALTER TABLE [dbo].[chi_tiet_hoa_don]  WITH CHECK ADD  CONSTRAINT [FK_chi_tiet_hoa_don_dich_vu] FOREIGN KEY([MaDV])
REFERENCES [dbo].[dich_vu] ([MaDichVu])
GO
ALTER TABLE [dbo].[chi_tiet_hoa_don] CHECK CONSTRAINT [FK_chi_tiet_hoa_don_dich_vu]
GO
ALTER TABLE [dbo].[chi_tiet_hoa_don]  WITH CHECK ADD  CONSTRAINT [FK_chi_tiet_hoa_don_hop_dong] FOREIGN KEY([MaHopDong])
REFERENCES [dbo].[hop_dong] ([MaHopDong])
GO
ALTER TABLE [dbo].[chi_tiet_hoa_don] CHECK CONSTRAINT [FK_chi_tiet_hoa_don_hop_dong]
GO
ALTER TABLE [dbo].[hoa_don]  WITH CHECK ADD  CONSTRAINT [FK_hoa_don_hop_dong] FOREIGN KEY([MaHopDong])
REFERENCES [dbo].[hop_dong] ([MaHopDong])
GO
ALTER TABLE [dbo].[hoa_don] CHECK CONSTRAINT [FK_hoa_don_hop_dong]
GO
ALTER TABLE [dbo].[hoa_don]  WITH CHECK ADD  CONSTRAINT [FK_hoa_don_phong_tro] FOREIGN KEY([MaPhong])
REFERENCES [dbo].[phong_tro] ([MaPhong])
GO
ALTER TABLE [dbo].[hoa_don] CHECK CONSTRAINT [FK_hoa_don_phong_tro]
GO
ALTER TABLE [dbo].[hoa_don]  WITH CHECK ADD  CONSTRAINT [FK_hoa_don_tai_khoan] FOREIGN KEY([NguoiTao])
REFERENCES [dbo].[nguoi_dung] ([taikhoan])
GO
ALTER TABLE [dbo].[hoa_don] CHECK CONSTRAINT [FK_hoa_don_tai_khoan]
GO
ALTER TABLE [dbo].[hop_dong]  WITH CHECK ADD  CONSTRAINT [FK_hop_dong_khach_hang] FOREIGN KEY([MaKhachHang])
REFERENCES [dbo].[khach_hang] ([MaKhachHang])
GO
ALTER TABLE [dbo].[hop_dong] CHECK CONSTRAINT [FK_hop_dong_khach_hang]
GO
ALTER TABLE [dbo].[hop_dong]  WITH CHECK ADD  CONSTRAINT [FK_hop_dong_phong_tro] FOREIGN KEY([MaPhong])
REFERENCES [dbo].[phong_tro] ([MaPhong])
GO
ALTER TABLE [dbo].[hop_dong] CHECK CONSTRAINT [FK_hop_dong_phong_tro]
GO
ALTER TABLE [dbo].[hop_dong]  WITH CHECK ADD  CONSTRAINT [FK_hop_dong_tai_khoan] FOREIGN KEY([NguoiTao])
REFERENCES [dbo].[nguoi_dung] ([taikhoan])
GO
ALTER TABLE [dbo].[hop_dong] CHECK CONSTRAINT [FK_hop_dong_tai_khoan]
GO
ALTER TABLE [dbo].[phong_co_tb]  WITH CHECK ADD  CONSTRAINT [FK_phong_co_tb_phong_tro] FOREIGN KEY([maphong])
REFERENCES [dbo].[phong_tro] ([MaPhong])
GO
ALTER TABLE [dbo].[phong_co_tb] CHECK CONSTRAINT [FK_phong_co_tb_phong_tro]
GO
ALTER TABLE [dbo].[phong_co_tb]  WITH CHECK ADD  CONSTRAINT [FK_phong_co_tb_thiet_bi] FOREIGN KEY([matb])
REFERENCES [dbo].[thiet_bi] ([matb])
GO
ALTER TABLE [dbo].[phong_co_tb] CHECK CONSTRAINT [FK_phong_co_tb_thiet_bi]
GO

-- Kiểm tra ràng buộc toàn vẹn giữa các bảng

ALTER TABLE [dbo].[chi_tiet_hoa_don]  WITH CHECK ADD  CONSTRAINT [CTHD_ThanhTien_C] CHECK  (([ThanhTien]>=[DonGia] AND [ThanhTien]=[SoLuong]*[DonGia]))
GO
ALTER TABLE [dbo].[chi_tiet_hoa_don] CHECK CONSTRAINT [CTHD_ThanhTien_C]
GO
ALTER TABLE [dbo].[dich_vu]  WITH CHECK ADD  CONSTRAINT [DichVu_GiaDV_C] CHECK  (([GiaDichVu]>(0)))
GO
ALTER TABLE [dbo].[dich_vu] CHECK CONSTRAINT [DichVu_GiaDV_C]
GO
ALTER TABLE [dbo].[hoa_don]  WITH CHECK ADD  CONSTRAINT [HoaDon_TongTien_C] CHECK  (([TongTien]>[TienPhong] AND [TongTien]=([TienPhong]+[TienDichVu])))
GO
ALTER TABLE [dbo].[hoa_don] CHECK CONSTRAINT [HoaDon_TongTien_C]
GO
ALTER TABLE [dbo].[khach_hang]  WITH CHECK ADD  CONSTRAINT [KhachHang_GioiTinh_C] CHECK  (([GioiTinh]=(1) OR [GioiTinh]=(0)))
GO
ALTER TABLE [dbo].[khach_hang] CHECK CONSTRAINT [KhachHang_GioiTinh_C]
GO
ALTER TABLE [dbo].[phong_tro]  WITH CHECK ADD  CONSTRAINT [PhongTro_GiaPhong_C] CHECK  (([GiaPhong]>(0)))
GO
ALTER TABLE [dbo].[phong_tro] CHECK CONSTRAINT [PhongTro_GiaPhong_C]
GO
ALTER TABLE [dbo].[Hop_dong]  WITH CHECK ADD  CONSTRAINT [HopDong_HienTrang_C] CHECK  ((HienTrang=(1) OR HienTrang=(0)))
GO
