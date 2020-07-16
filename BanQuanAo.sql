USE [master]
GO
CREATE DATABASE [Store_Fashion]
 CONTAINMENT = NONE
GO
ALTER DATABASE [Store_Fashion] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Store_Fashion].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Store_Fashion] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Store_Fashion] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Store_Fashion] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Store_Fashion] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Store_Fashion] SET ARITHABORT OFF 
GO
ALTER DATABASE [Store_Fashion] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Store_Fashion] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Store_Fashion] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Store_Fashion] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Store_Fashion] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Store_Fashion] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Store_Fashion] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Store_Fashion] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Store_Fashion] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Store_Fashion] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Store_Fashion] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Store_Fashion] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Store_Fashion] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Store_Fashion] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Store_Fashion] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Store_Fashion] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Store_Fashion] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Store_Fashion] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Store_Fashion] SET  MULTI_USER 
GO
ALTER DATABASE [Store_Fashion] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Store_Fashion] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Store_Fashion] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Store_Fashion] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Store_Fashion] SET DELAYED_DURABILITY = DISABLED 
GO
USE [Store_Fashion]
GO
/****** Object:  UserDefinedFunction [dbo].[fuChuyenCoDauThanhKhongDau]    Script Date: 1/16/2019 1:32:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fuChuyenCoDauThanhKhongDau]
(
      @strInput NVARCHAR(4000)
)
RETURNS NVARCHAR(4000)
AS
BEGIN    
    IF @strInput IS NULL RETURN @strInput
    IF @strInput = '' RETURN @strInput
    DECLARE @RT NVARCHAR(4000)
    DECLARE @SIGN_CHARS NCHAR(136)
    DECLARE @UNSIGN_CHARS NCHAR (136)
 
    SET @SIGN_CHARS = N'ăâđêôơưàảãạáằẳẵặắầẩẫậấèẻẽẹéềểễệế
                 ìỉĩịíòỏõọóồổỗộốờởỡợớùủũụúừửữựứỳỷỹỵý
                 ĂÂĐÊÔƠƯÀẢÃẠÁẰẲẴẶẮẦẨẪẬẤÈẺẼẸÉỀỂỄỆẾÌỈĨỊÍ
                 ÒỎÕỌÓỒỔỖỘỐỜỞỠỢỚÙỦŨỤÚỪỬỮỰỨỲỶỸỴÝ'
                  +NCHAR(272)+ NCHAR(208)
    SET @UNSIGN_CHARS = N'aadeoouaaaaaaaaaaaaaaaeeeeeeeeee
                 iiiiiooooooooooooooouuuuuuuuuuyyyyy
                 AADEOOUAAAAAAAAAAAAAAAEEEEEEEEEEIIIII
                 OOOOOOOOOOOOOOOUUUUUUUUUUYYYYYDD'
 
    DECLARE @COUNTER INT
    DECLARE @COUNTER1 INT
    SET @COUNTER = 1
 
    WHILE (@COUNTER <=LEN(@strInput))
    BEGIN  
      SET @COUNTER1 = 1
      --Tìm trong chuỗi mẫu
       WHILE (@COUNTER1 <=LEN(@SIGN_CHARS)+1)
       BEGIN
     IF UNICODE(SUBSTRING(@SIGN_CHARS, @COUNTER1,1))
            = UNICODE(SUBSTRING(@strInput,@COUNTER ,1) )
     BEGIN          
          IF @COUNTER=1
              SET @strInput = SUBSTRING(@UNSIGN_CHARS, @COUNTER1,1)
              + SUBSTRING(@strInput, @COUNTER+1,LEN(@strInput)-1)                  
          ELSE
              SET @strInput = SUBSTRING(@strInput, 1, @COUNTER-1)
              +SUBSTRING(@UNSIGN_CHARS, @COUNTER1,1)
              + SUBSTRING(@strInput, @COUNTER+1,LEN(@strInput)- @COUNTER)
              BREAK
               END
             SET @COUNTER1 = @COUNTER1 +1
       END
      --Tìm tiếp
       SET @COUNTER = @COUNTER +1
    END
    SET @strInput = REPLACE(@strInput,' ','-')
    RETURN @strInput
END


GO
/****** Object:  Table [dbo].[devvn_quanhuyen]    Script Date: 1/16/2019 1:32:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[devvn_quanhuyen](
	[maqh] [varchar](5) NOT NULL,
	[name] [nvarchar](100) NULL,
	[type] [nvarchar](30) NULL,
	[matp] [varchar](5) NULL,
PRIMARY KEY CLUSTERED 
(
	[maqh] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[devvn_tinhthanhpho]    Script Date: 1/16/2019 1:32:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[devvn_tinhthanhpho](
	[matp] [varchar](5) NOT NULL,
	[name] [nvarchar](100) NULL,
	[type] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[matp] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PayMeThod]    Script Date: 1/16/2019 1:32:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PayMeThod](
	[IdPay] [int] IDENTITY(1,1) NOT NULL,
	[HinhThucThanhToan] [nvarchar](50) NULL,
	[Visible] [bit] NULL,
 CONSTRAINT [PK_PayMeThod] PRIMARY KEY CLUSTERED 
(
	[IdPay] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_admin]    Script Date: 1/16/2019 1:32:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_admin](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](100) NULL,
	[pass] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_ChiTietDatHang]    Script Date: 1/16/2019 1:32:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_ChiTietDatHang](
	[id_hoadon] [int] NOT NULL,
	[id_hang] [int] NOT NULL,
	[SoLuongMua] [int] NULL,
	[ThanhTien] [money] NULL,
	[Size] [char](10) NULL,
	[Gia] [money] NULL,
 CONSTRAINT [PK_tbl_ChiTietHoaDon] PRIMARY KEY CLUSTERED 
(
	[id_hoadon] ASC,
	[id_hang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_DatHang]    Script Date: 1/16/2019 1:32:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_DatHang](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[NgaylapHD] [date] NULL,
	[id_KhachHang] [int] NULL,
	[IdPay] [int] NULL,
 CONSTRAINT [PK_HoaDon] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_Hang]    Script Date: 1/16/2019 1:32:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Hang](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[TenHang] [nvarchar](255) NULL,
	[image] [nvarchar](max) NULL,
	[ChatLieu] [nvarchar](50) NULL,
	[Mota] [ntext] NULL,
	[LuotXem] [int] NULL,
	[giaMoi] [money] NULL,
	[giaCu] [money] NULL,
	[id_Menu] [int] NULL,
	[Soluong] [int] NULL,
	[TinhTrang] [nvarchar](50) NULL,
	[Active] [bit] NULL,
	[image_large] [varchar](500) NULL,
	[TomTat] [nvarchar](max) NULL,
 CONSTRAINT [PK_tbl_Hang] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_KhachHang]    Script Date: 1/16/2019 1:32:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_KhachHang](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[tenKH] [nvarchar](50) NULL,
	[GioiTinh] [bit] NULL,
	[NgaySinh] [date] NULL,
	[TaiKhoan] [nvarchar](50) NULL,
	[MatKhau] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[SDT] [char](10) NULL,
	[Tinh] [nvarchar](50) NULL,
	[Quan] [nvarchar](50) NULL,
	[TinhTrang] [nvarchar](50) NULL,
	[DiaChi] [ntext] NULL,
	[Link_Fb] [varchar](200) NULL,
 CONSTRAINT [PK_tbl_KhachHang] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_KhuyenMai]    Script Date: 1/16/2019 1:32:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_KhuyenMai](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[GiaTri] [int] NULL,
 CONSTRAINT [PK_tbl_KhuyenMai] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_LienLac]    Script Date: 1/16/2019 1:32:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_LienLac](
	[Ten] [nvarchar](50) NULL,
	[DiaChi] [ntext] NULL,
	[DienThoai] [char](10) NULL,
	[Email] [varchar](50) NULL,
	[ChuDe] [nvarchar](50) NULL,
	[NoiDung] [ntext] NULL,
	[id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_tbl_LienLac] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_NhaCungCap]    Script Date: 1/16/2019 1:32:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_NhaCungCap](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[tenNCC] [nvarchar](50) NULL,
	[DiaChi] [ntext] NULL,
	[DienThoai] [nchar](10) NULL,
	[Email] [nchar](10) NULL,
 CONSTRAINT [PK_tbl_NhaCungCap] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_NhanVien]    Script Date: 1/16/2019 1:32:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_NhanVien](
	[id] [int] NOT NULL,
	[tenNV] [nvarchar](50) NULL,
	[NgaySinh] [date] NULL,
	[gioitinh] [nvarchar](50) NULL,
	[ChucVu] [nvarchar](50) NULL,
	[id_quyen] [int] NULL,
	[UserName] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
 CONSTRAINT [PK_tbl_NhanVien] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_NhomHang]    Script Date: 1/16/2019 1:32:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_NhomHang](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[TenNhomHang] [nvarchar](50) NULL,
	[Active] [bit] NULL,
	[idkhongdau] [nvarchar](200) NULL,
	[khongdau] [varchar](200) NULL,
 CONSTRAINT [PK_tbl_Menu] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_PhieuNhap]    Script Date: 1/16/2019 1:32:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_PhieuNhap](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ngayNhap] [date] NULL,
	[id_nhanvien] [int] NULL,
	[id_NCC] [int] NULL,
 CONSTRAINT [PK_tbl_PhieuNhap] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_QuanLyMeNu]    Script Date: 1/16/2019 1:32:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_QuanLyMeNu](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TenMenu] [nvarchar](50) NULL,
	[Type] [int] NULL,
	[Ord] [int] NULL,
	[Level] [nvarchar](50) NULL,
	[Link] [nvarchar](500) NULL,
	[TypeClick] [nvarchar](50) NULL,
	[Icon] [nvarchar](250) NULL,
	[Active] [bit] NULL,
 CONSTRAINT [PK_tbl_QuanLyMeNu] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_Quyen]    Script Date: 1/16/2019 1:32:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Quyen](
	[id] [int] NOT NULL,
	[TaiKhoan] [nvarchar](50) NULL,
	[MatKhau] [nvarchar](50) NULL,
	[id_NhanVien] [int] NULL,
	[TenQuyen] [nvarchar](50) NULL,
 CONSTRAINT [PK_tbl_Quyen] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_TinTuc]    Script Date: 1/16/2019 1:32:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_TinTuc](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[tieuDe] [nvarchar](max) NULL,
	[tomtat] [nvarchar](max) NULL,
	[noidung] [nvarchar](max) NULL,
	[ngayviet] [date] NULL,
	[id_nhanvien] [int] NULL,
	[urlHinhAnh] [text] NULL,
	[LuotXem] [int] NULL,
	[Active] [bit] NULL,
 CONSTRAINT [PK_tbl_TinTuc] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblQuangCao]    Script Date: 1/16/2019 1:32:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblQuangCao](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[urlImage] [varchar](50) NULL,
	[Active] [bit] NULL,
	[Count_Click] [int] NULL,
 CONSTRAINT [PK_Anh_GioiThieu] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'001', N'Quận Ba Đình', N'Quận', N'01')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'002', N'Quận Hoàn Kiếm', N'Quận', N'01')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'003', N'Quận Tây Hồ', N'Quận', N'01')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'004', N'Quận Long Biên', N'Quận', N'01')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'005', N'Quận Cầu Giấy', N'Quận', N'01')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'006', N'Quận Đống Đa', N'Quận', N'01')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'007', N'Quận Hai Bà Trưng', N'Quận', N'01')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'008', N'Quận Hoàng Mai', N'Quận', N'01')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'009', N'Quận Thanh Xuân', N'Quận', N'01')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'016', N'Huyện Sóc Sơn', N'Huyện', N'01')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'017', N'Huyện Đông Anh', N'Huyện', N'01')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'018', N'Huyện Gia Lâm', N'Huyện', N'01')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'019', N'Quận Nam Từ Liêm', N'Quận', N'01')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'020', N'Huyện Thanh Trì', N'Huyện', N'01')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'021', N'Quận Bắc Từ Liêm', N'Quận', N'01')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'024', N'Quận 1', N'Quận', N'02')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'026', N'Quận 2', N'Quận', N'02')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'027', N'Quận 3', N'Quận', N'02')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'028', N'Quận 4', N'Quận', N'02')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'029', N'Quận 5', N'Quận', N'02')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'030', N'Quận 6', N'Quận', N'02')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'031', N'Quận 7', N'Quận', N'02')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'032', N'Quận 8', N'Quận', N'02')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'033', N'Quận 9', N'Quận', N'02')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'034', N'Quận 10', N'Quận', N'02')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'035',N'Quận 11', N'Quận', N'02')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'036',N'Quận 12', N'Quận', N'02')

INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'040', N'Thành phố Cao Bằng', N'Thành phố', N'04')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'042', N'Huyện Bảo Lâm', N'Huyện', N'04')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'043', N'Huyện Bảo Lạc', N'Huyện', N'04')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'044', N'Huyện Thông Nông', N'Huyện', N'04')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'045', N'Huyện Hà Quảng', N'Huyện', N'04')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'046', N'Huyện Trà Lĩnh', N'Huyện', N'04')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'047', N'Huyện Trùng Khánh', N'Huyện', N'04')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'048', N'Huyện Hạ Lang', N'Huyện', N'04')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'049', N'Huyện Quảng Uyên', N'Huyện', N'04')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'050', N'Huyện Phục Hoà', N'Huyện', N'04')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'051', N'Huyện Hoà An', N'Huyện', N'04')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'052', N'Huyện Nguyên Bình', N'Huyện', N'04')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'053', N'Huyện Thạch An', N'Huyện', N'04')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'058', N'Thành Phố Bắc Kạn', N'Thành phố', N'06')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'060', N'Huyện Pác Nặm', N'Huyện', N'06')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'061', N'Huyện Ba Bể', N'Huyện', N'06')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'062', N'Huyện Ngân Sơn', N'Huyện', N'06')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'063', N'Huyện Bạch Thông', N'Huyện', N'06')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'064', N'Huyện Chợ Đồn', N'Huyện', N'06')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'065', N'Huyện Chợ Mới', N'Huyện', N'06')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'066', N'Huyện Na Rì', N'Huyện', N'06')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'070', N'Thành phố Tuyên Quang', N'Thành phố', N'08')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'071', N'Huyện Lâm Bình', N'Huyện', N'08')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'072', N'Huyện Nà Hang', N'Huyện', N'08')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'073', N'Huyện Chiêm Hóa', N'Huyện', N'08')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'074', N'Huyện Hàm Yên', N'Huyện', N'08')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'075', N'Huyện Yên Sơn', N'Huyện', N'08')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'076', N'Huyện Sơn Dương', N'Huyện', N'08')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'080', N'Thành phố Lào Cai', N'Thành phố', N'10')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'082', N'Huyện Bát Xát', N'Huyện', N'10')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'083', N'Huyện Mường Khương', N'Huyện', N'10')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'084', N'Huyện Si Ma Cai', N'Huyện', N'10')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'085', N'Huyện Bắc Hà', N'Huyện', N'10')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'086', N'Huyện Bảo Thắng', N'Huyện', N'10')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'087', N'Huyện Bảo Yên', N'Huyện', N'10')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'088', N'Huyện Sa Pa', N'Huyện', N'10')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'089', N'Huyện Văn Bàn', N'Huyện', N'10')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'094', N'Thành phố Điện Biên Phủ', N'Thành phố', N'11')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'095', N'Thị Xã Mường Lay', N'Th? xã', N'11')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'096', N'Huyện Mường Nhé', N'Huyện', N'11')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'097', N'Huyện Mường Chà', N'Huyện', N'11')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'098', N'Huyện Tủa Chùa', N'Huyện', N'11')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'099', N'Huyện Tuần Giáo', N'Huyện', N'11')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'100', N'Huyện Điện Biên', N'Huyện', N'11')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'101', N'Huyện Điện Biên Đông', N'Huyện', N'11')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'102', N'Huyện Mường Ảng', N'Huyện', N'11')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'103', N'Huyện Nậm Pồ', N'Huyện', N'11')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'105', N'Thành phố Lai Châu', N'Thành phố', N'12')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'106', N'Huyện Tam Đường', N'Huyện', N'12')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'107', N'Huyện Mường Tè', N'Huyện', N'12')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'108', N'Huyện Sìn Hồ', N'Huyện', N'12')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'109', N'Huyện Phong Thổ', N'Huyện', N'12')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'110', N'Huyện Than Uyên', N'Huyện', N'12')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'111', N'Huyện Tân Uyên', N'Huyện', N'12')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'112', N'Huyện Nậm Nhùn', N'Huyện', N'12')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'116', N'Thành phố Sơn La', N'Thành phố', N'14')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'118', N'Huyện Quỳnh Nhai', N'Huyện', N'14')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'119', N'Huyện Thuận Châu', N'Huyện', N'14')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'120', N'Huyện Mường La', N'Huyện', N'14')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'121', N'Huyện Bắc Yên', N'Huyện', N'14')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'122', N'Huyện Phù Yên', N'Huyện', N'14')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'123', N'Huyện Mộc Châu', N'Huyện', N'14')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'124', N'Huyện Yên Châu', N'Huyện', N'14')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'125', N'Huyện Mai Sơn', N'Huyện', N'14')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'126', N'Huyện Sông Mã', N'Huyện', N'14')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'127', N'Huyện Sốp Cộp', N'Huyện', N'14')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'128', N'Huyện Vân Hồ', N'Huyện', N'14')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'132', N'Thành phố Yên Bái', N'Thành phố', N'15')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'133', N'Thị xã Nghĩa Lộ', N'Th? xã', N'15')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'135', N'Huyện Lục Yên', N'Huyện', N'15')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'136', N'Huyện Văn Yên', N'Huyện', N'15')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'137', N'Huyện Mù Căng Chải', N'Huyện', N'15')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'138', N'Huyện Trấn Yên', N'Huyện', N'15')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'139', N'Huyện Trạm Tấu', N'Huyện', N'15')
GO
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'140', N'Huyện Văn Chấn', N'Huyện', N'15')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'141', N'Huyện Yên Bình', N'Huyện', N'15')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'148', N'Thành phố Hòa Bình', N'Thành phố', N'17')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'150', N'Huyện Đà Bắc', N'Huyện', N'17')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'151', N'Huyện Kỳ Sơn', N'Huyện', N'17')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'152', N'Huyện Lương Sơn', N'Huyện', N'17')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'153', N'Huyện Kim Bôi', N'Huyện', N'17')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'154', N'Huyện Cao Phong', N'Huyện', N'17')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'155', N'Huyện Tân Lạc', N'Huyện', N'17')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'156', N'Huyện Mai Châu', N'Huyện', N'17')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'157', N'Huyện Lạc Sơn', N'Huyện', N'17')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'158', N'Huyện Yên Thủy', N'Huyện', N'17')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'159', N'Huyện Lạc Thủy', N'Huyện', N'17')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'164', N'Thành phố Thái Nguyên', N'Thành phố', N'19')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'165', N'Thành phố Sông Công', N'Thành phố', N'19')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'167', N'Huyện Định Hóa', N'Huyện', N'19')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'168', N'Huyện Phú Lương', N'Huyện', N'19')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'169', N'Huyện Đồng Hỷ', N'Huyện', N'19')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'170', N'Huyện Võ Nhai', N'Huyện', N'19')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'171', N'Huyện Đại Từ', N'Huyện', N'19')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'172', N'Thị xã Phổ Yên', N'Th? xã', N'19')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'173', N'Huyện Phú Bình', N'Huyện', N'19')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'178', N'Thành phố Lạng Sơn', N'Thành phố', N'20')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'180', N'Huyện Tràng Định', N'Huyện', N'20')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'181', N'Huyện Bình Gia', N'Huyện', N'20')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'182', N'Huyện Văn Lãng', N'Huyện', N'20')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'183', N'Huyện Cao Lộc', N'Huyện', N'20')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'184', N'Huyện Văn Quan', N'Huyện', N'20')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'185', N'Huyện Bắc Sơn', N'Huyện', N'20')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'186', N'Huyện Hữu Lũng', N'Huyện', N'20')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'187', N'Huyện Chi Lăng', N'Huyện', N'20')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'188', N'Huyện Lộc Bình', N'Huyện', N'20')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'189', N'Huyện Đình Lập', N'Huyện', N'20')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'193', N'Thành phố Hạ Long', N'Thành phố', N'22')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'194', N'Thành phố Móng Cái', N'Thành phố', N'22')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'195', N'Thành phố Cẩm Phả', N'Thành phố', N'22')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'196', N'Thành phố Uông Bí', N'Thành phố', N'22')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'198', N'Huyện Bình Liêu', N'Huyện', N'22')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'199', N'Huyện Tiên Yên', N'Huyện', N'22')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'200', N'Huyện Đầm Hà', N'Huyện', N'22')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'201', N'Huyện Hải Hà', N'Huyện', N'22')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'202', N'Huyện Ba Chẽ', N'Huyện', N'22')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'203', N'Huyện Vân Đồn', N'Huyện', N'22')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'204', N'Huyện Hoành Bồ', N'Huyện', N'22')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'205', N'Thị xã Đông Triều', N'Th? xã', N'22')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'206', N'Thị xã Quảng Yên', N'Th? xã', N'22')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'207', N'Huyện Cô Tô', N'Huyện', N'22')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'213', N'Thành phố Bắc Giang', N'Thành phố', N'24')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'215', N'Huyện Yên Thế', N'Huyện', N'24')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'216', N'Huyện Tân Yên', N'Huyện', N'24')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'217', N'Huyện Lạng Giang', N'Huyện', N'24')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'218', N'Huyện Lục Nam', N'Huyện', N'24')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'219', N'Huyện Lục Ngạn', N'Huyện', N'24')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'220', N'Huyện Sơn Động', N'Huyện', N'24')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'221', N'Huyện Yên Dũng', N'Huyện', N'24')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'222', N'Huyện Việt Yên', N'Huyện', N'24')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'223', N'Huyện Hiệp Hòa', N'Huyện', N'24')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'227', N'Thành phố Việt Trì', N'Thành phố', N'25')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'228', N'Thị xã Phú Thọ', N'Th? xã', N'25')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'230', N'Huyện Đoan Hùng', N'Huyện', N'25')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'231', N'Huyện Hạ Hoà', N'Huyện', N'25')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'232', N'Huyện Thanh Ba', N'Huyện', N'25')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'233', N'Huyện Phù Ninh', N'Huyện', N'25')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'234', N'Huyện Yên Lập', N'Huyện', N'25')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'235', N'Huyện Cẩm Khê', N'Huyện', N'25')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'236', N'Huyện Tam Nông', N'Huyện', N'25')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'237', N'Huyện Lâm Thao', N'Huyện', N'25')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'238', N'Huyện Thanh Sơn', N'Huyện', N'25')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'239', N'Huyện Thanh Thuỷ', N'Huyện', N'25')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'240', N'Huyện Tân Sơn', N'Huyện', N'25')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'243', N'Thành phố Vĩnh Yên', N'Thành phố', N'26')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'244', N'Thị xã Phúc Yên', N'Th? xã', N'26')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'246', N'Huyện Lập Thạch', N'Huyện', N'26')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'247', N'Huyện Tam Dương', N'Huyện', N'26')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'248', N'Huyện Tam Đảo', N'Huyện', N'26')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'249', N'Huyện Bình Xuyên', N'Huyện', N'26')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'250', N'Huyện Mê Linh', N'Huyện', N'01')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'251', N'Huyện Yên Lạc', N'Huyện', N'26')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'252', N'Huyện Vĩnh Tường', N'Huyện', N'26')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'253', N'Huyện Sông Lô', N'Huyện', N'26')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'256', N'Thành phố Bắc Ninh', N'Thành phố', N'27')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'258', N'Huyện Yên Phong', N'Huyện', N'27')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'259', N'Huyện Quế Võ', N'Huyện', N'27')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'260', N'Huyện Tiên Du', N'Huyện', N'27')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'261', N'Thị xã Từ Sơn', N'Th? xã', N'27')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'262', N'Huyện Thuận Thành', N'Huyện', N'27')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'263', N'Huyện Gia Bình', N'Huyện', N'27')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'264', N'Huyện Lương Tài', N'Huyện', N'27')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'268', N'Quận Hà Đông', N'Quận', N'01')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'269', N'Thị xã Sơn Tây', N'Th? xã', N'01')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'271', N'Huyện Ba Vì', N'Huyện', N'01')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'272', N'Huyện Phúc Thọ', N'Huyện', N'01')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'273', N'Huyện Đan Phượng', N'Huyện', N'01')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'274', N'Huyện Hoài Đức', N'Huyện', N'01')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'275', N'Huyện Quốc Oai', N'Huyện', N'01')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'276', N'Huyện Thạch Thất', N'Huyện', N'01')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'277', N'Huyện Chương Mỹ', N'Huyện', N'01')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'278', N'Huyện Thanh Oai', N'Huyện', N'01')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'279', N'Huyện Thường Tín', N'Huyện', N'01')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'280', N'Huyện Phú Xuyên', N'Huyện', N'01')
GO
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'281', N'Huyện Ứng Hòa', N'Huyện', N'01')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'282', N'Huyện Mỹ Đức', N'Huyện', N'01')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'288', N'Thành phố Hải Dương', N'Thành phố', N'30')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'290', N'Thị xã Chí Linh', N'Th? xã', N'30')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'291', N'Huyện Nam Sách', N'Huyện', N'30')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'292', N'Huyện Kinh Môn', N'Huyện', N'30')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'293', N'Huyện Kim Thành', N'Huyện', N'30')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'294', N'Huyện Thanh Hà', N'Huyện', N'30')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'295', N'Huyện Cẩm Giàng', N'Huyện', N'30')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'296', N'Huyện Bình Giang', N'Huyện', N'30')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'297', N'Huyện Gia Lộc', N'Huyện', N'30')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'298', N'Huyện Tứ Kỳ', N'Huyện', N'30')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'299', N'Huyện Ninh Giang', N'Huyện', N'30')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'300', N'Huyện Thanh Miện', N'Huyện', N'30')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'303', N'Quận Hồng Bàng', N'Quận', N'31')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'304', N'Quận Ngô Quyền', N'Quận', N'31')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'305', N'Quận Lê Chân', N'Quận', N'31')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'306', N'Quận Hải An', N'Quận', N'31')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'307', N'Quận Kiến An', N'Quận', N'31')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'308', N'Quận Đồ Sơn', N'Quận', N'31')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'309', N'Quận Dương Kinh', N'Quận', N'31')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'311', N'Huyện Thuỷ Nguyên', N'Huyện', N'31')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'312', N'Huyện An Dương', N'Huyện', N'31')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'313', N'Huyện An Lão', N'Huyện', N'31')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'314', N'Huyện Kiến Thuỵ', N'Huyện', N'31')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'315', N'Huyện Tiên Lãng', N'Huyện', N'31')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'316', N'Huyện Vĩnh Bảo', N'Huyện', N'31')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'317', N'Huyện Cát Hải', N'Huyện', N'31')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'318', N'Huyện Bạch Long Vĩ', N'Huyện', N'31')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'323', N'Thành phố Hưng Yên', N'Thành phố', N'33')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'325', N'Huyện Văn Lâm', N'Huyện', N'33')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'326', N'Huyện Văn Giang', N'Huyện', N'33')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'327', N'Huyện Yên Mỹ', N'Huyện', N'33')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'328', N'Huyện Mỹ Hào', N'Huyện', N'33')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'329', N'Huyện Ân Thi', N'Huyện', N'33')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'330', N'Huyện Khoái Châu', N'Huyện', N'33')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'331', N'Huyện Kim Động', N'Huyện', N'33')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'332', N'Huyện Tiên Lữ', N'Huyện', N'33')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'333', N'Huyện Phù Cừ', N'Huyện', N'33')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'336', N'Thành phố Thái Bình', N'Thành phố', N'34')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'338', N'Huyện Quỳnh Phụ', N'Huyện', N'34')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'339', N'Huyện Hưng Hà', N'Huyện', N'34')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'340', N'Huyện Đông Hưng', N'Huyện', N'34')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'341', N'Huyện Thái Thụy', N'Huyện', N'34')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'342', N'Huyện Tiền Hải', N'Huyện', N'34')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'343', N'Huyện Kiến Xương', N'Huyện', N'34')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'344', N'Huyện Vũ Thư', N'Huyện', N'34')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'347', N'Thành phố Phủ Lý', N'Thành phố', N'35')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'349', N'Huyện Duy Tiên', N'Huyện', N'35')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'350', N'Huyện Kim Bảng', N'Huyện', N'35')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'351', N'Huyện Thanh Liêm', N'Huyện', N'35')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'352', N'Huyện Bình Lục', N'Huyện', N'35')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'353', N'Huyện Lý Nhân', N'Huyện', N'35')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'356', N'Thành phố Nam Định', N'Thành phố', N'36')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'358', N'Huyện Mỹ Lộc', N'Huyện', N'36')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'359', N'Huyện Vụ Bản', N'Huyện', N'36')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'360', N'Huyện Ý Yên', N'Huyện', N'36')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'361', N'Huyện Nghĩa Hưng', N'Huyện', N'36')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'362', N'Huyện Nam Trực', N'Huyện', N'36')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'363', N'Huyện Trực Ninh', N'Huyện', N'36')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'364', N'Huyện Xuân Trường', N'Huyện', N'36')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'365', N'Huyện Giao Thủy', N'Huyện', N'36')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'366', N'Huyện Hải Hậu', N'Huyện', N'36')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'369', N'Thành phố Ninh Bình', N'Thành phố', N'37')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'370', N'Thành phố Tam Điệp', N'Thành phố', N'37')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'372', N'Huyện Nho Quan', N'Huyện', N'37')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'373', N'Huyện Gia Viễn', N'Huyện', N'37')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'374', N'Huyện Hoa Lư', N'Huyện', N'37')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'375', N'Huyện Yên Khánh', N'Huyện', N'37')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'376', N'Huyện Kim Sơn', N'Huyện', N'37')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'377', N'Huyện Yên Mô', N'Huyện', N'37')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'380', N'Thành phố Thanh Hóa', N'Thành phố', N'38')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'381', N'Thị xã Bỉm Sơn', N'Th? xã', N'38')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'382', N'Thị xã Sầm Sơn', N'Th? xã', N'38')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'384', N'Huyện Mường Lát', N'Huyện', N'38')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'385', N'Huyện Quan Hóa', N'Huyện', N'38')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'386', N'Huyện Bá Thước', N'Huyện', N'38')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'387', N'Huyện Quan Sơn', N'Huyện', N'38')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'388', N'Huyện Lang Chánh', N'Huyện', N'38')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'389', N'Huyện Ngọc Lặc', N'Huyện', N'38')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'390', N'Huyện Cẩm Thủy', N'Huyện', N'38')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'391', N'Huyện Thạch Thành', N'Huyện', N'38')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'392', N'Huyện Hà Trung', N'Huyện', N'38')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'393', N'Huyện Vĩnh Lộc', N'Huyện', N'38')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'394', N'Huyện Yên Định', N'Huyện', N'38')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'395', N'Huyện Thọ Xuân', N'Huyện', N'38')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'396', N'Huyện Thường Xuân', N'Huyện', N'38')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'397', N'Huyện Triệu Sơn', N'Huyện', N'38')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'398', N'Huyện Thiệu Hóa', N'Huyện', N'38')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'399', N'Huyện Hoằng Hóa', N'Huyện', N'38')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'400', N'Huyện Hậu Lộc', N'Huyện', N'38')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'401', N'Huyện Nga Sơn', N'Huyện', N'38')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'402', N'Huyện Như Xuân', N'Huyện', N'38')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'403', N'Huyện Như Thanh', N'Huyện', N'38')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'404', N'Huyện Nông Cống', N'Huyện', N'38')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'405', N'Huyện Đông Sơn', N'Huyện', N'38')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'406', N'Huyện Quảng Xương', N'Huyện', N'38')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'407', N'Huyện Tĩnh Gia', N'Huyện', N'38')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'412', N'Thành phố Vinh', N'Thành phố', N'40')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'413', N'Thị xã Cửa Lò', N'Th? xã', N'40')
GO
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'414', N'Thị xã Thái Hoà', N'Th? xã', N'40')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'415', N'Huyện Quế Phong', N'Huyện', N'40')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'416', N'Huyện Quỳ Châu', N'Huyện', N'40')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'417', N'Huyện Kỳ Sơn', N'Huyện', N'40')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'418', N'Huyện Tương Dương', N'Huyện', N'40')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'419', N'Huyện Nghĩa Đàn', N'Huyện', N'40')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'420', N'Huyện Quỳ Hợp', N'Huyện', N'40')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'421', N'Huyện Quỳnh Lưu', N'Huyện', N'40')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'422', N'Huyện Con Cuông', N'Huyện', N'40')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'423', N'Huyện Tân Kỳ', N'Huyện', N'40')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'424', N'Huyện Anh Sơn', N'Huyện', N'40')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'425', N'Huyện Diễn Châu', N'Huyện', N'40')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'426', N'Huyện Yên Thành', N'Huyện', N'40')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'427', N'Huyện Đô Lương', N'Huyện', N'40')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'428', N'Huyện Thanh Chương', N'Huyện', N'40')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'429', N'Huyện Nghi Lộc', N'Huyện', N'40')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'430', N'Huyện Nam Đàn', N'Huyện', N'40')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'431', N'Huyện Hưng Nguyên', N'Huyện', N'40')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'432', N'Thị xã Hoàng Mai', N'Th? xã', N'40')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'436', N'Thành phố Hà Tĩnh', N'Thành phố', N'42')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'437', N'Thị xã Hồng Lĩnh', N'Th? xã', N'42')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'439', N'Huyện Hương Sơn', N'Huyện', N'42')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'440', N'Huyện Đức Thọ', N'Huyện', N'42')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'441', N'Huyện Vũ Quang', N'Huyện', N'42')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'442', N'Huyện Nghi Xuân', N'Huyện', N'42')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'443', N'Huyện Can Lộc', N'Huyện', N'42')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'444', N'Huyện Hương Khê', N'Huyện', N'42')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'445', N'Huyện Thạch Hà', N'Huyện', N'42')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'446', N'Huyện Cẩm Xuyên', N'Huyện', N'42')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'447', N'Huyện Kỳ Anh', N'Huyện', N'42')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'448', N'Huyện Lộc Hà', N'Huyện', N'42')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'449', N'Thị xã Kỳ Anh', N'Th? xã', N'42')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'450', N'Thành Phố Đồng Hới', N'Thành phố', N'44')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'452', N'Huyện Minh Hóa', N'Huyện', N'44')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'453', N'Huyện Tuyên Hóa', N'Huyện', N'44')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'454', N'Huyện Quảng Trạch', N'Th? xã', N'44')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'455', N'Huyện Bố Trạch', N'Huyện', N'44')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'456', N'Huyện Quảng Ninh', N'Huyện', N'44')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'457', N'Huyện Lệ Thủy', N'Huyện', N'44')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'458', N'Thị xã Ba Đồn', N'Huyện', N'44')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'461', N'Thành phố Đông Hà', N'Thành phố', N'45')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'462', N'Thị xã Quảng Trị', N'Th? xã', N'45')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'464', N'Huyện Vĩnh Linh', N'Huyện', N'45')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'465', N'Huyện Hướng Hóa', N'Huyện', N'45')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'466', N'Huyện Gio Linh', N'Huyện', N'45')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'467', N'Huyện Đa Krông', N'Huyện', N'45')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'468', N'Huyện Cam Lộ', N'Huyện', N'45')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'469', N'Huyện Triệu Phong', N'Huyện', N'45')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'470', N'Huyện Hải Lăng', N'Huyện', N'45')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'471', N'Huyện Cồn Cỏ', N'Huyện', N'45')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'474', N'Thành phố Huế', N'Thành phố', N'46')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'476', N'Huyện Phong Điền', N'Huyện', N'46')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'477', N'Huyện Quảng Điền', N'Huyện', N'46')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'478', N'Huyện Phú Vang', N'Huyện', N'46')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'479', N'Thị xã Hương Thủy', N'Th? xã', N'46')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'480', N'Thị xã Hương Trà', N'Th? xã', N'46')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'481', N'Huyện A Lưới', N'Huyện', N'46')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'482', N'Huyện Phú Lộc', N'Huyện', N'46')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'483', N'Huyện Nam Đông', N'Huyện', N'46')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'490', N'Quận Liên Chiểu', N'Quận', N'48')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'491', N'Quận Thanh Khê', N'Quận', N'48')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'492', N'Quận Hải Châu', N'Quận', N'48')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'493', N'Quận Sơn Trà', N'Quận', N'48')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'494', N'Quận Ngũ Hành Sơn', N'Quận', N'48')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'495', N'Quận Cẩm Lệ', N'Quận', N'48')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'497', N'Huyện Hòa Vang', N'Huyện', N'48')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'498', N'Huyện Hoàng Sa', N'Huyện', N'48')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'502', N'Thành phố Tam Kỳ', N'Thành phố', N'49')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'503', N'Thành phố Hội An', N'Thành phố', N'49')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'504', N'Huyện Tây Giang', N'Huyện', N'49')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'505', N'Huyện Đông Giang', N'Huyện', N'49')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'506', N'Huyện Đại Lộc', N'Huyện', N'49')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'507', N'Thị xã Điện Bàn', N'Th? xã', N'49')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'508', N'Huyện Duy Xuyên', N'Huyện', N'49')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'509', N'Huyện Quế Sơn', N'Huyện', N'49')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'510', N'Huyện Nam Giang', N'Huyện', N'49')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'511', N'Huyện Phước Sơn', N'Huyện', N'49')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'512', N'Huyện Hiệp Đức', N'Huyện', N'49')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'513', N'Huyện Thăng Bình', N'Huyện', N'49')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'514', N'Huyện Tiên Phước', N'Huyện', N'49')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'515', N'Huyện Bắc Trà My', N'Huyện', N'49')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'516', N'Huyện Nam Trà My', N'Huyện', N'49')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'517', N'Huyện Núi Thành', N'Huyện', N'49')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'518', N'Huyện Phú Ninh', N'Huyện', N'49')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'519', N'Huyện Nông Sơn', N'Huyện', N'49')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'522', N'Thành phố Quảng Ngãi', N'Thành phố', N'51')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'524', N'Huyện Bình Sơn', N'Huyện', N'51')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'525', N'Huyện Trà Bồng', N'Huyện', N'51')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'526', N'Huyện Tây Trà', N'Huyện', N'51')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'527', N'Huyện Sơn Tịnh', N'Huyện', N'51')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'528', N'Huyện Tư Nghĩa', N'Huyện', N'51')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'529', N'Huyện Sơn Hà', N'Huyện', N'51')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'530', N'Huyện Sơn Tây', N'Huyện', N'51')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'531', N'Huyện Minh Long', N'Huyện', N'51')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'532', N'Huyện Nghĩa Hành', N'Huyện', N'51')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'533', N'Huyện Mộ Đức', N'Huyện', N'51')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'534', N'Huyện Đức Phổ', N'Huyện', N'51')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'535', N'Huyện Ba Tơ', N'Huyện', N'51')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'536', N'Huyện Lý Sơn', N'Huyện', N'51')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'540', N'Thành phố Qui Nhơn', N'Thành phố', N'52')
GO
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'542', N'Huyện An Lão', N'Huyện', N'52')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'543', N'Huyện Hoài Nhơn', N'Huyện', N'52')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'544', N'Huyện Hoài Ân', N'Huyện', N'52')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'545', N'Huyện Phù Mỹ', N'Huyện', N'52')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'546', N'Huyện Vĩnh Thạnh', N'Huyện', N'52')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'547', N'Huyện Tây Sơn', N'Huyện', N'52')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'548', N'Huyện Phù Cát', N'Huyện', N'52')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'549', N'Thị xã An Nhơn', N'Th? xã', N'52')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'550', N'Huyện Tuy Phước', N'Huyện', N'52')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'551', N'Huyện Vân Canh', N'Huyện', N'52')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'555', N'Thành phố Tuy Hoà', N'Thành phố', N'54')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'557', N'Thị xã Sông Cầu', N'Th? xã', N'54')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'558', N'Huyện Đồng Xuân', N'Huyện', N'54')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'559', N'Huyện Tuy An', N'Huyện', N'54')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'560', N'Huyện Sơn Hòa', N'Huyện', N'54')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'561', N'Huyện Sông Hinh', N'Huyện', N'54')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'562', N'Huyện Tây Hoà', N'Huyện', N'54')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'563', N'Huyện Phú Hoà', N'Huyện', N'54')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'564', N'Huyện Đông Hòa', N'Huyện', N'54')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'568', N'Thành phố Nha Trang', N'Thành phố', N'56')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'569', N'Thành phố Cam Ranh', N'Thành phố', N'56')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'570', N'Huyện Cam Lâm', N'Huyện', N'56')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'571', N'Huyện Vạn Ninh', N'Huyện', N'56')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'572', N'Thị xã Ninh Hòa', N'Th? xã', N'56')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'573', N'Huyện Khánh Vĩnh', N'Huyện', N'56')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'574', N'Huyện Diên Khánh', N'Huyện', N'56')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'575', N'Huyện Khánh Sơn', N'Huyện', N'56')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'576', N'Huyện Trường Sa', N'Huyện', N'56')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'582', N'Thành phố Phan Rang-Tháp Chàm', N'Thành phố', N'58')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'584', N'Huyện Bác Ái', N'Huyện', N'58')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'585', N'Huyện Ninh Sơn', N'Huyện', N'58')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'586', N'Huyện Ninh Hải', N'Huyện', N'58')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'587', N'Huyện Ninh Phước', N'Huyện', N'58')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'588', N'Huyện Thuận Bắc', N'Huyện', N'58')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'589', N'Huyện Thuận Nam', N'Huyện', N'58')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'593', N'Thành phố Phan Thiết', N'Thành phố', N'60')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'594', N'Thị xã La Gi', N'Th? xã', N'60')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'595', N'Huyện Tuy Phong', N'Huyện', N'60')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'596', N'Huyện Bắc Bình', N'Huyện', N'60')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'597', N'Huyện Hàm Thuận Bắc', N'Huyện', N'60')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'598', N'Huyện Hàm Thuận Nam', N'Huyện', N'60')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'599', N'Huyện Tánh Linh', N'Huyện', N'60')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'600', N'Huyện Đức Linh', N'Huyện', N'60')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'601', N'Huyện Hàm Tân', N'Huyện', N'60')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'602', N'Huyện Phú Quí', N'Huyện', N'60')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'608', N'Thành phố Kon Tum', N'Thành phố', N'62')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'610', N'Huyện Đắk Glei', N'Huyện', N'62')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'611', N'Huyện Ngọc Hồi', N'Huyện', N'62')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'612', N'Huyện Đắk Tô', N'Huyện', N'62')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'613', N'Huyện Kon Plông', N'Huyện', N'62')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'614', N'Huyện Kon Rẫy', N'Huyện', N'62')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'615', N'Huyện Đắk Hà', N'Huyện', N'62')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'616', N'Huyện Sa Thầy', N'Huyện', N'62')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'617', N'Huyện Tu Mơ Rông', N'Huyện', N'62')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'618', N'Huyện  Gia Drai', N'Huyện', N'62')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'622', N'Thành phố Pleiku', N'Thành phố', N'64')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'623', N'Thị xã An Khê', N'Th? xã', N'64')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'624', N'Thị xã Ayun Pa', N'Th? xã', N'64')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'625', N'Huyện KBang', N'Huyện', N'64')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'626', N'Huyện Đăk Đoa', N'Huyện', N'64')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'627', N'Huyện Chư Păh', N'Huyện', N'64')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'628', N'Huyện Ia Grai', N'Huyện', N'64')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'629', N'Huyện Mang Yang', N'Huyện', N'64')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'630', N'Huyện Kông Chro', N'Huyện', N'64')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'631', N'Huyện Đức Cơ', N'Huyện', N'64')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'632', N'Huyện Chư Prông', N'Huyện', N'64')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'633', N'Huyện Chư Sê', N'Huyện', N'64')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'634', N'Huyện Đăk Pơ', N'Huyện', N'64')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'635', N'Huyện Ia Pa', N'Huyện', N'64')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'637', N'Huyện Krông Pa', N'Huyện', N'64')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'638', N'Huyện Phú Thiện', N'Huyện', N'64')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'639', N'Huyện Chư Pưh', N'Huyện', N'64')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'643', N'Thành phố Buôn Ma Thuột', N'Thành phố', N'66')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'644', N'Thị Xã Buôn Hồ', N'Th? xã', N'66')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'645', N'Huyện Ea Hleo', N'Huyện', N'66')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'646', N'Huyện Ea Súp', N'Huyện', N'66')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'647', N'Huyện Buôn Đôn', N'Huyện', N'66')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'648', N'Huyện Cư Mgar', N'Huyện', N'66')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'649', N'Huyện Krông Búk', N'Huyện', N'66')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'650', N'Huyện Krông Năng', N'Huyện', N'66')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'651', N'Huyện Ea Kar', N'Huyện', N'66')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'652', N'Huyện MĐrắk', N'Huyện', N'66')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'653', N'Huyện Krông Bông', N'Huyện', N'66')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'654', N'Huyện Krông Pắc', N'Huyện', N'66')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'655', N'Huyện Krông A Na', N'Huyện', N'66')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'656', N'Huyện Lắk', N'Huyện', N'66')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'657', N'Huyện Cư Kuin', N'Huyện', N'66')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'660', N'Thị xã Gia Nghĩa', N'Th? xã', N'67')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'661', N'Huyện Đăk Glong', N'Huyện', N'67')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'662', N'Huyện Cư Jút', N'Huyện', N'67')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'663', N'Huyện Đắk Mil', N'Huyện', N'67')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'664', N'Huyện Krông Nô', N'Huyện', N'67')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'665', N'Huyện Đắk Song', N'Huyện', N'67')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'666', N'Huyện Đắk RLấp', N'Huyện', N'67')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'667', N'Huyện Tuy Đức', N'Huyện', N'67')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'672', N'Thành phố Đà Lạt', N'Thành phố', N'68')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'673', N'Thành phố Bảo Lộc', N'Thành phố', N'68')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'674', N'Huyện Đam Rông', N'Huyện', N'68')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'675', N'Huyện Lạc Dương', N'Huyện', N'68')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'676', N'Huyện Lâm Hà', N'Huyện', N'68')
GO
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'677', N'Huyện Đơn Dương', N'Huyện', N'68')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'678', N'Huyện Đức Trọng', N'Huyện', N'68')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'679', N'Huyện Di Linh', N'Huyện', N'68')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'680', N'Huyện Bảo Lâm', N'Huyện', N'68')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'681', N'Huyện Đạ Huoai', N'Huyện', N'68')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'682', N'Huyện Đạ Tẻh', N'Huyện', N'68')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'683', N'Huyện Cát Tiên', N'Huyện', N'68')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'688', N'Thị xã Phước Long', N'Th? xã', N'70')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'689', N'Thị xã Đồng Xoài', N'Th? xã', N'70')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'690', N'Thị xã Bình Long', N'Th? xã', N'70')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'691', N'Huyện Bù Gia Mập', N'Huyện', N'70')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'692', N'Huyện Lộc Ninh', N'Huyện', N'70')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'693', N'Huyện Bù Đốp', N'Huyện', N'70')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'694', N'Huyện Hớn Quản', N'Huyện', N'70')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'695', N'Huyện Đồng Phú', N'Huyện', N'70')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'696', N'Huyện Bù Đăng', N'Huyện', N'70')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'697', N'Huyện Chơn Thành', N'Huyện', N'70')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'698', N'Huyện Phú Riềng', N'Huyện', N'70')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'703', N'Thành phố Tây Ninh', N'Thành phố', N'72')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'705', N'Huyện Tân Biên', N'Huyện', N'72')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'706', N'Huyện Tân Châu', N'Huyện', N'72')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'707', N'Huyện Dương Minh Châu', N'Huyện', N'72')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'708', N'Huyện Châu Thành', N'Huyện', N'72')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'709', N'Huyện Hòa Thành', N'Huyện', N'72')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'710', N'Huyện Gò Dầu', N'Huyện', N'72')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'711', N'Huyện Bến Cầu', N'Huyện', N'72')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'712', N'Huyện Trảng Bàng', N'Huyện', N'72')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'718', N'Thành phố Thủ Dầu Một', N'Thành phố', N'74')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'719', N'Huyện Bàu Bàng', N'Huyện', N'74')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'720', N'Huyện Dầu Tiếng', N'Huyện', N'74')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'721', N'Thị xã Bến Cát', N'Th? xã', N'74')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'722', N'Huyện Phú Giáo', N'Huyện', N'74')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'723', N'Thị xã Tân Uyên', N'Th? xã', N'74')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'724', N'Thị xã Dĩ An', N'Th? xã', N'74')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'725', N'Thị xã Thuận An', N'Th? xã', N'74')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'726', N'Huyện Bắc Tân Uyên', N'Huyện', N'74')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'731', N'Thành phố Biên Hòa', N'Thành phố', N'75')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'732', N'Thị xã Long Khánh', N'Th? xã', N'75')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'734', N'Huyện Tân Phú', N'Huyện', N'75')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'735', N'Huyện Vĩnh Cửu', N'Huyện', N'75')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'736', N'Huyện Định Quán', N'Huyện', N'75')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'737', N'Huyện Trảng Bom', N'Huyện', N'75')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'738', N'Huyện Thống Nhất', N'Huyện', N'75')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'739', N'Huyện Cẩm Mỹ', N'Huyện', N'75')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'740', N'Huyện Long Thành', N'Huyện', N'75')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'741', N'Huyện Xuân Lộc', N'Huyện', N'75')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'742', N'Huyện Nhơn Trạch', N'Huyện', N'75')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'747', N'Thành phố Vũng Tàu', N'Thành phố', N'77')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'748', N'Thành phố Bà Rịa', N'Thành phố', N'77')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'750', N'Huyện Châu Đức', N'Huyện', N'77')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'751', N'Huyện Xuyên Mộc', N'Huyện', N'77')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'752', N'Huyện Long Điền', N'Huyện', N'77')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'753', N'Huyện Đất Đỏ', N'Huyện', N'77')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'754', N'Huyện Tân Thành', N'Huyện', N'77')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'755', N'Huyện Côn Đảo', N'Huyện', N'77')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'760', N'Quận 1', N'Quận', N'79')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'761', N'Quận 12', N'Quận', N'79')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'762', N'Quận Thủ Đức', N'Quận', N'79')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'763', N'Quận 9', N'Quận', N'79')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'764', N'Quận Gò Vấp', N'Quận', N'79')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'765', N'Quận Bình Thạnh', N'Quận', N'79')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'766', N'Quận Tân Bình', N'Quận', N'79')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'767', N'Quận Tân Phú', N'Quận', N'79')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'768', N'Quận Phú Nhuận', N'Quận', N'79')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'769', N'Quận 2', N'Quận', N'79')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'770', N'Quận 3', N'Quận', N'79')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'771', N'Quận 10', N'Quận', N'79')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'772', N'Quận 11', N'Quận', N'79')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'773', N'Quận 4', N'Quận', N'79')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'774', N'Quận 5', N'Quận', N'79')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'775', N'Quận 6', N'Quận', N'79')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'776', N'Quận 8', N'Quận', N'79')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'777', N'Quận Bình Tân', N'Quận', N'79')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'778', N'Quận 7', N'Quận', N'79')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'783', N'Huyện Củ Chi', N'Huyện', N'79')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'784', N'Huyện Hóc Môn', N'Huyện', N'79')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'785', N'Huyện Bình Chánh', N'Huyện', N'79')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'786', N'Huyện Nhà Bè', N'Huyện', N'79')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'787', N'Huyện Cần Giờ', N'Huyện', N'79')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'794', N'Thành phố Tân An', N'Thành phố', N'80')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'795', N'Thị xã Kiến Tường', N'Th? xã', N'80')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'796', N'Huyện Tân Hưng', N'Huyện', N'80')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'797', N'Huyện Vĩnh Hưng', N'Huyện', N'80')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'798', N'Huyện Mộc Hóa', N'Huyện', N'80')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'799', N'Huyện Tân Thạnh', N'Huyện', N'80')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'800', N'Huyện Thạnh Hóa', N'Huyện', N'80')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'801', N'Huyện Đức Huệ', N'Huyện', N'80')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'802', N'Huyện Đức Hòa', N'Huyện', N'80')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'803', N'Huyện Bến Lức', N'Huyện', N'80')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'804', N'Huyện Thủ Thừa', N'Huyện', N'80')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'805', N'Huyện Tân Trụ', N'Huyện', N'80')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'806', N'Huyện Cần Đước', N'Huyện', N'80')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'807', N'Huyện Cần Giuộc', N'Huyện', N'80')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'808', N'Huyện Châu Thành', N'Huyện', N'80')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'815', N'Thành phố Mỹ Tho', N'Thành phố', N'82')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'816', N'Thị xã Gò Công', N'Th? xã', N'82')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'817', N'Thị xã Cai Lậy', N'Huyện', N'82')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'818', N'Huyện Tân Phước', N'Huyện', N'82')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'819', N'Huyện Cái Bè', N'Huyện', N'82')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'820', N'Huyện Cai Lậy', N'Th? xã', N'82')
GO
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'821', N'Huyện Châu Thành', N'Huyện', N'82')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'822', N'Huyện Chợ Gạo', N'Huyện', N'82')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'823', N'Huyện Gò Công Tây', N'Huyện', N'82')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'824', N'Huyện Gò Công Đông', N'Huyện', N'82')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'825', N'Huyện Tân Phú Đông', N'Huyện', N'82')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'829', N'Thành phố Bến Tre', N'Thành phố', N'83')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'831', N'Huyện Châu Thành', N'Huyện', N'83')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'832', N'Huyện Chợ Lách', N'Huyện', N'83')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'833', N'Huyện Mỏ Cày Nam', N'Huyện', N'83')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'834', N'Huyện Giồng Trôm', N'Huyện', N'83')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'835', N'Huyện Bình Đại', N'Huyện', N'83')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'836', N'Huyện Ba Tri', N'Huyện', N'83')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'837', N'Huyện Thạnh Phú', N'Huyện', N'83')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'838', N'Huyện Mỏ Cày Bắc', N'Huyện', N'83')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'842', N'Thành phố Trà Vinh', N'Thành phố', N'84')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'844', N'Huyện Càng Long', N'Huyện', N'84')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'845', N'Huyện Cầu Kè', N'Huyện', N'84')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'846', N'Huyện Tiểu Cần', N'Huyện', N'84')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'847', N'Huyện Châu Thành', N'Huyện', N'84')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'848', N'Huyện Cầu Ngang', N'Huyện', N'84')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'849', N'Huyện Trà Cú', N'Huyện', N'84')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'850', N'Huyện Duyên Hải', N'Huyện', N'84')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'851', N'Thị xã Duyên Hải', N'Th? xã', N'84')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'855', N'Thành phố Vĩnh Long', N'Thành phố', N'86')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'857', N'Huyện Long Hồ', N'Huyện', N'86')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'858', N'Huyện Mang Thít', N'Huyện', N'86')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'859', N'Huyện  Vũng Liêm', N'Huyện', N'86')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'860', N'Huyện Tam Bình', N'Huyện', N'86')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'861', N'Thị xã Bình Minh', N'Th? xã', N'86')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'862', N'Huyện Trà Ôn', N'Huyện', N'86')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'863', N'Huyện Bình Tân', N'Huyện', N'86')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'866', N'Thành phố Cao Lãnh', N'Thành phố', N'87')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'867', N'Thành phố Sa Đéc', N'Thành phố', N'87')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'868', N'Thị xã Hồng Ngự', N'Th? xã', N'87')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'869', N'Huyện Tân Hồng', N'Huyện', N'87')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'870', N'Huyện Hồng Ngự', N'Huyện', N'87')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'871', N'Huyện Tam Nông', N'Huyện', N'87')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'872', N'Huyện Tháp Mười', N'Huyện', N'87')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'873', N'Huyện Cao Lãnh', N'Huyện', N'87')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'874', N'Huyện Thanh Bình', N'Huyện', N'87')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'875', N'Huyện Lấp Vò', N'Huyện', N'87')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'876', N'Huyện Lai Vung', N'Huyện', N'87')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'877', N'Huyện Châu Thành', N'Huyện', N'87')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'883', N'Thành phố Long Xuyên', N'Thành phố', N'89')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'884', N'Thành phố Châu Đốc', N'Thành phố', N'89')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'886', N'Huyện An Phú', N'Huyện', N'89')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'887', N'Thị xã Tân Châu', N'Th? xã', N'89')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'888', N'Huyện Phú Tân', N'Huyện', N'89')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'889', N'Huyện Châu Phú', N'Huyện', N'89')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'890', N'Huyện Tịnh Biên', N'Huyện', N'89')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'891', N'Huyện Tri Tôn', N'Huyện', N'89')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'892', N'Huyện Châu Thành', N'Huyện', N'89')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'893', N'Huyện Chợ Mới', N'Huyện', N'89')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'894', N'Huyện Thoại Sơn', N'Huyện', N'89')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'899', N'Thành phố Rạch Giá', N'Thành phố', N'91')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'900', N'Thị xã Hà Tiên', N'Th? xã', N'91')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'902', N'Huyện Kiên Lương', N'Huyện', N'91')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'903', N'Huyện Hòn Đất', N'Huyện', N'91')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'904', N'Huyện Tân Hiệp', N'Huyện', N'91')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'905', N'Huyện Châu Thành', N'Huyện', N'91')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'906', N'Huyện Giồng Riềng', N'Huyện', N'91')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'907', N'Huyện Gò Quao', N'Huyện', N'91')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'908', N'Huyện An Biên', N'Huyện', N'91')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'909', N'Huyện An Minh', N'Huyện', N'91')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'910', N'Huyện Vĩnh Thuận', N'Huyện', N'91')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'911', N'Huyện Phú Quốc', N'Huyện', N'91')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'912', N'Huyện Kiên Hải', N'Huyện', N'91')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'913', N'Huyện U Minh Thượng', N'Huyện', N'91')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'914', N'Huyện Giang Thành', N'Huyện', N'91')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'916', N'Quận Ninh Kiều', N'Quận', N'92')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'917', N'Quận Ô Môn', N'Quận', N'92')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'918', N'Quận Bình Thuỷ', N'Quận', N'92')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'919', N'Quận Cái Răng', N'Quận', N'92')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'923', N'Quận Thốt Nốt', N'Quận', N'92')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'924', N'Huyện Vĩnh Thạnh', N'Huyện', N'92')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'925', N'Huyện Cờ Đỏ', N'Huyện', N'92')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'926', N'Huyện Phong Điền', N'Huyện', N'92')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'927', N'Huyện Thới Lai', N'Huyện', N'92')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'930', N'Thành phố Vị Thanh', N'Thành phố', N'93')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'931', N'Thị xã Ngã Bảy', N'Th? xã', N'93')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'932', N'Huyện Châu Thành A', N'Huyện', N'93')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'933', N'Huyện Châu Thành', N'Huyện', N'93')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'934', N'Huyện Phụng Hiệp', N'Huyện', N'93')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'935', N'Huyện Vị Thuỷ', N'Huyện', N'93')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'936', N'Huyện Long Mỹ', N'Huyện', N'93')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'937', N'Thị xã Long Mỹ', N'Th? xã', N'93')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'941', N'Thành phố Sóc Trăng', N'Thành phố', N'94')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'942', N'Huyện Châu Thành', N'Huyện', N'94')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'943', N'Huyện Kế Sách', N'Huyện', N'94')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'944', N'Huyện Mỹ Tú', N'Huyện', N'94')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'945', N'Huyện Cù Lao Dung', N'Huyện', N'94')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'946', N'Huyện Long Phú', N'Huyện', N'94')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'947', N'Huyện Mỹ Xuyên', N'Huyện', N'94')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'948', N'Thị xã Ngã Năm', N'Th? xã', N'94')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'949', N'Huyện Thạnh Trị', N'Huyện', N'94')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'950', N'Thị xã Vĩnh Châu', N'Th? xã', N'94')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'951', N'Huyện Trần Đề', N'Huyện', N'94')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'954', N'Thành phố Bạc Liêu', N'Thành phố', N'95')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'956', N'Huyện Hồng Dân', N'Huyện', N'95')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'957', N'Huyện Phước Long', N'Huyện', N'95')
GO
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'958', N'Huyện Vĩnh Lợi', N'Huyện', N'95')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'959', N'Thị xã Giá Rai', N'Th? xã', N'95')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'960', N'Huyện Đông Hải', N'Huyện', N'95')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'961', N'Huyện Hoà Bình', N'Huyện', N'95')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'964', N'Thành phố Cà Mau', N'Thành phố', N'96')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'966', N'Huyện U Minh', N'Huyện', N'96')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'967', N'Huyện Thới Bình', N'Huyện', N'96')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'968', N'Huyện Trần Văn Thời', N'Huyện', N'96')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'969', N'Huyện Cái Nước', N'Huyện', N'96')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'970', N'Huyện Đầm Dơi', N'Huyện', N'96')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'971', N'Huyện Năm Căn', N'Huyện', N'96')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'972', N'Huyện Phú Tân', N'Huyện', N'96')
INSERT [dbo].[devvn_quanhuyen] ([maqh], [name], [type], [matp]) VALUES (N'973', N'Huyện Ngọc Hiển', N'Huyện', N'96')
INSERT [dbo].[devvn_tinhthanhpho] ([matp], [name], [type]) VALUES (N'01', N'Thành phố Hà Nội', N'Thành phố Trung ương')
INSERT [dbo].[devvn_tinhthanhpho] ([matp], [name], [type]) VALUES (N'02', N'Thành phố Hồ Chí Minh', N'Thành phố Trung ương')
INSERT [dbo].[devvn_tinhthanhpho] ([matp], [name], [type]) VALUES (N'04', N'Tỉnh Cao Bằng', N'Tỉnh')
INSERT [dbo].[devvn_tinhthanhpho] ([matp], [name], [type]) VALUES (N'06', N'Tỉnh Bắc Kạn', N'Tỉnh')
INSERT [dbo].[devvn_tinhthanhpho] ([matp], [name], [type]) VALUES (N'08', N'Tỉnh Tuyên Quang', N'Tỉnh')
INSERT [dbo].[devvn_tinhthanhpho] ([matp], [name], [type]) VALUES (N'10', N'Tỉnh Lào Cai', N'Tỉnh')
INSERT [dbo].[devvn_tinhthanhpho] ([matp], [name], [type]) VALUES (N'11', N'Tỉnh Điện Biên', N'Tỉnh')
INSERT [dbo].[devvn_tinhthanhpho] ([matp], [name], [type]) VALUES (N'12', N'Tỉnh Lai Châu', N'Tỉnh')
INSERT [dbo].[devvn_tinhthanhpho] ([matp], [name], [type]) VALUES (N'14', N'Tỉnh Sơn La', N'Tỉnh')
INSERT [dbo].[devvn_tinhthanhpho] ([matp], [name], [type]) VALUES (N'15', N'Tỉnh Yên Bái', N'Tỉnh')
INSERT [dbo].[devvn_tinhthanhpho] ([matp], [name], [type]) VALUES (N'17', N'Tỉnh Hoà Bình', N'Tỉnh')
INSERT [dbo].[devvn_tinhthanhpho] ([matp], [name], [type]) VALUES (N'19', N'Tỉnh Thái Nguyên', N'Tỉnh')
INSERT [dbo].[devvn_tinhthanhpho] ([matp], [name], [type]) VALUES (N'20', N'Tỉnh Lạng Sơn', N'Tỉnh')
INSERT [dbo].[devvn_tinhthanhpho] ([matp], [name], [type]) VALUES (N'22', N'Tỉnh Quảng Ninh', N'Tỉnh')
INSERT [dbo].[devvn_tinhthanhpho] ([matp], [name], [type]) VALUES (N'24', N'Tỉnh Bắc Giang', N'Tỉnh')
INSERT [dbo].[devvn_tinhthanhpho] ([matp], [name], [type]) VALUES (N'25', N'Tỉnh Phú Thọ', N'Tỉnh')
INSERT [dbo].[devvn_tinhthanhpho] ([matp], [name], [type]) VALUES (N'26', N'Tỉnh Vĩnh Phúc', N'Tỉnh')
INSERT [dbo].[devvn_tinhthanhpho] ([matp], [name], [type]) VALUES (N'27', N'Tỉnh Bắc Ninh', N'Tỉnh')
INSERT [dbo].[devvn_tinhthanhpho] ([matp], [name], [type]) VALUES (N'30', N'Tỉnh Hải Dương', N'Tỉnh')
INSERT [dbo].[devvn_tinhthanhpho] ([matp], [name], [type]) VALUES (N'31', N'Thành phố Hải Phòng', N'Thành phố Trung ương')
INSERT [dbo].[devvn_tinhthanhpho] ([matp], [name], [type]) VALUES (N'33', N'Tỉnh Hưng Yên', N'Tỉnh')
INSERT [dbo].[devvn_tinhthanhpho] ([matp], [name], [type]) VALUES (N'34', N'Tỉnh Thái Bình', N'Tỉnh')
INSERT [dbo].[devvn_tinhthanhpho] ([matp], [name], [type]) VALUES (N'35', N'Tỉnh Hà Nam', N'Tỉnh')
INSERT [dbo].[devvn_tinhthanhpho] ([matp], [name], [type]) VALUES (N'36', N'Tỉnh Nam Định', N'Tỉnh')
INSERT [dbo].[devvn_tinhthanhpho] ([matp], [name], [type]) VALUES (N'37', N'Tỉnh Ninh Bình', N'Tỉnh')
INSERT [dbo].[devvn_tinhthanhpho] ([matp], [name], [type]) VALUES (N'38', N'Tỉnh Thanh Hóa', N'Tỉnh')
INSERT [dbo].[devvn_tinhthanhpho] ([matp], [name], [type]) VALUES (N'40', N'Tỉnh Nghệ An', N'Tỉnh')
INSERT [dbo].[devvn_tinhthanhpho] ([matp], [name], [type]) VALUES (N'42', N'Tỉnh Hà Tĩnh', N'Tỉnh')
INSERT [dbo].[devvn_tinhthanhpho] ([matp], [name], [type]) VALUES (N'44', N'Tỉnh Quảng Bình', N'Tỉnh')
INSERT [dbo].[devvn_tinhthanhpho] ([matp], [name], [type]) VALUES (N'45', N'Tỉnh Quảng Trị', N'Tỉnh')
INSERT [dbo].[devvn_tinhthanhpho] ([matp], [name], [type]) VALUES (N'46', N'Tỉnh Thừa Thiên Huế', N'Tỉnh')
INSERT [dbo].[devvn_tinhthanhpho] ([matp], [name], [type]) VALUES (N'48', N'Thành phố Đà Nẵng', N'Thành ph? Trung uong')
INSERT [dbo].[devvn_tinhthanhpho] ([matp], [name], [type]) VALUES (N'49', N'Tỉnh Quảng Nam', N'Tỉnh')
INSERT [dbo].[devvn_tinhthanhpho] ([matp], [name], [type]) VALUES (N'51', N'Tỉnh Quảng Ngãi', N'Tỉnh')
INSERT [dbo].[devvn_tinhthanhpho] ([matp], [name], [type]) VALUES (N'52', N'Tỉnh Bình Định', N'Tỉnh')
INSERT [dbo].[devvn_tinhthanhpho] ([matp], [name], [type]) VALUES (N'54', N'Tỉnh Phú Yên', N'Tỉnh')
INSERT [dbo].[devvn_tinhthanhpho] ([matp], [name], [type]) VALUES (N'56', N'Tỉnh Khánh Hòa', N'Tỉnh')
INSERT [dbo].[devvn_tinhthanhpho] ([matp], [name], [type]) VALUES (N'58', N'Tỉnh Ninh Thuận', N'Tỉnh')
INSERT [dbo].[devvn_tinhthanhpho] ([matp], [name], [type]) VALUES (N'60', N'Tỉnh Bình Thuận', N'Tỉnh')
INSERT [dbo].[devvn_tinhthanhpho] ([matp], [name], [type]) VALUES (N'62', N'Tỉnh Kon Tum', N'Tỉnh')
INSERT [dbo].[devvn_tinhthanhpho] ([matp], [name], [type]) VALUES (N'64', N'Tỉnh Gia Lai', N'Tỉnh')
INSERT [dbo].[devvn_tinhthanhpho] ([matp], [name], [type]) VALUES (N'66', N'Tỉnh Đắk Lắk', N'Tỉnh')
INSERT [dbo].[devvn_tinhthanhpho] ([matp], [name], [type]) VALUES (N'67', N'Tỉnh Đắk Nông', N'Tỉnh')
INSERT [dbo].[devvn_tinhthanhpho] ([matp], [name], [type]) VALUES (N'68', N'Tỉnh Lâm Đồng', N'Tỉnh')
INSERT [dbo].[devvn_tinhthanhpho] ([matp], [name], [type]) VALUES (N'70', N'Tỉnh Bình Phước', N'Tỉnh')
INSERT [dbo].[devvn_tinhthanhpho] ([matp], [name], [type]) VALUES (N'72', N'Tỉnh Tây Ninh', N'Tỉnh')
INSERT [dbo].[devvn_tinhthanhpho] ([matp], [name], [type]) VALUES (N'74', N'Tỉnh Bình Dương', N'Tỉnh')
INSERT [dbo].[devvn_tinhthanhpho] ([matp], [name], [type]) VALUES (N'75', N'Tỉnh Đồng Nai', N'Tỉnh')
INSERT [dbo].[devvn_tinhthanhpho] ([matp], [name], [type]) VALUES (N'77', N'Tỉnh Bà Rịa - Vũng Tàu', N'Tỉnh')
INSERT [dbo].[devvn_tinhthanhpho] ([matp], [name], [type]) VALUES (N'79', N'Thành phố Hồ Chí Minh', N'Thành phố Trung ương')
INSERT [dbo].[devvn_tinhthanhpho] ([matp], [name], [type]) VALUES (N'80', N'Tỉnh Long An', N'Tỉnh')
INSERT [dbo].[devvn_tinhthanhpho] ([matp], [name], [type]) VALUES (N'82', N'Tỉnh Tiền Giang', N'Tỉnh')
INSERT [dbo].[devvn_tinhthanhpho] ([matp], [name], [type]) VALUES (N'83', N'Tỉnh Bến Tre', N'Tỉnh')
INSERT [dbo].[devvn_tinhthanhpho] ([matp], [name], [type]) VALUES (N'84', N'Tỉnh Trà Vinh', N'Tỉnh')
INSERT [dbo].[devvn_tinhthanhpho] ([matp], [name], [type]) VALUES (N'86', N'Tỉnh Vĩnh Long', N'Tỉnh')
INSERT [dbo].[devvn_tinhthanhpho] ([matp], [name], [type]) VALUES (N'87', N'Tỉnh Đồng Tháp', N'Tỉnh')
INSERT [dbo].[devvn_tinhthanhpho] ([matp], [name], [type]) VALUES (N'89', N'Tỉnh An Giang', N'Tỉnh')
INSERT [dbo].[devvn_tinhthanhpho] ([matp], [name], [type]) VALUES (N'91', N'Tỉnh Kiên Giang', N'Tỉnh')
INSERT [dbo].[devvn_tinhthanhpho] ([matp], [name], [type]) VALUES (N'92', N'Thành phố Cần Thơ', N'Thành phố Trung ương')
INSERT [dbo].[devvn_tinhthanhpho] ([matp], [name], [type]) VALUES (N'93', N'Tỉnh Hậu Giang', N'Tỉnh')
INSERT [dbo].[devvn_tinhthanhpho] ([matp], [name], [type]) VALUES (N'94', N'Tỉnh Sóc Trăng', N'Tỉnh')
INSERT [dbo].[devvn_tinhthanhpho] ([matp], [name], [type]) VALUES (N'95', N'Tỉnh Bạc Liêu', N'Tỉnh')
INSERT [dbo].[devvn_tinhthanhpho] ([matp], [name], [type]) VALUES (N'96', N'Tỉnh Cà Mau', N'Tỉnh')
SET IDENTITY_INSERT [dbo].[PayMeThod] ON 

INSERT [dbo].[PayMeThod] ([IdPay], [HinhThucThanhToan], [Visible]) VALUES (1, N'Giao hàng nhận tiên', 1)
INSERT [dbo].[PayMeThod] ([IdPay], [HinhThucThanhToan], [Visible]) VALUES (2, N'Qua thẻ ngân hàng', 1)
INSERT [dbo].[PayMeThod] ([IdPay], [HinhThucThanhToan], [Visible]) VALUES (3, N'Thanh toán 50%', 1)
SET IDENTITY_INSERT [dbo].[PayMeThod] OFF
SET IDENTITY_INSERT [dbo].[tbl_admin] ON 

INSERT [dbo].[tbl_admin] ([id], [username], [pass]) VALUES (1, N'baodeptrai', N'admin')
SET IDENTITY_INSERT [dbo].[tbl_admin] OFF

SET IDENTITY_INSERT [dbo].[tbl_DatHang] ON 


SET IDENTITY_INSERT [dbo].[tbl_DatHang] OFF
SET IDENTITY_INSERT [dbo].[tbl_Hang] ON 

INSERT [dbo].[tbl_Hang] ([id], [TenHang], [image], [ChatLieu], [Mota], [LuotXem], [giaMoi], [giaCu], [id_Menu], [Soluong], [TinhTrang], [Active], [image_large], [TomTat]) VALUES (1, N'Sơ mi nam cổ Trụ dáng ôm vải mịn không nhăn', N'images/somi1.jpg', N'vãi cao cấp', N'<h1><strong>L&Agrave; MỘT C&Ocirc;NG TY MAY L&Acirc;U NĂM TRONG NGHỀ, CH&Uacute;NG T&Ocirc;I CAM KẾT:</strong></h1>

<h2><strong>1. Cam kết chất lượng v&agrave; mẫu m&atilde; sản phẩm giống với h&igrave;nh ảnh. N&oacute;i kh&ocirc;ng với kiểu l&agrave;m ăn chộp giật.</strong></h2>

<h2><strong>2. Cam kết Ho&agrave;n tiền 100% nếu sản phẩm kh&ocirc;ng giống với m&ocirc; tả.</strong></h2>

<h2><strong>3. Được kiểm tra h&agrave;ng trước khi thanh to&aacute;n.</strong></h2>

<h2><strong>4. Cam kết được đổi trả h&agrave;ng trong v&ograve;ng 7&nbsp;ng&agrave;y.</strong></h2>

<p>&nbsp;</p>

<h2><strong>Th&ocirc;ng tin chi tiết sản phẩm:<br />
Sản phẩm c&oacute; c&aacute;c size như sau:<br />
SIZE M: C&acirc;n nặng 48-55kg, Cao 1m50 - 1m62, &quot; &Aacute;o D&agrave;i giữa cổ sau đến lai bầu 68cm, Vai 38cm, V&ograve;ng ngực 88cm, Chiết eo 76cm, D&agrave;i tay 54cm&quot;<br />
SIZE L: Can nặng 55- 60kg, Cao 1m60 - 1m68, &quot; &Aacute;o D&agrave;i giữa cổ sau đến lai bầu 70cm, Vai 40cm, V&ograve;ng Ngực 92cm, Chiết eo 80cm, D&agrave;i tay 56cm&quot;<br />
SIZE XL: c&acirc;n nặng 60 - 68kg, Cao 1m65 - 1m72, &quot; &Aacute;o D&agrave;i giữa cổ sau xuống lai bầu 72cm, Vai 42cm, V&ograve;ng ngực 96cm, Chiết eo 84cm, D&agrave;i tay 58cm&quot;<br />
SIZE XXL: C&acirc;n nặng 65 -74kg Cao 1m7. - 1m80, &Aacute;o D&agrave;i giữa cổ sau xuống lai bầu 74cm, Vai 46cm, V&ograve;ng Ngực 100cm, Chiết eo 90cm, D&agrave;i tay 60cm&quot;<br />
--H&agrave;ng c&oacute; sẵn, đủ size:M, L, XL, XXL<br />
NHẬN ĐẶT H&Agrave;NG MUA BU&Ocirc;N/MUA SỈ SỐ LƯỢNG LỚN</strong></h2>

<p>&nbsp;</p>
', 382, 89000.0000, 170000.0000, 2, 100, N'Còn', 1, N'images/somi1.jpg', N'THÔNG TIN SẢN PHẨM
✔ Xuất xứ: Việt Nam
✔ Chất lụa trơn, không nhăn, không xù, không bai, không phai màu.
✔ Form body Hàn Quốc, dễ kết hợp với các loại quần.
✔ Size: M, L, XL,XXL
✔ Thích hợp mặc trong nhiều môi trường khác nhau như công sở, tiệc, event, du lịch...')
INSERT [dbo].[tbl_Hang] ([id], [TenHang], [image], [ChatLieu], [Mota], [LuotXem], [giaMoi], [giaCu], [id_Menu], [Soluong], [TinhTrang], [Active], [image_large], [TomTat]) VALUES (2, N'Áo sơ mi nam đen trơn dài tay', N'images/somi2.jpg', N'Chất lụa trơn, không nhăn, không xù, không bai, kh', N'<h2>&nbsp;Chất lụa trơn, kh&ocirc;ng nhăn, kh&ocirc;ng x&ugrave;, kh&ocirc;ng bai, kh&ocirc;ng phai m&agrave;u.<br />
✔&nbsp;Form body H&agrave;n Quốc, dễ kết hợp với c&aacute;c loại quần.<br />
✔&nbsp;Made in Việt Nam.<br />
✔&nbsp;Size: M, L, XL,XXL, XXXL<br />
✔&nbsp;Được sử dụng nhiều tr&ecirc;n thị trường.<br />
✔&nbsp;Th&iacute;ch hợp mặc trong nhiều m&ocirc;i trường kh&aacute;c nhau như c&ocirc;ng sở, tiệc, event, du lịch...</h2>

<h1>=&gt;CH&Uacute;NG T&Ocirc;I CAM KẾT</h1>

<h2>Cam kết chất lượng v&agrave; mẫu m&atilde; sản phẩm giống với h&igrave;nh ảnh.</h2>

<h2>Ho&agrave;n tiền nếu sản phẩm kh&ocirc;ng giống với m&ocirc; tả.</h2>

<h2>Được kiểm tra h&agrave;ng trước khi thanh to&aacute;n.</h2>

<h2>Cam kết được đổi trả h&agrave;ng trong v&ograve;ng 7 ng&agrave;y.</h2>

<p>SIZE M: C&acirc;n nặng 48-55kg, Cao 1m50 - 1m62, &quot; &Aacute;o D&agrave;i giữa cổ sau đến lai bầu 68cm, Vai 38cm, V&ograve;ng ngực 88cm, Chiết eo 76cm, D&agrave;i tay 54cm&quot;<br />
SIZE L: Can nặng 55- 60kg, Cao 1m60 - 1m68, &quot; &Aacute;o D&agrave;i giữa cổ sau đến lai bầu 70cm, Vai 40cm, V&ograve;ng Ngực 92cm, Chiết eo 80cm, D&agrave;i tay 56cm&quot;<br />
SIZE XL: c&acirc;n nặng 60 - 68kg, Cao 1m65 - 1m72, &quot; &Aacute;o D&agrave;i giữa cổ sau xuống lai bầu 72cm, Vai 42cm, V&ograve;ng ngực 96cm, Chiết eo 84cm, D&agrave;i tay 58cm&quot;<br />
SIZE XXL: C&acirc;n nặng 65 -74kg Cao 1m7. - 1m80, &Aacute;o D&agrave;i giữa cổ sau xuống lai bầu 74cm, Vai 46cm, V&ograve;ng Ngực 100cm, Chiết eo 90cm, D&agrave;i tay 60cm&quot;</p>

<p>SIZE 3XL:C&acirc;n nặng 73-78kg Cao 1m7. - 1m80, &Aacute;o D&agrave;i giữa cổ sau xuống lai bầu 77cm, Vai 48cm, V&ograve;ng Ngực 104cm, Chiết eo 94cm, D&agrave;i tay 64cm</p>

<h1>NHẬN ĐẶT H&Agrave;NG MUA BU&Ocirc;N/MUA SỈ SỐ LƯỢNG LỚN.</h1>

<h2>Ch&uacute;ng t&ocirc;i hiện nay cung cấp &aacute;o sơ mi nam với gi&aacute; b&aacute;n lẻ tốt tr&ecirc;n thị trường.</h2>

<h3>--Gi&aacute; cạnh tranh do ch&iacute;nh nh&agrave; m&aacute;y sản xuất với số lượng lớn.</h3>

<h3>--Ch&uacute;ng t&ocirc;i kh&ocirc;ng n&oacute;i sản phẩm của m&igrave;nh c&oacute; chất lượng cao nhưng phải khẳng định chất lượng sản phẩm vượt trội so với gi&aacute; tiền.</h3>

<h3>--Uy t&iacute;n b&aacute;n h&agrave;ng được đặt l&ecirc;n h&agrave;ng đầu, kh&ocirc;ng kinh doanh chộp giật.</h3>

<h3>--V&igrave; sản phẩm được sản xuất với số lượng lớn để c&oacute; gi&aacute; cạnh tranh n&ecirc;n kh&ocirc;ng thể tr&aacute;nh được sai s&oacute;t. Nếu qu&yacute; kh&aacute;ch h&agrave;ng kh&ocirc;ng h&agrave;i l&ograve;ng ch&uacute;ng t&ocirc;i sẵn s&agrave;ng hỗ trợ đổi trả.</h3>

<h3>--Rất mong nhận được &yacute; kiến đ&oacute;ng g&oacute;p của Qu&yacute; kh&aacute;ch h&agrave;ng để ch&uacute;ng t&ocirc;i cải thiện chất lượng dịch vụ tốt hơn.</h3>

<p><img alt="23622175_1274839482620233_8185696138576540659_n.jpg" src="https://vn-live-02.slatic.net/original/2715980954a9a5b87e8d570c48eb0f7c.jpg" /></p>

<p><img alt="25443001_1302190583218456_5347700343587382224_n.jpg" src="https://vn-live-02.slatic.net/original/9e6e2c4607d6bdea4e254da5a3a8b557.jpg" /></p>

<p><img alt="3d680be6213ecf60962f.jpg" src="https://vn-live-02.slatic.net/original/4ac1dff0ad2db45be7ed3b24da323a66.jpg" /></p>
', 19, 89000.0000, 170000.0000, 2, 50, N'Còn', 1, N'images/somi2.jpg', N'THÔNG TIN SẢN PHẨM
✔ Xuất xứ: Việt Nam
✔ Chất lụa trơn, không nhăn, không xù, không bai, không phai màu.
✔ Form body Hàn Quốc, dễ kết hợp với các loại quần.
✔ Size: M, L, XL,XXL
✔ Thích hợp mặc trong nhiều môi trường khác nhau như công sở, tiệc, event, du lịch...')
INSERT [dbo].[tbl_Hang] ([id], [TenHang], [image], [ChatLieu], [Mota], [LuotXem], [giaMoi], [giaCu], [id_Menu], [Soluong], [TinhTrang], [Active], [image_large], [TomTat]) VALUES (3, N'Áo sơ mi nam cổ Trụ Màu Xám Tiêu Nhạt', N'images/somi3.jpg', N' Chất lụa trơn', N'<h2><strong>CH&Uacute;NG T&Ocirc;I CAM KẾT</strong></h2>

<h3>Cam kết chất lượng v&agrave; mẫu m&atilde; sản phẩm giống với h&igrave;nh ảnh.</h3>

<h3>Ho&agrave;n tiền nếu sản phẩm kh&ocirc;ng giống với m&ocirc; tả.</h3>

<h3>Được kiểm tra h&agrave;ng trước khi thanh to&aacute;n.</h3>

<h3>Cam kết được đổi trả h&agrave;ng trong v&ograve;ng 7 ng&agrave;y.</h3>

<h3><strong>C&Aacute;CH CHỌN SIZE &Aacute;O SƠ MI:</strong></h3>

<h3><strong>SIZE M: C&acirc;n nặng 48-55kg, Cao 1m50 - 1m62, &quot; &Aacute;o D&agrave;i giữa cổ sau đến lai bầu 68cm, Vai 38cm, V&ograve;ng ngực 88cm, Chiết eo 76cm, D&agrave;i tay 54cm&quot;</strong></h3>

<h3><strong>SIZE L: Can nặng 55- 60kg, Cao 1m60 - 1m68, &quot; &Aacute;o D&agrave;i giữa cổ sau đến lai bầu 70cm, Vai 40cm, V&ograve;ng Ngực 92cm, Chiết eo 80cm, D&agrave;i tay 56cm&quot;</strong></h3>

<h3><strong>SIZE XL: c&acirc;n nặng 60 - 68kg, Cao 1m65 - 1m72, &quot; &Aacute;o D&agrave;i giữa cổ sau xuống lai bầu 72cm, Vai 42cm, V&ograve;ng ngực 96cm, Chiết eo 84cm, D&agrave;i tay 58cm&quot;</strong></h3>

<h3><strong>SIZE XXL: C&acirc;n nặng 65 -74kg Cao 1m7. - 1m80, &Aacute;o D&agrave;i giữa cổ sau xuống lai bầu 74cm, Vai 46cm, V&ograve;ng Ngực 100cm, Chiết eo 90cm, D&agrave;i tay 60cm&quot;</strong></h3>

<h3>&nbsp;</h3>

<h3>NHẬN ĐẶT H&Agrave;NG MUA BU&Ocirc;N/MUA SỈ SỐ LƯỢNG LỚN.</h3>

<h3>Ch&uacute;ng t&ocirc;i hiện nay cung cấp &aacute;o sơ mi nam với gi&aacute; b&aacute;n lẻ tốt tr&ecirc;n thị trường.</h3>

<h3>--Gi&aacute; cạnh tranh do ch&iacute;nh nh&agrave; m&aacute;y sản xuất với số lượng lớn.</h3>

<h3>--Ch&uacute;ng t&ocirc;i kh&ocirc;ng n&oacute;i sản phẩm của m&igrave;nh c&oacute; chất lượng cao nhưng phải khẳng định chất lượng sản phẩm vượt trội so với gi&aacute; tiền.</h3>

<h3>--Uy t&iacute;n b&aacute;n h&agrave;ng được đặt l&ecirc;n h&agrave;ng đầu, kh&ocirc;ng kinh doanh chộp giật.</h3>

<h3>--V&igrave; sản phẩm được sản xuất với số lượng lớn để c&oacute; gi&aacute; cạnh tranh n&ecirc;n kh&ocirc;ng thể tr&aacute;nh được sai s&oacute;t. Nếu qu&yacute; kh&aacute;ch h&agrave;ng kh&ocirc;ng h&agrave;i l&ograve;ng ch&uacute;ng t&ocirc;i sẵn s&agrave;ng hỗ trợ đổi trả.</h3>

<h3>--Rất mong nhận được &yacute; kiến đ&oacute;ng g&oacute;p của Qu&yacute; kh&aacute;ch h&agrave;ng để ch&uacute;ng t&ocirc;i cải thiện chất lượng dịch vụ tốt hơn.</h3>
', 49, 119000.0000, 238000.0000, 2, 100, N'Còn', 1, N'images/somi3.jpg', N'✔ Chất lụa trơn, không nhăn, không xù, không bai, không phai màu.
✔ Form body Hàn Quốc, dễ kết hợp với các loại quần.
✔ Made in Việt Nam.
✔ Size: M, L, XL,XXL
✔ Được sử dụng nhiều nhất trên thị trường.
✔ Thích hợp mặc trong nhiều môi trường khác nhau như công sở, tiệc, event, du lịch')
INSERT [dbo].[tbl_Hang] ([id], [TenHang], [image], [ChatLieu], [Mota], [LuotXem], [giaMoi], [giaCu], [id_Menu], [Soluong], [TinhTrang], [Active], [image_large], [TomTat]) VALUES (4, N'Áo sơ mi cổ tàu nam không nhăn', N'images/somi4.jpg', N'Vải cotton mềm mịn', N'<h2><strong>1. Kh&aacute;i qu&aacute;t về sản phẩm&nbsp;&Aacute;o sơ mi nam cổ t&agrave;u H&agrave;n Quốc thời trang Nami - TTT02&nbsp;(X&aacute;m)</strong></h2>

<p>&Aacute;o sơ mi cổ t&agrave;u lu&ocirc;n l&agrave; sự lựa chọn ho&agrave;n hảo chưa bao giờ l&agrave; lỗi mốt đối với c&aacute;c ch&agrave;ng trai khi tới nơi l&agrave;m việc cũng như đi dạo phố. Với những ch&agrave;ng trai&nbsp;y&ecirc;u th&iacute;ch thời trang th&igrave; kiểu &aacute;o n&agrave;y chắc chắn kh&ocirc;ng thể thiếu trong tủ quần &aacute;o của m&igrave;nh v&agrave; cứ mỗi khi m&ugrave;a h&egrave; sang l&agrave; ch&uacute;ng lại được diện với nhiều sự kết hợp kh&aacute;c nhau.</p>

<p><img alt="xám nhạt 2.jpg" src="https://vn-live.slatic.net/original/a992b6fb970baa7955b14f66104892ae.jpg" /></p>

<h2><strong>2.Thiết kế, chất liệu của sản phẩm &Aacute;o sơ mi nam cổ t&agrave;u H&agrave;n Quốc thời trang Nami - TT02&nbsp;(X&aacute;m)</strong></h2>

<p>- Kiểu d&aacute;ng &ocirc;m nhẹ l&agrave;m t&ocirc;n l&ecirc;n body người mặc kết hợp với m&agrave;u sắc trẻ trung, tinh tế mang lại vẻ đẹp phong c&aacute;ch v&agrave; thời thượng.</p>

<p>- &Aacute;o trơn m&agrave;u trắng mang đến cho người mặc một phong c&aacute;ch vừa cổ điển vừa c&oacute; n&eacute;t trẻ trung, lịch l&atilde;m v&agrave; quyến rũ.</p>

<p>- &Aacute;o d&aacute;ng cổ trụ trẻ trung</p>

<p><img alt="24301191_2126495677579884_4780479856442684040_n.jpg" src="https://vn-live.slatic.net/original/9f9d5719bcd52a26ec9d7ce26c4f2092.jpg" /></p>

<h2><strong>3. Hướng dẫn lựa chọn k&iacute;ch cỡ cho &Aacute;o sơ mi nam cổ t&agrave;u H&agrave;n Quốc thời trang Nami - TT02&nbsp;(X&aacute;m)</strong></h2>

<p>Kh&ocirc;ng giống như &aacute;o thun c&oacute; gi&atilde;n được, &aacute;o sơ mi l&agrave; loại trang phục c&oacute; form cứng do đ&oacute; việc chọn đ&uacute;ng size &aacute;o l&agrave; điều hết sức quan trọng. &Aacute;o sơ mi nếu chọn lệch size th&igrave; kh&oacute; c&oacute; thể mặc được hoặc nếu c&oacute; miễn cưỡng mặc th&igrave; cũng l&agrave;m mất đi sự thoải m&aacute;i v&agrave; t&iacute;nh thẩm mỹ. Nhưng với Thời Trang Nami&nbsp;th&igrave; mọi chuyện sẽ trở th&agrave;nh qu&aacute; khứ v&igrave; lu&ocirc;n c&oacute; 1 đội chuy&ecirc;n chăm s&oacute;c kh&aacute;ch h&agrave;ng tư vấn cho bạn chu đ&aacute;o v&agrave; nhiệt t&igrave;nh.</p>

<p>H&atilde;y nhanh tay đặt ngay 1 &Aacute;o sơ mi nam c&ocirc;ng sở AS01<strong>&nbsp;</strong>để cảm nhận chất lượng sản phẩm cũng như dịch vụ của Nami.</p>

<p>Nếu bạn c&ograve;n ch&uacute;t thắc mắc cần tư vấn th&ecirc;m về sản phẩm h&atilde;y li&ecirc;n hệ ngay với Nami</p>
', 70, 139000.0000, 199000.0000, 2, 100, N'Còn', 1, N'images/somi4.jpg', N'Thiết kế: Áo Sơ Mi Nam
Size : M, L, XL
Màu sắc: Xám
*Chất liệu: Vải cotton mềm mịn
*Phong cách: Trẻ Trung, Thời Trang
*Tư Vấn: Chọn Size Miễn Phí Ngay Khi Đặt Hàng
*Cam Kết: Ảnh Thật, Sản Phẩm Giống Y Trong Hình.
*Giao Hàng: Tận Nơi Trên Toàn Quốc, Thanh Toán Khi Nhận Hàng')
INSERT [dbo].[tbl_Hang] ([id], [TenHang], [image], [ChatLieu], [Mota], [LuotXem], [giaMoi], [giaCu], [id_Menu], [Soluong], [TinhTrang], [Active], [image_large], [TomTat]) VALUES (5, N'ÁO KHOÁC GIÓ CÓ MŨ NAM HAI LỚP', N'images/aokhoac1.jpg', N'vải dù', N'<p><strong>TH&Ocirc;NG TIN SẢN PHẨM</strong></p>

<ul>
	<li>Sản phẩm: &Aacute;o Hoodies Nam Nữ Liền Mũ Giả Hai Lớp</li>
	<li>Chất liệu mềm mại, tho&aacute;ng m&aacute;t, thấm h&uacute;t mồ h&ocirc;i</li>
	<li>Thiết kế đơn giản nhưng kh&ocirc;ng k&eacute;m phần thời trang</li>
	<li>Sản xuất tại Việt Nam</li>
	<li>K&iacute;ch cỡ ph&ugrave; hợp với người dưới 65kg t&ugrave;y chiều cao</li>
	<li>Size S: cho bạn c&oacute; c&acirc;n nặng từ dưới 45kg t&ugrave;y chiều cao</li>
	<li>Size M: cho bạn c&oacute; c&acirc;n nặng từ 46- 52kg t&ugrave;y chiều cao</li>
	<li>Size L: cho bạn c&oacute; c&acirc;n nặng từ 53-65kg t&ugrave;y chiều cao</li>
</ul>

<p><strong>&Aacute;o hoodie&nbsp;</strong>l&agrave;<strong>&nbsp;</strong>một trong c&aacute;c trang phục&nbsp;phong c&aacute;ch thời trang đường phố (streetstyle) nổi tiếng thế giới d&agrave;nh cho giới trẻ đang ng&agrave;y c&agrave;ng quen thuộc v&agrave; được c&aacute;c bạn trẻ Việt Nam ưa chuộng bởi thiết kế đơn giản, dễ phối v&agrave; th&iacute;ch hợp cho cả nam lẫn nữ. Hoodie thể hiện phong c&aacute;ch casual &ndash; ăn mặc thoải m&aacute;i h&agrave;ng ng&agrave;y n&ecirc;n rất th&iacute;ch hợp cho c&aacute;c hoạt động ngoại kh&oacute;a ngo&agrave;i trời, đi học, đi l&agrave;m (nếu nơi bạn l&agrave;m việc kh&ocirc;ng qu&aacute; khắt khe trong việc ăn mặc) v&agrave; đi chơi c&ugrave;ng gia đ&igrave;nh hoặc bạn b&egrave;.</p>

<p>Đ&acirc;y l&agrave; một trang phục v&ocirc; c&ugrave;ng tiện lợi c&oacute; thể kết hợp với nhiều kiểu dang, phong c&aacute;ch kh&aacute;c nhau. Sự kết hợp giữa hoodie với &aacute;o thun, quần jeans hoặc quần ngố đem lại cho người mặc sự năng động, trẻ trung, đậm phong c&aacute;ch thể thao. Bạn muốn đến một trận đấu thể thao hay một buổi picnic với bạn b&egrave;? Đ&acirc;y hẳn l&agrave; một lựa chọn v&ocirc; c&ugrave;ng th&iacute;ch hơp.</p>
', 15, 99000.0000, 120000.0000, 1, 100, N'Còn', 1, N'images/aokhoac1.jpg', N'ÁO KHOÁC GIÓ CÓ MŨ NAM HAI LỚP')
INSERT [dbo].[tbl_Hang] ([id], [TenHang], [image], [ChatLieu], [Mota], [LuotXem], [giaMoi], [giaCu], [id_Menu], [Soluong], [TinhTrang], [Active], [image_large], [TomTat]) VALUES (6, N'Áo Sơ Mi Nam Kẻ Sọc', N'images/somi6.jpg', N' Cotton', N'<p>Loại sản phẩm: &Aacute;o Sơ Mi<br />
Giới t&iacute;nh: Nam<br />
Chiều D&agrave;i tay: D&agrave;i tay<br />
&Aacute;o Sơ Mi Kiểu: &Aacute;o Sơ Mi th&ocirc;ng thường<br />
Cổ &aacute;o: Cổ Bẻ<br />
Loại vải: Vải Rộng<br />
Chất liệu: Cotton<br />
Phong c&aacute;ch: Đ&ocirc; Thị thời trang<br />
Loại kh&oacute;a: Một H&agrave;ng Khuy<br />
Phong C&aacute;ch tay &aacute;o: Th&ocirc;ng Thường<br />
Kiểu Họa tiết: Kẻ Sọc<br />
K&iacute;ch thước: M L XL XXL XXXL 4XL 5XL<br />
Cơ Bản Phong C&aacute;ch: Thanh Ni&ecirc;n thời trang<br />
Bản mẫu: Mỏng<br />
Loại đơn vị: C&aacute;i<br />
Trọng Lượng g&oacute;i h&agrave;ng: 0.350 kg (0.77lb.)<br />
K&iacute;ch Thước đ&oacute;ng g&oacute;i: 40 cm x 30 cm x 4 cm (15.75in x 11.81in x 1.57in)</p>

<p>Kh&aacute;ch h&agrave;ng th&acirc;n mến, nếu bạn c&oacute; bất kỳ c&acirc;u hỏi n&agrave;o về sản phẩm của ch&uacute;ng t&ocirc;i, xin được tự do li&ecirc;n hệ với ch&uacute;ng t&ocirc;i. ch&uacute;ng t&ocirc;i sẽ gi&uacute;p bạn sớm nhất c&oacute; thể.<br />
Ch&uacute;c bạn c&oacute; một đẹp trải nghiệm mua sắm ở đ&acirc;y. Cảm Ơn bạn.<br />
Của ch&uacute;ng t&ocirc;i E-mail: charlieforwish05@126.com<br />
Điện thoại di động: + 8618616700882<br />
WhatsApp: + 8618616700882</p>

<p>&nbsp;</p>

<p><img src="https://vn-live-02.slatic.net/original/2af9eded8172aa203865b9648f88c0be.jpg" /><img src="https://vn-live-02.slatic.net/original/02e2353b0d524d76083d7de9ced8723a.jpg" /><img src="https://vn-live-02.slatic.net/original/6c4d172fad3224ac9c463d395a3fc8d1.jpg" /><img src="https://vn-live-02.slatic.net/original/e40747152160d3c991a4d7dc00cc2c22.jpg" /><img src="https://vn-live-02.slatic.net/original/207637c5004af52834856814b0552d44.jpg" /><img src="https://vn-live-02.slatic.net/original/63ae6db4f78eaf89b5500ea7ac2a92c6.jpg" /><img src="https://vn-live-02.slatic.net/original/5de0037a9a9946106b64c4313e0edd34.jpg" /><img src="https://vn-live-02.slatic.net/original/6199ddbcaf9b4e108c8d92b945eb8f2a.jpg" /><img src="https://vn-live-02.slatic.net/original/570caac9c8197552ecd2707a89d60ef6.jpg" /><img src="https://vn-live-02.slatic.net/original/1ad268906881ef62ced41dc4f7265312.jpg" /><img src="https://vn-live-02.slatic.net/original/810c6f9039b2e2bd9003e40dcb10b3de.jpg" /><img src="https://vn-live-02.slatic.net/original/efdc5ec62bcec76b28f6df7d832c32a1.jpg" /><img src="https://vn-live-02.slatic.net/original/a75432ef18258baca5c3c4687e8dc15d.jpg" /><img src="https://vn-live-02.slatic.net/original/9f9432eefa3f7a386b14f62581323de3.jpg" /><img src="https://vn-live-02.slatic.net/original/e9161f73b8d924d0e6f0aac940529d83.jpg" /><img src="https://vn-live-02.slatic.net/original/121320fd8d8b7fd75e629b83667d0143.jpg" /><img src="https://vn-live-02.slatic.net/original/71adf55194067d6c8309b58b6297cf3e.jpg" /><img src="https://vn-live-02.slatic.net/original/996797bab83530ec78f48297e7a33fc7.jpg" /><img src="https://vn-live-02.slatic.net/original/3efd198c1b1a5a8177077c746298c654.jpg" /><img src="https://vn-live-02.slatic.net/original/b6826a04f4705816b867b885efce1129.jpg" /><img src="https://vn-live-02.slatic.net/original/ada369dac1236af60ca41da97b248aac.jpg" /><img src="https://vn-live-02.slatic.net/original/a967b3e45de017de56bb253c93adf82d.jpg" /></p>
', 22, 230000.0000, 32000.0000, 2, 50, N'Còn', 1, N'images/somi6.jpg', N'100% Thương Hiệu Mới
Chất liệu này mang đến cho bạn cảm giác thoải mái
Chất Lượng cao, Hợp Thời Trang & Thoải Mái
Đây là thiết kế rất phổ biến và thời trang, chúng tôi tin rằng bạn sẽ thích nó!')
INSERT [dbo].[tbl_Hang] ([id], [TenHang], [image], [ChatLieu], [Mota], [LuotXem], [giaMoi], [giaCu], [id_Menu], [Soluong], [TinhTrang], [Active], [image_large], [TomTat]) VALUES (7, N'ÁO KHOÁC NAM BOMBER JACKET KAKI (XÁM)', N'images/aokhoac3.jpg', N'Vãi dù', N'<h2>Giới thiệu sản phẩm &Aacute;o kho&aacute;c bomber nam jacket kaki 2 lớp họa tiết ( X&aacute;m )</h2>

<p>c&aacute;c ban ch&uacute; &yacute; khi chọn size nh&eacute;( c&aacute;c ban được mặc thử trước khi nhận- nếu nh&acirc;n vi&ecirc;n k chịu xin li&ecirc;n hệ sdt tren hộp)</p>

<table border="1" cellpadding="0" cellspacing="0">
	<tbody>
		<tr>
			<td>
			<p>NẶNG/CAO</p>
			</td>
			<td>
			<p>140cm</p>
			</td>
			<td>
			<p>145cm</p>
			</td>
			<td>
			<p>150cm</p>
			</td>
			<td>
			<p>155cm</p>
			</td>
			<td>
			<p>160cm</p>
			</td>
			<td>
			<p>165cm</p>
			</td>
			<td>
			<p>170cm</p>
			</td>
			<td>
			<p>175cm</p>
			</td>
			<td>
			<p>180cm</p>
			</td>
			<td>
			<p>185cm</p>
			</td>
		</tr>
		<tr>
			<td>
			<p>40kg</p>
			</td>
			<td>
			<p>M</p>
			</td>
			<td>
			<p>M</p>
			</td>
			<td>
			<p>M</p>
			</td>
			<td>
			<p>M</p>
			</td>
			<td>
			<p>M/L</p>
			</td>
			<td>
			<p>L</p>
			</td>
			<td>
			<p>L</p>
			</td>
			<td>
			<p>XL</p>
			</td>
			<td>
			<p>XL</p>
			</td>
			<td>
			<p>XL</p>
			</td>
		</tr>
		<tr>
			<td>
			<p>45kg</p>
			</td>
			<td>
			<p>M</p>
			</td>
			<td>
			<p>M</p>
			</td>
			<td>
			<p>M</p>
			</td>
			<td>
			<p>M</p>
			</td>
			<td>
			<p>M/L</p>
			</td>
			<td>
			<p>L</p>
			</td>
			<td>
			<p>L</p>
			</td>
			<td>
			<p>XL</p>
			</td>
			<td>
			<p>XL</p>
			</td>
			<td>
			<p>XL</p>
			</td>
		</tr>
		<tr>
			<td>
			<p>50kg</p>
			</td>
			<td>
			<p>M</p>
			</td>
			<td>
			<p>M</p>
			</td>
			<td>
			<p>M/L</p>
			</td>
			<td>
			<p>M/L</p>
			</td>
			<td>
			<p>L</p>
			</td>
			<td>
			<p>L</p>
			</td>
			<td>
			<p>L</p>
			</td>
			<td>
			<p>XL</p>
			</td>
			<td>
			<p>XL</p>
			</td>
			<td>
			<p>XL</p>
			</td>
		</tr>
		<tr>
			<td>
			<p>55kg</p>
			</td>
			<td>
			<p>M</p>
			</td>
			<td>
			<p>M</p>
			</td>
			<td>
			<p>M/L</p>
			</td>
			<td>
			<p>L</p>
			</td>
			<td>
			<p>L</p>
			</td>
			<td>
			<p>L</p>
			</td>
			<td>
			<p>L/XL</p>
			</td>
			<td>
			<p>XL</p>
			</td>
			<td>
			<p>XL</p>
			</td>
			<td>
			<p>XL</p>
			</td>
		</tr>
		<tr>
			<td>
			<p>60kg</p>
			</td>
			<td>
			<p>L</p>
			</td>
			<td>
			<p>L</p>
			</td>
			<td>
			<p>L</p>
			</td>
			<td>
			<p>L</p>
			</td>
			<td>
			<p>L/XL</p>
			</td>
			<td>
			<p>XL</p>
			</td>
			<td>
			<p>XL</p>
			</td>
			<td>
			<p>XL</p>
			</td>
			<td>
			<p>XL</p>
			</td>
			<td>
			<p>XL</p>
			</td>
		</tr>
		<tr>
			<td>
			<p>65kg</p>
			</td>
			<td>
			<p>L</p>
			</td>
			<td>
			<p>L</p>
			</td>
			<td>
			<p>L</p>
			</td>
			<td>
			<p>L</p>
			</td>
			<td>
			<p>L/XL</p>
			</td>
			<td>
			<p>XL</p>
			</td>
			<td>
			<p>XL</p>
			</td>
			<td>
			<p>XL</p>
			</td>
			<td>
			<p>XL</p>
			</td>
			<td>
			<p>XL</p>
			</td>
		</tr>
		<tr>
			<td>
			<p>70kg</p>
			</td>
			<td>
			<p>&nbsp;</p>
			</td>
			<td>
			<p>&nbsp;</p>
			</td>
			<td>
			<p>&nbsp;</p>
			</td>
			<td>
			<p>XL</p>
			</td>
			<td>
			<p>XL</p>
			</td>
			<td>
			<p>XL</p>
			</td>
			<td>
			<p>XL</p>
			</td>
			<td>
			<p>XL</p>
			</td>
			<td>
			<p>XL</p>
			</td>
			<td>
			<p>XL</p>
			</td>
		</tr>
		<tr>
			<td>
			<p>75kg</p>
			</td>
			<td>
			<p>&nbsp;</p>
			</td>
			<td>
			<p>&nbsp;</p>
			</td>
			<td>
			<p>&nbsp;</p>
			</td>
			<td>
			<p>XL</p>
			</td>
			<td>
			<p>XL</p>
			</td>
			<td>
			<p>XL</p>
			</td>
			<td>
			<p>XL</p>
			</td>
			<td>
			<p>XL</p>
			</td>
			<td>
			<p>XL</p>
			</td>
			<td>
			<p>XXL</p>
			</td>
		</tr>
	</tbody>
</table>

<p>Tiếp nối th&agrave;nh c&ocirc;ng của mẫu<strong>&aacute;o kho&aacute;c bomber nam jacket cao cấp</strong>, Shop tiếp tục cho ra mắt sản phẩm &aacute;o kho&aacute;c bomber gi&aacute; rẻ với m&agrave;u chủ đạo đen đơn giản, thanh lịch. Đ&acirc;y sẽ l&agrave; chiếc &aacute;o tuyệt vời cho những ch&agrave;ng trai chọn phong c&aacute;ch trẻ trung của những anh ch&agrave;ng, d&ugrave; đi học hay đi l&agrave;m.</p>

<p>Chất liệu vải vẫn l&agrave; kaki nhật ngoại nhập cao cấp, 2 lớp l&oacute;t d&ugrave; mềm mại, chắc chắn, thấm h&uacute;t mồ h&ocirc;i tốt tạo sự thoải m&aacute;i khi mặc. &Aacute;o bomber c&oacute; t&uacute;i, d&acirc;y k&eacute;o tiện dụng gi&uacute;p đựng được những vật nhỏ cần thiết v&agrave; sử dụng gam m&agrave;u trung t&iacute;nh sẽ l&agrave; lựa chọn ho&agrave;n hảo cho phong c&aacute;ch smart-casual &ndash; kh&ocirc;ng ồn &agrave;o những vẫn rất nổi bật, đơn giản m&agrave; thời trang, trẻ trung m&agrave; lịch l&atilde;m. Bomber hứa h</p>

<p>lại dễ kết hợp với nhiều loại trang phục.</p>

<p>C&ograve;n chần chừ g&igrave; nữa m&agrave; kh&ocirc;ng nhanh tay sở hữu một chiếc bomber kaki JACKER<img src="https://vn-live-02.slatic.net/original/0b6061636c2f707031b987123827c690.jpg" /></p>

<p><strong>HƯỚNG DẪN BẢO QUẢN:</strong></p>

<p>&nbsp;</p>

<ul>
	<li>Chỉ giặt bằng tay.</li>
	<li>Kh&ocirc;ng ng&acirc;m đồ qu&aacute; l&acirc;u trong dung dịch c&oacute; độ tẩy cao.</li>
	<li>Kh&ocirc;ng để x&agrave; ph&ograve;ng h&oacute;a chất trực tiếp l&ecirc;n sản phẩm c&oacute; in h&igrave;nh.</li>
	<li>Kh&ocirc;ng được phơi dưới nắng lớn, n&ecirc;n phơi trong b&oacute;ng r&acirc;m m&aacute;t.</li>
	<li>Ủi ở nhiệt độ trung b&igrave;nh.</li>
</ul>

<p><br />
<strong>K&Iacute;CH CỠ THAM KHẢO:</strong></p>

<p>&nbsp;</p>

<ul>
	<li>Size M: ph&ugrave; hợp với bạn dưới 50kg</li>
	<li>Size L: ph&ugrave; hợp với bạn từ 50đến 60kg</li>
	<li>size xl ph&ugrave; hợp với bạn tu 60đến 70kg</li>
</ul>
', 5, 77000.0000, 123000.0000, 1, 100, N'Còn', 1, N'images/aokhoac3.jpg', N'Chỉ giặt bằng tay.
Không ngâm đồ quá lâu trong dung dịch có độ tẩy cao.
Không để xà phòng hóa chất trực tiếp lên sản phẩm có in hình.
Không được phơi dưới nắng lớn, nên phơi trong bóng râm mát.
Ủi ở nhiệt độ trung bình.
Size M: phù hợp với bạn dưới 50kg
Size L: phù hợp với bạn từ 50 đến 60kg
size xl phù hợp với bạn tu 60 đến 70kg')
INSERT [dbo].[tbl_Hang] ([id], [TenHang], [image], [ChatLieu], [Mota], [LuotXem], [giaMoi], [giaCu], [id_Menu], [Soluong], [TinhTrang], [Active], [image_large], [TomTat]) VALUES (8, N'QUẦN JEAN NAM CAO CẤP 024 JET SHOP', N'images/quan1.jpg', N' jean cotton bền đẹp', N'<p><img src="https://vn-test-11.slatic.net/shop/4858b857056a15dcc53185cee4fd71ed.png" /></p>

<p><img src="https://vn-test-11.slatic.net/shop/8f705dafa9692b358d4d3584f1684b69.jpeg" /></p>
', 89, 128000.0000, 158000.0000, 3, 100, N'Còn', 1, N'images/quan1.jpg', N'Kiểu dáng thời trang, sành điệu.
· Tổng thể màu xanh hài hòa phối rách táo bạo tạo sự năng động, cá tính.
· Có hai túi xéo trước và hai túi sau rất tiện dụng.
· Chất liệu jean cotton bền đẹp, chắc chắn, không phai màu, không co rút khi giặc.')
INSERT [dbo].[tbl_Hang] ([id], [TenHang], [image], [ChatLieu], [Mota], [LuotXem], [giaMoi], [giaCu], [id_Menu], [Soluong], [TinhTrang], [Active], [image_large], [TomTat]) VALUES (9, N'Áo Sơ mi Nam Cổ Trụ', N'images/somi5.jpg', N'Chất lụa trơn', N'<p><strong>ẢNH SẢN PHẨM</strong></p>

<p><img src="https://vn-live.slatic.net/v2/resize/products/S-100066759-18a92e1f3bd8a6374f1ef022c444d5a8.jpg" /></p>

<p>-------------------------------------<br />
<strong>CHI TIẾT SẢN PHẨM</strong></p>

<p>Sơ mi- trang phục kh&ocirc;ng thể thiếu trong tủ đồ của nam giới. Những chiếc &aacute;o sơ mi nam c&ocirc;ng sở thoải m&aacute;i, lịch l&atilde;m, trẻ trung chắc chắn sẽ l&agrave;m vừa l&ograve;ng những ch&agrave;ng trai kh&oacute; t&iacute;nh v&agrave; cầu k&igrave; nhất. &Aacute;o sơ mi nam cổ t&agrave;u vừa vặn sẽ gi&uacute;p t&ocirc;n l&ecirc;n đường n&eacute;t cơ thể v&agrave; chỉ cần mix với quần t&acirc;y hoặc quần kaki đơn giản l&agrave; bạn đủ sức để tỏa s&aacute;ng mỗi khi ra ngo&agrave;i. Đặc biệt, bộ đ&ocirc;i &Aacute;O SƠ MI TRẮNG-QUẦN &Acirc;U lu&ocirc;n l&agrave; một cặp ho&agrave;n hảo.<br />
H&egrave; n&agrave;y, ch&uacute;ng t&ocirc;imang đến cho c&aacute;c ch&agrave;ng những item &ldquo;sơ mi nam cổ t&agrave;u&rdquo; với những đặc t&iacute;nh vượt trội:<br />
Chất vải lụa nến cao cấp, kh&ocirc;ng nhăn, kh&ocirc;ng x&ugrave;, kh&ocirc;ng bai m&agrave;u<br />
Đường may tinh tế, chỉn chu, n&uacute;t đơm kh&eacute;o l&eacute;o, chắc chắn<br />
M&agrave;u sắc đa dạng, trẻ trung<br />
Form body H&agrave;n Quốc mang lại phong c&aacute;ch lịch l&atilde;m, sang trọng<br />
Cổ &aacute;o được c&aacute;ch điệu theo d&aacute;ng cổ t&agrave;u mới mẻ, độc đ&aacute;o kh&ocirc;ng bị dập khu&ocirc;n với chiếc &aacute;o sơ mi nam cổ trụ k&iacute;n bưng</p>
', 28, 100000.0000, 150000.0000, 2, 100, N'Còn', 1, N'images/somi5.jpg', N'✔ Chất lụa trơn, không nhăn, không xù, không bai, không phai màu.
✔ Form body Hàn Quốc, dễ kết hợp với các loại quần.
✔ Made in Việt Nam.
✔ Size: M, L, XL, XXL
✔ Được sử dụng nhiều nhất trên thị trường.
✔ Thích hợp mặc trong nhiều môi trường khác nhau như công sở, tiệc, event, du lịch...')
INSERT [dbo].[tbl_Hang] ([id], [TenHang], [image], [ChatLieu], [Mota], [LuotXem], [giaMoi], [giaCu], [id_Menu], [Soluong], [TinhTrang], [Active], [image_large], [TomTat]) VALUES (24, N'ÁO KHOÁC NHẸ NAM', N'images/aokhoac2.jpg', N'vãi cao cấp', N'<p>&Aacute;o kho&aacute;c d&ugrave; namc&oacute; n&oacute;n dường như đ&atilde; qu&aacute; quen thuộc đối với người d&acirc;n Việt Nam. Nổi tiếng với chất vải bền, đẹp, đ&aacute;ng tiền.<br />
- Chất liệu vải d&ugrave; d&agrave;y dặn gi&uacute;p bảo vệ l&agrave;n da của bạn tr&aacute;nh khỏi t&aacute;c động của &aacute;nh nắng mặt trời m&agrave; kh&ocirc;ng bị c&aacute;c bệnh về da.<br />
- &Aacute;o kho&aacute;c của xưởngch&uacute;ng t&ocirc;i sản xuất ra lu&ocirc;n được đảm bảo về c&aacute;c ti&ecirc;u chuẩn chất lượng, qua c&aacute;c c&ocirc;ng đoạn kiểm tra nghi&ecirc;m ngặt để tạo ra sản phẩm n&ecirc;n c&aacute;c bạn kh&ocirc;ng cần lo lắng về sản phẩm.<br />
- Với chất liệu d&ugrave; cao cấp cho bạn một chiếc &aacute;o khi mặc v&agrave;o t&ocirc;n l&ecirc;n vẻ nam t&iacute;nh, trẻ trung.<br />
- &Aacute;okho&aacute;c nam được b&aacute;n ra đảm bảo giặt sẽkh&ocirc;ng ra m&agrave;u, kh&ocirc;ng x&ugrave; l&ocirc;ngtheo thời gian<br />
- &Aacute;o c&oacute; tổng cộng ba m&agrave;u tha hồ cho c&aacute;c bạn lựa chọn. Lấy ngay ba c&aacute;iđể mặccả tuần m&agrave; kh&ocirc;ng cần phải đắn đo suy nghĩ rằng ng&agrave;y mai mặc g&igrave;<br />
- Lấy ngay 2 &aacute;o thiết kế phong c&aacute;ch lịch l&atilde;mtrở l&ecirc;n cho c&aacute;c bạn thoải m&aacute;i mặc đi l&agrave;m, đi họchay chơic&aacute;c m&ocirc;n thể thaotrong nh&agrave;. Vừac&oacute; thể dễ d&agrave;ng thay đỗi kiểu vừa được hỗ trợ ph&iacute; ship từ Lazada<br />
*M&ocirc; tả sản phẩm &Aacute;O KHO&Aacute;C NHẸ NAM VẢI D&Ugrave; XẺ T&Uacute;I H&Agrave;NG NHẬP<br />
- Chất liệu: Vải d&ugrave; c&aacute;n d&agrave;y dặn<br />
- M&agrave;u sắc: Xanh đen, Đen, X&aacute;m<br />
- Size: M ( 50 -60 kg ) L (60 -70kg )<br />
- Xuất xứ: Việt Nam</p>

<p>BẠN THAM KHẢO TH&Ecirc;M SP MỚI TẠI ĐAY:</p>

<p><img src="https://vn-live.slatic.net/v2/resize/products/S-100012113-2c3f52bcb307e0d37e9a3088a9f49995.jpg" /></p>
', 13, 80000.0000, 100000.0000, 1, 120, N'Còn', 1, N'images/aokhoac2.jpg', N'Chất liệu: Vải dù cán 2 lớp, lớp bên trong có vải lót giúp thoáng khí mát mẻ
Kiểu dáng: Thời trang, trẻ trung, năng động thích hợp cho mọi lứa tuổi. Chất lượng sản phẩm chuẩn xuất khẩu
Áo có 3 màu : Đen, Xanh Đen, Xám tha hồ lựa chọn
Người bạn đồng hành với mọi người mang đến phong cách " Chất "
')
INSERT [dbo].[tbl_Hang] ([id], [TenHang], [image], [ChatLieu], [Mota], [LuotXem], [giaMoi], [giaCu], [id_Menu], [Soluong], [TinhTrang], [Active], [image_large], [TomTat]) VALUES (25, N'QUẦN JEAN NAM ĐEN TRƠN ', N'images/quan3.jpg', N'jean cotton bền đẹp', N'<p>h&agrave;ng hot h&agrave;ng đẹp b&aacute;n quanh năm&nbsp;<br />
đi h&agrave;ng trong ng&agrave;y ❤️<br />
C&Aacute;CH CHỌN SIZE<br />
Size 28 (Từ 50 - 55kg Cao Dưới 1m70)<br />
Size 29 (Từ 55 - 68kg Cao Dưới 1m70)<br />
Size 30 (Từ 58 - 61kg Cao Dưới 1m70)&nbsp;<br />
Size 31 ( Từ 61- 63kg Cao Dưới 1m75)&nbsp;<br />
Size 32 (Từ 63 - 67kg Cao Dưới 1m75)<br />
Size 33 (Từ 67 - 71kg Cao Dưới 1m75)<br />
Size 34 (Từ 71 - 77kg Cao Dưới 1m75)</p>

<p>&nbsp;</p>
', 5, 120000.0000, 180000.0000, 3, 88, N'Còn', 1, N'images/quan3.jpg', N'hàng hot hàng đẹp bán quanh năm
đi hàng trong ngày ❤️
CÁCH CHỌN SIZE
Size 28 (Từ 50 - 55kg Cao Dưới 1m70)
Size 29 (Từ 55 - 68kg Cao Dưới 1m70)
Size 30 (Từ 58 - 61kg Cao Dưới 1m70)
Size 31 ( Từ 61- 63kg Cao Dưới 1m75)
Size 32 (Từ 63 - 67kg Cao Dưới 1m75)
Size 33 (Từ 67 - 71kg Cao Dưới 1m75)
Size 34 (Từ 71 - 77kg Cao Dưới 1m75)')
INSERT [dbo].[tbl_Hang] ([id], [TenHang], [image], [ChatLieu], [Mota], [LuotXem], [giaMoi], [giaCu], [id_Menu], [Soluong], [TinhTrang], [Active], [image_large], [TomTat]) VALUES (26, N'QUẦN JEAN NAM RÁCH 018 CAO CẤP JET SHOP', N'images/quan2s.jpg', N'jean cotton bền đẹp', N'<p>&nbsp;</p>

<p>- ĐƯỢC KIỂM TRA H&Agrave;NG TRƯỚC KHI THANH TO&Aacute;N - MIỄN PH&Iacute; ĐỔI TRẢ TRONG V&Ograve;NG 7 NG&Agrave;Y (n&ecirc;n kh&aacute;ch y&ecirc;n t&acirc;m ạ) - TẶNG VOUCHER 50K CHO LẦN SAU KH&Aacute;CH MUA H&Agrave;NG TẠI SHOP KHI KH&Aacute;CH ĐANH GI&Aacute; 5 SAO CHO SẢN PHẨM ( li&ecirc;n hệ với shop để nhận voucher) -HỐ TRỢ PH&Iacute; SHIP KHI KH&Aacute;CH ĐẶT H&Agrave;NG TR&Ecirc;N 200K</p>

<p><img src="https://vn-test-11.slatic.net/shop/a991f53be53cb21b5d9c06d095c9e663.jpeg" /></p>

<p>&nbsp;</p>

<p>&nbsp;</p>
', 2, 149000.0000, 180000.0000, 3, 28, N'Còn', 1, N'images/quan2s.jpg', N'Kiểu dáng thời trang, sành điệu.
· Tổng thể màu xanh hài hòa phối rách táo bạo tạo sự năng động, cá tính.
· Có hai túi xéo trước và hai túi sau rất tiện dụng.
· Chất liệu jean cotton bền đẹp, chắc chắn, không phai màu, không co rút khi giặc.')
INSERT [dbo].[tbl_Hang] ([id], [TenHang], [image], [ChatLieu], [Mota], [LuotXem], [giaMoi], [giaCu], [id_Menu], [Soluong], [TinhTrang], [Active], [image_large], [TomTat]) VALUES (27, N'QUẦN JEAN NAM RÁCH 018 CAO CẤP JET SHOP', N'images/quan2s.jpg', N'jean cotton bền đẹp', N'<p>&nbsp;</p>

<p>- ĐƯỢC KIỂM TRA H&Agrave;NG TRƯỚC KHI THANH TO&Aacute;N - MIỄN PH&Iacute; ĐỔI TRẢ TRONG V&Ograve;NG 7 NG&Agrave;Y (n&ecirc;n kh&aacute;ch y&ecirc;n t&acirc;m ạ) - TẶNG VOUCHER 50K CHO LẦN SAU KH&Aacute;CH MUA H&Agrave;NG TẠI SHOP KHI KH&Aacute;CH ĐANH GI&Aacute; 5 SAO CHO SẢN PHẨM ( li&ecirc;n hệ với shop để nhận voucher) -HỐ TRỢ PH&Iacute; SHIP KHI KH&Aacute;CH ĐẶT H&Agrave;NG TR&Ecirc;N 200K</p>

<p><img src="https://vn-test-11.slatic.net/shop/a991f53be53cb21b5d9c06d095c9e663.jpeg" /></p>

<p>&nbsp;</p>

<p>&nbsp;</p>
', 1, 149000.0000, 180000.0000, 3, 28, N'', 1, N'images/quan2s.jpg', N'Kiểu dáng thời trang, sành điệu.
· Tổng thể màu xanh hài hòa phối rách táo bạo tạo sự năng động, cá tính.
· Có hai túi xéo trước và hai túi sau rất tiện dụng.
· Chất liệu jean cotton bền đẹp, chắc chắn, không phai màu, không co rút khi giặc.')
INSERT [dbo].[tbl_Hang] ([id], [TenHang], [image], [ChatLieu], [Mota], [LuotXem], [giaMoi], [giaCu], [id_Menu], [Soluong], [TinhTrang], [Active], [image_large], [TomTat]) VALUES (28, N'Quần tây nam xám kẻ caro cao cấp MẪU HOT 2018', N'images/dai3.jpg', N'vải mềm mại, co giản tốt', N'<p><strong><em>Th&ocirc;ng tin sản phẩm:</em></strong></p>

<p><strong>- Thiết kế form &ocirc;m vừa, ống c&ocirc;n thời trang tuổi teen v&agrave; c&ocirc;ng sở.<br />
- Hai t&uacute;i trước v&agrave; hai t&uacute;i sau vừa tiện dụng.<br />
- Đường may đẹp mắt, cẩn thận tỉ mỉ, tạo sự thanh lịch, lịch l&atilde;m, tr&ocirc;ng bạn như một người th&agrave;nh đạt đầy thu h&uacute;t<br />
- Chất liệu vải mềm mại, co giản tốt tạo n&ecirc;n sự tho&aacute;i m&aacute;i cho người mặc, c&oacute; nhiều size ph&ugrave; hợp theo d&aacute;ng người.</strong>-<strong>Đế tr&aacute;nh nhầm lẫn về size, rộng qu&aacute; hoặc chật qu&aacute;, hoặc mặc l&ecirc;n kh&ocirc;ng vừa, kh&ocirc;ng chuẩn.</strong></p>

<p><strong>-Xin qu&yacute; kh&aacute;ch h&agrave;ng bỏ ra 5 gi&acirc;y để CHAT với SHOP để được tư vấn SIZE chuẩn nh&eacute;</strong></p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p><img alt="33470466_238235920256857_4214730155790172160_n.jpg" src="https://vn-live.slatic.net/original/a4b54dfc9c530ec80d6c2831c14f9283.jpg" /><img alt="33501309_238235780256871_2604923525022089216_n.jpg" src="https://vn-live.slatic.net/original/2a58872d6ce7f0fe9c4f8e6b2aa7dcdb.jpg" /><img alt="33502368_238235843590198_5207841545130082304_n.jpg" src="https://vn-live.slatic.net/original/5e3c4c1c53cbeff1dd9d3ad404b7b319.jpg" /><img alt="33524322_238236080256841_2309721291667537920_n.jpg" src="https://vn-live.slatic.net/original/346b4a329ca3e9d0d5e2e78386da1858.jpg" /><img alt="33621329_238235880256861_6521070268813672448_n.jpg" src="https://vn-live.slatic.net/original/e32d7c8d846eac746b7e130ac5775a35.jpg" /></p>

<ul>
	<li><strong>Hướng dẫn chọn size:</strong></li>
</ul>

<ul>
	<li>Size 28 c&acirc;n nặng 45-50kg, chiều d&agrave;i 92cm, bụng 74cm, ống 15cm</li>
	<li>Size 29 c&acirc;n nặng 50-55kg, d&agrave;i 94, bụng 76, ống 15,5cm</li>
	<li>Size 30 c&acirc;n nặng 55-60kg, d&agrave;i 96cm, bụng 79, ống 16cm.</li>
	<li>Size 31 c&acirc;n nặng 60-65kg, d&agrave;i 98cm, bụng 82cm, ống 16cm.</li>
	<li>Size 32 c&acirc;n nặng 65-70kg, d&agrave;i 100cm, bụng 84cm, ống 16cm.</li>
	<li>Size 33 c&acirc;n nặng 70-75kg, d&agrave;i 102cm, bụng 86cm, ống 19cm.</li>
	<li>Size 34 c&acirc;n nặng 75-80kg, d&agrave;i 104cm, bụng 88cm, ống 19cm.</li>
	<li><strong>Ductayshop CAM KẾT:</strong><br />
	<strong>- Cho c&aacute;c bạn xem, kiểm tra h&agrave;ng trước khi đồng &yacute; nhận v&agrave; thanh to&aacute;n</strong><br />
	<strong>- Cho c&aacute;c bạn đổi hoặc trả h&agrave;ng v&agrave; ho&agrave;n tiền 100%</strong><br />
	<strong>- Cho c&aacute;c bạn trả tiền mặt trực tiếp sau khi xem v&agrave; nhận h&agrave;ng</strong></li>
</ul>

<p><strong>Ductayshop CAM KẾT 100% BẠN H&Agrave;I L&Ograve;NG</strong><br />
<strong>---------------------------------</strong><br />
<strong>C&Ograve;N CHẦN CHỪ G&Igrave; NỮA C&Aacute;C BẠN H&Atilde;Y NHANH TAY TẬU NGAY SẢN PHẨM SI&Ecirc;U HOT N&Agrave;Y NH&Eacute; !</strong><br />
<strong>----------------------------------</strong><br />
<strong>GIAO H&Agrave;NG TO&Agrave;N QUỐC V&Agrave; THANH TO&Aacute;N NGAY TẠI NH&Agrave; !</strong></p>
', 2, 119000.0000, 220000.0000, 4, 100, N'Còn', 1, N'images/dai3.jpg', N'Quần tây nam xám kẻ caro cao cấp MẪU HOT 2018')
INSERT [dbo].[tbl_Hang] ([id], [TenHang], [image], [ChatLieu], [Mota], [LuotXem], [giaMoi], [giaCu], [id_Menu], [Soluong], [TinhTrang], [Active], [image_large], [TomTat]) VALUES (29, N'QUẦN SHORT THỂ THAO STYKE SPORT ', N'images/s5.jpg', N'vãi cao cấp', N'<ul>
	<li>GIỚI THIỆU BỘ THỂ THAO NAM 2017+Chất liệu l&agrave; vải gai mịn cao cấp tương đương với h&agrave;ng F1 +CHẤT LIỆU VẢI: quần được may bằng thun lạnh 100%+T&Uacute;I: hai t&uacute;i đều c&oacute; kh&oacute;a thiết kế đẹp mắt chống mất đồ+QUẦN: c&oacute; d&acirc;y r&uacute;t theo phom từng người+Thấm mồ h&ocirc;i v&agrave; tho&aacute;t nhiệt cực tốt gi&uacute;p người chơi c&oacute; được phong độ tốt nhất khi thi đấu +Tạo cảm gi&aacute;c thoải m&aacute;i cho người sử dụng Bảng size cho mọi người lựa chọn: ONE SIZE DƯỚI &lt;78KG</li>
</ul>

<p>GIỚI THIỆU BỘ THỂ THAO NAM&nbsp;2017</p>

<p>+Chất liệu l&agrave; vải gai mịn cao cấp tương đương với h&agrave;ng F1&nbsp;</p>

<p>+CHẤT LIỆU VẢI: quần được may bằng thun lạnh 100%</p>

<p>+T&Uacute;I: hai t&uacute;i đều c&oacute; kh&oacute;a thiết kế đẹp mắt chống mất đồ</p>

<p>+QUẦN:&nbsp;c&oacute; d&acirc;y r&uacute;t theo phom từng người</p>

<p>+Thấm mồ h&ocirc;i v&agrave; tho&aacute;t nhiệt cực tốt gi&uacute;p người chơi c&oacute; được phong độ tốt nhất khi thi đấu&nbsp;</p>

<p>+Tạo cảm gi&aacute;c thoải m&aacute;i cho người sử dụng&nbsp;</p>

<p>Bảng size cho mọi người lựa chọn: ONE SIZE DƯỚI &lt;78KG</p>

<p><img alt="" src="https://vn-live.slatic.net/v2/resize/products/S-100012113-09b7e40b2fc0c93dee3796fc762bc986.jpg" /><img alt="" src="https://vn-live.slatic.net/v2/resize/products/S-100012113-166bd67704ae18db28e6d7af6e5e770f.jpg" /><img alt="" src="https://vn-live.slatic.net/v2/resize/products/S-100012113-9f37fc4341f7510f103735693c852ece.jpg" />​​​​​​​</p>
', 6, 159000.0000, 23000.0000, 5, 200, N'Còn', 1, N'images/s5.jpg', N'QUẦN SHORT THỂ THAO STYKE SPORT ')
INSERT [dbo].[tbl_Hang] ([id], [TenHang], [image], [ChatLieu], [Mota], [LuotXem], [giaMoi], [giaCu], [id_Menu], [Soluong], [TinhTrang], [Active], [image_large], [TomTat]) VALUES (31, N'Áo thun nam cá sấu Havis ', N'images/tk1.jpg', N' Thun cá sấu co giãn 4 chiều, thấm hút tốt', N'<h2><em><strong>&Aacute;o thun nam c&aacute; sấu Havis thiết kế cổ bẻ phong c&aacute;ch ( nhiều m&agrave;u )</strong></em></h2>

<h1><strong>◤H&atilde;y truy cập ngay v&agrave;o gian h&agrave;ng Thời Trang Havis của ch&uacute;ng t&ocirc;i để xem ngay hơn 100 mẫu thời trang nam c&aacute;c loại.</strong></h1>

<p><em><strong>- &Aacute;o thun nam c&aacute; sấu Havis thiết kế cổ bẻ phong c&aacute;ch</strong></em>&nbsp;dường như đ&atilde; qu&aacute; quen thuộc đối với ph&aacute;i mạnh. Nổi tiếng với chất vải bền, đẹp, đ&aacute;ng tiền.</p>

<p>- Chất liệu thun c&aacute; sấu co gi&atilde;n thoải m&aacute;i khi mặc v&agrave; hoạt động cả ng&agrave;y d&agrave;i.</p>

<p>- &Aacute;o của xưởng ch&uacute;ng t&ocirc;i l&agrave;m ra lu&ocirc;n được đảm bảo về c&aacute;c ti&ecirc;u chuẩn chất lượng, qua c&aacute;c c&ocirc;ng đoạn kiểm tra nghi&ecirc;m ngặt để ra sản phẩm n&ecirc;n c&aacute;c bạn kh&ocirc;ng sẽ kh&ocirc;ng thể kh&ocirc;ng h&agrave;i l&ograve;ng.</p>

<p>- Với chất liệu thun cao cấp cho bạn một chiếc &aacute;o c&oacute; xớ vải mịn v&agrave; &iacute;t nhăn.</p>

<p>- &Aacute;o thun nam của xưởng giặt sẽ kh&ocirc;ng ra m&agrave;u v&agrave; đảm bảo chất lượng</p>

<p>- &Aacute;o c&oacute; tổng cộng năm m&agrave;u tha hồ cho c&aacute;c bạn lựa chọn. Lấy ngay năm c&aacute;i để mặc cả tuần m&agrave; kh&ocirc;ng cần phải đắn đo suy nghĩ rằng ng&agrave;y mai mặc g&igrave;</p>

<p><strong>- Lấy ngay 2&nbsp;</strong><em><strong>&Aacute;o thun nam c&aacute; sấu Havis thiết kế cổ bẻ phong c&aacute;ch</strong></em><strong>&nbsp;trở l&ecirc;n cho c&aacute;c bạn thoải m&aacute;i mặc đi l&agrave;m, đi học hay đi chơi.&nbsp;</strong></p>

<p><strong><img alt="size-ao-hd-2.jpg" src="https://vn-live.slatic.net/original/b853da46da6953adf4ecac002f5d50c7.jpg" /></strong></p>

<p><strong>◤&nbsp;TH&Ocirc;NG TIN CHI TIẾT VỀ &Aacute;O THUN NAM C&Aacute; SẤU</strong></p>

<p>- Chất liệu: Thun c&aacute; sấu<br />
- M&agrave;u sắc: Đỏ, X&aacute;m, Xanh Đen, Xanh Nhạt, Trắng<br />
- Size: Size: M: 50 - 55kg, L:56 - 65kg , XL: 66 - 75kg, XXL 75-85kg<br />
- Xuất xứ: Việt Nam</p>

<p><strong>◤&nbsp;Cam kết của Shop</strong></p>

<p>- 100% H&igrave;nh ảnh l&agrave; chụp thật<br />
- Giao h&agrave;ng đ&uacute;ng mẫu m&atilde;, size m&agrave;u kh&aacute;ch đặt.</p>

<p><strong>◤&nbsp;C&Aacute;CH BẢO QUẢN &Aacute;O</strong></p>

<p><strong><img alt="102325456-9abcff0d5172154b1e3f9cbb8161b578.jpg" src="https://vn-live.slatic.net/original/d025127f096077fec8c3c44c67801961.jpg" /></strong></p>

<p><strong>◤ Một số h&igrave;nh ảnh th&ecirc;m về &aacute;o</strong></p>

<p><strong><img src="https://vn-test-11.slatic.net/shop/5db57d94d3cb10cdfe0adb4bd025c058.jpeg" style="height:400px; width:400px" /><img src="https://vn-test-11.slatic.net/shop/c2fae5899a82f5900872ca5b927e3665.jpeg" style="height:400px; width:400px" /></strong></p>

<p><strong><img src="https://vn-test-11.slatic.net/shop/49c4836e61db09ba65e6a67fb3650712.jpeg" style="height:400px; width:400px" /><img src="https://vn-test-11.slatic.net/shop/55a8605509687e168f509355469d5846.jpeg" style="height:400px; width:400px" /></strong></p>

<p><strong><img src="https://vn-test-11.slatic.net/shop/70386e5ce364349a9c29423ef6feceba.jpeg" style="height:400px; width:400px" /></strong></p>

<p><strong><img src="https://vn-test-11.slatic.net/shop/6d774ae6dfd40f1aa71f58ab614fdfe2.jpeg" style="height:400px; width:300px" /><img src="https://vn-test-11.slatic.net/shop/eb4eaf2db8dae2e1576f3363a5084123.jpeg" style="height:400px; width:300px" /><img src="https://vn-test-11.slatic.net/shop/3131a669b7350b0b80bf3c7d13806471.jpeg" style="height:400px; width:300px" /></strong></p>
', NULL, 108000.0000, 180000.0000, 6, 100, NULL, 1, N'images/tk1.jpg', N'Mô tả sản phẩm Áo thun nam cá sấu Havis thiết kế cổ bẻ phong cách ( nhiều màu ) - Thời Trang Havis - ASTD020')
INSERT [dbo].[tbl_Hang] ([id], [TenHang], [image], [ChatLieu], [Mota], [LuotXem], [giaMoi], [giaCu], [id_Menu], [Soluong], [TinhTrang], [Active], [image_large], [TomTat]) VALUES (33, N'ÁO THUN NAM THỜI TRANG CAO CẤP LULY FASHION MS53', N'images/tk4.jpg', N'vãi cao cấp', N'<p>TH&Ocirc;NG TIN SẢN PHẨM<br />
Size: M,L,XL<br />
Chất liệu: Cotton co gi&atilde;n 4 chiều<br />
Style: Korea<br />
-</p>

<p>&Aacute;o ph&ocirc;ng kh&ocirc;ng qu&aacute; nghi&ecirc;m t&uacute;c như &aacute;o sơ mi, nhưng vẫn lịch sự tạo n&ecirc;n một sức h&uacute;t vừa gần gũi, vừa nam t&iacute;nh cho c&aacute;c ch&agrave;ng. Những anh ch&agrave;ng năng động v&agrave; hiện đại thường lựa chọn chiếc &aacute;o n&agrave;y trong những buổi gặp gỡ, hẹn h&ograve; v&igrave; n&oacute; kh&aacute; tiện lợi v&agrave; thoải m&aacute;i.<br />
Đặc điểm sản phẩm:<br />
- &Aacute;O PH&Ocirc;NG được thiết kế phối với nhiều m&agrave;u tạo n&ecirc;n sự trẻ trung, năng động cập nhật xu hướng thời trang mới cho c&aacute;c bạn trẻ.<br />
- Tay ngắn, phối m&agrave;u sắc &aacute;o th&ecirc;m điểm nhấn trẻ trung ph&ugrave; hợp để kết hợp với quần jean, kaki d&agrave;i để đi học hay quần short, quần lửng để đi chơi, dạo phố c&ugrave;ng gia đ&igrave;nh v&agrave; bạn b&egrave;. Kết hợp th&ecirc;m một chiếc &aacute;o kho&aacute;c nỉ l&agrave; bạn c&oacute; thể l&ecirc;n đường cho một chuyến du lịch rồi đấy.<br />
- Chất liệu:Cotton co d&atilde;n 4 chiều mềm mịn thoải m&aacute;i nhưng cũng rất bền bỉ đảm bảo cho sự vận động mạnh mẽ của c&aacute;c bạn trai. Đường may cẩn thận, tỉ mỉ n&ecirc;n bạn ho&agrave;n to&agrave;n an t&acirc;m trong từng hoạt động.<br />
- &Aacute;O PH&Ocirc;NG HONGHANHSHOP94 n&agrave;y sẽ gi&uacute;p bạn lu&ocirc;n tự tin v&agrave; thoải m&aacute;i khi hoạt động trong m&ugrave;a h&egrave; n&agrave;y.<br />
KHUY&Ecirc;N D&Ugrave;NG : kh&ocirc;ng n&ecirc;n ch&agrave; x&aacute;t mạnh bằng b&agrave;n chải. Tr&aacute;nh phới dưới nắng trực tiếp. Khuyến &aacute;o n&ecirc;n giặt bằng tay, kh&ocirc;ng ng&acirc;m sản phẩm qu&aacute; l&acirc;u với nước v&agrave; tr&aacute;nh giặt chung với quần &aacute;o trắng. Trong qu&aacute; tr&igrave;nh vận chuyển kh&oacute; tr&aacute;nh khỏi sản phẩm c&oacute; thể bị nh&agrave;u hoặc nhiều nếp gắp, khuyến c&aacute;o kh&aacute;ch trước khi sử dụng! H&agrave;ng n&ecirc;n giặt ủi!<img alt="0ab7ecf7e1fe0fa056ef.jpg" src="https://vn-live.slatic.net/original/d10ef82d623fc692ef5d634add44b494.jpg" /></p>

<p>LULYFASHION</p>

<p>Đổi v&agrave; trả h&agrave;ng trong 7 ng&agrave;y nếu h&agrave;ng bị lỗi hoặc mặc kh&ocirc;ng vừa size. Ch&uacute;ng t&ocirc;i xin cam kết lấy chất lượng sản phẩm đặt l&ecirc;n h&agrave;ng đầu v&agrave; hoạt động theo phương ch&acirc;m: Uy t&iacute;n &ndash; Nhiệt t&igrave;nh &ndash; Chuy&ecirc;n nghiệp &bull; Đặc biệt: QK nhận h&agrave;ng, đ&aacute;nh gi&aacute; sản phẩm 5*v&agrave; nhận x&eacute;t ch&acirc;n thực về sản phẩm để được nhận voucher cho lần mua h&agrave;ng tiếp theo nh&eacute; LI&Ecirc;N HỆ SHOP ĐỂ ĐƯỢC NHẬN VOUCHER : 30K CHO LẦN MUA TIẾP THEO</p>

<p><img src="https://vn-test-11.slatic.net/shop/a6f2d8e8036d1836d2fc6ee80976ef65.jpeg" /></p>

<p>-Size M: Nặng 55Kg trở xuống, cao khoảng 1,63m - 1,67m -Size L: Nặng 55kg đến 62kg, cao khoảng 1,66m - 1,72m -Size XL: Nặng 62kg đến 72kg *Ch&uacute; &yacute;: nếu b&eacute;o bụng tăng l&ecirc;n 1 size Xuất xứ: VIỆT NAM</p>
', 1, 720000.0000, 140000.0000, 6, 123, N'Còn', 1, N'images/tk4.jpg', N'ÁO THUN NAM THỜI TRANG CAO CẤP LULY FASHION MS53')
INSERT [dbo].[tbl_Hang] ([id], [TenHang], [image], [ChatLieu], [Mota], [LuotXem], [giaMoi], [giaCu], [id_Menu], [Soluong], [TinhTrang], [Active], [image_large], [TomTat]) VALUES (34, N'Áo Thun Có Cổ Sọc Vằn Độc Đáo', N'images/tk3.jpg', N'vãi cao cấp', N'<p><strong><em>&Aacute;o Thun C&oacute; Cổ Sọc Vằn Độc Đ&aacute;o</em></strong></p>

<p>L&agrave; một trong những kiểu d&aacute;ng &aacute;o thun nam dễ mặc, thoải m&aacute;i, lại được thiết kế đơn giản, kh&ocirc;ng cầu kỳ, với điểm nhấn l&agrave; c&aacute;c sọc m&agrave;u bắt mắt. V&igrave; vậy, đừng chần chừ đến với ngay vớiChất Shop để chọn cho m&igrave;nh 1 chiếc nh&eacute;.<br />
<br />
<img src="https://vn-live-02.slatic.net/original/3d1bec3e8eef6691e913df4ac1ee4e32.jpg" /><br />
<br />
<strong>Điểm nổi bật</strong>:<br />
- Sản phẩm được thiết kế với c&aacute;c m&agrave;u sắc kẻ sọc bắt mắt , phối m&agrave;u h&agrave;i h&ograve;a tạo sự trẻ trung năng động, ph&ugrave; hợp với c&aacute;c ch&agrave;ng trai trẻ.</p>

<p>- Với chất liệu vải l&agrave; cotton 100%, thấm h&uacute;t mồ h&ocirc;i tốt v&agrave; co d&atilde;n thoải m&aacute;i. Sản phẩm l&agrave; sự lựa chọn ho&agrave;n hảo cho những ch&agrave;ng trai năng động.<img src="https://vn-live-02.slatic.net/original/3d1bec3e8eef6691e913df4ac1ee4e32.jpg" /><br />
<br />
<img src="https://vn-live-02.slatic.net/original/66a8655db0c4b9e95408b94e4a68fbc6.jpg" /><br />
<br />
<img src="https://vn-live-02.slatic.net/original/a87ff1062de9016f7252c4872833d123.jpg" /><br />
<br />
<img src="https://vn-live-02.slatic.net/original/b64ea85ec8f41a5af72d0a950a5c761f.jpg" /><br />
<br />
<img src="https://vn-live-02.slatic.net/original/32c404f51996c06eb0af382b33aaff95.jpg" /><br />
<br />
<img src="https://vn-live-02.slatic.net/original/ce28d998e82da541c7c2b5c3ddc5b4f6.jpg" /><br />
<br />
<img src="https://vn-live-02.slatic.net/original/2e7350fed79957f3656e385bee2f2079.jpg" /></p>

<p><strong>Th&ocirc;ng tin sản phẩm:</strong><br />
<br />
- M&agrave;u sắc: Sọc Đỏ, X&aacute;m, Đen.<br />
<br />
- Chất liệu: Vải cotton 100% chuẩn xuất, mềm mịn, thấm h&uacute;t mồ h&ocirc;i tốt.<br />
<br />
-Form &aacute;o: M , L , XL, form &ocirc;m cho người từ 50 - 70kg</p>

<p><br />
<br />
<img src="https://vn-live-02.slatic.net/original/23f2b4084e46c76962f4df346a9f0398.jpg" /><br />
<br />
<br />
<img src="https://vn-live-02.slatic.net/original/08b439e8653fb36e64e10cbe49156045.jpg" /><br />
<br />
<br />
<img src="https://vn-live-02.slatic.net/original/e0dc012eca50e0a52ebf7f942aeaa20f.jpg" /><br />
<br />
<strong>Lưu &yacute;:</strong>Qu&yacute; kh&aacute;ch vui l&ograve;ng tham khảo bảng k&iacute;ch thước ở b&ecirc;n dưới hoặc li&ecirc;n hệ theo<em><strong>số hotline</strong></em>với<em><strong>Chất Shop</strong></em>để được tư vấn chọn size ph&ugrave; hợp.</p>

<p><img src="https://vn-live-02.slatic.net/original/bd57b55597bcd1534e58b27ecb9d01b2.jpg" /></p>
', NULL, 119000.0000, 178000.0000, 6, 123, N'Còn', 1, N'images/tk3.jpg', N'Áo Thun Có Cổ Sọc Vằn Độc Đáo')
INSERT [dbo].[tbl_Hang] ([id], [TenHang], [image], [ChatLieu], [Mota], [LuotXem], [giaMoi], [giaCu], [id_Menu], [Soluong], [TinhTrang], [Active], [image_large], [TomTat]) VALUES (35, N'Quần jean nam cao cấp co giãn tốt ', N'images/jean5.jpg', N'jean cotton bền đẹp', N'<p>h&agrave;ng hot h&agrave;ng đẹp b&aacute;n quanh năm&nbsp;<br />
đi h&agrave;ng trong ng&agrave;y ❤️<br />
C&Aacute;CH CHỌN SIZE<br />
Size 28 (Từ 50 - 55kg Cao Dưới 1m70)<br />
Size 29 (Từ 55 - 68kg Cao Dưới 1m70)<br />
Size 30 (Từ 58 - 61kg Cao Dưới 1m70)<br />
Size 31 ( Từ 61- 63kg Cao Dưới 1m75)<br />
Size 32 (Từ 63 - 67kg Cao Dưới 1m75)<br />
Size 33 (Từ 67 - 71kg Cao Dưới 1m75)<br />
Size 34 (Từ 71 - 77kg Cao Dưới 1m75)</p>
', NULL, 130000.0000, 150000.0000, 3, 100, N'Còn', 1, N'images/jean5.jpg', N'Quần jean nam cao cấp co giãn tốt ')
INSERT [dbo].[tbl_Hang] ([id], [TenHang], [image], [ChatLieu], [Mota], [LuotXem], [giaMoi], [giaCu], [id_Menu], [Soluong], [TinhTrang], [Active], [image_large], [TomTat]) VALUES (36, N'Quần Jean Nam cao cấp Phong Cách vải jean dày co giản chuẩn shop 2018', N'images/jear6.jpg', N'jean cotton bền đẹp', N'<h2>M&ocirc; tả sản phẩm Quần Jean Nam Phong C&aacute;ch NG157</h2>

<ul>
	<li>Chất liệu cao cấp</li>
	<li>Đường may tinh tế</li>
	<li>Thiết kế nổi bật</li>
	<li>Phong c&aacute;ch sang trọng</li>
</ul>

<p>QUẦN JEAN NAM - QUẦN JEAN THỜI TRANG<br />
- Quần jeans được may từ chất liệu vải Jean cao cấp mềm mại, bền m&agrave;u kết hợp những đường may đẹp, chắc chắn mang đến sự thoải m&aacute;i, an t&acirc;m khi mặc cũng như độ bền cho trang phục. Kh&ocirc;ng chỉ thế, với thiết kế trơn tinh tế, dễ kết hợp c&ugrave;ng nhiều trang phục kh&aacute;c, chiếc quần khiến cho những t&iacute;n đồ Jean kh&ocirc;ng thể l&agrave;m ngơ<br />
-Chất liệu: Jean<br />
-SIZE: ,28,29,30,31,32</p>
', NULL, 189000.0000, 220000.0000, 3, 122, N'Còn', 1, N'images/jear6.jpg', N'Quần Jean Nam cao cấp Phong Cách vải jean dày co giản chuẩn shop 2018')
INSERT [dbo].[tbl_Hang] ([id], [TenHang], [image], [ChatLieu], [Mota], [LuotXem], [giaMoi], [giaCu], [id_Menu], [Soluong], [TinhTrang], [Active], [image_large], [TomTat]) VALUES (37, N'Quần Jogger Nỉ Thể Thao Nam Ống Bo Năng Động ', N'images/dai1.jpg', N'Vải thun nỉ mềm mại, dày dặn', N'<ul>
	<li>Sản phẩm: Quần Jogger Nỉ Thể Thao Nam Ống Bo Năng Động</li>
	<li>Chất liệu: Vải thun nỉ mềm mại, d&agrave;y dặn</li>
	<li>Phong c&aacute;ch: Quần jogger ống bo thiết kế thời trang, hiện đại, năng động</li>
	<li>Dễ phối đồ, ph&ugrave; hợp khi đi chơi, tập thể thao, dạo phố c&ugrave;ng bạn b&egrave;&hellip;</li>
	<li>K&iacute;ch cỡ: Size S, M, L d&agrave;nh cho người dưới 65kg</li>
	<li>Size S:Chiều d&agrave;i 90cm, V&ograve;ng m&ocirc;ng: 53cm, V&ograve;ng Đ&ugrave;i: 46cm</li>
	<li>Size M:Chiều d&agrave;i 93cm, V&ograve;ng m&ocirc;ng: 55cm, V&ograve;ng Đ&ugrave;i: 48cm</li>
	<li>Size L: Chiều d&agrave;i 95cm, V&ograve;ng m&ocirc;ng: 57cm, V&ograve;ng Đ&ugrave;i: 50cm</li>
</ul>
', NULL, 49000.0000, 90000.0000, 4, 1111, N'Còn', 1, N'images/dai1.jpg', N'Quần Jogger Nỉ Thể Thao Nam Ống Bo Năng Động ')
INSERT [dbo].[tbl_Hang] ([id], [TenHang], [image], [ChatLieu], [Mota], [LuotXem], [giaMoi], [giaCu], [id_Menu], [Soluong], [TinhTrang], [Active], [image_large], [TomTat]) VALUES (38, N'Quần tây( âu ) nam màu đen kiểu dáng Hàn Quốc', N'images/dai2.jpg', N'vãi cao cấp', N'<p><strong><em>Th&ocirc;ng tin sản phẩm:</em></strong></p>

<p><strong>- Thiết kế form &ocirc;m vừa, ống c&ocirc;n thời trang tuổi teen v&agrave; c&ocirc;ng sở.<br />
- Hai t&uacute;i trước v&agrave; hai t&uacute;i sau vừa tiện dụng.<br />
- Đường may đẹp mắt, cẩn thận tỉ mỉ, tạo sự thanh lịch, lịch l&atilde;m, tr&ocirc;ng bạn như một người th&agrave;nh đạt đầy thu h&uacute;t<br />
- Chất liệu vải mềm mại, co giản tốt tạo n&ecirc;n sự tho&aacute;i m&aacute;i cho người mặc, c&oacute; nhiều size ph&ugrave; hợp theo d&aacute;ng người.</strong>-<strong>Đế tr&aacute;nh nhầm lẫn về size, rộng qu&aacute; hoặc chật qu&aacute;, hoặc mặc l&ecirc;n kh&ocirc;ng vừa, kh&ocirc;ng chuẩn.</strong></p>

<p><strong>-Xin qu&yacute; kh&aacute;ch h&agrave;ng bỏ ra 5 gi&acirc;y để CHAT với SHOP để được tư vấn SIZE chuẩn nh&eacute;</strong></p>

<p>&nbsp;</p>

<p><img alt="34532903_243573673056415_4160699943947862016_n (1).jpg" src="https://vn-live-02.slatic.net/original/ff495a9d29e4757458d69b3665eacfe6.jpg" /><img alt="34583777_243573653056417_593994698591305728_n (1).jpg" src="https://vn-live-02.slatic.net/original/8052dd8ae7658570c0cbc7e56a7b054e.jpg" /><img alt="34596863_243573693056413_3686178148765925376_n (1).jpg" src="https://vn-live-02.slatic.net/original/bf74b17e16d9d7319e9224636f8c4ccd.jpg" /><img alt="34781090_243573699723079_5545664199251722240_n.jpg" src="https://vn-live-02.slatic.net/original/b1bb83bfa2356851a2b60ea270af8ccc.jpg" /><img alt="34535838_243573723056410_7569817092547936256_n.jpg" src="https://vn-live-02.slatic.net/original/f312542aace2f43e6e6e5b6816e9b54f.jpg" /></p>

<p>&nbsp;</p>

<ul>
	<li><strong>Hướng dẫn chọn size:</strong></li>
</ul>

<ul>
	<li>Size 28 c&acirc;n nặng 45-50kg, chiều d&agrave;i 92cm, bụng 74cm, ống 15cm</li>
	<li>Size 29 c&acirc;n nặng 50-55kg, d&agrave;i 94, bụng 76, ống 15,5cm</li>
	<li>Size 30 c&acirc;n nặng 55-60kg, d&agrave;i 96cm, bụng 79, ống 16cm.</li>
	<li>Size 31 c&acirc;n nặng 60-65kg, d&agrave;i 98cm, bụng 82cm, ống 16cm.</li>
	<li>Size 32 c&acirc;n nặng 65-70kg, d&agrave;i 100cm, bụng 84cm, ống 16cm.</li>
	<li>Size 33 c&acirc;n nặng 70-75kg, d&agrave;i 102cm, bụng 86cm, ống 19cm.</li>
	<li>Size 34 c&acirc;n nặng 75-80kg, d&agrave;i 104cm, bụng 88cm, ống 19cm.</li>
	<li><strong>Ductayshop CAM KẾT:</strong><br />
	<strong>- Cho c&aacute;c bạn xem, kiểm tra h&agrave;ng trước khi đồng &yacute; nhận v&agrave; thanh to&aacute;n</strong><br />
	<strong>- Cho c&aacute;c bạn đổi hoặc trả h&agrave;ng v&agrave; ho&agrave;n tiền 100%</strong><br />
	<strong>- Cho c&aacute;c bạn trả tiền mặt trực tiếp sau khi xem v&agrave; nhận h&agrave;ng</strong></li>
</ul>

<p><strong>Ductayshop CAM KẾT 100% BẠN H&Agrave;I L&Ograve;NG</strong><br />
<strong>---------------------------------</strong><br />
<strong>C&Ograve;N CHẦN CHỪ G&Igrave; NỮA C&Aacute;C BẠN H&Atilde;Y NHANH TAY TẬU NGAY SẢN PHẨM SI&Ecirc;U HOT N&Agrave;Y NH&Eacute; !</strong><br />
<strong>----------------------------------</strong><br />
<strong>GIAO H&Agrave;NG TO&Agrave;N QUỐC V&Agrave; THANH TO&Aacute;N NGAY TẠI NH&Agrave; !</strong></p>
', NULL, 99000.0000, 180000.0000, 4, 100, N'Còn', 1, N'images/dai2.jpg', N'Quần tây( âu ) nam màu đen kiểu dáng Hàn Quốc')
INSERT [dbo].[tbl_Hang] ([id], [TenHang], [image], [ChatLieu], [Mota], [LuotXem], [giaMoi], [giaCu], [id_Menu], [Soluong], [TinhTrang], [Active], [image_large], [TomTat]) VALUES (39, N'Set Thể Thao Nam Tự Thiết Kế vải cực mát', N'images/s1.jpg', N'Vãi', N'<h2>Ch&iacute;nh s&aacute;ch b&aacute;n h&agrave;ng:</h2>

<ul>
	<li>H&igrave;nh thật, sản phẩm v&agrave; m&agrave;u sắc giống h&igrave;nh 100%.</li>
	<li>Chất liệu v&agrave; kiểu d&aacute;ng đ&uacute;ng như m&ocirc; tả.</li>
	<li>Giao h&agrave;ng to&agrave;n quốc. Xem h&agrave;ng trước - thu tiền sau.</li>
	<li>Ho&agrave;n 100% tiền h&agrave;ng nếu kh&ocirc;ng h&agrave;i l&ograve;ng về sản phẩm.</li>
</ul>

<p>M&ugrave;a h&egrave; n&oacute;ng nực m&agrave; phải mặc quần &aacute;o d&agrave;y quả thật l&agrave; cực h&igrave;nh. Bộ thể thao nam chất lưới m&egrave; short ngắn m&ugrave;a h&egrave; l&agrave; lựa chọn ho&agrave;n hảo cho h&egrave; n&agrave;y. C&oacute; thể mặc khi chơi thể thao, mặc ở nh&agrave; hay dạo phố đều được.</p>

<p>Kiểu d&aacute;ng trẻ trung hợp thời trang họa tiết bắt mắt ph&ugrave; hợp cho mặc dạo phố, chơi thể thao,du lịch,&hellip;. với những mẫu mới được cập nhật cho m&ugrave;a h&egrave; 2018.</p>

<p>Sản phẩm chất lượng cao, vải mềm, m&aacute;t, đường may k&iacute;n. Co gi&atilde;n v&agrave; thấm h&uacute;t mồ h&ocirc;i tốt, kh&ocirc;ng x&ugrave; l&ocirc;ng, chảy xệ. Chất vải tốt gi&uacute;p trang phục c&oacute; phom d&aacute;ng body &ocirc;m s&aacute;t nhưng bạn vẫn c&oacute; cảm gi&aacute;c v&ocirc; c&ugrave;ng thoải m&aacute;i.</p>

<p>&nbsp;</p>

<h2>Th&ocirc;ng tin sản phẩm</h2>

<ul>
	<li>Bộ đồ thể thao nam m&ugrave;a h&egrave; mẫu đẹp</li>
	<li>Thấm h&uacute;t mồ h&ocirc;i cực tốt.</li>
	<li>Kiểu d&aacute;ng mẫu m&atilde; độc đ&aacute;o, trẻ trung hợp thời trang.</li>
	<li>Co gi&atilde;n v&agrave; thấm h&uacute;t mồ h&ocirc;i tốt, kh&ocirc;ng x&ugrave; l&ocirc;ng, chảy xệ.</li>
	<li>C&oacute; c&aacute;c size M, L, XL cho người từ 40kg đến 75kg.</li>
</ul>

<p>Bấm v&agrave;o t&ecirc;n shop để xem 1000+ sản phẩm thời trang hấp dẫn kh&aacute;c.</p>
', 1, 79000.0000, 150000.0000, 5, 199, N'Còn', 1, N'images/s1.jpg', N'Set Thể Thao Nam Tự Thiết Kế vải cực mát')
INSERT [dbo].[tbl_Hang] ([id], [TenHang], [image], [ChatLieu], [Mota], [LuotXem], [giaMoi], [giaCu], [id_Menu], [Soluong], [TinhTrang], [Active], [image_large], [TomTat]) VALUES (40, N'Quần short kaki nam Hàn Quốc SIÊU THỊ SỈ', N'images/s3.jpg', N'vãi cao cấp', N'<p><strong>Quần sort kaki nam phong c&aacute;ch H&agrave;n Quốc</strong>&nbsp;mẫu mới&nbsp;năm nay, mẫu m&atilde; đẹp, chất lượng</p>

<p>Những chiếc quần short nam m&ugrave;a n&agrave;y&nbsp;ng&agrave;y c&agrave;ng đa dạng về kiểu d&aacute;ng v&agrave; m&agrave;u sắc, cho ph&aacute;i mạnh nhiều sự lựa chọn c&aacute; t&iacute;nh v&agrave; hợp gu. V&agrave; những anh ch&agrave;ng ưa th&iacute;ch thể thao c&agrave;ng kh&ocirc;ng thể bỏ qua những chiếc quần short&nbsp;trơn trẻ trung, năng động v&agrave; m&agrave;u sắc dưới đ&acirc;y. Sẽ l&agrave; những trải nghiệm thể thao đầy th&uacute; vị đấy nh&eacute;!<br />
Kh&ocirc;ng phải ngẫu nhi&ecirc;n những chiếc quần short&nbsp;mềm mại đang dần thay thế những item thời trang kh&aacute;c trong m&ugrave;a h&egrave; oi bức. Với chất liệu kaki trơn&nbsp;v&agrave; hai t&uacute;i sau tiện dụng để bỏ t&uacute;i những vật dụng cần thiết&nbsp;tạo d&aacute;ng vẻ thể thao cực năng động. Đường may chắc chắn, tỉ mẩn kết hợp c&ugrave;ng kiểu d&aacute;ng, m&agrave;u sắc thời trang sẽ tạo n&ecirc;n phong th&aacute;i tự tin, ph&oacute;ng kho&aacute;ng cho người mặc.<br />
Thật tuyệt khi vận bộ đồ quần short c&aacute; t&iacute;nh n&agrave;y để thả bước dạo biển c&ugrave;ng n&agrave;ng phải kh&ocirc;ng n&agrave;o? H&atilde;y c&ugrave;ng kết hợp với &aacute;o thun m&agrave;u sắc v&agrave; mắt k&iacute;nh thời trang để khiến n&agrave;ng &ldquo;đổ rầm&rdquo; lu&ocirc;n nh&eacute;! ^^</p>

<p>H&agrave;ng xưởng cam kết gi&aacute; rẻ. Ở đ&acirc;u rẻ hơn ho&agrave;n lại tiền.</p>

<p><strong>Bảng size tham khảo:</strong></p>

<p>- Size 28 &lt; 50kg</p>

<p>- 51kg &lt; Sixe 29 &lt; 53kg</p>

<p>- 54kg &lt; size 30 &lt; 57kg</p>

<p>- 58kg &lt; size 31 &lt; 61kg</p>

<p>- 62kg &lt; size 32 &lt; 65kg</p>

<p>- 66kg &lt; size 34 &lt; 73kg</p>
', NULL, 59000.0000, 110000.0000, 5, 100, N'Còn', 1, N'images/s3.jpg', N'Quần short kaki nam Hàn Quốc SIÊU THỊ SỈ')
SET IDENTITY_INSERT [dbo].[tbl_Hang] OFF
SET IDENTITY_INSERT [dbo].[tbl_KhachHang] ON 

SET IDENTITY_INSERT [dbo].[tbl_KhachHang] OFF
SET IDENTITY_INSERT [dbo].[tbl_KhuyenMai] ON 

INSERT [dbo].[tbl_KhuyenMai] ([id], [GiaTri]) VALUES (1, 10)
SET IDENTITY_INSERT [dbo].[tbl_KhuyenMai] OFF
SET IDENTITY_INSERT [dbo].[tbl_LienLac] ON 

INSERT [dbo].[tbl_LienLac] ([Ten], [DiaChi], [DienThoai], [Email], [ChuDe], [NoiDung], [id]) VALUES (N'1', N'1', N'1         ', N'1', N'1', N'1', 1)
INSERT [dbo].[tbl_LienLac] ([Ten], [DiaChi], [DienThoai], [Email], [ChuDe], [NoiDung], [id]) VALUES (N'2', N'2', N'2         ', N'2', N'2', N'2', 2)
INSERT [dbo].[tbl_LienLac] ([Ten], [DiaChi], [DienThoai], [Email], [ChuDe], [NoiDung], [id]) VALUES (N'3', N'3', N'3         ', N'3', N'3', N'3', 3)
INSERT [dbo].[tbl_LienLac] ([Ten], [DiaChi], [DienThoai], [Email], [ChuDe], [NoiDung], [id]) VALUES (N'10', N'10', N'10        ', N'10', N'10', N'10', 4)
INSERT [dbo].[tbl_LienLac] ([Ten], [DiaChi], [DienThoai], [Email], [ChuDe], [NoiDung], [id]) VALUES (N'Phúc Bảo', N'Đồng Nai', N'0327010289', N'baonguyen741999@gmail.com', N'abc', N'quá dở', 5)
SET IDENTITY_INSERT [dbo].[tbl_LienLac] OFF
INSERT [dbo].[tbl_NhanVien] ([id], [tenNV], [NgaySinh], [gioitinh], [ChucVu], [id_quyen], [UserName], [Password]) VALUES (1, N'Phúc Bảo', CAST(N'1999-04-07' AS Date), N'nam', N'admin', 1, N'admin', N'admin')
INSERT [dbo].[tbl_NhanVien] ([id], [tenNV], [NgaySinh], [gioitinh], [ChucVu], [id_quyen], [UserName], [Password]) VALUES (2, N'User_mod', CAST(N'1999-08-03' AS Date), N'nữ', N'mod', 2, N'usermod', N'usermod')
INSERT [dbo].[tbl_NhanVien] ([id], [tenNV], [NgaySinh], [gioitinh], [ChucVu], [id_quyen], [UserName], [Password]) VALUES (3, N'Bảo', CAST(N'1999-02-10' AS Date), N'nam', N'tintuc', 3, N'tintuc', N'tintuc')
SET IDENTITY_INSERT [dbo].[tbl_NhomHang] ON 

INSERT [dbo].[tbl_NhomHang] ([id], [TenNhomHang], [Active], [idkhongdau], [khongdau]) VALUES (1, N'Áo khoác', 1, NULL, N'lbtndamlien')
INSERT [dbo].[tbl_NhomHang] ([id], [TenNhomHang], [Active], [idkhongdau], [khongdau]) VALUES (2, N'Sơ mi', 1, NULL, N'lbtnaokhoac')
INSERT [dbo].[tbl_NhomHang] ([id], [TenNhomHang], [Active], [idkhongdau], [khongdau]) VALUES (3, N'Quần Jeans', 1, NULL, N'lbtndamkm')
INSERT [dbo].[tbl_NhomHang] ([id], [TenNhomHang], [Active], [idkhongdau], [khongdau]) VALUES (4, N'Quần dài', 1, NULL, N'lbtnquandai')
INSERT [dbo].[tbl_NhomHang] ([id], [TenNhomHang], [Active], [idkhongdau], [khongdau]) VALUES (5, N'Quần Shorts', 1, NULL, N'lbtnquanshorts')
SET IDENTITY_INSERT [dbo].[tbl_NhomHang] OFF
SET IDENTITY_INSERT [dbo].[tbl_QuanLyMeNu] ON 

INSERT [dbo].[tbl_QuanLyMeNu] ([ID], [TenMenu], [Type], [Ord], [Level], [Link], [TypeClick], [Icon], [Active]) VALUES (1, N'Tin Tức', 1, 1, N'0001', N'./TinTucAdmin.aspx', N'_self', N'fa fa-edit fa-fw', 1)
INSERT [dbo].[tbl_QuanLyMeNu] ([ID], [TenMenu], [Type], [Ord], [Level], [Link], [TypeClick], [Icon], [Active]) VALUES (2, N'Trang Chủ', 1, 2, N'0002', N'../TrangChu.aspx', N'_blank', N'fa fa-dashboard fa-fw', 1)
INSERT [dbo].[tbl_QuanLyMeNu] ([ID], [TenMenu], [Type], [Ord], [Level], [Link], [TypeClick], [Icon], [Active]) VALUES (3, N'Quản trị hệ thông', 1, 3, N'0003', N'#', NULL, N'fa fa-wrench fa-fw', 1)
INSERT [dbo].[tbl_QuanLyMeNu] ([ID], [TenMenu], [Type], [Ord], [Level], [Link], [TypeClick], [Icon], [Active]) VALUES (4, N'Menu', 1, 1, N'00030001', N'./Menu.aspx', N'_self', NULL, 1)
INSERT [dbo].[tbl_QuanLyMeNu] ([ID], [TenMenu], [Type], [Ord], [Level], [Link], [TypeClick], [Icon], [Active]) VALUES (5, N'Nhân Viên', 1, 2, N'00030002', N'./NhanVien.aspx', N'_self', NULL, 1)
INSERT [dbo].[tbl_QuanLyMeNu] ([ID], [TenMenu], [Type], [Ord], [Level], [Link], [TypeClick], [Icon], [Active]) VALUES (6, N'Khách hàng', 1, 3, N'00030003', N'./KhachHang.aspx', N'_self', NULL, 1)
INSERT [dbo].[tbl_QuanLyMeNu] ([ID], [TenMenu], [Type], [Ord], [Level], [Link], [TypeClick], [Icon], [Active]) VALUES (7, N'Nhà Cung Cấp', 1, 4, N'00030004', N'./NhaCungCap.aspx', N'_self', NULL, 1)
INSERT [dbo].[tbl_QuanLyMeNu] ([ID], [TenMenu], [Type], [Ord], [Level], [Link], [TypeClick], [Icon], [Active]) VALUES (8, N'Hình thức thanh toán', 1, 5, N'00030005', N'./HinhThucThanhToan.aspx', N'_self', NULL, 1)
INSERT [dbo].[tbl_QuanLyMeNu] ([ID], [TenMenu], [Type], [Ord], [Level], [Link], [TypeClick], [Icon], [Active]) VALUES (9, N'Khuyến Mại', 1, 6, N'00030006', N'./KhuyenMai.aspx', N'_self', NULL, 1)
INSERT [dbo].[tbl_QuanLyMeNu] ([ID], [TenMenu], [Type], [Ord], [Level], [Link], [TypeClick], [Icon], [Active]) VALUES (10, N'Liên hệ', 1, 7, N'00030007', N'./LienHe.aspx', N'_self', NULL, 1)
INSERT [dbo].[tbl_QuanLyMeNu] ([ID], [TenMenu], [Type], [Ord], [Level], [Link], [TypeClick], [Icon], [Active]) VALUES (11, N'Quyền', 1, 8, N'00030008', N'./Quyen.aspx', N'_self', NULL, 1)
INSERT [dbo].[tbl_QuanLyMeNu] ([ID], [TenMenu], [Type], [Ord], [Level], [Link], [TypeClick], [Icon], [Active]) VALUES (12, N'Quảng cáo', 1, 9, N'00030009', N'./QuangCao.aspx', N'_self', NULL, 1)
INSERT [dbo].[tbl_QuanLyMeNu] ([ID], [TenMenu], [Type], [Ord], [Level], [Link], [TypeClick], [Icon], [Active]) VALUES (13, N'Quản lí  hàng', 1, 4, N'0004', N'#', N'_self', N'fa fa-table fa-fw', 1)
INSERT [dbo].[tbl_QuanLyMeNu] ([ID], [TenMenu], [Type], [Ord], [Level], [Link], [TypeClick], [Icon], [Active]) VALUES (14, N'Hàng', 1, 1, N'00040001', N'./HangAdmin.aspx', N'_self', NULL, 1)
INSERT [dbo].[tbl_QuanLyMeNu] ([ID], [TenMenu], [Type], [Ord], [Level], [Link], [TypeClick], [Icon], [Active]) VALUES (15, N'Đặt Hàng', 1, 2, N'00040002', N'./DonHangAdmin.aspx', N'_self', NULL, 1)
SET IDENTITY_INSERT [dbo].[tbl_QuanLyMeNu] OFF
INSERT [dbo].[tbl_Quyen] ([id], [TaiKhoan], [MatKhau], [id_NhanVien], [TenQuyen]) VALUES (1, NULL, NULL, 1, N'admin')
INSERT [dbo].[tbl_Quyen] ([id], [TaiKhoan], [MatKhau], [id_NhanVien], [TenQuyen]) VALUES (2, NULL, NULL, 2, N'quanly')
INSERT [dbo].[tbl_Quyen] ([id], [TaiKhoan], [MatKhau], [id_NhanVien], [TenQuyen]) VALUES (3, NULL, NULL, 3, N'quanlytintuc')
SET IDENTITY_INSERT [dbo].[tbl_TinTuc] ON 

INSERT [dbo].[tbl_TinTuc] ([id], [tieuDe], [tomtat], [noidung], [ngayviet], [id_nhanvien], [urlHinhAnh], [LuotXem], [Active]) VALUES (10, N'Thời trang đường phố Việt Nam – Liệu cuộc chơi đã có bản sắc?', N'Thời trang đường phố Việt” luôn là một keyword rất hot trong cộng đồng các bạn trẻ hiện nay.', N'<h2>&nbsp;</h2>

<p>&ldquo;Thời trang đường phố Việt&rdquo; lu&ocirc;n l&agrave; một keyword rất hot trong cộng đồng c&aacute;c bạn trẻ hiện nay. Qua b&agrave;i viết n&agrave;y, ELLE Man muốn đưa đến cho c&aacute;c độc giả một c&aacute;i nh&igrave;n tổng quan về xu hướng thời trang đường phố của giới trẻ Việt Nam cũng như t&igrave;nh h&igrave;nh ph&aacute;t triển của những local brand hiện nay.</p>

<p>&nbsp;</p>

<p>&ldquo;Fashion never die&rdquo; &ndash; Thời trang l&agrave; một cuộc đua kh&ocirc;ng bao giờ c&oacute; hồi kết, l&agrave; một lĩnh vực lu&ocirc;n lu&ocirc;n c&oacute; sự cập nhật xu hướng v&agrave; cải tiến. Thời trang, từ thời điểm n&agrave;y qua thời điểm kh&aacute;c, lu&ocirc;n được c&aacute;ch t&acirc;n bằng nhiều h&igrave;nh thức kh&aacute;c nhau để ph&ugrave; hợp với nhu cầu của những t&iacute;n đồ hiện nay.</p>

<p><a href="https://www.elleman.vn/wp-content/uploads/2018/10/22/thoi-trang-duong-pho-the-collectors_1-elle-man.jpg" rel="fancy_gallery"><img alt="Ảnh: The Collectors" src="https://www.elleman.vn/wp-content/uploads/2018/10/22/thoi-trang-duong-pho-the-collectors_1-elle-man-475x713.jpg" style="height:713px; width:475px" /></a></p>

<p>Ảnh: The Collectors</p>

<p>Đi ngược thời gian về giai đoạn những năm 2000, l&agrave; thời điểm m&agrave; khởi nguồn của văn h&oacute;a đường phố được du nhập v&agrave; ph&aacute;t triển mạnh mẽ ở Việt Nam &ndash; nền văn h&oacute;a Hip-Hop v&agrave; B-boying. Ở đ&oacute; cũng l&agrave; nơi thể hiện c&aacute;i t&ocirc;i, c&aacute; t&iacute;nh ri&ecirc;ng biệt của mỗi c&aacute; thể khi đ&atilde; v&ocirc; t&igrave;nh bị nền văn h&oacute;a n&agrave;y m&ecirc; hoặc. Đ&ocirc;i l&uacute;c chỉ l&agrave; một đoạn nhạc với tiết tấu nhanh hơn b&igrave;nh thường với những &acirc;m điệu bắt tai cũng đ&atilde; l&agrave;m ch&uacute;ng ta gật g&ugrave;, v&agrave; đ&ocirc;i ch&acirc;n bắt đầu nh&uacute;ng nhảy kh&ocirc;ng dừng lại. Từ thời điểm đ&oacute;, thời trang đường phố cũng bắt đầu du nhập v&agrave;o Việt Nam, với phong c&aacute;ch quần thụng &aacute;o rộng, trang sức lỉnh kỉnh, n&oacute;n snapback đi c&ugrave;ng những đ&ocirc;i gi&agrave;y hầm hố đầy m&agrave;u sắc. Những h&igrave;nh ảnh ấy cho tới nay vẫn c&ograve;n in đậm trong t&acirc;m tr&iacute; những bạn trẻ Việt đời đầu trong nỗ lực mang văn h&oacute;a đường phố đến gần hơn v&agrave; phổ biến hơn trong cộng đồng trẻ. V&agrave; sự ph&aacute;t triển thời trang đường phố Việt vẫn đang tiếp diễn từng ng&agrave;y, đi c&ugrave;ng những cải tiến về phong c&aacute;ch, m&agrave;u sắc v&agrave; chất liệu ph&ugrave; hợp với tốc độ ph&aacute;t triển của thế giới.</p>

<p><a href="https://www.elleman.vn/wp-content/uploads/2018/10/22/thoi-trang-duong-pho-hiphop-elle-man.jpg" rel="fancy_gallery"><img alt="Ảnh: Ben Đại - Big South Crew" src="https://www.elleman.vn/wp-content/uploads/2018/10/22/thoi-trang-duong-pho-hiphop-elle-man-475x316.jpg" style="height:316px; width:475px" /></a></p>

<p>Ảnh: Ben Đại &ndash; Big South Crew</p>

<p><a href="https://www.elleman.vn/wp-content/uploads/2018/10/28/thoi-trang-duong-pho-hiphop_3-elle-man.jpg" rel="fancy_gallery"><img alt="Ảnh: Ben Đại - Big South Crew" src="https://www.elleman.vn/wp-content/uploads/2018/10/28/thoi-trang-duong-pho-hiphop_3-elle-man-475x317.jpg" style="height:317px; width:475px" /></a></p>

<p>Ảnh: Ben Đại &ndash; Big South Crew</p>

<p>Trước l&agrave;n s&oacute;ng du nhập mạnh mẽ của c&aacute;c thương hiệu casual nước ngo&agrave;i trong những năm gần đ&acirc;y, những thương hiệu thời trang đường phố Việt Nam vẫn kh&ocirc;ng hề nao n&uacute;ng. Bằng c&aacute;ch li&ecirc;n tục tung ra những bộ sưu tập mới, với những h&igrave;nh ảnh được đầu tư kỹ lưỡng, đi k&egrave;m sự cải tiến về chất lượng, c&ugrave;ng với sự trau chuốt trong mặt quảng b&aacute; h&igrave;nh ảnh, c&aacute;c local brand cho thấy họ vẫn ổn định v&agrave; được duy tr&igrave;, kh&ocirc;ng hề k&eacute;m cạnh với c&aacute;c&nbsp;thương hiệu&nbsp;nước ngo&agrave;i</p>

<p>Trong v&agrave;i năm trở lại đ&acirc;y thật sự l&agrave; một cột mốc đ&aacute;ng được ghi nhận, khi c&aacute;c local brand Việt Nam đ&atilde; v&agrave; đang dần ph&aacute;t triển mạnh mẽ, được đ&oacute;n nhận cuồng nhiệt từ ph&iacute;a c&aacute;c bạn trẻ ở ba miền Bắc, Trung, Nam. C&oacute; thể kể đến một v&agrave;i local brand nổi bật như Peace United Streetwear, Headless, The Collectors, Freakers,&hellip; Họ l&agrave; những founder trẻ, d&aacute;m nghĩ d&aacute;m l&agrave;m, v&agrave; c&aacute;i t&ocirc;i c&ugrave;ng c&aacute; t&iacute;nh của họ li&ecirc;n tục được thể hiện qua những sản phẩm họ l&agrave;m ra. Với tất cả t&acirc;m huyết c&ugrave;ng đam m&ecirc; ph&aacute;t triển cộng đồng, họ đ&atilde; thổi hồn v&agrave;o những đứa con tinh thần của m&igrave;nh một gi&aacute; trị rất đặc biệt, rất x&atilde; hội để c&ugrave;ng &ldquo;ch&aacute;y&rdquo; trong d&ograve;ng chảy thời trang đường phố hiện nay.</p>

<p><a href="https://www.elleman.vn/wp-content/uploads/2018/10/23/thoi-trang-duong-pho-freakers_1-elle-man.jpg" rel="fancy_gallery"><img alt="Ảnh: Freakers" src="https://www.elleman.vn/wp-content/uploads/2018/10/23/thoi-trang-duong-pho-freakers_1-elle-man-475x475.jpg" style="height:475px; width:475px" /></a></p>

<p>Ảnh: Freakers</p>

<p><a href="https://www.elleman.vn/wp-content/uploads/2018/10/23/thoi-trang-duong-pho-pusw_1-elle-man.jpg" rel="fancy_gallery"><img alt="Ảnh: Peace United Store" src="https://www.elleman.vn/wp-content/uploads/2018/10/23/thoi-trang-duong-pho-pusw_1-elle-man-475x713.jpg" style="height:713px; width:475px" /></a></p>

<p>Ảnh: Peace United Store</p>

<p><a href="https://www.elleman.vn/wp-content/uploads/2018/10/24/thoi-trang-duong-pho-headless_2-elle-man.jpg" rel="fancy_gallery"><img alt="Ảnh: Headless" src="https://www.elleman.vn/wp-content/uploads/2018/10/24/thoi-trang-duong-pho-headless_2-elle-man-475x396.jpg" style="height:396px; width:475px" /></a></p>

<p>Ảnh: Headless</p>

<p>Li&ecirc;n tục học hỏi để bắt kịp xu thế l&agrave; một trong những yếu tố ch&iacute;nh tạo n&ecirc;n sự th&agrave;nh c&ocirc;ng hiện tại của thời trang đường phố Việt Nam. Thế nhưng, sự việc n&agrave;o cũng c&oacute; hai mặt của n&oacute; khi một v&agrave;i founder trẻ đang v&ocirc; t&igrave;nh nhầm lẫn (hoặc l&agrave; cố t&igrave;nh) giữa việc &ldquo;đ&oacute;n nhận cảm hứng&rdquo; v&agrave; &ldquo;vay mượn &yacute; tưởng&rdquo; từ những local brand kh&aacute;c. Thời trang đường phố đem đến cho ch&uacute;ng ta định nghĩa về sự s&aacute;ng tạo kh&ocirc;ng giới hạn, kh&ocirc;ng c&oacute; quy chuẩn hay thước đo n&agrave;o c&oacute; thể đ&aacute;nh gi&aacute; được, nhưng thời trang kh&ocirc;ng chứa chấp cho sự đạo nh&aacute;i v&agrave; lười biếng. Sức h&uacute;t của những sản phẩm đến từ những local brand nổi tiếng sẽ l&agrave; một miếng mồi ngon để những local brand trẻ hơn l&ocirc;i ra x&acirc;u x&eacute;. Một bộ phận giới trẻ kh&ocirc;ng c&oacute; khả năng chi ti&ecirc;u cho những brand qu&aacute; nổi tiếng, th&igrave; họ sẽ mang nhu cầu đ&oacute; t&igrave;m đến những brand với c&aacute;c sản phẩm c&oacute; những n&eacute;t tương đồng về mặt gi&aacute; trị nghệ thuật nhưng c&oacute; gi&aacute; th&agrave;nh thấp hơn để đ&aacute;p ứng nhu cầu thời trang của m&igrave;nh. Ch&iacute;nh điều đ&oacute; đ&atilde; v&ocirc; h&igrave;nh trung tạo n&ecirc;n căn bệnh &ldquo;lười s&aacute;ng tạo&rdquo; trong ch&iacute;nh founder của c&aacute;c local brand trẻ. Họ muốn sản phẩm của m&igrave;nh được mọi người đ&oacute;n nhận, nhưng mặt h&igrave;nh ảnh lại l&agrave; vay mượn từ những t&aacute;c phẩm nghệ thuật, kh&ocirc;ng thể hiện được c&aacute;i t&ocirc;i ri&ecirc;ng của ch&iacute;nh m&igrave;nh v&agrave; rơi v&agrave;o vết xe đổ về ranh giới mỏng manh giữa &ldquo;lấy cảm hứng&rdquo; v&agrave; &ldquo;đạo nh&aacute;i&rdquo;. C&agrave;ng nhiều những &yacute; tưởng giống nhau, đơn thuần chạy theo phong tr&agrave;o sẽ c&agrave;ng tạo điều kiện cho sự nh&agrave;m ch&aacute;n v&agrave; &ldquo;một m&agrave;u&rdquo; của thời trang đường phố nước nh&agrave; m&agrave; bấy l&acirc;u nay cộng đồng đang x&acirc;y dựng.</p>

<p><a href="https://www.elleman.vn/wp-content/uploads/2018/10/24/thoi-trang-duong-pho-steal-idea-elle-man.jpg" rel="fancy_gallery"><img alt="Ảnh: TED Ideas" src="https://www.elleman.vn/wp-content/uploads/2018/10/24/thoi-trang-duong-pho-steal-idea-elle-man-475x289.jpg" style="height:289px; width:475px" /></a></p>

<p>Ảnh: TED Ideas</p>

<p>B&ecirc;n cạnh việc đi sai hướng của c&aacute;c local brand trẻ, th&igrave; một vấn đề kh&aacute;c cũng n&oacute;ng kh&ocirc;ng k&eacute;m đến từ những t&iacute;n đồ thời trang, đ&oacute; ch&iacute;nh l&agrave; việc c&aacute;c bạn kh&ocirc;ng c&oacute; ch&iacute;nh kiến ri&ecirc;ng về phong c&aacute;ch của m&igrave;nh. Điều đ&oacute; thể hiện qua việc đang c&oacute; qu&aacute; nhiều c&aacute; nh&acirc;n trong cộng đồng đua theo những item đắt tiền, với suy nghĩ kho&aacute;c những bộ quần &aacute;o như thế l&ecirc;n người sẽ thu h&uacute;t được sự ch&uacute; &yacute; của người kh&aacute;c. C&aacute;c bạn c&oacute; thể bất chấp mọi thứ, chi trả rất nhiều tiền cho một bộ outfit để thể hiện sự nổi trội của m&igrave;nh so với cộng đồng, nhưng kh&ocirc;ng hề c&acirc;n đo đong đếm xem bộ c&aacute;nh ấy c&oacute; thực sự ph&ugrave; hợp với thể trạng, cũng như đ&atilde; thể hiện đ&uacute;ng c&aacute; t&iacute;nh của m&igrave;nh hay chưa.&nbsp;Họ&nbsp;đang &ldquo;gồng m&igrave;nh&rdquo; chạy theo những&nbsp;thứ khiến&nbsp;đ&aacute;m đ&ocirc;ng th&iacute;ch th&uacute; v&agrave; b&agrave;n t&aacute;n chứ kh&ocirc;ng phải những thứ bản th&acirc;n thật sự đam m&ecirc;. Điều n&agrave;y v&ocirc; h&igrave;nh đ&atilde; v&agrave; đang giảm đi gi&aacute; trị thực sự cũng như &yacute; nghĩa m&agrave; thời trang đường phố mang lại.</p>

<p><a href="https://www.elleman.vn/wp-content/uploads/2018/10/24/thoi-trang-duong-pho-bad-outfit-elle-man.jpg" rel="fancy_gallery"><img alt="Ảnh: Life of Himel" src="https://www.elleman.vn/wp-content/uploads/2018/10/24/thoi-trang-duong-pho-bad-outfit-elle-man-475x589.jpg" style="height:589px; width:475px" /></a></p>

<p>Ảnh: Life of Himel</p>

<p>Tuy mỗi người sẽ c&oacute; mỗi quan điểm về h&igrave;nh thức v&agrave; t&iacute;nh chất thời trang kh&aacute;c nhau, nhưng việc c&oacute; thể &ldquo;học hỏi&rdquo; lu&ocirc;n l&agrave; yếu tố h&agrave;ng đầu để đẩy mạnh danh tiếng cho c&aacute;c local brand n&oacute;i chung v&agrave; những t&iacute;n đồ thời trang đường phố n&oacute;i ri&ecirc;ng. Sẽ thật tuyệt đời khi thấy cộng đồng trẻ Việt Nam khẳng định bản th&acirc;n m&igrave;nh th&ocirc;ng qua những item thời trang độc đ&aacute;o, c&aacute; t&iacute;nh mang đậm n&eacute;t s&aacute;ng tạo ri&ecirc;ng biệt của những local brand, để bạn b&egrave; quốc tế c&ocirc;ng nhận rằng người trẻ Việt Nam ch&uacute;ng ta cũng c&oacute; một nền văn h&oacute;a đường phố kh&ocirc;ng thua k&eacute;m bất kỳ quốc gia n&agrave;o. &nbsp;</p>
', CAST(N'2018-04-11' AS Date), 1, N'images/thoi-trang-duong-pho-hiphop-elle-man.jpg', 46, 1)
INSERT [dbo].[tbl_TinTuc] ([id], [tieuDe], [tomtat], [noidung], [ngayviet], [id_nhanvien], [urlHinhAnh], [LuotXem], [Active]) VALUES (11, N'Xu hướng Parody và lằn ranh mong manh với đạo nhái', N'Lằn ranh giữa xu hướng Parody (trào phúng) và Bootleg (đạo nhái, ăn cắp ý tưởng) trong thời trang luôn rất mong manh', N'<h2>&nbsp;</h2>

<p>Lằn ranh giữa xu hướng Parody (tr&agrave;o ph&uacute;ng) v&agrave; Bootleg (đạo nh&aacute;i, ăn cắp &yacute; tưởng) trong thời trang lu&ocirc;n rất mong manh. Parody hiện nay vẫn nằm trong v&ugrave;ng x&aacute;m, kh&ocirc;ng phải ho&agrave;n to&agrave;n đ&uacute;ng (v&ugrave;ng trắng) nhưng cũng kh&ocirc;ng ho&agrave;n to&agrave;n sai (v&ugrave;ng tối). V&igrave; vậy, việc lợi dụng m&aacute;c &ldquo;Parody&rdquo; để kinh doanh những sản phẩm ăn theo hiện nay vẫn l&agrave; một hiện trạng nhức nhối trong cộng đồng thời trang.</p>

<p>&nbsp;</p>

<p>V&agrave;o năm 2016, Davil Tran, một thanh ni&ecirc;n người Mỹ gốc Việt, đ&atilde; khiến cộng đồng thời trang c&oacute; một phen cười nghi&ecirc;ng ng&atilde; khi ra mắt h&agrave;ng loạt sản phẩm ăn theo thương hiệu Vetements, dưới t&ecirc;n gọi Vetememes.</p>

<p><a href="https://www.elleman.vn/wp-content/uploads/2018/08/01/xu-huong-parody-elle-man-1.jpg" rel="fancy_gallery"><img alt="xu huong parody - elle man 1" src="https://www.elleman.vn/wp-content/uploads/2018/08/01/xu-huong-parody-elle-man-1.jpg" style="height:1875px; width:1500px" /></a></p>

<p>Davil Tran trong một buổi chụp với thương hiệu Parody mới nhất của m&igrave;nh mang t&ecirc;n Boolenciaga.</p>

<p>Ở thời điểm đ&oacute;, người ta c&oacute; thể t&igrave;m thấy chiếc &aacute;o raincoat đen với độc nhất logo Vetements ở bất k&igrave; con phố n&agrave;o mỗi fashion week. Sự n&oacute;ng bỏng của n&oacute; kh&ocirc;ng chỉ dừng lại tr&ecirc;n đường phố m&agrave; c&ograve;n len l&otilde;i khắp ng&oacute;c ng&aacute;ch của c&aacute;c hot insta, người nổi tiếng&hellip; Điều khiến item n&agrave;y c&oacute; gi&aacute; b&aacute;n lẻ l&agrave; $135 được &ldquo;hype&rdquo; l&ecirc;n gấp 2,3 lần v&agrave; hơn thế nữa, việc sở hữu một chiếc &aacute;o Vetements c&ograve;n trở th&agrave;nh một t&iacute;n hiệu của sự thời thượng cho bất k&igrave; ai kho&aacute;c l&ecirc;n n&oacute;.</p>

<p><a href="https://www.elleman.vn/wp-content/uploads/2018/08/01/xu-huong-parody-elle-man-2.jpg" rel="fancy_gallery"><img alt="xu huong parody - elle man 2" src="https://www.elleman.vn/wp-content/uploads/2018/08/01/xu-huong-parody-elle-man-2.jpg" style="height:650px; width:1000px" /></a></p>

<p>Về h&igrave;nh thức những sản phẩm Vetememes gần như kh&ocirc;ng kh&aacute;c l&agrave; mấy so với nguy&ecirc;n bản Vetements.</p>

<p>Nhưng kh&ocirc;ng phải ai cũng c&oacute; thể t&igrave;m kiếm v&agrave; đủ khả năng chi trả cho thiết kế đắt gi&aacute; tr&ecirc;n. Thế n&ecirc;n, Vetememes của cậu thiếu ni&ecirc;n 22 tuổi, Davil Tran ra đời dường như l&agrave; cơn mưa giữa m&ugrave;a Hạ. C&aacute;ch chơi chữ h&agrave;i hước với font chữ v&agrave; thiết kế gần như kh&ocirc;ng g&igrave; kh&aacute;c biệt so với bản gốc gi&uacute;p Vetememes trở th&agrave;nh alternative-item (sản phẩm thay thế) ho&agrave;n hảo cho những ai kh&ocirc;ng muốn chi trả qu&aacute; nhiều cho một tấm ảnh trendy tr&ecirc;n instagram</p>

<p>Từ đ&oacute;, Vetememes trở th&agrave;nh một v&iacute; dụ điển h&igrave;nh về văn ho&aacute; Parody trong thời trang. Xu hướng Parody c&oacute; thể tạm định nghĩa l&agrave; những sản phẩm ăn theo, sử dụng phong c&aacute;ch của một sản phẩm nổi tiếng theo lối thiết kế tr&agrave;o ph&uacute;ng, h&agrave;i hước.</p>

<p><a href="https://www.elleman.vn/wp-content/uploads/2018/08/01/xu-huong-parody-elle-man-3.jpg" rel="fancy_gallery"><img alt="xu huong parody - elle man 3" src="https://www.elleman.vn/wp-content/uploads/2018/08/01/xu-huong-parody-elle-man-3.jpg" style="height:462px; width:916px" /></a></p>

<p>Thiết kế h&agrave;i hước &ldquo;Homies New York&rdquo; của Reason Clothing lấy cảm hứng từ logo kinh điển của Hermes Paris</p>

<p><a href="https://www.elleman.vn/wp-content/uploads/2018/08/01/xu-huong-parody-elle-man-4.jpg" rel="fancy_gallery"><img alt="xu huong parody - elle man 4" src="https://www.elleman.vn/wp-content/uploads/2018/08/01/xu-huong-parody-elle-man-4.jpg" style="height:400px; width:700px" /></a></p>

<p>Theo nhiều tin đồn, Riccardo Tisci &ndash; khi ấy l&agrave; gi&aacute;m đốc nghệ thuật của Givenchy, thậm ch&iacute; từng sở hữu một chiếc &aacute;o &ldquo;Giraunchy&rdquo; của h&atilde;ng C.O.I (Conflict of Interest) .</p>

<p><a href="https://www.elleman.vn/wp-content/uploads/2018/08/01/xu-huong-parody-elle-man-5.jpg" rel="fancy_gallery"><img alt="xu huong parody" src="https://www.elleman.vn/wp-content/uploads/2018/08/01/xu-huong-parody-elle-man-5.jpg" style="height:795px; width:546px" /></a></p>

<p>Rihanna cũng từng nhiều lần xuất hiện với c&aacute;c thiết kế mang xu hướng Parody.</p>

<p><a href="https://www.elleman.vn/wp-content/uploads/2018/08/01/xu-huong-parody-elle-man-6.jpg" rel="fancy_gallery"><img alt="xu huong parody - elle man 6" src="https://www.elleman.vn/wp-content/uploads/2018/08/01/xu-huong-parody-elle-man-6.jpg" style="height:600px; width:600px" /></a></p>

<p>T&agrave;i tử Trần Qu&aacute;n Hy, một trong những &ldquo;d&acirc;n chơi&rdquo; thời trang số 1 Hongkong với thiết kế Channel!</p>

<p><a href="https://www.elleman.vn/wp-content/uploads/2018/08/01/xu-huong-parody-elle-man-7.jpg" rel="fancy_gallery"><img alt="xu huong parody - elle man 7" src="https://www.elleman.vn/wp-content/uploads/2018/08/01/xu-huong-parody-elle-man-7.jpg" style="height:390px; width:630px" /></a></p>

<p>COMME des FUCKDOWN (parody của Comme des Garcons) cũng từng l&agrave;m mưa, l&agrave;m gi&oacute; trong cộng đồng thời trang sau khi được A$AP Rocky v&agrave; c&aacute;c anh em A$AP mặc.</p>

<p>C&oacute; rất nhiều c&aacute;ch để thể hiện trong Parody. Phổ biến nhất c&oacute; lẽ l&agrave; c&aacute;ch chơi chữ, nhại lại t&ecirc;n thương hiệu như Homies, Buccy, Saint Laundry&hellip;&nbsp;Ngo&agrave;i ra, c&aacute;c phong c&aacute;ch như l&agrave;m mới những thiết kế đặc trưng, sử dụng một phần t&ecirc;n thương hiệu trong ngữ cảnh h&agrave;i hước, phản &aacute;nh tr&agrave;o ph&uacute;ng một sự việc, scandal của c&aacute;c brand&hellip; cũng thường l&agrave; những đề t&agrave;i được nh&igrave;n thấy tr&ecirc;n c&aacute;c thiết kế mang xu hướng Parody.</p>

<p><a href="https://www.elleman.vn/wp-content/uploads/2018/08/01/xuhuongparody8.jpg" rel="fancy_gallery"><img alt="xuhuongparody8" src="https://www.elleman.vn/wp-content/uploads/2018/08/01/xuhuongparody8.jpg" style="height:600px; width:630px" /></a></p>

<p>Nổi tiếng trong số đ&oacute; phải kể đến thiết kế &ldquo;Ain&rsquo;t Laurent Without Yves&rdquo; của nghệ sĩ Jeanine Heller. C&acirc;u chơi chữ h&agrave;i hước n&agrave;y l&agrave; c&aacute;ch Heller ch&acirc;m biếm sự kiện thương hiệu hơn 50 năm tuổi, Yves Saint Laurent đổi t&ecirc;n th&agrave;nh Saint Laurent Paris. Chiếc &aacute;o n&agrave;y nhanh ch&oacute;ng trở th&agrave;nh một đề t&agrave;i b&agrave;n t&aacute;n của giới mộ điệu thời điểm bấy giờ v&agrave; thậm ch&iacute; c&ograve;n c&oacute; mặt tr&ecirc;n kệ của một trong những cửa h&agrave;ng thời trang uy t&iacute;n nhất Paris &ndash; Colette, mặc cho Saint Laurent Paris đ&acirc;m đơn kiện l&ecirc;n to&agrave; &aacute;n (nhưng r&uacute;t lại sau đ&oacute;).<br />
Tuy nhi&ecirc;n, lằn ranh giữa Parody v&agrave; đạo nh&aacute;i (bootleg), ăn cắp &yacute; tưởng lu&ocirc;n rất mong manh.&nbsp;Parody hiện nay vẫn nằm trong v&ugrave;ng x&aacute;m, kh&ocirc;ng phải ho&agrave;n to&agrave;n đ&uacute;ng (v&ugrave;ng trắng) nhưng cũng kh&ocirc;ng ho&agrave;n to&agrave;n sai (v&ugrave;ng tối). V&igrave; vậy, việc lợi dụng m&aacute;c &ldquo;Parody&rdquo; để kinh doanh những sản phẩm ăn theo hiện nay vẫn l&agrave; một hiện trạng nhức nh&oacute;i trong cộng đồng thời trang.</p>

<p><a href="https://www.elleman.vn/wp-content/uploads/2018/08/01/xuhuongparody1.jpg" rel="fancy_gallery"><img alt="xuhuongparody1" src="https://www.elleman.vn/wp-content/uploads/2018/08/01/xuhuongparody1.jpg" style="height:800px; width:1200px" /></a></p>

<p>Một sản phẩm chỉ được đ&aacute;nh gi&aacute; l&agrave; Parody khi sản phẩm đ&oacute; sử dụng những yếu tố cơ bản của t&aacute;c phẩm gốc như: font chữ, biểu tượng, lối thiết kế hay phong c&aacute;ch&hellip; dưới g&oacute;c nh&igrave;n h&agrave;i hước.&nbsp;Song, mọi h&agrave;nh vi sử dụng t&ecirc;n thương hiệu, logo nguy&ecirc;n bản hay &ldquo;sao ch&eacute;p&rdquo; y nguy&ecirc;n thiết kế đều c&oacute; thể bị xem l&agrave; h&agrave;nh động đạo nh&aacute;i. Điều n&agrave;y cũng giống như việc kh&ocirc;ng thể xem c&aacute;c biến thể với logo &ldquo;Supreme&rdquo; được b&agrave;y b&aacute;n ở c&aacute;c khu chợ l&agrave; sản phẩm Parody!</p>

<p>V&agrave; để minh chứng cho c&acirc;u n&oacute;i tr&ecirc;n, T&acirc;n Nguyễn (founder của Vietnamese Street Style Group &ndash; một cộng đồng thời trang đường phố lớn ở Việt Nam) cũng chỉ ra sự kiện nh&agrave; mốt Maison Martin Margiela đ&atilde; từng &ldquo;t&aacute;i tạo&rdquo; những chiếc quần Levi&rsquo;s c&oacute; gi&aacute; tầm $50 để biến n&oacute; th&agrave;nh một sản phẩm high fashion cho bộ sưu tập của m&igrave;nh v&agrave;o những năm 90s hay việc Demna Gvasalia từ Vetements sử dụng những chiếc &aacute;o đồng phục DHL truyền thống cho runway. Việc &ldquo;high-fashion-ho&aacute;&rdquo; những item đấy nhằm n&oacute;i l&ecirc;n rằng fashion l&agrave; mu&ocirc;n m&agrave;u mu&ocirc;n vẻ v&agrave; d&ugrave; t&uacute;i tiền của bạn c&oacute; ở ngưỡng n&agrave;o đi nữa th&igrave; bạn vẫn c&oacute; thể mặc đẹp như c&aacute;c người mẫu tr&ecirc;n runway.</p>

<p><img alt="xuhuongthoitrang9" src="https://www.elleman.vn/wp-content/uploads/2018/08/01/xuhuongthoitrang9.jpg" style="height:1600px; width:1200px" /></p>

<p><a href="https://www.elleman.vn/wp-content/uploads/2018/08/01/trao-luu-parody-elle-man-80.jpg" rel="fancy_gallery"><img alt="trao luu parody - elle man 80" src="https://www.elleman.vn/wp-content/uploads/2018/08/01/trao-luu-parody-elle-man-80.jpg" style="height:1080px; width:1080px" /></a></p>

<p>Nếu như so s&aacute;nh c&aacute;c sản phẩm Haute Couture l&agrave; những t&aacute;c phẩm điện ảnh h&agrave;m l&acirc;m đầy t&iacute;nh nghệ thuật th&igrave; Parody lại l&agrave; những bộ phim h&agrave;i hước mang phong vị &ldquo;m&igrave; ăn liền&rdquo;.</p>

<p>Bạn c&oacute; thể ch&ecirc; hay khen, y&ecirc;u th&iacute;ch hay gh&eacute;t bỏ phong c&aacute;ch n&agrave;y. Nhưng d&ugrave; thế n&agrave;o th&igrave; vẫn kh&ocirc;ng thể chối c&atilde;i rằng xu hướng Parody l&agrave; một phần tất yếu v&agrave; gắn liền với sự ph&aacute;t triển của văn ho&aacute; thời trang v&agrave; cũng h&atilde;y nhớ r&otilde;, lằn ranh giữa Parody v&agrave; đạo nh&aacute;i cũng thật mỏng manh.</p>
', CAST(N'2018-04-11' AS Date), 1, N'images/xu-huong-parody-elle-man-1.jpg', 44, 1)
INSERT [dbo].[tbl_TinTuc] ([id], [tieuDe], [tomtat], [noidung], [ngayviet], [id_nhanvien], [urlHinhAnh], [LuotXem], [Active]) VALUES (12, N'5 local brand Việt Nam nổi bật nhất tại Hà Nội', N'Local Brand Việt Nam hiện đang là một trong những keyword thu hút nhiều quan tâm của giới trẻ trong thời gian gần đây.', N'<h2>&nbsp;</h2>

<p>Local Brand Việt Nam hiện đang l&agrave; một trong những keyword thu h&uacute;t nhiều quan t&acirc;m của giới trẻ trong thời gian gần đ&acirc;y. Trong b&agrave;i viết n&agrave;y, ELLE Man sẽ giới thiệu đến với c&aacute;c độc giả 5 thương hiệu thời trang nội địa đang &ldquo;hot&rdquo; nhất khu vực Thủ Đ&ocirc;.</p>

<p>&nbsp;</p>

<p>Sự b&ugrave;ng nổ của c&aacute;c thương hiệu thời trang trẻ v&agrave; năng động đ&atilde; v&agrave; đang mang một luồng gi&oacute; mới thổi v&agrave;o l&agrave;ng thời trang vốn lắng động, c&oacute; phần truyền thống của Việt Nam. V&agrave;&nbsp;ngay b&ecirc;n dưới đ&acirc;y,&nbsp;<strong>ELLE Man&nbsp;</strong>giới thiệu đến c&aacute;c bạn&nbsp;5 thương hiệu local brand Việt Nam đ&aacute;ng ch&uacute; &yacute; nhất m&agrave; bạn c&oacute; thể t&igrave;m thấy ở H&agrave; Nội.</p>

<h2><strong>1. SCC Daily Sneaker</strong></h2>

<p>Những thiết kế lấy cảm hứng từ c&aacute;c đ&ocirc;i gi&agrave;y kinh điển Off White x Air Jordan 1, Air Max 98 &ldquo;Gundam&rdquo; hay Vans Old Skul lu&ocirc;n l&agrave; phần kh&ocirc;ng thể thiếu của SCC Daily Sneaker.</p>

<p><a href="https://www.elleman.vn/wp-content/uploads/2018/09/05/local-brand-viet-nam-scc-daily-sneaker-elle-man-3.jpg" rel="fancy_gallery"><img alt="local brand viet nam - scc daily sneaker - elle man 3" src="https://www.elleman.vn/wp-content/uploads/2018/09/05/local-brand-viet-nam-scc-daily-sneaker-elle-man-3.jpg" style="height:960px; width:960px" /></a></p>

<p>Ảnh: SCC Daily Sneaker</p>

<p><a href="https://www.elleman.vn/wp-content/uploads/2018/09/05/local-brand-viet-nam-scc-daily-sneaker-elle-man-1.jpg" rel="fancy_gallery"><img alt="local brand viet nam - scc daily sneaker - elle man 1" src="https://www.elleman.vn/wp-content/uploads/2018/09/05/local-brand-viet-nam-scc-daily-sneaker-elle-man-1.jpg" style="height:960px; width:960px" /></a></p>

<p>Ảnh: SCC Daily Sneaker</p>

<p><a href="https://www.elleman.vn/wp-content/uploads/2018/09/05/local-brand-viet-nam-scc-daily-sneaker-elle-man-2.jpg" rel="fancy_gallery"><img alt="local brand viet nam - scc daily sneaker - elle man 2" src="https://www.elleman.vn/wp-content/uploads/2018/09/05/local-brand-viet-nam-scc-daily-sneaker-elle-man-2.jpg" style="height:960px; width:960px" /></a></p>

<p>Ảnh: SCC Daily Sneaker</p>

<p><a href="https://www.elleman.vn/wp-content/uploads/2018/09/05/local-brand-viet-nam-scc-daily-sneaker-elle-man-4.jpg" rel="fancy_gallery"><img alt="local brand viet nam - scc daily sneaker - elle man 4" src="https://www.elleman.vn/wp-content/uploads/2018/09/05/local-brand-viet-nam-scc-daily-sneaker-elle-man-4.jpg" style="height:960px; width:960px" /></a></p>

<p>Ảnh: SCC Daily Sneaker</p>

<p>Nằm tại Creative City, SCC Daily Sneaker l&agrave; local brand Việt Nam được th&agrave;nh lập bởi Trương Ngọc Anh, founder của facebook group về gi&agrave;y đ&igrave;nh đ&aacute;m nhất Việt Nam &ndash; #HNBMG. Với&nbsp;nền tảng&nbsp;nổi bật về&nbsp;gi&agrave;y thể thao&nbsp;của founder, những thiết kế của SCC Daily Sneaker phần nhiều mang &acirc;m hưởng của văn ho&aacute; s&aacute;t mặt đất.</p>

<p><a href="https://www.elleman.vn/wp-content/uploads/2018/09/05/local-brand-viet-nam-scc-daily-sneaker-elle-man-5.jpg" rel="fancy_gallery"><img alt="local brand viet nam - scc daily sneaker - elle man 5" src="https://www.elleman.vn/wp-content/uploads/2018/09/05/local-brand-viet-nam-scc-daily-sneaker-elle-man-5.jpg" style="height:1536px; width:2048px" /></a></p>

<p>Rất nhiều bạn trẻ đến tham gia camping những ph&aacute;t h&agrave;nh mới của HNBMG tại SCC. Ảnh: SCC Daily Sneaker</p>

<p>Nổi bật ở local brand Việt Nam n&agrave;y l&agrave; những chiếc &aacute;o thun&nbsp;v&agrave; Hoodie với thiết kế s&aacute;ng tạo xoay quanh những đ&ocirc;i gi&agrave;y đế bằng. Ngo&agrave;i ra, đ&acirc;y cũng l&agrave; nơi c&aacute;c t&iacute;n đồ streetwear miền Bắc &ldquo;cắm trại&rdquo; mỗi đợt ra mắt c&aacute;c sản phẩm mới của #HNBMG.</p>

<h2><strong>2. Freakers</strong></h2>

<p>Freaker l&agrave; một trong những c&aacute;i t&ecirc;n k&igrave; cựu trong l&agrave;ng local brand Việt Nam. Xuy&ecirc;n suốt nhiều năm ph&aacute;t triển, &ldquo;c&acirc;y đại thụ&rdquo; n&agrave;y vẫn lu&ocirc;n duy tr&igrave; h&igrave;nh ảnh m&igrave;nh l&agrave; một skate brand của H&agrave; Nội với những thiết kế đậm chất đường phố.</p>

<p><a href="https://www.elleman.vn/wp-content/uploads/2018/09/05/local-brand-viet-nam-Freakers-elle-man-1.jpg" rel="fancy_gallery"><img alt="local brand viet nam - Freakers - elle man 1" src="https://www.elleman.vn/wp-content/uploads/2018/09/05/local-brand-viet-nam-Freakers-elle-man-1.jpg" style="height:1313px; width:2048px" /></a></p>

<p>Ảnh: Freakers</p>

<p><a href="https://www.elleman.vn/wp-content/uploads/2018/09/05/local-brand-viet-nam-Freakers-elle-man-2.jpg" rel="fancy_gallery"><img alt="local brand viet nam - Freakers - elle man 2" src="https://www.elleman.vn/wp-content/uploads/2018/09/05/local-brand-viet-nam-Freakers-elle-man-2.jpg" style="height:693px; width:960px" /></a></p>

<p>Ảnh: Freakers</p>

<p>Đ&uacute;ng như tinh thần của c&aacute;c skater, những sản phẩm của Freakers đề cao t&iacute;nh năng động, ph&oacute;ng kho&aacute;ng, tự do v&agrave; dĩ nhi&ecirc;n kh&ocirc;ng thể thiếu sự h&agrave;i hước&hellip; Những graphic của Freakers lu&ocirc;n được đ&aacute;nh gi&aacute; cao bởi c&aacute;ch sử dụng h&igrave;nh ảnh s&aacute;ng tạo, mới mẻ.</p>

<p>B&ecirc;n cạnh đ&oacute;, local brand Việt Nam n&agrave;y c&ograve;n sở hữu rất nhiều collaboration với những c&aacute;i t&ecirc;n đ&igrave;nh đ&aacute;m như: Nirvana, #HNBMG,&hellip; hay c&aacute;c rapper như Đen V&acirc;u, Woowy&hellip;</p>

<p><a href="https://www.elleman.vn/wp-content/uploads/2018/09/05/local-brand-viet-nam-Freakers-elle-man-3.jpg" rel="fancy_gallery"><img alt="local brand viet nam - Freakers - elle man 3" src="https://www.elleman.vn/wp-content/uploads/2018/09/05/local-brand-viet-nam-Freakers-elle-man-3.jpg" style="height:520px; width:960px" /></a></p>

<p>Ảnh: Freakers</p>

<p><a href="https://www.elleman.vn/wp-content/uploads/2018/09/05/local-brand-viet-nam-Freakers-elle-man-4.jpeg" rel="fancy_gallery"><img alt="local brand viet nam - Freakers - elle man 4" src="https://www.elleman.vn/wp-content/uploads/2018/09/05/local-brand-viet-nam-Freakers-elle-man-4.jpeg" style="height:785px; width:1200px" /></a></p>

<p>Ảnh: Freakers</p>

<h2><strong>3. HBS</strong></h2>

<p>Ngay từ t&ecirc;n gọi HBS a.k.a Hanoi Boyz Swagg, ch&uacute;ng ta đ&atilde; c&oacute; thể cảm nhận được sự đậm đặc phong vị H&agrave; Nội trong thương hiệu n&agrave;y.&nbsp;Được th&agrave;nh lập v&agrave;o năm 2012, HBS l&agrave; một local brand Việt Nam c&oacute; nhiều biến ho&aacute; trong sản phẩm từ những item mang phong c&aacute;ch darkwear đến c&aacute;c graphic tee đầy s&aacute;ng tạo.</p>

<p><a href="https://www.elleman.vn/wp-content/uploads/2018/09/05/local-brand-viet-nam-HBS-elle-man-1.jpg" rel="fancy_gallery"><img alt="local brand viet nam - HBS - elle man 1" src="https://www.elleman.vn/wp-content/uploads/2018/09/05/local-brand-viet-nam-HBS-elle-man-1.jpg" style="height:1368px; width:2048px" /></a></p>

<p>Ảnh: HBS</p>

<p><a href="https://www.elleman.vn/wp-content/uploads/2018/09/05/local-brand-viet-nam-HBS-elle-man-2.jpg" rel="fancy_gallery"><img alt="local brand viet nam - HBS - elle man 2" src="https://www.elleman.vn/wp-content/uploads/2018/09/05/local-brand-viet-nam-HBS-elle-man-2.jpg" style="height:1240px; width:1754px" /></a></p>

<p>Ảnh: HBS</p>

<p>Một trong những item nổi bật nhất của HBS ch&iacute;nh l&agrave; chiếc &aacute;o Coat Jacket &ldquo;THERE IS A METHOD TO OUR MADNESS&rdquo;. Sản phẩm nằm trong bộ sưu tập kết hợp với Vietnamese Street Style Group n&agrave;y được cộng đồng thời trang đ&aacute;nh gi&aacute; cao ở khả năng thiết kế v&agrave; sử dụng chất liệu t&agrave;i t&igrave;nh.&nbsp;Item Coat Jacket lấy cảm hứng từ những h&igrave;nh ảnh X-Quang độc đ&aacute;o trong y khoa.</p>

<p><a href="https://www.elleman.vn/wp-content/uploads/2018/09/05/local-brand-viet-nam-HBS-elle-man-3.jpg" rel="fancy_gallery"><img alt="local brand viet nam - HBS - elle man 3" src="https://www.elleman.vn/wp-content/uploads/2018/09/05/local-brand-viet-nam-HBS-elle-man-3.jpg" style="height:1459px; width:2048px" /></a></p>

<p>Ảnh: HBS</p>

<p><a href="https://www.elleman.vn/wp-content/uploads/2018/09/05/local-brand-viet-nam-HBS-elle-man-4.jpg" rel="fancy_gallery"><img alt="local brand viet nam - HBS - elle man 4" src="https://www.elleman.vn/wp-content/uploads/2018/09/05/local-brand-viet-nam-HBS-elle-man-4.jpg" style="height:1398px; width:2048px" /></a></p>

<p>Ảnh: HBS</p>

<h2><strong>4. ClownZ</strong></h2>

<p>Nếu như những thương hiệu tr&ecirc;n đều mang một style ri&ecirc;ng biệt th&igrave; ClownZ lại l&agrave; nơi m&agrave; c&aacute;c t&iacute;nh đồ streetwear H&agrave; Th&agrave;nh c&oacute; thể t&igrave;m thấy tất cả những g&igrave; m&igrave;nh cần từ đầu đến ch&acirc;n.&nbsp;Từ Baseball Jacket, Tee, Jogger Pants cho đến sneakers trong bức ảnh n&agrave;y đều c&oacute; thể t&igrave;m thấy ở ClownZ.</p>

<p><a href="https://www.elleman.vn/wp-content/uploads/2018/09/05/local-brand-viet-nam-ClownZ-elle-man-1.jpg" rel="fancy_gallery"><img alt="local brand viet nam - ClownZ - elle man 1" src="https://www.elleman.vn/wp-content/uploads/2018/09/05/local-brand-viet-nam-ClownZ-elle-man-1.jpg" style="height:1365px; width:2048px" /></a></p>

<p>Ảnh: ClownZ</p>

<p>Lối thiết kế của ClownZ kh&ocirc;ng qu&aacute; bao h&agrave;m v&agrave;o một phong c&aacute;ch m&agrave; lu&ocirc;n thể hiện sự đa dạng v&agrave; mới mẻ qua từng bộ sưu tập. Đ&acirc;y cũng l&agrave; một Local Brand Việt kh&aacute; năng động trong việc ra mắt những sản phẩm mới.&nbsp;V&agrave; d&ugrave; sở hữu một danh s&aacute;ch d&agrave;i c&aacute;c item kh&aacute;c nhau nhưng chất lượng của ClownZ vẫn lu&ocirc;n được duy tr&igrave; v&agrave; đ&aacute;nh gi&aacute; tốt bởi giới mộ điệu.</p>

<p><a href="https://www.elleman.vn/wp-content/uploads/2018/09/05/local-brand-viet-nam-ClownZ-elle-man-2.jpg" rel="fancy_gallery"><img alt="local brand viet nam - ClownZ - elle man 2" src="https://www.elleman.vn/wp-content/uploads/2018/09/05/local-brand-viet-nam-ClownZ-elle-man-2.jpg" style="height:1365px; width:2048px" /></a></p>

<p>Ảnh: ClownZ</p>

<p><a href="https://www.elleman.vn/wp-content/uploads/2018/09/05/local-brand-viet-nam-ClownZ-elle-man-3.jpg" rel="fancy_gallery"><img alt="local brand viet nam - ClownZ - elle man 3" src="https://www.elleman.vn/wp-content/uploads/2018/09/05/local-brand-viet-nam-ClownZ-elle-man-3.jpg" style="height:960px; width:960px" /></a></p>

<p>Ảnh: ClownZ</p>

<h2><strong>5. Nirvana</strong></h2>

<p><a href="https://www.elleman.vn/wp-content/uploads/2018/09/05/local-brand-viet-nam-Nirvana-elle-man-1.jpg" rel="fancy_gallery"><img alt="local brand viet nam - Nirvana - elle man 1" src="https://www.elleman.vn/wp-content/uploads/2018/09/05/local-brand-viet-nam-Nirvana-elle-man-1.jpg" style="height:1322px; width:1983px" /></a></p>

<p>Ảnh: Nirvana</p>

<p>Kh&aacute;c biệt ho&agrave;n to&agrave;n với cả bốn Local Brand Việt tr&ecirc;n, Nirvana l&agrave; một nh&acirc;n tố nổi loạn trong l&agrave;ng thời trang H&agrave; Nội.&nbsp;Thừa hưởng phong c&aacute;ch của hai nh&agrave; s&aacute;ng lập nổi tiếng trong giới nghệ thuật l&agrave; Phương Vũ v&agrave; Plastic, những sản phẩm của Nirvana đều mang hơi hướng nghệ thuật v&agrave; c&oacute; phần dị biệt.</p>

<p><a href="https://www.elleman.vn/wp-content/uploads/2018/09/05/local-brand-viet-nam-Nirvana-elle-man-2.jpg" rel="fancy_gallery"><img alt="local brand viet nam - Nirvana - elle man 2" src="https://www.elleman.vn/wp-content/uploads/2018/09/05/local-brand-viet-nam-Nirvana-elle-man-2.jpg" style="height:1149px; width:1722px" /></a></p>

<p>Ảnh: Nirvana</p>

<p><a href="https://www.elleman.vn/wp-content/uploads/2018/09/05/local-brand-viet-nam-Nirvana-elle-man-3.jpg" rel="fancy_gallery"><img alt="local brand viet nam - Nirvana - elle man 3" src="https://www.elleman.vn/wp-content/uploads/2018/09/05/local-brand-viet-nam-Nirvana-elle-man-3.jpg" style="height:1365px; width:2048px" /></a></p>

<p>Ảnh: Nirvana</p>

<p>Kh&ocirc;ng phải ai cũng c&oacute; thể cảm nhận r&otilde; r&agrave;ng những th&ocirc;ng điệp cũng như c&aacute;i chất trong c&aacute;c sản phẩm của Nirvana, nhưng đ&oacute; cũng ch&iacute;nh l&agrave; điều tạo n&ecirc;n sự đặc biệt của thương hiệu n&agrave;y.&nbsp;Kh&ocirc;ng chỉ vậy, Nirvana c&ograve;n nổi tiếng v&agrave; g&acirc;y được nhiều tiếng vang trong cộng đồng thời trang với những video nổi loạn, đậm chất &ldquo;đi&ecirc;n&rdquo; của những founder s&aacute;ng lập n&ecirc;n thương hiệu.</p>
', CAST(N'2018-04-11' AS Date), 1, N'images/local-brand-viet-nam-Nirvana-elle-man-2.jpg', 19, 1)
INSERT [dbo].[tbl_TinTuc] ([id], [tieuDe], [tomtat], [noidung], [ngayviet], [id_nhanvien], [urlHinhAnh], [LuotXem], [Active]) VALUES (13, N'2 mẫu giày lấy cảm hứng từ CR7 chưa lên kệ đã cháy hàng', N'', N'<h2>Kh&ocirc;ng thể phủ nhận Cristiano Ronaldo l&agrave; một cầu thủ thuộc top đầu thế giới, v&agrave; dĩ nhi&ecirc;n l&agrave; Nike lu&ocirc;n c&oacute; phần cưng chiều anh ch&agrave;ng với những sản phẩm đặc biệt d&agrave;nh ri&ecirc;ng cho CR7.</h2>

<p><a href="http://www.facebook.com/fan24h" target="_blank" title="Chia sẻ trên Fanpage"><img alt="Chia sẻ trên Fanpage" src="https://cdn.24h.com.vn/images/2014/icon_24h_2018.png" /></a>&nbsp;<a href="javascript:void(0);" onclick="javascript:window.open(''https://www.facebook.com/sharer/sharer.php?u=https%3A%2F%2Fwww.24h.com.vn%2Fthoi-trang%2F2-mau-giay-lay-cam-hung-tu-cr7-chua-len-ke-da-chay-hang-c78a1002259.html'', '''', ''menubar=no, toolbar=no, resizable=yes, scrollbars=yes, height=600, width=600'');return false;" title="Chia sẻ bài viết này trên Facebook"><img alt="Chia sẻ bài viết này trên trên Facebook" src="https://cdn.24h.com.vn/images/2014/icon_fb50_2018.png" /></a>&nbsp;<a href="javascript:void(0);" onclick="javascript:window.open(''https://plus.google.com/share?url=https%3A%2F%2Fwww.24h.com.vn%2Fthoi-trang%2F2-mau-giay-lay-cam-hung-tu-cr7-chua-len-ke-da-chay-hang-c78a1002259.html'', '''', ''menubar=no, toolbar=no, resizable=yes, scrollbars=yes, height=600, width=600'');return false;" title="Chia sẻ bài viết này trên G+"><img alt="Chia sẻ bài viết này trên trên G+" src="https://cdn.24h.com.vn/images/2014/icon_gg50_2018.png" /></a></p>

<p><img alt="2 mẫu giày lấy cảm hứng từ CR7 chưa lên kệ đã cháy hàng - 1" src="https://cdn.24h.com.vn/upload/4-2018/images/2018-11-03/1541216295-115-3-mau-giay-lay-cam-hung-tu-cr7-chua-len-ke-da-chay-hang-untitled-1541124559-width550height682.jpg" /></p>

<p>CR7 v&agrave; đ&ocirc;i EXP- X14 tại một địa danh nổi tiếng của Trung Quốc.</p>

<p><strong>Nike EXP-X14 CR7</strong></p>

<p>Phi&ecirc;n bản Nike EXP-X14 CR7 đặc biệt của Cristiano&nbsp;<a href="https://www.24h.com.vn/cristiano-ronaldo-c48e4384.html" title="Ronaldo">Ronaldo</a>.&nbsp;Sau khi c&ugrave;ng đội tuyển Bồ Đ&agrave;o Nha tham gia thi đấu ở World Cup 2018, CR7 đ&atilde; chuyển qua đ&aacute; cho clb Juventus. C&ugrave;ng với đ&oacute;, anh tới Trung Quốc để quảng b&aacute; cho gi&agrave;y thể thao mang t&ecirc;n m&igrave;nh, phi&ecirc;n bản Nike EXP-X14 giới hạn.</p>

<p>Nike đ&atilde; thiết kế một phi&ecirc;n bản EXP-X14&nbsp;&ldquo;CR7&rdquo; giới hạn v&agrave;&nbsp;thể hiện r&otilde; tinh thần Trung Quốc.&nbsp;Phi&ecirc;n bản gi&agrave;y chạy k&egrave;m lifestyle t&acirc;n binh n&agrave;y vừa được ra mắt kh&ocirc;ng l&acirc;u v&agrave; ngay lập tức g&acirc;y được sự ch&uacute; &yacute; nhờ kiểu d&aacute;ng hiện đại c&ugrave;ng những c&ocirc;ng nghệ ti&ecirc;n tiến đi k&egrave;m. T&ocirc;ng m&agrave;u chủ đạo l&agrave; trắng bao phủ to&agrave;n gi&agrave;y với độ trẻ trung, những chi tiết nổi bật kh&aacute;c l&agrave; m&agrave;u đỏ ở lỗ xỏ d&acirc;y v&agrave; miếng l&oacute;t insole, dấu logo Swoosh v&agrave;ng v&agrave; cả dấu logo CR7.</p>

<p>Cuối c&ugrave;ng họa tiết ch&uacute; rồng dưới g&oacute;t gi&agrave;y để ghi dấu ấn Trung hoa với cảm hứng đậm chất &Aacute; đ&ocirc;ng.</p>

<p><strong>Air Max 97 &ldquo;CR7&rdquo;</strong></p>

<p><img alt="2 mẫu giày lấy cảm hứng từ CR7 chưa lên kệ đã cháy hàng - 2" src="https://cdn.24h.com.vn/upload/4-2018/images/2018-11-03/1541216295-377-3-mau-giay-lay-cam-hung-tu-cr7-chua-len-ke-da-chay-hang-media-1541124559-width550height687.jpg" /></p>

<p>Mẫu gi&agrave;y được lấy cảm hứng từ đất nước Bồ Đ&agrave;o Nha - qu&ecirc; hương của CR7. T&ocirc;ng m&agrave;u ch&iacute;nh l&agrave; cảm nhận mang lại sự dễ chịu đầu ti&ecirc;n cho người nh&igrave;n, đỏ v&agrave; v&agrave;ng đồng. Đế gi&agrave;y m&agrave;u trắng độn cao tầm 5cm, đ&acirc;y l&agrave; mẫu gi&agrave;y thể thao thời trang kh&ocirc;ng phải gi&agrave;y thi đấu.</p>

<p>D&ugrave; chưa ni&ecirc;m yết mức gi&aacute; ch&iacute;nh x&aacute;c nhưng đ&atilde; c&oacute; rất nhiều người mong muốn được sở hữu mẫu gi&agrave;y n&agrave;y. Bởi, ngo&agrave;i t&igrave;nh y&ecirc;u với danh thủ h&agrave;ng đầu thế giới th&igrave; đ&ocirc;i gi&agrave;y kh&aacute; đẹp mắt v&agrave; trẻ trung, ph&ugrave; hợp với thị hiếu phần lớn c&aacute;c t&iacute;n đồ sneaker.</p>

<p><img alt="2 mẫu giày lấy cảm hứng từ CR7 chưa lên kệ đã cháy hàng - 3" src="https://cdn.24h.com.vn/upload/4-2018/images/2018-11-03/1541216296-387-3-mau-giay-lay-cam-hung-tu-cr7-chua-len-ke-da-chay-hang-dmrek7ixkaanrei-1541124559-width550height733.jpg" /></p>

<p>Mẫu gi&agrave;y được c&aacute;c t&iacute;n đồ sneaker khao kh&aacute;t.</p>

<p>Chỉ t&iacute;nh trong năm 2018, CR7 đ&atilde; cho ra mắt 2 d&ograve;ng gi&agrave;y v&agrave; số tiền anh thu lại được từ việc trở th&agrave;nh gương mặt thương hiệu cho &quot;&ocirc;ng lớn&quot; Nike quả thực đếm kh&ocirc;ng xuể. Sự kết hợp từ t&ecirc;n tuổi của một người c&oacute; sức ảnh hưởng lớn cộng đồng v&agrave; 1 thương hiệu thời trang ch&iacute;nh l&agrave; c&ocirc;ng thức tăng doanh thu m&agrave; nhiều thương hiệu đang &aacute;p dụng.&nbsp;</p>
', CAST(N'2018-11-03' AS Date), 1, N'images/cr7.jpg', 3, 1)
SET IDENTITY_INSERT [dbo].[tbl_TinTuc] OFF
SET IDENTITY_INSERT [dbo].[tblQuangCao] ON 

INSERT [dbo].[tblQuangCao] ([id], [urlImage], [Active], [Count_Click]) VALUES (1, N'images/banner-thu-dong-2016_web3197_905x345.jpg', 0, NULL)
INSERT [dbo].[tblQuangCao] ([id], [urlImage], [Active], [Count_Click]) VALUES (2, N'images/bn1.png', 1, 11)
INSERT [dbo].[tblQuangCao] ([id], [urlImage], [Active], [Count_Click]) VALUES (3, N'images/bn4.jpg', 1, 3)
INSERT [dbo].[tblQuangCao] ([id], [urlImage], [Active], [Count_Click]) VALUES (4, N'images/bn5.jpg', 1, 30)
INSERT [dbo].[tblQuangCao] ([id], [urlImage], [Active], [Count_Click]) VALUES (5, N'Qu?n dài', NULL, NULL)
SET IDENTITY_INSERT [dbo].[tblQuangCao] OFF
ALTER TABLE [dbo].[tbl_ChiTietDatHang]  WITH CHECK ADD  CONSTRAINT [FK_tbl_ChiTietDatHang_tbl_Hang] FOREIGN KEY([id_hang])
REFERENCES [dbo].[tbl_Hang] ([id])
GO
ALTER TABLE [dbo].[tbl_ChiTietDatHang] CHECK CONSTRAINT [FK_tbl_ChiTietDatHang_tbl_Hang]
GO
ALTER TABLE [dbo].[tbl_ChiTietDatHang]  WITH CHECK ADD  CONSTRAINT [FK_tbl_ChiTietHoaDon_tbl_HoaDon] FOREIGN KEY([id_hoadon])
REFERENCES [dbo].[tbl_DatHang] ([id])
GO
ALTER TABLE [dbo].[tbl_ChiTietDatHang] CHECK CONSTRAINT [FK_tbl_ChiTietHoaDon_tbl_HoaDon]
GO
ALTER TABLE [dbo].[tbl_DatHang]  WITH CHECK ADD  CONSTRAINT [FK_tbl_DatHang_PayMeThod] FOREIGN KEY([IdPay])
REFERENCES [dbo].[PayMeThod] ([IdPay])
GO
ALTER TABLE [dbo].[tbl_DatHang] CHECK CONSTRAINT [FK_tbl_DatHang_PayMeThod]
GO
ALTER TABLE [dbo].[tbl_DatHang]  WITH CHECK ADD  CONSTRAINT [FK_tbl_DatHang_tbl_KhachHang] FOREIGN KEY([id_KhachHang])
REFERENCES [dbo].[tbl_KhachHang] ([id])
GO
ALTER TABLE [dbo].[tbl_DatHang] CHECK CONSTRAINT [FK_tbl_DatHang_tbl_KhachHang]
GO
ALTER TABLE [dbo].[tbl_Hang]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Hang_tbl_Menu] FOREIGN KEY([id_Menu])
REFERENCES [dbo].[tbl_NhomHang] ([id])
GO
ALTER TABLE [dbo].[tbl_Hang] CHECK CONSTRAINT [FK_tbl_Hang_tbl_Menu]
GO
ALTER TABLE [dbo].[tbl_NhanVien]  WITH CHECK ADD  CONSTRAINT [FK_tbl_NhanVien_tbl_Quyen] FOREIGN KEY([id_quyen])
REFERENCES [dbo].[tbl_Quyen] ([id])
GO
ALTER TABLE [dbo].[tbl_NhanVien] CHECK CONSTRAINT [FK_tbl_NhanVien_tbl_Quyen]
GO
ALTER TABLE [dbo].[tbl_PhieuNhap]  WITH CHECK ADD  CONSTRAINT [FK_tbl_PhieuNhap_tbl_NhaCungCap] FOREIGN KEY([id_NCC])
REFERENCES [dbo].[tbl_NhaCungCap] ([id])
GO
ALTER TABLE [dbo].[tbl_PhieuNhap] CHECK CONSTRAINT [FK_tbl_PhieuNhap_tbl_NhaCungCap]
GO
ALTER TABLE [dbo].[tbl_PhieuNhap]  WITH CHECK ADD  CONSTRAINT [FK_tbl_PhieuNhap_tbl_NhanVien] FOREIGN KEY([id_nhanvien])
REFERENCES [dbo].[tbl_NhanVien] ([id])
GO
ALTER TABLE [dbo].[tbl_PhieuNhap] CHECK CONSTRAINT [FK_tbl_PhieuNhap_tbl_NhanVien]
GO
ALTER TABLE [dbo].[tbl_TinTuc]  WITH CHECK ADD  CONSTRAINT [FK_tbl_TinTuc_tbl_NhanVien] FOREIGN KEY([id_nhanvien])
REFERENCES [dbo].[tbl_NhanVien] ([id])
GO
ALTER TABLE [dbo].[tbl_TinTuc] CHECK CONSTRAINT [FK_tbl_TinTuc_tbl_NhanVien]
GO
/****** Object:  StoredProcedure [dbo].[sp_ChiTietDatHang_getByTop]    Script Date: 1/16/2019 1:32:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ChiTietDatHang_getByTop]
@Top	nvarchar(10),
@Where	nvarchar(MAX),
@Order	nvarchar(200)
AS
	Declare @SQL as nvarchar(500)
	Declare @strTop as nvarchar(100)
	Select @strTop = '(' + @Top + ')'
	if len(@Top) = 0 
		BEGIN
			Select @strTop = '100 percent'
		END
	Select @SQL = 'SELECT top ' + @strTop + ' * FROM [tbl_ChiTietDatHang]'
	if len(@Where) >0 
		BEGIN
			Select @SQL = @SQL + ' Where ' + @Where
		END
	if len(@Order) >0
		BEGIN
			Select @SQL = @SQL + ' Order by ' + @Order
		END
	EXEC (@SQL)

GO
/****** Object:  StoredProcedure [dbo].[sp_ChiTietDatHang_Insert]    Script Date: 1/16/2019 1:32:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ChiTietDatHang_Insert]
	@id_hoadon int,
	@id_hang int,
	@SoLuongMua int,
	@ThanhTien money,
	@Size char(10),
	@Gia money
AS
BEGIN
	insert into tbl_ChiTietDatHang(id_hoadon,id_hang,SoLuongMua,ThanhTien,Size,Gia) 
	values(@id_hoadon,@id_hang,@SoLuongMua,@ThanhTien,@Size,@Gia)
END

GO
/****** Object:  StoredProcedure [dbo].[sp_ChiTietDatHang_Update]    Script Date: 1/16/2019 1:32:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	CREATE PROCEDURE [dbo].[sp_ChiTietDatHang_Update]
	@id_hoadon int,
	@id_hang int,
	@SoLuongMua int,
	@ThanhTien money,
	@Size char(10),
	@Gia money
AS
BEGIN
	update tbl_ChiTietDatHang set SoLuongMua = @SoLuongMua, ThanhTien = @ThanhTien,
	Size=@Size,Gia=@Gia
	where id_hoadon = @id_hoadon and id_hang=@id_hang
END


GO
/****** Object:  StoredProcedure [dbo].[sp_DatHang_getByTop]    Script Date: 1/16/2019 1:32:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_DatHang_getByTop]
@Top	nvarchar(10),
@Where	nvarchar(MAX),
@Order	nvarchar(200)
AS
	Declare @SQL as nvarchar(500)
	Declare @strTop as nvarchar(100)
	Select @strTop = '(' + @Top + ')'
	if len(@Top) = 0 
		BEGIN
			Select @strTop = '100 percent'
		END
	Select @SQL = 'SELECT top ' + @strTop + ' * FROM [tbl_DatHang]'
	if len(@Where) >0 
		BEGIN
			Select @SQL = @SQL + ' Where ' + @Where
		END
	if len(@Order) >0
		BEGIN
			Select @SQL = @SQL + ' Order by ' + @Order
		END
	EXEC (@SQL)

GO
/****** Object:  StoredProcedure [dbo].[sp_DatHang_Insert]    Script Date: 1/16/2019 1:32:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_DatHang_Insert]
	@NgaylapHD date,
	@id_KhachHang int,
	@IdPay int

AS
BEGIN
	insert into tbl_DatHang(NgaylapHD,id_KhachHang,IdPay) 
	values(@NgaylapHD,@id_KhachHang,@IdPay)
END

GO
/****** Object:  StoredProcedure [dbo].[sp_DatHang_Update]    Script Date: 1/16/2019 1:32:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[sp_DatHang_Update]
	@NgaylapHD date,
	@id_KhachHang int,
	@IdPay int,
	@id int
AS
BEGIN
	update tbl_KhachHang set @NgaylapHD = @NgaylapHD, @id_KhachHang = @id_KhachHang, @IdPay = @IdPay
	
	where id = @id
END


GO
/****** Object:  StoredProcedure [dbo].[sp_Hang_Delete]    Script Date: 1/16/2019 1:32:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_Hang_Delete]
	@id int
AS
BEGIN
	delete from tbl_Hang where id=@id
END

GO
/****** Object:  StoredProcedure [dbo].[sp_Hang_getByTop]    Script Date: 1/16/2019 1:32:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_Hang_getByTop]
@Top	nvarchar(10),
@Where	nvarchar(MAX),
@Order	nvarchar(200)
AS
	Declare @SQL as nvarchar(500)
	Declare @strTop as nvarchar(100)
	Select @strTop = '(' + @Top + ')'
	if len(@Top) = 0 
		BEGIN
			Select @strTop = '100 percent'
		END
	Select @SQL = 'SELECT top ' + @strTop + ' [id],[TenHang],[image],[ChatLieu],[Mota],ISNULL([LuotXem],0) as [LuotXem] ,CONVERT(DECIMAL(18,0),[giaMoi])as [giaMoi],CONVERT(DECIMAL(18,0),[giaCu])as [giaCu] ,[id_Menu],[Soluong],[TinhTrang],[Active],[image_large],TomTat FROM [tbl_Hang]'
	if len(@Where) >0 
		BEGIN
			Select @SQL = @SQL + ' Where ' + @Where
		END
	if len(@Order) >0
		BEGIN
			Select @SQL = @SQL + ' Order by ' + @Order
		END
	EXEC (@SQL)

GO
/****** Object:  StoredProcedure [dbo].[sp_Hang_Insert]    Script Date: 1/16/2019 1:32:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_Hang_Insert]
	@TenHang nvarchar(50),
	@TomTat nvarchar(MAX),
	@Mota ntext,
	@image nvarchar(MAX),
	@ChatLieu nvarchar(50),
	@giaMoi money,
	@giaCu money,
	@id_Menu int,
	@Soluong int,
	@Active bit,
	@image_large varchar(500)
AS
BEGIN
	insert into tbl_Hang(TenHang,TomTat,Mota,[image],ChatLieu,giaMoi,giaCu,id_Menu,Soluong,Active,image_large) values(@TenHang,@TomTat,@Mota,@image,@ChatLieu,@giaMoi,@giaCu,@id_Menu,@Soluong,@Active,@image_large)
END

GO
/****** Object:  StoredProcedure [dbo].[sp_Hang_Update]    Script Date: 1/16/2019 1:32:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[sp_Hang_Update]
	@id int,
	@TenHang nvarchar(50),
	@TomTat nvarchar(MAX),
	@Mota ntext,
	@image nvarchar(MAX),
	@ChatLieu nvarchar(50),
	@giaMoi money,
	@giaCu money,
	@id_Menu int,
	@Soluong int,
	@Active bit,
	@image_large varchar(500)
AS
BEGIN
	update tbl_Hang set TenHang = @TenHang, TomTat = @TomTat, Mota = @Mota
	,[image]=@image,ChatLieu=@ChatLieu,giaMoi=@giaMoi,giaCu=@giaCu,id_Menu=@id_Menu,
	Soluong=@Soluong,Active=@Active,image_large=@image_large
	
	where id = @id
END


GO
/****** Object:  StoredProcedure [dbo].[sp_HinhThucThanhToan_getByTop]    Script Date: 1/16/2019 1:32:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_HinhThucThanhToan_getByTop]
@Top	nvarchar(10),
@Where	nvarchar(MAX),
@Order	nvarchar(200)
AS
	Declare @SQL as nvarchar(500)
	Declare @strTop as nvarchar(100)
	Select @strTop = '(' + @Top + ')'
	if len(@Top) = 0 
		BEGIN
			Select @strTop = '100 percent'
		END
	Select @SQL = 'SELECT top ' + @strTop + ' * FROM [PayMeThod]'
	if len(@Where) >0 
		BEGIN
			Select @SQL = @SQL + ' Where ' + @Where
		END
	if len(@Order) >0
		BEGIN
			Select @SQL = @SQL + ' Order by ' + @Order
		END
	EXEC (@SQL)

GO
/****** Object:  StoredProcedure [dbo].[sp_KhachHang_Delete]    Script Date: 1/16/2019 1:32:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_KhachHang_Delete]
	@id int
AS
BEGIN
	delete from tbl_KhachHang where id=@id
END

GO
/****** Object:  StoredProcedure [dbo].[sp_KhachHang_getByTop]    Script Date: 1/16/2019 1:32:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_KhachHang_getByTop]
@Top	nvarchar(10),
@Where	nvarchar(MAX),
@Order	nvarchar(200)
AS
	Declare @SQL as nvarchar(500)
	Declare @strTop as nvarchar(100)
	Select @strTop = '(' + @Top + ')'
	if len(@Top) = 0 
		BEGIN
			Select @strTop = '100 percent'
		END
	Select @SQL = 'SELECT top ' + @strTop + ' id,tenKH,GioiTinh,convert(varchar,NgaySinh,120) as NgaySinh,TaiKhoan,MatKhau,Email,Tinh,Quan, SDT,TinhTrang,DiaChi,Link_Fb FROM [tbl_KhachHang]'
	if len(@Where) >0 
		BEGIN
			Select @SQL = @SQL + ' Where ' + @Where
		END
	if len(@Order) >0
		BEGIN
			Select @SQL = @SQL + ' Order by ' + @Order
		END
	EXEC (@SQL)


GO
/****** Object:  StoredProcedure [dbo].[sp_KhachHang_Insert]    Script Date: 1/16/2019 1:32:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_KhachHang_Insert]
	@tenKH nvarchar(50),
	@GioiTinh bit,
	@NgaySinh date,
	@TaiKhoan nvarchar(50),
	@MatKhau nvarchar(50),
	@Email nvarchar(50),
	@SDT char(10),
	@Tinh nvarchar(50),
	@Quan nvarchar(50),
	@DiaChi ntext,
	@Link_Fb varchar(200)
AS
BEGIN
	insert into tbl_KhachHang(tenKH,GioiTinh,NgaySinh,TaiKhoan,MatKhau,Email,SDT,Tinh,Quan,DiaChi,Link_Fb) values(@tenKH,@GioiTinh,@NgaySinh,@TaiKhoan,@MatKhau,@Email,@SDT,@Tinh,@Quan,@DiaChi,@Link_Fb)
END

GO
/****** Object:  StoredProcedure [dbo].[sp_KhachHang_Update]    Script Date: 1/16/2019 1:32:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	CREATE PROCEDURE [dbo].[sp_KhachHang_Update]
	@id int,
	@tenKH nvarchar(50),
	@GioiTinh bit,
	@NgaySinh date,
	@MatKhau nvarchar(50),
	@Email nvarchar(50),
	@SDT char(10),
	@Tinh nvarchar(50),
	@Quan nvarchar(50),
	@DiaChi ntext
AS
BEGIN
	update tbl_KhachHang set tenKH = @tenKH, GioiTinh = @GioiTinh, NgaySinh = @NgaySinh, MatKhau = @MatKhau,
	Email=@Email,SDT=@SDT,Tinh=@Tinh,Quan=@Quan,DiaChi=@DiaChi
	where id = @id
END

GO
/****** Object:  StoredProcedure [dbo].[sp_KhachHangDatHang_Update]    Script Date: 1/16/2019 1:32:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	CREATE PROCEDURE [dbo].[sp_KhachHangDatHang_Update]
	@id int,
	@tenKH nvarchar(50),
	@Email nvarchar(50),
	@SDT char(10),
	@Tinh nvarchar(50),
	@Quan nvarchar(50),
	@DiaChi ntext
AS
BEGIN
	update tbl_KhachHang set tenKH = @tenKH, 
	Email=@Email,SDT=@SDT,Tinh=@Tinh,Quan=@Quan,DiaChi=@DiaChi
	where id = @id
END


GO
/****** Object:  StoredProcedure [dbo].[sp_KhuyenMai_getByTop]    Script Date: 1/16/2019 1:32:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_KhuyenMai_getByTop]
@Top	nvarchar(10),
@Where	nvarchar(MAX),
@Order	nvarchar(200)
AS
	Declare @SQL as nvarchar(500)
	Declare @strTop as nvarchar(100)
	Select @strTop = '(' + @Top + ')'
	if len(@Top) = 0 
		BEGIN
			Select @strTop = '100 percent'
		END
	Select @SQL = 'SELECT top ' + @strTop + ' * FROM [tbl_KhuyenMai]'
	if len(@Where) >0 
		BEGIN
			Select @SQL = @SQL + ' Where ' + @Where
		END
	if len(@Order) >0
		BEGIN
			Select @SQL = @SQL + ' Order by ' + @Order
		END
	EXEC (@SQL)

GO
/****** Object:  StoredProcedure [dbo].[sp_LienLac_getByTop]    Script Date: 1/16/2019 1:32:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_LienLac_getByTop]
@Top	nvarchar(10),
@Where	nvarchar(MAX),
@Order	nvarchar(200)
AS
	Declare @SQL as nvarchar(500)
	Declare @strTop as nvarchar(100)
	Select @strTop = '(' + @Top + ')'
	if len(@Top) = 0 
		BEGIN
			Select @strTop = '100 percent'
		END
	Select @SQL = 'SELECT top ' + @strTop + ' * FROM [tbl_LienLac]'
	if len(@Where) >0 
		BEGIN
			Select @SQL = @SQL + ' Where ' + @Where
		END
	if len(@Order) >0
		BEGIN
			Select @SQL = @SQL + ' Order by ' + @Order
		END
	EXEC (@SQL)

GO
/****** Object:  StoredProcedure [dbo].[sp_LienLac_Insert]    Script Date: 1/16/2019 1:32:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_LienLac_Insert]
	@Ten nvarchar(50),
	@DiaChi ntext,
	@DienThoai char(10),
	@Email varchar(50),
	@ChuDe nvarchar(50),
	@NoiDung ntext

AS
BEGIN
	insert into tbl_LienLac(Ten,DiaChi,DienThoai,Email,ChuDe,NoiDung) 
	values(@Ten,@DiaChi,@DienThoai,@Email,@ChuDe,@NoiDung) 
END

GO
/****** Object:  StoredProcedure [dbo].[sp_NhanVien_getByTop]    Script Date: 1/16/2019 1:32:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_NhanVien_getByTop]
@Top	nvarchar(10),
@Where	nvarchar(MAX),
@Order	nvarchar(200)
AS
	Declare @SQL as nvarchar(500)
	Declare @strTop as nvarchar(100)
	Select @strTop = '(' + @Top + ')'
	if len(@Top) = 0 
		BEGIN
			Select @strTop = '100 percent'
		END
	Select @SQL = 'SELECT top ' + @strTop + ' * FROM tbl_NhanVien'
	if len(@Where) >0 
		BEGIN
			Select @SQL = @SQL + ' Where ' + @Where
		END
	if len(@Order) >0
		BEGIN
			Select @SQL = @SQL + ' Order by ' + @Order
		END
	EXEC (@SQL)


GO
/****** Object:  StoredProcedure [dbo].[sp_NhomHang_getByTop]    Script Date: 1/16/2019 1:32:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_NhomHang_getByTop]
@Top	nvarchar(10),
@Where	nvarchar(MAX),
@Order	nvarchar(200)
AS
	Declare @SQL as nvarchar(500)
	Declare @strTop as nvarchar(100)
	Select @strTop = '(' + @Top + ')'
	if len(@Top) = 0 
		BEGIN
			Select @strTop = '100 percent'
		END
	Select @SQL = 'SELECT top ' + @strTop + ' * FROM [tbl_NhomHang]'
	if len(@Where) >0 
		BEGIN
			Select @SQL = @SQL + ' Where ' + @Where
		END
	if len(@Order) >0
		BEGIN
			Select @SQL = @SQL + ' Order by ' + @Order
		END
	EXEC (@SQL)

GO
/****** Object:  StoredProcedure [dbo].[sp_QuangCao_Count_Update]    Script Date: 1/16/2019 1:32:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	CREATE PROCEDURE [dbo].[sp_QuangCao_Count_Update]
	@id int

AS
BEGIN
	declare @get_Click int=(Select Count_Click from tblQuangCao where id=@id)
	if(@get_Click is null)
		update tblQuangCao set Count_Click=1 where id = @id	
	else		
		update tblQuangCao set Count_Click=Count_Click+1 where id = @id
	

END

GO
/****** Object:  StoredProcedure [dbo].[sp_QuangCao_getByTop]    Script Date: 1/16/2019 1:32:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_QuangCao_getByTop]
@Top	nvarchar(10),
@Where	nvarchar(MAX),
@Order	nvarchar(200)
AS
	Declare @SQL as nvarchar(500)
	Declare @strTop as nvarchar(100)
	Select @strTop = '(' + @Top + ')'
	if len(@Top) = 0 
		BEGIN
			Select @strTop = '100 percent'
		END
	Select @SQL = 'SELECT top ' + @strTop + ' * FROM [tblQuangCao]'
	if len(@Where) >0 
		BEGIN
			Select @SQL = @SQL + ' Where ' + @Where
		END
	if len(@Order) >0
		BEGIN
			Select @SQL = @SQL + ' Order by ' + @Order
		END
	EXEC (@SQL)


GO
/****** Object:  StoredProcedure [dbo].[sp_QuanLyMeNu_Delete]    Script Date: 1/16/2019 1:32:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_QuanLyMeNu_Delete]
	@ID int
AS
BEGIN
	delete from tbl_QuanLyMeNu where ID=@ID
END

GO
/****** Object:  StoredProcedure [dbo].[sp_QuanLyMeNu_getByTop]    Script Date: 1/16/2019 1:32:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_QuanLyMeNu_getByTop]
@Top	nvarchar(10),
@Where	nvarchar(MAX),
@Order	nvarchar(200)
AS
	Declare @SQL as nvarchar(500)
	Declare @strTop as nvarchar(100)
	Select @strTop = '(' + @Top + ')'
	if len(@Top) = 0 
		BEGIN
			Select @strTop = '100 percent'
		END
	Select @SQL = 'SELECT top ' + @strTop + ' * FROM [tbl_QuanLyMeNu]'
	if len(@Where) >0 
		BEGIN
			Select @SQL = @SQL + ' Where ' + @Where
		END
	if len(@Order) >0
		BEGIN
			Select @SQL = @SQL + ' Order by ' + @Order
		END
	EXEC (@SQL)


GO
/****** Object:  StoredProcedure [dbo].[sp_QuanLyMeNu_Insert]    Script Date: 1/16/2019 1:32:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_QuanLyMeNu_Insert]
	@TenMenu nvarchar(50),
	@Type int,
	@Ord int,
	@Level nvarchar(50),
	@Link nvarchar(500),
	@TypeClick nvarchar(50),
	@Icon nvarchar(250),
	@Active bit
AS
BEGIN
	insert into tbl_QuanLyMeNu(TenMenu,[Type],Ord,[Level],Link,TypeClick,Icon,Active) values(@TenMenu,@Type,@Ord,@Level,@Link,@TypeClick,@Icon,@Active)
END

GO
/****** Object:  StoredProcedure [dbo].[sp_QuanLyMeNu_Update]    Script Date: 1/16/2019 1:32:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	CREATE PROCEDURE [dbo].[sp_QuanLyMeNu_Update]
	@id int,
	@TenMenu nvarchar(50),
	@Type int,
	@Ord int,
	@Level nvarchar(50),
	@Link nvarchar(500),
	@TypeClick nvarchar(50),
	@Icon nvarchar(250),
	@Active bit
AS
BEGIN
	update tbl_QuanLyMeNu set TenMenu = @TenMenu, [Type] = @Type, Ord = @Ord, [Level] = @Level,
	Link=@Link,TypeClick=@TypeClick,Icon=@Icon,Active=@Active
	where id = @id
END

GO
/****** Object:  StoredProcedure [dbo].[sp_SanPhamView_Update]    Script Date: 1/16/2019 1:32:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	CREATE PROCEDURE [dbo].[sp_SanPhamView_Update]
	@id int

AS
BEGIN
	declare @get_LuotXem int=(Select LuotXem from tbl_Hang where id=@id)
	if(@get_LuotXem is null)
		update tbl_Hang set LuotXem=1 where id = @id
	else		
		update tbl_Hang set LuotXem=LuotXem+1 where id = @id
END

GO
/****** Object:  StoredProcedure [dbo].[sp_TinTuc_Delete]    Script Date: 1/16/2019 1:32:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_TinTuc_Delete]
	@id int
AS
BEGIN
	delete from tbl_TinTuc where id=@id
END

GO
/****** Object:  StoredProcedure [dbo].[sp_TinTuc_getByTop]    Script Date: 1/16/2019 1:32:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_TinTuc_getByTop]
@Top	nvarchar(10),
@Where	nvarchar(MAX),
@Order	nvarchar(200)
AS
	Declare @SQL as nvarchar(500)
	Declare @strTop as nvarchar(100)
	Select @strTop = '(' + @Top + ')'
	if len(@Top) = 0 
		BEGIN
			Select @strTop = '100 percent'
		END
	Select @SQL = 'SELECT top ' + @strTop + ' id,tieuDe,tomtat,noidung,convert(varchar,ngayviet,120) as ngayviet,id_nhanvien,urlHinhAnh,LuotXem,Active FROM [tbl_TinTuc]'
	if len(@Where) >0 
		BEGIN
			Select @SQL = @SQL + ' Where ' + @Where
		END
	if len(@Order) >0
		BEGIN
			Select @SQL = @SQL + ' Order by ' + @Order
		END
	EXEC (@SQL)


GO
/****** Object:  StoredProcedure [dbo].[sp_TinTuc_Insert]    Script Date: 1/16/2019 1:32:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_TinTuc_Insert]
	@tieuDe nvarchar(500),
	@tomtat ntext,
	@noidung ntext,
	@ngayviet date,
	@id_nhanvien int,
	@urlHinhAnh text,
	@Active bit
AS
BEGIN
	insert into tbl_TinTuc(tieuDe,tomtat,noidung,ngayviet,id_nhanvien,urlHinhAnh,Active) values(@tieuDe,@tomtat,@noidung,@ngayviet,@id_nhanvien,@urlHinhAnh,@Active)
END

GO
/****** Object:  StoredProcedure [dbo].[sp_TinTuc_Update]    Script Date: 1/16/2019 1:32:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	CREATE PROCEDURE [dbo].[sp_TinTuc_Update]
	@id int,
	@tieuDe nvarchar(500),
	@tomtat ntext,
	@noidung ntext,
	@ngayviet date,
	@id_nhanvien int,
	@urlHinhAnh text,
	@Active bit
AS
BEGIN
	update tbl_TinTuc set tieuDe = @tieuDe, tomtat = @tomtat, noidung = @noidung, ngayviet = @ngayviet,
	id_nhanvien=@id_nhanvien,urlHinhAnh=@urlHinhAnh,Active=@Active
	where id = @id
END

GO
/****** Object:  StoredProcedure [dbo].[sp_TinTucView_Update]    Script Date: 1/16/2019 1:32:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	CREATE PROCEDURE [dbo].[sp_TinTucView_Update]
	@id int

AS
BEGIN
	declare @get_LuotXem int=(Select LuotXem from tbl_TinTuc where id=@id)
	if(@get_LuotXem is null)
		update tbl_TinTuc set LuotXem=1 where id = @id	
	else		
		update tbl_TinTuc set LuotXem=LuotXem+1 where id = @id
	

END

GO
USE [master]
GO
ALTER DATABASE [Store_Fashion] SET  READ_WRITE 
GO
