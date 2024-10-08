USE [master]
GO
/****** Object:  Database [MicroserviciosUsuario]    Script Date: 3/10/2024 11:14:16 ******/
CREATE DATABASE [MicroserviciosUsuario]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MicroserviciosUsuario', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\MicroserviciosUsuario.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MicroserviciosUsuario_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\MicroserviciosUsuario_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [MicroserviciosUsuario] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MicroserviciosUsuario].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MicroserviciosUsuario] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MicroserviciosUsuario] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MicroserviciosUsuario] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MicroserviciosUsuario] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MicroserviciosUsuario] SET ARITHABORT OFF 
GO
ALTER DATABASE [MicroserviciosUsuario] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [MicroserviciosUsuario] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MicroserviciosUsuario] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MicroserviciosUsuario] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MicroserviciosUsuario] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MicroserviciosUsuario] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MicroserviciosUsuario] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MicroserviciosUsuario] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MicroserviciosUsuario] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MicroserviciosUsuario] SET  ENABLE_BROKER 
GO
ALTER DATABASE [MicroserviciosUsuario] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MicroserviciosUsuario] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MicroserviciosUsuario] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MicroserviciosUsuario] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MicroserviciosUsuario] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MicroserviciosUsuario] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MicroserviciosUsuario] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MicroserviciosUsuario] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [MicroserviciosUsuario] SET  MULTI_USER 
GO
ALTER DATABASE [MicroserviciosUsuario] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MicroserviciosUsuario] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MicroserviciosUsuario] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MicroserviciosUsuario] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MicroserviciosUsuario] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [MicroserviciosUsuario] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [MicroserviciosUsuario] SET QUERY_STORE = OFF
GO
USE [MicroserviciosUsuario]
GO
/****** Object:  Table [dbo].[Direccion]    Script Date: 3/10/2024 11:14:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Direccion](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[calle] [varchar](150) NOT NULL,
	[altura] [int] NOT NULL,
	[localidad_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Localidad]    Script Date: 3/10/2024 11:14:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Localidad](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](100) NOT NULL,
	[provincia_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Paquete]    Script Date: 3/10/2024 11:14:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Paquete](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[direccion1_id] [int] NULL,
	[direccion2_id] [int] NULL,
	[persona1_id] [int] NULL,
	[persona2_id] [int] NULL,
	[estado] [varchar](50) NULL,
	[precio] [decimal](10, 2) NULL,
 CONSTRAINT [PK__Paquete__3213E83F983ED5F6] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Persona]    Script Date: 3/10/2024 11:14:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Persona](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](100) NOT NULL,
	[apellido] [varchar](100) NOT NULL,
	[dni] [varchar](20) NOT NULL,
	[telefono] [varchar](20) NOT NULL,
	[email] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Provincia]    Script Date: 3/10/2024 11:14:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Provincia](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Direccion] ON 

INSERT [dbo].[Direccion] ([id], [calle], [altura], [localidad_id]) VALUES (1, N'Calleprueba', 123, 1)
INSERT [dbo].[Direccion] ([id], [calle], [altura], [localidad_id]) VALUES (2, N'Destinoprueba', 321, 2)
INSERT [dbo].[Direccion] ([id], [calle], [altura], [localidad_id]) VALUES (3, N'callea', 1234, 1)
INSERT [dbo].[Direccion] ([id], [calle], [altura], [localidad_id]) VALUES (4, N'aaaaa', 11, 1)
SET IDENTITY_INSERT [dbo].[Direccion] OFF
GO
SET IDENTITY_INSERT [dbo].[Localidad] ON 

INSERT [dbo].[Localidad] ([id], [nombre], [provincia_id]) VALUES (1, N'La Plata', 1)
INSERT [dbo].[Localidad] ([id], [nombre], [provincia_id]) VALUES (2, N'Mar del Plata', 1)
INSERT [dbo].[Localidad] ([id], [nombre], [provincia_id]) VALUES (3, N'San Isidro', 1)
INSERT [dbo].[Localidad] ([id], [nombre], [provincia_id]) VALUES (4, N'San Fernando del Valle de Catamarca', 2)
INSERT [dbo].[Localidad] ([id], [nombre], [provincia_id]) VALUES (5, N'Tinogasta', 2)
INSERT [dbo].[Localidad] ([id], [nombre], [provincia_id]) VALUES (6, N'Fray Mamerto Esquiú', 2)
SET IDENTITY_INSERT [dbo].[Localidad] OFF
GO
SET IDENTITY_INSERT [dbo].[Paquete] ON 

INSERT [dbo].[Paquete] ([id], [direccion1_id], [direccion2_id], [persona1_id], [persona2_id], [estado], [precio]) VALUES (1, 1, 2, 1, 2, N'Aceptado', CAST(300.00 AS Decimal(10, 2)))
INSERT [dbo].[Paquete] ([id], [direccion1_id], [direccion2_id], [persona1_id], [persona2_id], [estado], [precio]) VALUES (2, 2, 1, 2, 1, N'Rechazado', NULL)
INSERT [dbo].[Paquete] ([id], [direccion1_id], [direccion2_id], [persona1_id], [persona2_id], [estado], [precio]) VALUES (3, 3, 4, 6, 7, N'En tránsito', CAST(66.00 AS Decimal(10, 2)))
SET IDENTITY_INSERT [dbo].[Paquete] OFF
GO
SET IDENTITY_INSERT [dbo].[Persona] ON 

INSERT [dbo].[Persona] ([id], [nombre], [apellido], [dni], [telefono], [email]) VALUES (1, N'Destinoprueba', N'destinoApellprueba', N'1234', N'12344', N'prueba@asd')
INSERT [dbo].[Persona] ([id], [nombre], [apellido], [dni], [telefono], [email]) VALUES (2, N'Remitenteprueba', N'remitenteApellprueba', N'123456', N'32144', N'prueba@asdasd')
INSERT [dbo].[Persona] ([id], [nombre], [apellido], [dni], [telefono], [email]) VALUES (3, N'a', N'a', N'1', N'1', N'a@a')
INSERT [dbo].[Persona] ([id], [nombre], [apellido], [dni], [telefono], [email]) VALUES (5, N'prueba', N'remitente', N'123', N'123', N'aaa@aaa')
INSERT [dbo].[Persona] ([id], [nombre], [apellido], [dni], [telefono], [email]) VALUES (6, N'pruebaaaa', N'remitenteasdasd', N'1232', N'1232', N'aaa@aaaaa')
INSERT [dbo].[Persona] ([id], [nombre], [apellido], [dni], [telefono], [email]) VALUES (7, N'aLALA', N'lasdasd', N'1235', N'22222', N'asdasd@asdasd')
SET IDENTITY_INSERT [dbo].[Persona] OFF
GO
SET IDENTITY_INSERT [dbo].[Provincia] ON 

INSERT [dbo].[Provincia] ([id], [nombre]) VALUES (1, N'Buenos Aires')
INSERT [dbo].[Provincia] ([id], [nombre]) VALUES (2, N'Catamarca')
INSERT [dbo].[Provincia] ([id], [nombre]) VALUES (3, N'Chaco')
INSERT [dbo].[Provincia] ([id], [nombre]) VALUES (4, N'Chubut')
INSERT [dbo].[Provincia] ([id], [nombre]) VALUES (5, N'Ciudad de Buenos Aires')
INSERT [dbo].[Provincia] ([id], [nombre]) VALUES (6, N'Córdoba')
INSERT [dbo].[Provincia] ([id], [nombre]) VALUES (7, N'Corrientes')
INSERT [dbo].[Provincia] ([id], [nombre]) VALUES (8, N'Entre Ríos')
INSERT [dbo].[Provincia] ([id], [nombre]) VALUES (9, N'Formosa')
INSERT [dbo].[Provincia] ([id], [nombre]) VALUES (10, N'Jujuy')
INSERT [dbo].[Provincia] ([id], [nombre]) VALUES (11, N'La Pampa')
INSERT [dbo].[Provincia] ([id], [nombre]) VALUES (12, N'La Rioja')
INSERT [dbo].[Provincia] ([id], [nombre]) VALUES (13, N'Mendoza')
INSERT [dbo].[Provincia] ([id], [nombre]) VALUES (14, N'Misiones')
INSERT [dbo].[Provincia] ([id], [nombre]) VALUES (15, N'Neuquén')
INSERT [dbo].[Provincia] ([id], [nombre]) VALUES (16, N'Río Negro')
INSERT [dbo].[Provincia] ([id], [nombre]) VALUES (17, N'Salta')
INSERT [dbo].[Provincia] ([id], [nombre]) VALUES (18, N'San Juan')
INSERT [dbo].[Provincia] ([id], [nombre]) VALUES (19, N'San Luis')
INSERT [dbo].[Provincia] ([id], [nombre]) VALUES (20, N'Santa Cruz')
INSERT [dbo].[Provincia] ([id], [nombre]) VALUES (21, N'Santa Fe')
INSERT [dbo].[Provincia] ([id], [nombre]) VALUES (22, N'Santiago del Estero')
INSERT [dbo].[Provincia] ([id], [nombre]) VALUES (23, N'Tierra del Fuego')
INSERT [dbo].[Provincia] ([id], [nombre]) VALUES (24, N'Tucumán')
SET IDENTITY_INSERT [dbo].[Provincia] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Persona__D87608A7EE3DE914]    Script Date: 3/10/2024 11:14:17 ******/
ALTER TABLE [dbo].[Persona] ADD UNIQUE NONCLUSTERED 
(
	[dni] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Direccion]  WITH CHECK ADD FOREIGN KEY([localidad_id])
REFERENCES [dbo].[Localidad] ([id])
GO
ALTER TABLE [dbo].[Localidad]  WITH CHECK ADD FOREIGN KEY([provincia_id])
REFERENCES [dbo].[Provincia] ([id])
GO
ALTER TABLE [dbo].[Paquete]  WITH CHECK ADD  CONSTRAINT [FK__Paquete__direcci__412EB0B6] FOREIGN KEY([direccion1_id])
REFERENCES [dbo].[Direccion] ([id])
GO
ALTER TABLE [dbo].[Paquete] CHECK CONSTRAINT [FK__Paquete__direcci__412EB0B6]
GO
ALTER TABLE [dbo].[Paquete]  WITH CHECK ADD  CONSTRAINT [FK__Paquete__direcci__4222D4EF] FOREIGN KEY([direccion2_id])
REFERENCES [dbo].[Direccion] ([id])
GO
ALTER TABLE [dbo].[Paquete] CHECK CONSTRAINT [FK__Paquete__direcci__4222D4EF]
GO
ALTER TABLE [dbo].[Paquete]  WITH CHECK ADD  CONSTRAINT [FK__Paquete__persona__4316F928] FOREIGN KEY([persona1_id])
REFERENCES [dbo].[Persona] ([id])
GO
ALTER TABLE [dbo].[Paquete] CHECK CONSTRAINT [FK__Paquete__persona__4316F928]
GO
ALTER TABLE [dbo].[Paquete]  WITH CHECK ADD  CONSTRAINT [FK__Paquete__persona__440B1D61] FOREIGN KEY([persona2_id])
REFERENCES [dbo].[Persona] ([id])
GO
ALTER TABLE [dbo].[Paquete] CHECK CONSTRAINT [FK__Paquete__persona__440B1D61]
GO
USE [master]
GO
ALTER DATABASE [MicroserviciosUsuario] SET  READ_WRITE 
GO
