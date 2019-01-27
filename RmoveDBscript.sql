USE [master]
GO
/****** Object:  Database [Rightmove]    Script Date: 27/01/2019 20:45:22 ******/
CREATE DATABASE [Rightmove]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Rightmove', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\Rightmove.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Rightmove_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\Rightmove_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Rightmove] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Rightmove].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Rightmove] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Rightmove] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Rightmove] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Rightmove] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Rightmove] SET ARITHABORT OFF 
GO
ALTER DATABASE [Rightmove] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Rightmove] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Rightmove] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Rightmove] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Rightmove] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Rightmove] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Rightmove] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Rightmove] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Rightmove] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Rightmove] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Rightmove] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Rightmove] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Rightmove] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Rightmove] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Rightmove] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Rightmove] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Rightmove] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Rightmove] SET RECOVERY FULL 
GO
ALTER DATABASE [Rightmove] SET  MULTI_USER 
GO
ALTER DATABASE [Rightmove] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Rightmove] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Rightmove] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Rightmove] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Rightmove] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Rightmove', N'ON'
GO
ALTER DATABASE [Rightmove] SET QUERY_STORE = OFF
GO
USE [Rightmove]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [Rightmove]
GO
/****** Object:  Schema [Lettings]    Script Date: 27/01/2019 20:45:22 ******/
CREATE SCHEMA [Lettings]
GO
/****** Object:  Schema [Property]    Script Date: 27/01/2019 20:45:22 ******/
CREATE SCHEMA [Property]
GO
/****** Object:  Schema [Sales]    Script Date: 27/01/2019 20:45:22 ******/
CREATE SCHEMA [Sales]
GO
/****** Object:  Table [Lettings].[PropertiesToLet]    Script Date: 27/01/2019 20:45:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Lettings].[PropertiesToLet](
	[Id] [int] NOT NULL,
	[Status] [int] NOT NULL,
	[IsStudentProperty] [bit] NOT NULL,
	[IsHouseFlatShare] [bit] NOT NULL,
	[DateAvailable] [datetime] NULL,
	[ContractMonths] [tinyint] NULL,
	[MinimumTerm] [tinyint] NULL,
	[LettingTypeId] [int] NULL,
	[Deposit] [decimal](7, 2) NULL,
	[AdminFee] [varchar](4000) NULL,
	[Rent] [decimal](7, 2) NULL,
	[RentFrequencyId] [int] NULL,
 CONSTRAINT [PK_PropertyLettingInstructions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Lettings].[PropertyLettingTypes]    Script Date: 27/01/2019 20:45:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Lettings].[PropertyLettingTypes](
	[Id] [int] NOT NULL,
	[Name] [varchar](255) NOT NULL,
 CONSTRAINT [PK_PropertyLettingTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Lettings].[PropertyToLetRentFrequencies]    Script Date: 27/01/2019 20:45:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Lettings].[PropertyToLetRentFrequencies](
	[Id] [int] NOT NULL,
	[Name] [varchar](255) NOT NULL,
 CONSTRAINT [PK_PropertyToLetRentFrequencies] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Lettings].[PropertyToLetStatus]    Script Date: 27/01/2019 20:45:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Lettings].[PropertyToLetStatus](
	[Id] [int] NOT NULL,
	[Name] [varchar](255) NOT NULL,
 CONSTRAINT [PK_PropertyToLetStatus] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Property].[GoogleStreetViewDetails]    Script Date: 27/01/2019 20:45:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Property].[GoogleStreetViewDetails](
	[Id] [int] NOT NULL,
	[PovLatitude] [nchar](10) NULL,
	[PovLongitude] [nchar](10) NULL,
	[PovPitch] [nchar](10) NULL,
	[PovHeading] [nchar](10) NULL,
	[PovZoom] [nchar](10) NULL,
 CONSTRAINT [PK_GoogleStreetViewDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Property].[Properties]    Script Date: 27/01/2019 20:45:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Property].[Properties](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PropertyTypeId] [int] NOT NULL,
	[IsNewHome] [bit] NOT NULL,
	[AddrHouseNameNumber] [varchar](255) NOT NULL,
	[Addr2] [varchar](255) NULL,
	[Addr3] [varchar](255) NULL,
	[Addr4] [varchar](255) NULL,
	[AddrTown] [varchar](255) NOT NULL,
	[AddrPostcode1stPart] [varchar](5) NOT NULL,
	[AddrPostcode2ndPart] [varchar](5) NOT NULL,
	[DisplayAddress] [varchar](255) NOT NULL,
	[Latitude] [smallint] NULL,
	[Longitude] [smallint] NULL,
 CONSTRAINT [PK_Properties] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Property].[PropertyTypes]    Script Date: 27/01/2019 20:45:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Property].[PropertyTypes](
	[Id] [int] NOT NULL,
	[Name] [varchar](255) NOT NULL,
 CONSTRAINT [PK_PropertyTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Sales].[PropertiesForSale]    Script Date: 27/01/2019 20:45:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Sales].[PropertiesForSale](
	[Id] [int] NOT NULL,
	[Status] [int] NOT NULL,
	[Price] [decimal](9, 2) NOT NULL,
	[PriceQualifierId] [int] NULL,
	[TenureTypeId] [int] NULL,
	[IsToBeAuctioned] [bit] NULL,
	[TenureUnexpiredYears] [tinyint] NULL,
 CONSTRAINT [PK_PropertySaleInstructions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Sales].[PropertyForSalePriceQualifiers]    Script Date: 27/01/2019 20:45:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Sales].[PropertyForSalePriceQualifiers](
	[Id] [int] NOT NULL,
	[Name] [varchar](255) NOT NULL,
 CONSTRAINT [PK_PropertyForSalePriceQualifiers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Sales].[PropertyForSaleStatus]    Script Date: 27/01/2019 20:45:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Sales].[PropertyForSaleStatus](
	[Id] [int] NOT NULL,
	[Name] [varchar](255) NOT NULL,
 CONSTRAINT [PK_PropertyForSaleStatus] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Sales].[PropertyForSaleTenureTypes]    Script Date: 27/01/2019 20:45:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Sales].[PropertyForSaleTenureTypes](
	[Id] [int] NOT NULL,
	[Name] [varchar](255) NOT NULL,
 CONSTRAINT [PK_PropertyForSaleTenureTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Lettings].[PropertiesToLet]  WITH CHECK ADD  CONSTRAINT [FK_PropertiesToLet_Properties] FOREIGN KEY([Id])
REFERENCES [Property].[Properties] ([Id])
GO
ALTER TABLE [Lettings].[PropertiesToLet] CHECK CONSTRAINT [FK_PropertiesToLet_Properties]
GO
ALTER TABLE [Lettings].[PropertiesToLet]  WITH CHECK ADD  CONSTRAINT [FK_PropertiesToLet_PropertyLettingTypes] FOREIGN KEY([LettingTypeId])
REFERENCES [Lettings].[PropertyLettingTypes] ([Id])
GO
ALTER TABLE [Lettings].[PropertiesToLet] CHECK CONSTRAINT [FK_PropertiesToLet_PropertyLettingTypes]
GO
ALTER TABLE [Lettings].[PropertiesToLet]  WITH CHECK ADD  CONSTRAINT [FK_PropertiesToLet_PropertyToLetRentFrequencies] FOREIGN KEY([RentFrequencyId])
REFERENCES [Lettings].[PropertyToLetRentFrequencies] ([Id])
GO
ALTER TABLE [Lettings].[PropertiesToLet] CHECK CONSTRAINT [FK_PropertiesToLet_PropertyToLetRentFrequencies]
GO
ALTER TABLE [Lettings].[PropertiesToLet]  WITH CHECK ADD  CONSTRAINT [FK_PropertiesToLet_PropertyToLetStatus] FOREIGN KEY([Status])
REFERENCES [Lettings].[PropertyToLetStatus] ([Id])
GO
ALTER TABLE [Lettings].[PropertiesToLet] CHECK CONSTRAINT [FK_PropertiesToLet_PropertyToLetStatus]
GO
ALTER TABLE [Property].[GoogleStreetViewDetails]  WITH CHECK ADD  CONSTRAINT [FK_GoogleStreetViewDetails_Properties] FOREIGN KEY([Id])
REFERENCES [Property].[Properties] ([Id])
GO
ALTER TABLE [Property].[GoogleStreetViewDetails] CHECK CONSTRAINT [FK_GoogleStreetViewDetails_Properties]
GO
ALTER TABLE [Property].[Properties]  WITH CHECK ADD  CONSTRAINT [FK_Properties_PropertyTypes] FOREIGN KEY([PropertyTypeId])
REFERENCES [Property].[PropertyTypes] ([Id])
GO
ALTER TABLE [Property].[Properties] CHECK CONSTRAINT [FK_Properties_PropertyTypes]
GO
ALTER TABLE [Sales].[PropertiesForSale]  WITH CHECK ADD  CONSTRAINT [FK_PropertiesForSale_Properties] FOREIGN KEY([Id])
REFERENCES [Property].[Properties] ([Id])
GO
ALTER TABLE [Sales].[PropertiesForSale] CHECK CONSTRAINT [FK_PropertiesForSale_Properties]
GO
ALTER TABLE [Sales].[PropertiesForSale]  WITH CHECK ADD  CONSTRAINT [FK_PropertiesForSale_PropertyForSalePriceQualifiers] FOREIGN KEY([PriceQualifierId])
REFERENCES [Sales].[PropertyForSalePriceQualifiers] ([Id])
GO
ALTER TABLE [Sales].[PropertiesForSale] CHECK CONSTRAINT [FK_PropertiesForSale_PropertyForSalePriceQualifiers]
GO
ALTER TABLE [Sales].[PropertiesForSale]  WITH CHECK ADD  CONSTRAINT [FK_PropertiesForSale_PropertyForSaleStatus] FOREIGN KEY([Status])
REFERENCES [Sales].[PropertyForSaleStatus] ([Id])
GO
ALTER TABLE [Sales].[PropertiesForSale] CHECK CONSTRAINT [FK_PropertiesForSale_PropertyForSaleStatus]
GO
ALTER TABLE [Sales].[PropertiesForSale]  WITH CHECK ADD  CONSTRAINT [FK_PropertiesForSale_PropertyForSaleTenureTypes] FOREIGN KEY([TenureTypeId])
REFERENCES [Sales].[PropertyForSaleTenureTypes] ([Id])
GO
ALTER TABLE [Sales].[PropertiesForSale] CHECK CONSTRAINT [FK_PropertiesForSale_PropertyForSaleTenureTypes]
GO
USE [master]
GO
ALTER DATABASE [Rightmove] SET  READ_WRITE 
GO
