-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th10 09, 2023 lúc 05:33 PM
-- Phiên bản máy phục vụ: 10.4.27-MariaDB
-- Phiên bản PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `khachsan`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `account`
--

CREATE DATABASE `KhachSan`;
use `KhachSan`;

CREATE TABLE `account` (
  `username` varchar(50) NOT NULL,
  `password` varchar(500) NOT NULL,
  `create_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `datphong`
--

CREATE TABLE `datphong` (
  `Id` varchar(50) NOT NULL,
  `NgayDat` date NOT NULL DEFAULT current_timestamp(),
  `IdPhong` varchar(50) NOT NULL,
  `MaKH` varchar(50) NOT NULL,
  `NgayCheckInDuKien` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `dichvu`
--

CREATE TABLE `dichvu` (
  `MaDV` varchar(50) NOT NULL,
  `TenDV` text CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `ChiTietDichVu` text CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `Gia` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `dichvu`
--

INSERT INTO `dichvu` (`MaDV`, `TenDV`, `ChiTietDichVu`, `Gia`) VALUES
('DV01', 'Dọn Phòng', 'Nhân viên sẽ tiến hành lên phòng của bạn để dọn dẹp lại phòng như lúc mới.', 200000),
('DV02', 'Wifi', 'Cung cấp thẻ truy cập wifi cho một phòng, tối đa dùng được 4 người', 80000),
('DV03', 'Buffet buổi trưa', 'Bạn sẽ được ăn trưa ở nhà ăn chúng tôi theo hình thức buffle, 1 vé sử dụng cho 1 người', 120000),
('DV04', 'Bữa tối sang trọng', 'Bữa tối sang trọng dành cho 2 người ăn', 900000);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hoadon`
--

CREATE TABLE `hoadon` (
  `MaHD` varchar(50) NOT NULL,
  `MaKH` varchar(50) NOT NULL,
  `MaNV` varchar(50) NOT NULL,
  `NgayTao` date NOT NULL DEFAULT current_timestamp(),
  `TongTien` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hoadondichvu`
--

CREATE TABLE `hoadondichvu` (
  `MaHD` varchar(50) NOT NULL,
  `MaDichVu` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hoadonphong`
--

CREATE TABLE `hoadonphong` (
  `MaHD` varchar(50) NOT NULL,
  `MaPhong` varchar(50) NOT NULL,
  `ThoiGianThue` int(20) NOT NULL,
  `NgayCheckIn` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hoadon_voucher`
--

CREATE TABLE `hoadon_voucher` (
  `MaHD` varchar(50) NOT NULL,
  `MaVoucher` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ketoan`
--

CREATE TABLE `ketoan` (
  `MaNV` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `ketoan`
--

INSERT INTO `ketoan` (`MaNV`) VALUES
('NV03'),
('NV10'),
('NV11'),
('NV01');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `khachhang`
--

CREATE TABLE `khachhang` (
  `MaKH` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `HoTen` varchar(100) NOT NULL,
  `NgaySinh` date NOT NULL,
  `Sdt` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `DiaChi` text NOT NULL,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `khachhang`
--

INSERT INTO `khachhang` (`MaKH`, `HoTen`, `NgaySinh`, `Sdt`, `Email`, `DiaChi`, `username`) VALUES
('KH02', 'Lê Thảo', '1995-04-19', '0703456789', 'le.thao@gmail.com', '456 Đường Hà Huy Tập, Phường An Hòa, Quận Ninh Kiều, Cần Thơ', 'lethao'),
('KH03', 'Phạm Quân', '1986-03-03', '0604567890', 'pham.quan@gmail.com', '789 Đường Trần Hưng Đạo, Phường Hòa Xuân, Quận Cẩm Lệ, Đà Nẵng', 'phamquan'),
('KH04', 'Huỳnh Ngọc', '1991-10-09', '0901234568', 'huynh.ngoc@gmail.com', '321 Đường Lê Thánh Tôn, Phường 2, Quận 10, TP. Hồ Chí Minh', 'huynhngoc'),
('KH05', 'Hoàng Sơn', '1994-03-13', '0802345679', 'hoang.son@gmail.com', '654 Đường Đống Đa, Phường Trần Phú, Thành phố Bắc Giang, Bắc Giang', 'hoangson'),
('KH06', 'Võ Thanh', '1989-09-14', '0703456780', 'vo.thanh@gmail.com', '987 Đường Lê Lai, Phường Ngô Mây, Quận Lê Chân, Hải Phòng', 'vothanh'),
('KH07', 'Đặng Linh', '2004-06-10', '0604567891', 'dang.linh@gmail.com', '234 Đường Phạm Văn Đồng, Phường Bình Trưng Đông, Quận 2, TP. Hồ Chí Minh', 'danglinh'),
('KH08', 'Bùi Tâm', '1992-06-07', '0901234569', 'bui.tam@gmail.com', '567 Đường Lê Duẩn, Phường Hải Châu 1, Quận Hải Châu, Đà Nẵng', 'buitam'),
('KH09', 'Đỗ Tuấn', '2003-04-29', '0802345680', 'do.tuan@gmail.com', '876 Đường Trần Phú, Phường Hoà Cường Bắc, Quận Hải Châu, Đà Nẵng', 'dotuan'),
('KH10', 'Trần Văn Quang', '1984-05-27', '0703456781', 'tran.van.quang@gmail.com', '432 Đường Hoàng Hoa Thám, Phường 3, Quận Tân Bình, TP. Hồ Chí Minh', 'tranvanquang'),
('KH11', 'Lê Thanh Thuỳ', '2002-11-17', '0604567892', 'le.thanh.thuy@gmail.com', '123 Đường Bà Triệu, Phường Lê Lợi, Quận Vinh, Nghệ An', 'lethanhthuy'),
('KH12', 'Phạm Đức Minh', '1990-05-14', '0901234570', 'pham.duc.minh@gmail.com', '789 Đường Hàm Nghi, Phường Nghĩa Đô, Quận Cầu Giấy, Hà Nội', 'phamducminh'),
('KH13', 'Huỳnh Quỳnh Nhi', '1987-01-19', '0802345681', 'huynh.quynh.nhi@gmail.com', '345 Đường Lê Lợi, Phường Hòa Khánh Nam, Quận Liên Chiểu, Đà Nẵng', 'huynhquynhnhi'),
('KH14', 'Hoàng Thanh Hà', '2002-03-21', '0703456782', 'hoang.thanh.ha@gmail.com', '678 Đường Hoàng Diệu, Phường Vĩnh Ninh, TP. Huế, Thừa Thiên/Huế', 'hoangthanhha'),
('KH15', 'Võ Xuân Đức', '2003-12-29', '0604567893', 'vo.xuan.duc@gmail.com', '987 Đường Quang Trung, Phường Phước Long, Quận Ninh Kiều, Cần Thơ', 'voxuanduc'),
('KH16', 'Đặng Công Tuấn', '1980-11-21', '0901234571', 'dang.cong.tuan@gmail.com', '543 Đường Điện Biên Phủ, Phường Tân An, TP. Buôn Ma Thuột, Đắk Lắk', 'dangcongtuan'),
('KH17', 'Bùi Thị Ngọc Phượng', '1998-10-27', '0802345682', 'bui.thi.ngoc.phuong@gmail.com', '321 Đường Hùng Vương, Phường Mỹ An, Quận Ngũ Hành Sơn, Đà Nẵng', 'buithingocphuong'),
('KH18', 'Đỗ Hoàng Sơn', '1994-11-10', '0703456783', 'do.hoang.son@gmail.com', '654 Đường 30 Tháng 4, Phường Ninh Xá, TP. Bắc Ninh, Bắc Ninh', 'dohoangson'),
('KH19', 'Hồ Thị Mai Linh', '1993-07-16', '0604567894', 'ho.thi.mai.linh@gmail.com', '789 Đường Hồ Xuân Hương, Phường Nghĩa An, TP. Quy Nhơn, Bình Định', 'hothimailinh'),
('KH20', 'Ngô Thành Huy', '2000-08-04', '0901234572', 'ngo.thanh.huy@gmail.com', '234 Đường Lê Duẩn, Phường Nghĩa Lộ, TP. Yên Bái, Yên Bái', 'ngothanhhuy'),
('KH21', 'Dương Thúy Vy', '1981-10-03', '0802345683', 'duong.thuy.vy@gmail.com', '123 Đường Lê Lợi, Phường Võ Thị Sáu, Quận 1, TP. Hồ Chí Minh', 'duongthuyvy'),
('KH22', 'Lý Hoàng Nam', '1997-07-01', '0703456784', 'ly.hoang.nam@gmail.com', '456 Đường Hà Huy Tập, Phường Cái Khế, Quận Ninh Kiều, Cần Thơ', 'lyhoangnam'),
('KH23', 'Đào Thị Thúy Trang', '1991-04-01', '0604567895', 'dao.thi.thuy.trang@gmail.com', '789 Đường Trần Phú, Phường Thanh Khê Đông, Quận Thanh Khê, Đà Nẵng', 'daothithuytrang'),
('KH24', 'Đinh Minh Khai', '1999-09-15', '0901234573', 'dinh.minh.khai@gmail.com', '321 Đường Lê Thánh Tôn, Phường Cô Giang, Quận 1, TP. Hồ Chí Minh', 'dinhminhkhai'),
('KH25', 'Mai Thị Quỳnh Anh', '2001-04-03', '0802345684', 'mai.thi.quynh.anh@gmail.com', '654 Đường Hùng Vương, Phường Hà Huy Tập, Thành phố Hạ Long, Quảng Ninh', 'maithiquynhanh'),
('KH26', 'Trịnh Ngọc Trường', '2004-11-19', '0703456785', 'trinh.ngoc.truong@gmail.com', '987 Đường Lê Lai, Phường Phường Ngô Quyền, Quận Hồng Bàng, Hải Phòng', 'trinhngoctruong'),
('KH27', 'Đoàn Văn Quân', '1987-06-29', '0604567896', 'doan.van.quan@gmail.com', '234 Đường Phạm Văn Đồng, Phường An Khê, Quận Thanh Khê, Đà Nẵng', 'doanvanquan'),
('KH28', 'Đặng Hà My', '1980-08-26', '0901234574', 'dang.ha.my@gmail.com', '567 Đường Lê Duẩn, Phường Xuân Hà, Quận Thanh Khê, Đà Nẵng', 'danghamy'),
('KH29', 'Phan Thị Thảo', '1985-07-05', '0802345685', 'phan.thi.thao@gmail.com', '876 Đường Trần Phú, Phường Trần Phú, Thành phố Biên Hòa, Đồng Nai', 'phanthithao'),
('KH30', 'Lương Hoàng Đức', '2004-03-18', '0703456786', 'luong.hoang.duc@gmail.com', '432 Đường Hoàng Hoa Thám, Phường 4, Quận Tân Bình, TP. Hồ Chí Minh', 'luonghoangduc'),
('KH31', 'Vũ Thị Lan Anh', '1991-01-11', '0604567897', 'vu.thi.lan.anh@gmail.com', '123 Đường Bà Triệu, Phường Hàm Rồng, Thành phố Thanh Hóa, Thanh Hóa', 'vuthilananh'),
('KH32', 'Tô Văn Tuấn', '2003-07-19', '0901234575', 'to.van.tuan@gmail.com', '789 Đường Hàm Nghi, Phường Trúc Bạch, Quận Ba Đình, Hà Nội', 'tovantuan'),
('KH33', 'Trương Thanh Thảo', '1988-02-26', '0802345686', 'truong.thanh.thao@gmail.com', '345 Đường Lê Lợi, Phường Tân Thành, Quận Tân Phú, TP. Hồ Chí Minh', 'truongthanhthao'),
('KH34', 'Lục Hữu Hùng', '2005-04-03', '0703456787', 'luc.huu.hung@gmail.com', '678 Đường Đào Duy Anh, Phường Phương Sài, TP. Nha Trang, Khánh Hòa', 'luchuuhung'),
('KH35', 'Thái Đức Khôi', '1982-06-01', '0604567898', 'thai.duc.khoi@gmail.com', '987 Đường Bạch Đằng, Phường An Cựu, TP. Huế, Thừa Thiên/Huế', 'thaiduckhoi'),
('KH36', 'Kim Thị Hồng Ngọc', '2005-09-12', '0901234576', 'kim.thi.hong.ngoc@gmail.com', '543 Đường Hồ Thị Kỷ, Phường Tân Lập, TP. Bà Rịa / Vũng Tàu, Bà Rịa / Vũng Tàu', 'kimthihongngoc'),
('KH37', 'Cao Văn Long', '1999-01-15', '0802345687', 'cao.van.long@gmail.com', '321 Đường Nguyễn Huệ, Phường Trà An, TP. Vũng Tàu, Bà Rịa / Vũng Tàu', 'caovanlong'),
('KH38', 'Chu Thị Thu Hằng', '2000-05-15', '0703456788', 'chu.thi.thu.hang@gmail.com', '654 Đường Nguyễn Đình Chính, Phường Phú Lâm, Quận Tân Phú, TP. Hồ Chí Minh', 'chuthithuhang'),
('KH39', 'Lâm Văn Hưng', '1998-05-19', '0604567899', 'lam.van.hung@gmail.com', '789 Đường Trần Hưng Đạo, Phường Phước Long, TP. Nha Trang, Khánh Hòa', 'lamvanhung'),
('KH40', 'Quách Văn Khải', '1983-01-29', '0901234577', 'quach.van.khai@gmail.com', '234 Đường Võ Thị Sáu, Phường Cái Khế, Quận Ninh Kiều, Cần Thơ', 'quachvankhai'),
('KH41', 'Lưu Thị Diệu Linh', '2000-02-22', '0802345688', 'luu.thi.dieu.linh@gmail.com', '123 Đường Nguyễn Huệ, Phường Vĩnh Ninh, TP. Huế, Thừa Thiên/Huế', 'luuthidieulinh'),
('KH42', 'Kiều Thị Hạnh', '1996-03-05', '0703456789', 'kieu.thi.hanh@gmail.com', '456 Đường Hoàng Hoa Thám, Phường Lê Đại Hành, TP. Hải Dương, Hải Dương', 'kieuthihanh'),
('KH43', 'Khương Văn Tuấn', '1993-12-23', '0604567801', 'khuong.van.tuan@gmail.com', '789 Đường Hàm Nghi, Phường Trung Hòa, Quận Cầu Giấy, Hà Nội', 'khuongvantuan'),
('KH44', 'Tăng Thị Linh Chi', '1990-10-23', '0901234578', 'tang.thi.linh.chi@gmail.com', '321 Đường Lê Thánh Tôn, Phường Thanh Khê Tây, Quận Thanh Khê, Đà Nẵng', 'tangthilinhchi'),
('KH45', 'Hà Văn Minh', '1996-08-14', '0802345689', 'ha.van.minh@gmail.com', '654 Đường Hồ Xuân Hương, Phường Võ Cường, TP. Bắc Ninh, Bắc Ninh', 'havanminh'),
('KH46', 'Triệu Thanh Tùng', '1982-08-20', '0703456790', 'trieu.thanh.tung@gmail.com', '987 Đường Lê Lai, Phường Vĩnh Tân, Quận Ninh Kiều, Cần Thơ', 'trieuthanhtung'),
('KH47', 'Lư Văn Hoàng', '1995-09-27', '0604567802', 'lu.van.hoang@gmail.com', '234 Đường Điện Biên Phủ, Phường Xuân Hà, TP. Quy Nhơn, Bình Định', 'luvanhoang'),
('KH48', 'Đoàn Văn Nhân', '1981-02-03', '0901234579', 'doan.van.nhan@gmail.com', '567 Đường Lê Duẩn, Phường Nghĩa Phương, TP. Quảng Ngãi, Quảng Ngãi', 'doanvannhan'),
('KH49', 'Lại Thị Huyền Trang', '1993-04-26', '0802345690', 'lai.thi.huyen.trang@gmail.com', '876 Đường Trần Phú, Phường Hòa Cường Nam, Quận Hải Châu, Đà Nẵng', 'laithihuyentrang'),
('KH50', 'Lục Văn Tuấn', '1984-11-05', '0703456791', 'luc.van.tuan@gmail.com', '432 Đường Phạm Văn Đồng, Phường Mỹ Đình, Quận Nam Từ Liêm, Hà Nội', 'lucvantuan'),
('KH51', 'Tạ Thị Thảo Ngân', '1990-08-03', '0604567803', 'ta.thi.thao.ngan@gmail.com', '123 Đường Bà Triệu, Phường Ngọc Trạo, TP. Thanh Hóa, Thanh Hóa', 'tathithaongan'),
('KH52', 'Quyền Đức Hoàng', '1992-11-15', '0901234580', 'quyen.duc.hoang@gmail.com', '789 Đường Hàm Nghi, Phường Hòa An, Quận Cẩm Lệ, Đà Nẵng', 'quyenduchoang'),
('KH53', 'Tống Thị Thanh Hà', '1998-08-07', '0802345691', 'tong.thi.thanh.ha@gmail.com', '345 Đường Lê Lợi, Phường Điện Ngọc, TP. Điện Biên Phủ, Điện Biên', 'tongthithanhha'),
('KH54', 'Nghiêm Văn Hùng', '1984-08-16', '0703456792', 'nghiem.van.hung@gmail.com', '678 Đường Đào Duy Anh, Phường Lê Lợi, TP. Hải Dương, Hải Dương', 'nghiemvanhung'),
('KH55', 'Tôn Đức Bảo', '2001-07-23', '0604567804', 'ton.duc.bao@gmail.com', '987 Đường Bạch Đằng, Phường Hà An, TP. Hạ Long, Quảng Ninh', 'tonducbao'),
('KH56', 'Thân Văn Tuấn', '1997-04-12', '0901234581', 'than.van.tuan@gmail.com', '543 Đường Hồ Thị Kỷ, Phường An Cựu, TP. Huế, Thừa Thiên/Huế', 'thanvantuan'),
('KH57', 'Hứa Đình Hoàng', '1985-12-13', '0802345692', 'hua.dinh.hoang@gmail.com', '321 Đường Nguyễn Huệ, Phường Tân Phong, Quận 7, TP. Hồ Chí Minh', 'huadinhhoang'),
('KH58', 'Khuất Thị Bảo Yến', '1995-01-29', '0703456793', 'khuat.thi.bao.yen@gmail.com', '654 Đường Nguyễn Đình Chính, Phường Phú Hòa, TP. Thủ Dầu Một, Bình Dương', 'khuatthibaoyen'),
('KH59', 'Trần Thanh Minh Hòa', '1983-09-28', '0604567805', 'tran.thanh.minh.hoa@gmail.com', '789 Đường Trần Hưng Đạo, Phường Thanh Bình, TP. Hải Dương, Hải Dương', 'tranthanhminhhoa'),
('KH60', 'Lê Văn Hữu Duy', '1991-07-21', '0901234582', 'le.van.huu.duy@gmail.com', '234 Đường Võ Thị Sáu, Phường Mỹ Phước, TP. Long Xuyên, An Giang', 'levanhuuduy'),
('KH61', 'Phạm Đình Công Tâm', '1999-06-26', '0802345693', 'pham.dinh.cong.tam@gmail.com', '321 Đường Nguyễn Huệ, Phường Trà An, TP. Vũng Tàu, Bà Rịa / Vũng Tàu', 'phamdinhcongtam'),
('KH62', 'Huỳnh Minh Tuấn Đức', '1986-08-11', '0703456794', 'huynh.minh.tuan.duc@gmail.com', '654 Đường Nguyễn Đình Chính, Phường Phú Lâm, Quận Tân Phú, TP. Hồ Chí Minh', 'huynhminhtuanduc'),
('KH63', 'Hoàng Công Minh Thanh', '1980-06-06', '0604567806', 'hoang.cong.minh.thanh@gmail.com', '789 Đường Trần Hưng Đạo, Phường Phước Long, TP. Nha Trang, Khánh Hòa', 'hoangcongminhthanh'),
('KH64', 'Võ Đức Thành Duy', '1996-05-25', '0901234583', 'vo.duc.thanh.duy@gmail.com', '234 Đường Võ Thị Sáu, Phường Cái Khế, Quận Ninh Kiều, Cần Thơ', 'voducthanhduy'),
('KH65', 'Đặng Công Bình Phúc', '1985-01-25', '0802345694', 'dang.cong.binh.phuc@gmail.com', '123 Đường Nguyễn Huệ, Phường Vĩnh Ninh, TP. Huế, Thừa Thiên/Huế', 'dangcongbinhphuc'),
('KH66', 'Bùi Văn Công Văn', '1987-04-09', '0703456795', 'bui.van.cong.van@gmail.com', '456 Đường Hoàng Hoa Thám, Phường Lê Đại Hành, TP. Hải Dương, Hải Dương', 'buivancongvan'),
('KH67', 'Đỗ Đình Thanh Hoàng', '1992-03-18', '0604567807', 'do.dinh.thanh.hoang@gmail.com', '789 Đường Hàm Nghi, Phường Trung Hòa, Quận Cầu Giấy, Hà Nội', 'dodingthanhhoang'),
('KH68', 'Hồ Minh Thanh Duy', '1998-11-09', '0901234584', 'ho.minh.thanh.duy@gmail.com', '321 Đường Lê Thánh Tôn, Phường Thanh Khê Tây, Quận Thanh Khê, Đà Nẵng', 'hominhthanhduy'),
('KH69', 'Ngô Đức Tuấn Huy', '1984-03-07', '0802345695', 'ngo.duc.tuan.huy@gmail.com', '654 Đường Hồ Xuân Hương, Phường Võ Cường, TP. Bắc Ninh, Bắc Ninh', 'ngoductuanhuy'),
('KH70', 'Dương Đình Minh Thông', '1997-01-16', '0703456796', 'duong.dinh.minh.thong@gmail.com', '987 Đường Lê Lai, Phường Vĩnh Tân, Quận Ninh Kiều, Cần Thơ', 'duongdinhminhthong'),
('KH71', 'Lý Thanh Nhân Bảo', '2005-07-25', '0604567808', 'ly.thanh.nhan.bao@gmail.com', '234 Đường Điện Biên Phủ, Phường Xuân Hà, TP. Quy Nhơn, Bình Định', 'lythanhnhanbao'),
('KH72', 'Đào Thị Đức Thùy', '1981-04-24', '0901234585', 'dao.thi.duc.thuy@gmail.com', '567 Đường Lê Duẩn, Phường Nghĩa Phương, TP. Quảng Ngãi, Quảng Ngãi', 'daothiducthuy'),
('KH73', 'Đinh Công Huy Bá', '2003-10-08', '0802345696', 'dinh.cong.huy.ba@gmail.com', '876 Đường Trần Phú, Phường Hòa Cường Nam, Quận Hải Châu, Đà Nẵng', 'dinhconghuyba'),
('KH74', 'Mai Minh Hữu Hòa', '1988-05-18', '0703456797', 'mai.minh.huu.hoa@gmail.com', '432 Đường Phạm Văn Đồng, Phường Mỹ Đình, Quận Nam Từ Liêm, Hà Nội', 'maiminhhuuhoa'),
('KH75', 'Trịnh Thị Thanh Như', '1993-10-04', '0604567809', 'trinh.thi.thanh.nhu@gmail.com', '123 Đường Bà Triệu, Phường Ngọc Trạo, TP. Thanh Hóa, Thanh Hóa', 'trinhthithanhnhu'),
('KH76', 'Đoàn Văn Phúc Đức', '2002-08-29', '0901234586', 'doan.van.phuc.duc@gmail.com', '789 Đường Hàm Nghi, Phường Hòa An, Quận Cẩm Lệ, Đà Nẵng', 'doanvanphucduc'),
('KH77', 'Đặng Đức Văn Đạt', '1989-01-15', '0802345697', 'dang.duc.van.dat@gmail.com', '345 Đường Lê Lợi, Phường Điện Ngọc, TP. Điện Biên Phủ, Điện Biên', 'dangducvandat'),
('KH78', 'Phan Thị Thanh Tú', '2003-02-07', '0703456798', 'phan.thi.thanh.tu@gmail.com', '678 Đường Đào Duy Anh, Phường Lê Lợi, TP. Hải Dương, Hải Dương', 'phanthithanhtu'),
('KH79', 'Lương Minh Quyên Quốc', '1997-09-20', '0604567810', 'luong.minh.quyen.quoc@gmail.com', '987 Đường Bạch Đằng, Phường Hà An, TP. Hạ Long, Quảng Ninh', 'luongminhquyenquoc'),
('KH80', 'Vũ Thị Ngọc Thảo', '1985-04-15', '0901234587', 'vu.thi.ngoc.thao@gmail.com', '543 Đường Hồ Thị Kỷ, Phường An Cựu, TP. Huế, Thừa Thiên/Huế', 'vuthingocthao'),
('KH81', 'Tô Thị Minh Huyền', '2001-10-11', '0802345698', 'to.thi.minh.huyen@gmail.com', '321 Đường Nguyễn Huệ, Phường Tân Phong, Quận 7, TP. Hồ Chí Minh', 'tothiminhhuyen'),
('KH82', 'Trương Văn Minh Quang', '1989-06-25', '0703456799', 'truong.van.minh.quang@gmail.com', '654 Đường Nguyễn Đình Chính, Phường Phú Hòa, TP. Thủ Dầu Một, Bình Dương', 'truongvanminhquang'),
('KH83', 'Lục Văn Thanh Hà', '1994-08-21', '0604567811', 'luc.van.thanh.ha@gmail.com', '789 Đường Trần Hưng Đạo, Phường Thanh Bình, TP. Hải Dương, Hải Dương', 'lucvanthanhha'),
('KH84', 'Thái Đình Huy Minh', '1986-10-31', '0901234588', 'thai.dinh.huy.minh@gmail.com', '234 Đường Võ Thị Sáu, Phường Mỹ Phước, TP. Long Xuyên, An Giang', 'thaidinhhuyminh'),
('KH85', 'Kim Văn Đức Khải', '1991-12-29', '0802345699', 'kim.van.duc.khai@gmail.com', '654 Đường Nguyễn Đình Chính, Phường Phú Hòa, TP. Thủ Dầu Một, Bình Dương', 'kimvanduckhai'),
('KH86', 'Cao Thị Khôi Hạnh', '1994-06-01', '0703456800', 'cao.thi.khoi.hanh@gmail.com', '789 Đường Trần Hưng Đạo, Phường Thanh Bình, TP. Hải Dương, Hải Dương', 'caothikhoi'),
('KH87', 'Chu Đình Quang Khôi', '1986-05-23', '0604567812', 'chu.dinh.quang.khoi@gmail.com', '234 Đường Võ Thị Sáu, Phường Mỹ Phước, TP. Long Xuyên, An Giang', 'chudinhquangkhoi');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `letan`
--

CREATE TABLE `letan` (
  `MaNV` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `letan`
--

INSERT INTO `letan` (`MaNV`) VALUES
('NV02'),
('NV04'),
('NV05'),
('NV06'),
('NV07'),
('NV09');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `nhanvien`
--

CREATE TABLE `nhanvien` (
  `MaNV` varchar(50) NOT NULL,
  `TenNV` varchar(100) NOT NULL,
  `Sdt` varchar(13) NOT NULL,
  `Email` varchar(30) NOT NULL,
  `NgaySinh` date NOT NULL,
  `DiaChi` text NOT NULL,
  `Cccd` varchar(20) NOT NULL,
  `Luong` double NOT NULL,
  `NgayVaoLam` date NOT NULL DEFAULT current_timestamp(),
  `username` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `nhanvien`
--

INSERT INTO `nhanvien` (`MaNV`, `TenNV`, `Sdt`, `Email`, `NgaySinh`, `DiaChi`, `Cccd`, `Luong`, `NgayVaoLam`, `username`) VALUES
('NV01', 'Trần Nam Thanh', '0802345678', 'tran.nam123@gmail.com', '1983-12-07', '123 Đường Lê Lợi, Phường 1, Quận 1, Thành phố Hồ Chí Minh', '0918734', 10000000, '2020-09-13', 'trannamthnh01'),
('NV02', 'Lê Thảo Hiền', '0703456789', 'le.thao123@gmail.com', '1995-04-19', '456 Đường Hà Huy Tập, Phường An Hòa, Quận Ninh Kiều, Cần Thơ', '124152', 12000000, '2020-09-13', 'lethaohien'),
('NV03', 'Phạm Quân Quốc Chiến', '0604567890', 'pham.quan123@gmail.com', '1986-03-03', '789 Đường Trần Hưng Đạo, Phường Hòa Xuân, Quận Cẩm Lệ, Đà Nẵng', '6314651', 16000000, '2020-09-13', 'phamquanqchien'),
('NV04', 'Huỳnh Ngọc Kim', '0901234568', 'huynh.ngoc123@gmail.com', '1991-09-13', '321 Đường Lê Thánh Tôn, Phường 2, Quận 10, TP. Hồ Chí Minh', '372346', 11000000, '2020-09-13', 'huynhngoc123'),
('NV05', 'Hoàng Sơn Hỏa', '0802345679', 'hoang.son123@gmail.com', '1994-03-13', '654 Đường Đống Đa, Phường Trần Phú, Thành phố Bắc Giang, Bắc Giang', '6327234', 11000000, '2020-09-13', 'hoangson123'),
('NV06', 'Võ Thanh Thanh', '0703456780', 'vo.thanh123@gmail.com', '1989-09-14', '987 Đường Lê Lai, Phường Ngô Mây, Quận Lê Chân, Hải Phòng', '2347234', 11000000, '2020-09-13', 'vothanht'),
('NV07', 'Đặng Linh Hoa', '0604567891', 'dang.linh123@gmail.com', '2004-10-06', '234 Đường Phạm Văn Đồng, Phường Bình Trưng Đông, Quận 2, TP. Hồ Chí Minh', '2372345', 13000000, '2020-09-13', 'danglinh01'),
('NV08', 'Bùi Tâm Viên', '0901234569', 'bui.tam123@gmail.com', '1992-07-06', '567 Đường Lê Duẩn, Phường Hải Châu 1, Quận Hải Châu, Đà Nẵng', '1624553', 12000000, '2020-09-13', 'buitamvien'),
('NV09', 'Trần Văn Hải', '0901234569', 'bui.tamHai@gmail.com', '2003-04-05', '567 Đường Lê Duẩn, Phường Hải Châu 1, Quận Hải Châu, Đà Nẵng', '1346721', 20000000, '2020-09-13', 'tvh050423'),
('NV10', 'Cao Hoàng Oanh', '0901234569', 'bui.tamOanh@gmail.com', '2003-07-12', '567 Đường Lê Duẩn, Phường Hải Châu 1, Quận Hải Châu, Đà Lạt', '8423451', 20000000, '2020-09-13', 'oanh1234'),
('NV11', 'Nguyễn Dư Thành Long', '0901234569', 'bui.tamHaiLong@gmail.com', '2003-12-12', '567 Đường Lê Duẩn, Phường Hải Châu 1, Quận Hải Châu, Hà Giang', '6812415', 360000000, '2020-09-13', 'longdunguyen'),
('NV12', 'Cao Đăng Tình', '0901234569', 'bui.tamHai@gmail.com', '2003-09-16', '567 Đường Lê Duẩn, Phường Hải Châu 1, Quận Hải Châu, Đà Nẵng', '1621414', 20000000, '2020-09-13', 'tinhdangcao'),
('NV13', 'Võ Quang Huy', '0901234569', 'bui.tamHai@gmail.com', '2003-03-18', '567 Đường Lê Duẩn, Phường Hải Châu 1, Quận Hải Châu, Đà Nẵng', '1625726', 40000000, '2020-09-13', 'voquanghuy');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `phong`
--

CREATE TABLE `phong` (
  `Id` varchar(50) NOT NULL,
  `LoaiPhong` varchar(50) NOT NULL,
  `KieuGiuong` varchar(30) NOT NULL,
  `TinhTrang` varchar(20) NOT NULL,
  `Gia` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `phong`
--

INSERT INTO `phong` (`Id`, `LoaiPhong`, `KieuGiuong`, `TinhTrang`, `Gia`) VALUES
('P01', 'standard', 'single', 'avaiable', 1000000),
('P02', 'standard', 'single', 'avaiable', 1000000),
('P03', 'standard', 'single', 'avaiable', 1000000),
('P04', 'standard', 'single', 'avaiable', 1000000),
('P05', 'standard', 'single', 'avaiable', 1000000),
('P06', 'standard', 'single', 'avaiable', 1000000),
('P07', 'standard', 'single', 'avaiable', 1000000),
('P08', 'standard', 'single', 'avaiable', 1000000),
('P09', 'standard', 'single', 'avaiable', 1000000),
('P10', 'standard', 'single', 'avaiable', 1000000),
('P11', 'standard', 'single', 'avaiable', 1000000),
('P12', 'standard', 'single', 'avaiable', 1000000),
('P13', 'standard', 'single', 'avaiable', 1000000),
('P14', 'standard', 'single', 'avaiable', 1000000),
('P15', 'standard', 'single', 'avaiable', 1000000),
('P16', 'standard', 'single', 'avaiable', 1000000),
('P17', 'standard', 'twin', 'avaiable', 1000000),
('P18', 'standard', 'twin', 'avaiable', 1000000),
('P48', 'standard', 'twin', 'avaiable', 1000000),
('P49', 'standard', 'twin', 'avaiable', 1000000),
('P50', 'standard', 'double', 'avaiable', 1000000),
('P51', 'standard', 'double', 'avaiable', 1000000),
('P19', 'superior', 'twin', 'avaiable', 1450000),
('P20', 'superior', 'twin', 'avaiable', 1450000),
('P21', 'superior', 'double', 'avaiable', 1450000),
('P22', 'superior', 'double', 'avaiable', 1450000),
('P23', 'superior', 'double', 'avaiable', 1450000),
('P24', 'superior', 'double', 'avaiable', 1450000),
('P25', 'superior', 'double', 'avaiable', 1450000),
('P26', 'superior', 'double', 'avaiable', 1450000),
('P27', 'superior', 'quad', 'avaiable', 1450000),
('P28', 'superior', 'quad', 'avaiable', 1450000),
('P29', 'superior', 'triple', 'avaiable', 1450000),
('P30', 'superior', 'triple', 'avaiable', 1450000),
('P52', 'superior', 'single', 'avaiable', 1450000),
('P53', 'superior', 'single', 'avaiable', 1450000),
('P54', 'superior', 'single', 'avaiable', 1450000),
('P55', 'superior', 'single', 'avaiable', 1450000),
('P56', 'superior', 'quad', 'avaiable', 1450000),
('P57', 'superior', 'quad', 'avaiable', 1450000),
('P31', 'superior', 'quad', 'avaiable', 1450000),
('P32', 'superior', 'quad', 'avaiable', 1450000),
('P33', 'deluxe', 'single', 'avaiable', 1720000),
('P34', 'deluxe', 'single', 'avaiable', 1720000),
('P35', 'deluxe', 'double', 'avaiable', 1720000),
('P36', 'deluxe', 'double', 'avaiable', 1720000),
('P37', 'deluxe', 'double', 'avaiable', 1720000),
('P38', 'deluxe', 'double', 'avaiable', 1720000),
('P39', 'deluxe', 'triple', 'avaiable', 1720000),
('P40', 'deluxe', 'triple', 'avaiable', 1720000),
('P41', 'deluxe', 'quad', 'avaiable', 1720000),
('P42', 'deluxe', 'quad', 'avaiable', 1720000),
('P43', 'executive', 'double', 'avaiable', 3280000),
('P44', 'executive', 'double', 'avaiable', 3280000),
('P45', 'executive', 'quad', 'avaiable', 3280000),
('P46', 'executive', 'quad', 'avaiable', 3280000),
('P47', 'executive', 'double', 'avaiable', 3280000);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `quanly`
--

CREATE TABLE `quanly` (
  `MaNV` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `quanly`
--

INSERT INTO `quanly` (`MaNV`) VALUES
('NV13'),
('NV12'),
('NV08');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `voucher`
--

CREATE TABLE `voucher` (
  `MaVoucher` varchar(50) NOT NULL,
  `GiamGia` float NOT NULL,
  `StartDate` date NOT NULL,
  `EndDate` date NOT NULL,
  `State` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `voucher`
--
ALTER TABLE `voucher`
  ADD UNIQUE KEY `MaVoucher` (`MaVoucher`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
