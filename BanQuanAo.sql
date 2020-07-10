create database Clothing_Store
go
use Clothing_Store
go
create table taikhoan(
matk int primary key,
tendn nvarchar(100),
matkhau nvarchar(100),
quyen nvarchar(100)
)
go
create table khachhang(
makh int primary key,
tenkh nvarchar(100),
sdt nvarchar(20),
email nvarchar(100),
ngaysinh nvarchar(100),
diachi nvarchar(200) null,
gioitinh nvarchar(20),
matk int
foreign key (matk) references taikhoan(matk)
)
go
create table nhanvien(
manv int primary key,
tennv nvarchar(100),
chucvu nvarchar(100),
sdt nvarchar(20),
cmnd nvarchar(20),
ngaysinh nvarchar(100),
gioitinh nvarchar(200),
matk int
foreign key (matk) references taikhoan(matk)
)
go
create table ykienkhachhang(
mayk int primary key,
ten nvarchar(100),
noidung nvarchar(1000),
makh int,
ngay date,
sdt nvarchar(20),
email nvarchar(100),

foreign key (makh) references khachhang(makh)
)
go
create table loaihang(
maloai int primary key,
tenloai nvarchar(100),
)
go
create table sanpham(
masp int primary key,
tensp nvarchar(100),
hinh nvarchar(1000),
kichthuoc nvarchar(100),
mau nvarchar(100),
soluong int,
dongia int,
mota nvarchar(1000),
maloai int 

foreign key (maloai) references loaihang(maloai)
)
go
create table khuyenmai(
makm int primary key,
tenkm nvarchar(100),
mota nvarchar,
dongia int,
masp int,

foreign key (masp) references sanpham(masp)
)
go
create table ptthanhtoan(
mathanhtoan int primary key,
mota nvarchar(1000),
)
go
create table ptgiaohang(
magiaohang int primary key,
mota nvarchar(1000),
)
go
create table hoadon(
mahd int primary key,
makh int,
ten nvarchar(100),
diachi nvarchar(100),
tinhtrang nvarchar(100),
ngaydathang date,
ngaygiaohang date,
mathanhtoan int,
magiaohang int,

foreign key (makh) references khachhang(makh),
foreign key (mathanhtoan) references ptthanhtoan(mathanhtoan),
foreign key (magiaohang) references ptgiaohang(magiaohang)
)
go
create table chitiethd(
macthd int primary key,
mahd int,
masp int,
kichthuoc nvarchar(100),
soluong int,
giaban int,
tongtien int,
ghichu nvarchar(1000),

foreign key (mahd) references hoadon(mahd),
foreign key (masp) references sanpham(masp)
)
go
--insert data
insert into taikhoan(matk,tendn,matkhau,quyen) values(1,N'admin',1234,N'admin')
insert into taikhoan(matk,tendn,matkhau,quyen) values(2,N'nhanvien',1234,N'nhanvien')
insert into taikhoan(matk,tendn,matkhau,quyen) values(3,N'nguyenphucbao',1234,N'khachhang')
insert into taikhoan(matk,tendn,matkhau,quyen) values(4,N'datdao',1234,N'khachhang')
insert into taikhoan(matk,tendn,matkhau,quyen) values(5,N'khoale',1234,N'khachhang')
insert into taikhoan(matk,tendn,matkhau,quyen) values(6,N'kietduong',1234,N'khachhang')
insert into taikhoan(matk,tendn,matkhau,quyen) values(7,N'sonho',1234,N'khachhang')
insert into taikhoan(matk,tendn,matkhau,quyen) values(8,N'thaovuong',1234,N'khachhang')
insert into taikhoan(matk,tendn,matkhau,quyen) values(9,N'baonguyen',1234,N'khachhang')
insert into taikhoan(matk,tendn,matkhau,quyen) values(10,N'dongnguyen',1234,N'khachhang')
insert into taikhoan(matk,tendn,matkhau,quyen) values(11,N'truongnguyen',1234,N'khachhang')
insert into taikhoan(matk,tendn,matkhau,quyen) values(12,N'nguyennguyen',1234,N'khachhang')
insert into taikhoan(matk,tendn,matkhau,quyen) values(13,N'baobanh',1234,N'khachhang')
insert into taikhoan(matk,tendn,matkhau,quyen) values(14,N'cuongle',1234,N'khachhang')
insert into taikhoan(matk,tendn,matkhau,quyen) values(15,N'dahuynh',1234,N'khachhang')
insert into taikhoan(matk,tendn,matkhau,quyen) values(16,N'tuando',1234,N'khachhang')
insert into taikhoan(matk,tendn,matkhau,quyen) values(17,N'tuannguyen',1234,N'khachhang')
insert into taikhoan(matk,tendn,matkhau,quyen) values(18,N'khoima',1234,N'khachhang')
insert into taikhoan(matk,tendn,matkhau,quyen) values(19,N'baohoang',1234,N'khachhang')
insert into taikhoan(matk,tendn,matkhau,quyen) values(20,N'nhattruong',1234,N'khachhang')
go
insert into khachhang(makh,tenkh,sdt,email,ngaysinh,diachi,gioitinh,matk) values(1,N'nguyen phuc bao',N'0123131311',N'baonguyen@gmail.com',N'07-04-1999',N'long khanh',N'Nam',3)
insert into khachhang(makh,tenkh,sdt,email,ngaysinh,diachi,gioitinh,matk) values(2,N'dao duc dat',N'0123131313',N'datdao@gmail.com',N'15-04-1999',N'long khanh',N'Nam',4)
insert into khachhang(makh,tenkh,sdt,email,ngaysinh,diachi,gioitinh,matk) values(3,N'le anh khoa',N'0123133455',N'khoale@gmail.com',N'13-04-1999',N'long khanh',N'Nam',5)
insert into khachhang(makh,tenkh,sdt,email,ngaysinh,diachi,gioitinh,matk) values(4,N'duong hung kiet',N'012252311',N'duongkiet@gmail.com',N'12-04-1999',N'long khanh',N'Nam',6)
insert into khachhang(makh,tenkh,sdt,email,ngaysinh,diachi,gioitinh,matk) values(5,N'ho vinh son',N'01231364561',N'sonvinh@gmail.com',N'11-04-1999',N'long khanh',N'Nam',7)
insert into khachhang(makh,tenkh,sdt,email,ngaysinh,diachi,gioitinh,matk) values(6,N'vuong thi thao',N'01237456311',N'thaovuong@gmail.com',N'10-04-1999',N'long khanh',N'Nam',8)
insert into khachhang(makh,tenkh,sdt,email,ngaysinh,diachi,gioitinh,matk) values(7,N'nguyen thien bao',N'01233451311',N'thienbao@gmail.com',N'07-1-1999',N'long khanh',N'Nam',9)
insert into khachhang(makh,tenkh,sdt,email,ngaysinh,diachi,gioitinh,matk) values(8,N'nguyen duc dong',N'0123135411',N'dongnguyen@gmail.com',N'08-11-1999',N'long khanh',N'Nam',10)
insert into khachhang(makh,tenkh,sdt,email,ngaysinh,diachi,gioitinh,matk) values(9,N'nguyen thien truong',N'0167131311',N'truongnguyen@gmail.com',N'07-12-1999',N'long khanh',N'Nam',11)
insert into khachhang(makh,tenkh,sdt,email,ngaysinh,diachi,gioitinh,matk) values(10,N'nguyen dinh tri nguyen',N'0167131311',N'nguyennguyen@gmail.com',N'07-11-1999',N'long khanh',N'Nam',12)
insert into khachhang(makh,tenkh,sdt,email,ngaysinh,diachi,gioitinh,matk) values(11,N'le bao',N'0123137651',N'baole@gmail.com',N'07-10-1999',N'long khanh',N'Nam',13)
insert into khachhang(makh,tenkh,sdt,email,ngaysinh,diachi,gioitinh,matk) values(12,N'le quang cuong',N'0126431311',N'lecuong@gmail.com',N'07-09-1999',N'long khanh',N'Nam',14)
insert into khachhang(makh,tenkh,sdt,email,ngaysinh,diachi,gioitinh,matk) values(13,N'huynh tan da',N'0123176311',N'datan@gmail.com',N'07-08-1999',N'long khanh',N'Nam',15)
insert into khachhang(makh,tenkh,sdt,email,ngaysinh,diachi,gioitinh,matk) values(14,N'do le anh tuan',N'0124531311',N'tuando@gmail.com',N'07-07-1999',N'long khanh',N'Nam',16)
insert into khachhang(makh,tenkh,sdt,email,ngaysinh,diachi,gioitinh,matk) values(15,N'nguyen hoang tuan',N'0127631311',N'tuannguyen@gmail.com',N'07-06-1999',N'long khanh',N'Nam',17)
insert into khachhang(makh,tenkh,sdt,email,ngaysinh,diachi,gioitinh,matk) values(16,N'ma thanh khoi',N'0123131751',N'khoima@gmail.com',N'07-05-1999',N'long khanh',N'Nam',18)
insert into khachhang(makh,tenkh,sdt,email,ngaysinh,diachi,gioitinh,matk) values(17,N'hoang bao',N'0123131431',N'baohoang@gmail.com',N'09-04-1999',N'long khanh',N'Nam',19)
insert into khachhang(makh,tenkh,sdt,email,ngaysinh,diachi,gioitinh,matk) values(18,N'nguyen nhat truong',N'01235131311',N'truongnhat@gmail.com',N'08-04-1999',N'long khanh',N'Nam',20)
go
insert into nhanvien(manv,tennv,chucvu,sdt,cmnd,ngaysinh,gioitinh,matk) values(1,N'tony','nv cham soc khach hang','0414141411','271313131','09-06-1999','Nam',2)
insert into nhanvien(manv,tennv,chucvu,sdt,cmnd,ngaysinh,gioitinh,matk) values(2,N'cat','nv cham soc khach hang','0414141411','271313131','08-06-1999','Nam',2)
insert into nhanvien(manv,tennv,chucvu,sdt,cmnd,ngaysinh,gioitinh,matk) values(3,N'tom,','nv kho','0418841411','271873131','05-06-1999','Nam',2)
insert into nhanvien(manv,tennv,chucvu,sdt,cmnd,ngaysinh,gioitinh,matk) values(4,N'teo','nv kho','0414661411','271398131','07-06-1999','Nam',2)
insert into nhanvien(manv,tennv,chucvu,sdt,cmnd,ngaysinh,gioitinh,matk) values(5,N'bom','nv web','0414878411','271365431','15-06-1999','Nam',2)
insert into nhanvien(manv,tennv,chucvu,sdt,cmnd,ngaysinh,gioitinh,matk) values(6,N'linda','nv ke toan','0414969611','2713100131','05-05-1999','Nu',2)
insert into nhanvien(manv,tennv,chucvu,sdt,cmnd,ngaysinh,gioitinh,matk) values(7,N'linlin','nv ke toan','0131969611','2723100131','15-05-1999','Nu',2)
insert into nhanvien(manv,tennv,chucvu,sdt,cmnd,ngaysinh,gioitinh,matk) values(8,N'rey','nv quan ly','0214969611','2725100131','22-05-1998','Nam',1)
insert into nhanvien(manv,tennv,chucvu,sdt,cmnd,ngaysinh,gioitinh,matk) values(9,N'cap','nv ke toan','0614969611','2724500131','25-05-1998','Nam',1)
go
insert into loaihang(maloai,tenloai) values(1,N'quan jeans')
insert into loaihang(maloai,tenloai) values(2,N'quan kaki')
insert into loaihang(maloai,tenloai) values(3,N'quan tay')
insert into loaihang(maloai,tenloai) values(4,N'ao jeans')
insert into loaihang(maloai,tenloai) values(5,N'ao khoac')
insert into loaihang(maloai,tenloai) values(6,N'ao hoody')
insert into loaihang(maloai,tenloai) values(7,N'ao thun')
insert into loaihang(maloai,tenloai) values(8,N'ao somi')
go
insert into sanpham(masp,tensp,hinh,kichthuoc,mau,soluong,dongia,mota,maloai) values(1,N'áo thun tron','/images/aothun/thuntrang.png','s','trang',10,100,'cotton',7)
insert into sanpham(masp,tensp,hinh,kichthuoc,mau,soluong,dongia,mota,maloai) values(2,N'áo thun tron','/images/aothun/thuntrang.png','m','trang',10,100,'cotton',7)
insert into sanpham(masp,tensp,hinh,kichthuoc,mau,soluong,dongia,mota,maloai) values(3,N'áo thun tron','/images/aothun/thuntrang.png','l','trang',10,100,'cotton',7)
insert into sanpham(masp,tensp,hinh,kichthuoc,mau,soluong,dongia,mota,maloai) values(4,N'áo thun tron','/images/aothun/thuntrang.png','xl','trang',10,100,'cotton',7)
insert into sanpham(masp,tensp,hinh,kichthuoc,mau,soluong,dongia,mota,maloai) values(5,N'áo thun tron','/images/aothun/thuntrang.png','xxl','trang',10,100,'cotton',7)
insert into sanpham(masp,tensp,hinh,kichthuoc,mau,soluong,dongia,mota,maloai) values(6,N'áo thun tron','/images/aothun/thundo.jpg','s','do',10,100,'cotton',7)
insert into sanpham(masp,tensp,hinh,kichthuoc,mau,soluong,dongia,mota,maloai) values(7,N'áo thun tron','/images/aothun/thundo.jpg','m','do',10,100,'cotton',7)
insert into sanpham(masp,tensp,hinh,kichthuoc,mau,soluong,dongia,mota,maloai) values(8,N'áo thun tron','/images/aothun/thundo.jpg','l','do',10,100,'cotton',7)
insert into sanpham(masp,tensp,hinh,kichthuoc,mau,soluong,dongia,mota,maloai) values(9,N'áo thun tron','/images/aothun/thundo.jpg','xl','do',10,100,'cotton',7)
insert into sanpham(masp,tensp,hinh,kichthuoc,mau,soluong,dongia,mota,maloai) values(10,N'áo thun tron','/images/aothun/thundo.jpg','xxl','do',10,100,'cotton',7)
insert into sanpham(masp,tensp,hinh,kichthuoc,mau,soluong,dongia,mota,maloai) values(11,N'áo thun tron','/images/aothun/thunxanh.jpg','s','xanh',10,100,'cotton',7)
insert into sanpham(masp,tensp,hinh,kichthuoc,mau,soluong,dongia,mota,maloai) values(12,N'áo thun tron','/images/aothun/thunxanh.jpg','m','xanh',10,100,'cotton',7)
insert into sanpham(masp,tensp,hinh,kichthuoc,mau,soluong,dongia,mota,maloai) values(13,N'áo thun tron','/images/aothun/thunxanh.jpg','l','xanh',10,100,'cotton',7)
insert into sanpham(masp,tensp,hinh,kichthuoc,mau,soluong,dongia,mota,maloai) values(14,N'áo thun tron','/images/aothun/thunxanh.jpg','xl','xanh',10,100,'cotton',7)
insert into sanpham(masp,tensp,hinh,kichthuoc,mau,soluong,dongia,mota,maloai) values(15,N'áo thun tron','/images/aothun/thunxanh.jpg','xxl','xanh',10,100,'cotton',7)
insert into sanpham(masp,tensp,hinh,kichthuoc,mau,soluong,dongia,mota,maloai) values(16,N'áo thun soc','/images/aothun/thunsoctd.jpg','s','trang den',10,100,'cotton',7)
insert into sanpham(masp,tensp,hinh,kichthuoc,mau,soluong,dongia,mota,maloai) values(17,N'áo thun soc','/images/aothun/thunsoctd.jpg','m','trang den',10,100,'cotton',7)
insert into sanpham(masp,tensp,hinh,kichthuoc,mau,soluong,dongia,mota,maloai) values(18,N'áo thun soc','/images/aothun/thunsoctd.jpg','l','trang den',10,100,'cotton',7)
insert into sanpham(masp,tensp,hinh,kichthuoc,mau,soluong,dongia,mota,maloai) values(19,N'áo thun soc','/images/aothun/thunsoctd.jpg','xl','trang den',10,100,'cotton',7)
insert into sanpham(masp,tensp,hinh,kichthuoc,mau,soluong,dongia,mota,maloai) values(20,N'áo thun soc','/images/aothun/thunsoctd.jpg','xxl','trang den',10,100,'cotton',7)
insert into sanpham(masp,tensp,hinh,kichthuoc,mau,soluong,dongia,mota,maloai) values(21,N'áo thun soc','/images/aothun/thunsocvd.jpg','s','vang den',10,100,'cotton',7)
insert into sanpham(masp,tensp,hinh,kichthuoc,mau,soluong,dongia,mota,maloai) values(22,N'áo thun soc','/images/aothun/thunsocvd.jpg','s','vang den',10,100,'cotton',7)
insert into sanpham(masp,tensp,hinh,kichthuoc,mau,soluong,dongia,mota,maloai) values(23,N'áo thun soc','/images/aothun/thunsocvd.jpg','s','vang den',10,100,'cotton',7)
insert into sanpham(masp,tensp,hinh,kichthuoc,mau,soluong,dongia,mota,maloai) values(24,N'áo thun soc','/images/aothun/thunsocvd.jpg','s','vang den',10,100,'cotton',7)
insert into sanpham(masp,tensp,hinh,kichthuoc,mau,soluong,dongia,mota,maloai) values(25,N'áo thun soc','/images/aothun/thunsocvd.jpg','s','vang den',10,100,'cotton',7)
insert into sanpham(masp,tensp,hinh,kichthuoc,mau,soluong,dongia,mota,maloai) values(26,N'áo khoac jeans','/images/aokhoac/khoacjeans.jpg','s','jeans',10,300,'jeans',5)
insert into sanpham(masp,tensp,hinh,kichthuoc,mau,soluong,dongia,mota,maloai) values(27,N'áo khoac jeans','/images/aokhoac/khoacjeans.jpg','m','jeans',10,300,'jeans',5)
insert into sanpham(masp,tensp,hinh,kichthuoc,mau,soluong,dongia,mota,maloai) values(28,N'áo khoac jeans','/images/aokhoac/khoacjeans.jpg','l','jeans',10,300,'jeans',5)
insert into sanpham(masp,tensp,hinh,kichthuoc,mau,soluong,dongia,mota,maloai) values(29,N'áo khoac jeans','/images/aokhoac/khoacjeans.jpg','xl','jeans',10,300,'jeans',5)
insert into sanpham(masp,tensp,hinh,kichthuoc,mau,soluong,dongia,mota,maloai) values(30,N'áo khoac jeans','/images/aokhoac/khoacjeans.jpg','xxl','jeans',10,300,'jeans',5)
insert into sanpham(masp,tensp,hinh,kichthuoc,mau,soluong,dongia,mota,maloai) values(31,N'áo hoodie','/images/hoodie/hoodie7.jpg','s','',10,250,'cotton',6)
insert into sanpham(masp,tensp,hinh,kichthuoc,mau,soluong,dongia,mota,maloai) values(32,N'áo hoodie','/images/hoodie/hoodie7.jpg','m','',10,250,'cotton',6)
insert into sanpham(masp,tensp,hinh,kichthuoc,mau,soluong,dongia,mota,maloai) values(33,N'áo hoodie','/images/hoodie/hoodie7.jpg','l','',10,250,'cotton',6)
insert into sanpham(masp,tensp,hinh,kichthuoc,mau,soluong,dongia,mota,maloai) values(34,N'áo hoodie','/images/hoodie/hoodie7.jpg','xl','',10,250,'cotton',6)
insert into sanpham(masp,tensp,hinh,kichthuoc,mau,soluong,dongia,mota,maloai) values(35,N'áo hoodie','/images/hoodie/hoodie7.jpg','xxl','',10,250,'cotton',6)
insert into sanpham(masp,tensp,hinh,kichthuoc,mau,soluong,dongia,mota,maloai) values(36,N'áo somi tron','/images/aosomi/somitrang.png','s','trang',10,200,'cotton',8)
insert into sanpham(masp,tensp,hinh,kichthuoc,mau,soluong,dongia,mota,maloai) values(37,N'áo somi tron','/images/aosomi/somitrang.png','m','trang',10,200,'cotton',8)
insert into sanpham(masp,tensp,hinh,kichthuoc,mau,soluong,dongia,mota,maloai) values(38,N'áo somi tron','/images/aosomi/somitrang.png','l','trang',10,200,'cotton',8)
insert into sanpham(masp,tensp,hinh,kichthuoc,mau,soluong,dongia,mota,maloai) values(39,N'áo somi tron','/images/aosomi/somitrang.png','xl','trang',10,200,'cotton',8)
insert into sanpham(masp,tensp,hinh,kichthuoc,mau,soluong,dongia,mota,maloai) values(40,N'áo somi tron','/images/aosomi/somitrang.png','xxl','trang',10,200,'cotton',8)
insert into sanpham(masp,tensp,hinh,kichthuoc,mau,soluong,dongia,mota,maloai) values(41,N'áo somi tron','/images/aosomi/somiden.jpg','s','den',10,200,'cotton',8)
insert into sanpham(masp,tensp,hinh,kichthuoc,mau,soluong,dongia,mota,maloai) values(42,N'áo somi tron','/images/aosomi/somiden.jpg','m','den',10,200,'cotton',8)
insert into sanpham(masp,tensp,hinh,kichthuoc,mau,soluong,dongia,mota,maloai) values(43,N'áo somi tron','/images/aosomi/somiden.jpg','l','den',10,200,'cotton',8)
insert into sanpham(masp,tensp,hinh,kichthuoc,mau,soluong,dongia,mota,maloai) values(44,N'áo somi tron','/images/aosomi/somiden.jpg','xl','den',10,200,'cotton',8)
insert into sanpham(masp,tensp,hinh,kichthuoc,mau,soluong,dongia,mota,maloai) values(45,N'áo somi tron','/images/aosomi/somiden.jpg','xxl','den',10,200,'cotton',8)
insert into sanpham(masp,tensp,hinh,kichthuoc,mau,soluong,dongia,mota,maloai) values(46,N'quần jeans','/images/quanjeans/jeans1.jpg','s','jeans',10,400,'jeans',1)
insert into sanpham(masp,tensp,hinh,kichthuoc,mau,soluong,dongia,mota,maloai) values(47,N'quần jeans','/images/quanjeans/jeans1.jpg','m','jeans',10,400,'jeans',1)
insert into sanpham(masp,tensp,hinh,kichthuoc,mau,soluong,dongia,mota,maloai) values(48,N'quần jeans','/images/quanjeans/jeans1.jpg','l','jeans',10,400,'jeans',1)
insert into sanpham(masp,tensp,hinh,kichthuoc,mau,soluong,dongia,mota,maloai) values(49,N'quần jeans','/images/quanjeans/jeans1.jpg','xl','jeans',10,400,'jeans',1)
insert into sanpham(masp,tensp,hinh,kichthuoc,mau,soluong,dongia,mota,maloai) values(50,N'quần jeans','/images/quanjeans/jeans1.jpg','xxl','jeans',10,400,'jeans',1)
insert into sanpham(masp,tensp,hinh,kichthuoc,mau,soluong,dongia,mota,maloai) values(51,N'quần tây','/images/quantay/tay1.jpg','s','tây',10,400,'jeans',3)
insert into sanpham(masp,tensp,hinh,kichthuoc,mau,soluong,dongia,mota,maloai) values(52,N'quần tây','/images/quantay/tay1.jpg','m','tây',10,400,'jeans',3)
insert into sanpham(masp,tensp,hinh,kichthuoc,mau,soluong,dongia,mota,maloai) values(53,N'quần tây','/images/quantay/tay1.jpg','l','tây',10,400,'jeans',3)
insert into sanpham(masp,tensp,hinh,kichthuoc,mau,soluong,dongia,mota,maloai) values(54,N'quần tây','/images/quantay/tay1.jpg','xl','tây',10,400,'jeans',3)
insert into sanpham(masp,tensp,hinh,kichthuoc,mau,soluong,dongia,mota,maloai) values(55,N'quần tây','/images/quantay/tay1.jpg','xxl','tây',10,400,'jeans',3)
go
