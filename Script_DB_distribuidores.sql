USE [master]
GO
/****** Object:  Database [distribuidores]    Script Date: 22/08/2023 07:31:26 a. m. ******/
CREATE DATABASE [distribuidores]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'distribuidores', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\distribuidores.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'distribuidores_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\distribuidores_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [distribuidores] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [distribuidores].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [distribuidores] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [distribuidores] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [distribuidores] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [distribuidores] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [distribuidores] SET ARITHABORT OFF 
GO
ALTER DATABASE [distribuidores] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [distribuidores] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [distribuidores] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [distribuidores] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [distribuidores] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [distribuidores] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [distribuidores] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [distribuidores] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [distribuidores] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [distribuidores] SET  ENABLE_BROKER 
GO
ALTER DATABASE [distribuidores] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [distribuidores] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [distribuidores] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [distribuidores] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [distribuidores] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [distribuidores] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [distribuidores] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [distribuidores] SET RECOVERY FULL 
GO
ALTER DATABASE [distribuidores] SET  MULTI_USER 
GO
ALTER DATABASE [distribuidores] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [distribuidores] SET DB_CHAINING OFF 
GO
ALTER DATABASE [distribuidores] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [distribuidores] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [distribuidores] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [distribuidores] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'distribuidores', N'ON'
GO
ALTER DATABASE [distribuidores] SET QUERY_STORE = ON
GO
ALTER DATABASE [distribuidores] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [distribuidores]
GO
/****** Object:  Table [dbo].[Empresa_Distribuidora]    Script Date: 22/08/2023 07:31:27 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empresa_Distribuidora](
	[idEmpresa_Dis] [int] IDENTITY(1,1) NOT NULL,
	[Nombre_producto] [varchar](250) NOT NULL,
	[Clave_interna] [varchar](250) NOT NULL,
	[Precio_Interno] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idEmpresa_Dis] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Productos]    Script Date: 22/08/2023 07:31:27 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Productos](
	[idProducto] [int] IDENTITY(1,1) NOT NULL,
	[Tipodeproducto] [varchar](250) NOT NULL,
	[Nombre] [varchar](250) NOT NULL,
	[Clavedeproducto] [int] NOT NULL,
	[Precio] [int] NOT NULL,
	[Razón_social_proveedor] [varchar](250) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Productos] ON 

INSERT [dbo].[Productos] ([idProducto], [Tipodeproducto], [Nombre], [Clavedeproducto], [Precio], [Razón_social_proveedor]) VALUES (28, N'Abarrotes', N'Leche Lala', 683929, 23, N'Walmart de México')
SET IDENTITY_INSERT [dbo].[Productos] OFF
GO
/****** Object:  StoredProcedure [dbo].[_AGREGAR]    Script Date: 22/08/2023 07:31:27 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[_AGREGAR](
@tipoProducto varchar(250),
@NombreProducto varchar(250),
@claveProducto int,
@precioProducto int,
@razonSocialProvedor varchar(250)
)
as
begin 
insert into Productos(Tipodeproducto, Nombre, Clavedeproducto, Precio, Razón_social_proveedor) values (@tipoProducto, @NombreProducto, @claveProducto, @precioProducto, @razonSocialProvedor)
end
GO
/****** Object:  StoredProcedure [dbo].[_BusquedaA]    Script Date: 22/08/2023 07:31:27 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[_BusquedaA](
@idProducto int,
@tipoProducto varchar(250),
@claveProducto int
)
as
begin 
select * from Productos where Tipodeproducto = @tipoProducto AND Clavedeproducto = @claveProducto;
end
GO
/****** Object:  StoredProcedure [dbo].[_CONSULTAR]    Script Date: 22/08/2023 07:31:27 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[_CONSULTAR]
as
begin
select * from Productos;
end
GO
/****** Object:  StoredProcedure [dbo].[_Editar]    Script Date: 22/08/2023 07:31:27 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[_Editar](
@idProducto int,
@tipoProducto varchar(250),
@NombreProducto varchar(250),
@claveProducto int,
@precioProducto int,
@razonSocialProvedor varchar(250)
)
as
begin 
update Productos set Tipodeproducto = @tipoProducto, Nombre = @NombreProducto, Clavedeproducto = @claveProducto, Precio = @precioProducto, Razón_social_proveedor = @razonSocialProvedor;
end
GO
/****** Object:  StoredProcedure [dbo].[_Eliminar]    Script Date: 22/08/2023 07:31:27 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[_Eliminar](
@idProducto int
)
as
begin 
DELETE FROM  Productos WHERE idProducto = @idProducto;
end
GO
/****** Object:  StoredProcedure [dbo].[_Obtener]    Script Date: 22/08/2023 07:31:27 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[_Obtener](
@idProducto int
)
as
begin
select * from Productos where idProducto = @idProducto; 
end
GO
USE [master]
GO
ALTER DATABASE [distribuidores] SET  READ_WRITE 
GO
