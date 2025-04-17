-- Tạo cơ sở dữ liệu
CREATE DATABASE CNPM_QLNH;

-- Sử dụng cơ sở dữ liệu
USE CNPM_QLNH;

-- Tạo bảng người dùng
CREATE TABLE nguoi_dung (
    ma_nguoi_dung INT PRIMARY KEY AUTO_INCREMENT,
    ho_ten VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    so_dien_thoai VARCHAR(20),
    mat_khau VARCHAR(255) NOT NULL,
    ngay_tao TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
DROP TABLE nguoi_dung;

-- Tạo bảng món ăn (thực đơn)
CREATE TABLE mon_an (
    ma_mon_an INT PRIMARY KEY AUTO_INCREMENT,
    ten_mon_an VARCHAR(100) NOT NULL,
    mo_ta TEXT,
    gia INT NOT NULL,
    hinh_anh VARCHAR(255),
    loai_mon VARCHAR(50) -- khai_vi, mon_chinh, com_bun, canh_lau, trang_mieng, do_uong
);

-- Tạo bảng đặt bàn
CREATE TABLE dat_ban (
    ma_dat_ban INT PRIMARY KEY AUTO_INCREMENT,
    ma_nguoi_dung INT,
    ho_ten VARCHAR(100) NOT NULL,
    so_dien_thoai VARCHAR(20) NOT NULL,
    email VARCHAR(100),
    so_khach INT NOT NULL,
    ngay DATE NOT NULL,
    gio TIME NOT NULL,
    ghi_chu TEXT,
    ngay_tao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (ma_nguoi_dung) REFERENCES nguoi_dung(ma_nguoi_dung)
);

-- Tạo bảng liên hệ/góp ý
CREATE TABLE lien_he (
    ma_lien_he INT PRIMARY KEY AUTO_INCREMENT,
    ho_ten VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    so_dien_thoai VARCHAR(20),
    chu_de VARCHAR(100) NOT NULL,
    noi_dung TEXT NOT NULL,
    ngay_tao TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tạo bảng đánh giá khách hàng
CREATE TABLE danh_gia (
    ma_danh_gia INT PRIMARY KEY AUTO_INCREMENT,
    ma_nguoi_dung INT,
    ho_ten VARCHAR(100) NOT NULL,
    diem INT NOT NULL, -- 1-5
    binh_luan TEXT,
    ngay_tao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (ma_nguoi_dung) REFERENCES nguoi_dung(ma_nguoi_dung)
);
