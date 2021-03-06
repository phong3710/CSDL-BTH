USE [QLThueSach]
GO
/****** Object:  Table [dbo].[Sach]    Script Date: 03/18/2021 08:43:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Sach](
	[MaSach] [char](10) NOT NULL,
	[TenSach] [nvarchar](50) NULL,
	[TacGia] [nvarchar](50) NULL,
	[NXB] [nvarchar](50) NULL,
	[GiaMuaVao] [decimal](18, 2) NULL,
	[GhiChu] [nvarchar](max) NULL,
 CONSTRAINT [PK_Sach\] PRIMARY KEY CLUSTERED 
(
	[MaSach] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Sach] ([MaSach], [TenSach], [TacGia], [NXB], [GiaMuaVao], [GhiChu]) VALUES (N's01       ', N'CSDL', NULL, NULL, NULL, NULL)
/****** Object:  Table [dbo].[KhachHang]    Script Date: 03/18/2021 08:43:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachHang](
	[MaKH] [int] IDENTITY(1,1) NOT NULL,
	[TenKH] [nvarchar](100) NULL,
	[DiaChi] [nvarchar](100) NULL,
	[SDT] [nchar](12) NULL,
	[LoaiSachYeuThich] [nvarchar](100) NULL,
	[GhiChu] [nvarchar](max) NULL,
 CONSTRAINT [PK_KhachHang] PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[KhachHang] ON
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [SDT], [LoaiSachYeuThich], [GhiChu]) VALUES (1, N'Phong', NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[KhachHang] OFF
/****** Object:  Table [dbo].[ThueSach]    Script Date: 03/18/2021 08:43:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ThueSach](
	[MaKH] [int] NOT NULL,
	[MaSach] [char](10) NOT NULL,
	[NgayMuon] [datetime] NOT NULL,
	[SoTienThu] [decimal](8, 2) NULL,
	[GhiChu] [nvarchar](max) NULL,
 CONSTRAINT [PK_ThueSach] PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC,
	[MaSach] ASC,
	[NgayMuon] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[ThueSach] ([MaKH], [MaSach], [NgayMuon], [SoTienThu], [GhiChu]) VALUES (1, N's01       ', CAST(0x0000AB6000000000 AS DateTime), CAST(20000.00 AS Decimal(8, 2)), N'jjjj')
/****** Object:  ForeignKey [FK_ThueSach_KhachHang]    Script Date: 03/18/2021 08:43:41 ******/
ALTER TABLE [dbo].[ThueSach]  WITH CHECK ADD  CONSTRAINT [FK_ThueSach_KhachHang] FOREIGN KEY([MaKH])
REFERENCES [dbo].[KhachHang] ([MaKH])
GO
ALTER TABLE [dbo].[ThueSach] CHECK CONSTRAINT [FK_ThueSach_KhachHang]
GO
/****** Object:  ForeignKey [FK_ThueSach_Sach]    Script Date: 03/18/2021 08:43:41 ******/
ALTER TABLE [dbo].[ThueSach]  WITH CHECK ADD  CONSTRAINT [FK_ThueSach_Sach] FOREIGN KEY([MaSach])
REFERENCES [dbo].[Sach] ([MaSach])
GO
ALTER TABLE [dbo].[ThueSach] CHECK CONSTRAINT [FK_ThueSach_Sach]
GO
