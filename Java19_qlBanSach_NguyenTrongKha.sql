-- drop database QLBanSach;
create database QLBanSach;
use QLBanSach;

create table KHACHHANG (
    MaKH int primary key,
    TaiKhoan varchar(128) not null,
    MatKhau varchar(128) not null,
    Email varchar(128) not null,
    DiaChi varchar(256),
    DienThoai char(20),
    GioiTinh enum('Nam', 'Nu'),
    NgaySinh date,
    HoTen varchar(128)
);

create table TACGIA (
    MaTacGia int primary key,
    TenTacGia varchar(128),
    DiaChi varchar(256),
    TieuSu text,
    DienThoai char(20)
);

create table CHUDE (
    MaChuDe int primary key,
    TenChuDe varchar(128)
);

create table NHAXUATBAN (
    MaNSX int primary key,
    TenNSB varchar(256),
    DiaChi varchar(256),
    DienThoai char(20)
);


create table DONHANG (
    MaDonHang int primary key,
    MaKH int, /* ref */
    DaThanhToan boolean,
    NgayGiao date,
    NgayDat date,
    TinhTrangGH varchar(256),

    foreign key (MaKH) references KHACHHANG(MaKH)
);

create table SACH (
    MaSach int primary key,
    MaChuDe int, /* ref */
    MaNSX int, /* ref */
    TenSach varchar(256),
    GiaBan decimal(10,3),
    MoTa text,
    AnhBia varchar(256),
    NgayCapNhat date,
    SoLuongTon int,

    foreign key (MaChuDe) references CHUDE(MaChuDe),
    foreign key (MaNSX) references NHAXUATBAN(MaNSX)
);

create table SACH_TACGIA (
    MaSach int, /* ref, primary */
    MaTacGia int, /* ref, primary */
    VaiTro varchar(128),
    ViTri varchar(256),

    primary key (MaSach, MaTacGia),
    foreign key (MaSach) references SACH(MaSach),
    foreign key (MaTacGia) references TACGIA(MaTacGia)
);

create table DONHANG_SACH (
    MaDonHang int, /* ref, primary */
    MaSach int, /* ref, primary */
    SoLuong int,
    DonGia decimal(10,3),

    primary key (MaDonHang, MaSach),
    foreign key (MaDonHang) references DONHANG(MaDonHang),
    foreign key (MaSach) references SACH(MaSach)
)

