USE [master]
GO
/****** Object:  Database [Accidents_DW]    Script Date: 23/05/2024 3:06:25 PM ******/
CREATE DATABASE [Accidents_DW]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Accidents_DW', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MINHTHUAN\MSSQL\DATA\Accidents_DW.mdf' , SIZE = 991232KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Accidents_DW_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MINHTHUAN\MSSQL\DATA\Accidents_DW_log.ldf' , SIZE = 5185536KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Accidents_DW] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Accidents_DW].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Accidents_DW] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Accidents_DW] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Accidents_DW] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Accidents_DW] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Accidents_DW] SET ARITHABORT OFF 
GO
ALTER DATABASE [Accidents_DW] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Accidents_DW] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Accidents_DW] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Accidents_DW] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Accidents_DW] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Accidents_DW] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Accidents_DW] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Accidents_DW] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Accidents_DW] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Accidents_DW] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Accidents_DW] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Accidents_DW] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Accidents_DW] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Accidents_DW] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Accidents_DW] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Accidents_DW] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Accidents_DW] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Accidents_DW] SET RECOVERY FULL 
GO
ALTER DATABASE [Accidents_DW] SET  MULTI_USER 
GO
ALTER DATABASE [Accidents_DW] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Accidents_DW] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Accidents_DW] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Accidents_DW] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Accidents_DW] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Accidents_DW] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Accidents_DW', N'ON'
GO
ALTER DATABASE [Accidents_DW] SET QUERY_STORE = OFF
GO
USE [Accidents_DW]
GO
/****** Object:  Table [dbo].[DimDate]    Script Date: 20/05/2023 3:06:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimDate](
	[DateKey] [nvarchar](16) NOT NULL,
	[FullDate] [datetime] NULL,
	[Year] [int] NULL,
	[Quarter] [int] NULL,
	[Month] [int] NULL,
	[Day] [int] NULL,
	[Hour] [int] NULL,
	[Minute] [int] NULL,
	[Weekday] [int] NULL,
 CONSTRAINT [pkAccidentDimDate] PRIMARY KEY CLUSTERED 
(
	[DateKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimDriver]    Script Date: 20/05/2023 3:06:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimDriver](
	[DriverKey] [int] IDENTITY(1,1) NOT NULL,
	[ID] [varchar](50) NULL,
	[Age_Band_of_Driver] [varchar](50) NULL,
	[Sex_of_Driver] [varchar](50) NULL,
	[Driver_IMD_Decile] [float] NULL,
	[Driver_Home_Area_Type] [varchar](50) NULL,
	[Journey_Purpose_of_Driver] [varchar](50) NULL,
 CONSTRAINT [pkAccidentDimDriver] PRIMARY KEY CLUSTERED 
(
	[DriverKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimLocation]    Script Date: 20/05/2023 3:06:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimLocation](
	[LocationKey] [int] IDENTITY(1,1) NOT NULL,
	[ID] [varchar](50) NULL,
	[Number] [float] NULL,
	[Street] [varchar](255) NULL,
	[Side] [varchar](50) NULL,
	[City] [varchar](50) NULL,
	[County] [varchar](50) NULL,
	[State] [varchar](50) NULL,
	[Zipcode] [varchar](50) NULL,
	[Country] [varchar](50) NULL,
 CONSTRAINT [pkAccidentDimLocation] PRIMARY KEY CLUSTERED 
(
	[LocationKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimRoadFeature]    Script Date: 20/05/2023 3:06:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimRoadFeature](
	[RoadFeatureKey] [int] IDENTITY(1,1) NOT NULL,
	[ID] [varchar](50) NULL,
	[Amenity] [bit] NULL,
	[Bump] [bit] NULL,
	[Crossing] [bit] NULL,
	[GiveWay] [bit] NULL,
	[Junction] [bit] NULL,
	[NoExit] [bit] NULL,
	[Railway] [bit] NULL,
	[Roundabout] [bit] NULL,
	[Station] [bit] NULL,
	[Stop] [bit] NULL,
	[TrafficCalming] [bit] NULL,
	[TrafficSignal] [bit] NULL,
	[TurningLoop] [bit] NULL,
 CONSTRAINT [pkAccidentDimRoadFeature] PRIMARY KEY CLUSTERED 
(
	[RoadFeatureKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimRoadSurfaceCondition]    Script Date: 20/05/2023 3:06:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimRoadSurfaceCondition](
	[ID] [varchar](50) NOT NULL,
	[RoadSurfaceConditions] [varchar](50) NULL,
 CONSTRAINT [pkAccidentDimRoadSurfaceCondition] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimRoadType]    Script Date: 20/05/2023 3:06:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimRoadType](
	[ID] [varchar](50) NOT NULL,
	[RoadType] [varchar](50) NULL,
 CONSTRAINT [pkAccidentDimRoadType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimSpeedLimit]    Script Date: 20/05/2023 3:06:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimSpeedLimit](
	[SpeedLimitKey] [int] IDENTITY(1,1) NOT NULL,
	[ID] [varchar](50) NULL,
	[SpeedLimit] [int] NULL,
 CONSTRAINT [pkAccidentDimSpeedLimit] PRIMARY KEY CLUSTERED 
(
	[SpeedLimitKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimTwilight]    Script Date: 20/05/2023 3:06:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimTwilight](
	[TwilightKey] [int] IDENTITY(1,1) NOT NULL,
	[ID] [varchar](50) NULL,
	[Sunrise_Sunset] [varchar](10) NULL,
	[Civil_Twilight] [varchar](10) NULL,
	[Nautical_Twilight] [varchar](10) NULL,
	[Astronomical_Twilight] [varchar](10) NULL,
 CONSTRAINT [pkAccidentDimTwilight] PRIMARY KEY CLUSTERED 
(
	[TwilightKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimVehicle]    Script Date: 20/05/2023 3:06:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimVehicle](
	[VehicleKey] [int] IDENTITY(1,1) NOT NULL,
	[ID] [varchar](50) NULL,
	[Engine_Capacity_CC] [float] NULL,
	[PropulsionCode] [varchar](50) NULL,
	[Make] [varchar](50) NULL,
	[Model] [varchar](50) NULL,
	[JunctionLocation] [varchar](255) NULL,
	[Vehicle_Manoeuvre] [varchar](100) NULL,
	[Vehicle_Location_Restricted_Lane] [varchar](50) NULL,
	[X1st_Point_of_Impact] [varchar](50) NULL,
	[Was_Vehicle_Left_Hand_Drive] [varchar](50) NULL,
	[Year] [varchar](50) NULL,
 CONSTRAINT [pkAccidentDimVehicle] PRIMARY KEY CLUSTERED 
(
	[VehicleKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimWeather]    Script Date: 20/05/2023 3:06:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimWeather](
	[WeatherKey] [int] IDENTITY(1,1) NOT NULL,
	[ID] [varchar](50) NULL,
	[Temperature(F)] [varchar](10) NULL,
	[Wind_Chill(F)] [float] NULL,
	[Humidity(%)] [int] NULL,
	[Pressure(in)] [float] NULL,
	[Visibility(mi)] [float] NULL,
	[WindDirection] [varchar](50) NULL,
	[WindSpeed(mph)] [float] NULL,
	[Precipitation(in)] [float] NULL,
 CONSTRAINT [pkAccidentDimWeather] PRIMARY KEY CLUSTERED 
(
	[WeatherKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimWeatherCondition]    Script Date: 20/05/2023 3:06:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimWeatherCondition](
	[ID] [varchar](50) NOT NULL,
	[Weather_Condition] [varchar](50) NULL,
 CONSTRAINT [pkAccidentDimWeatherCondition] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FactAccident]    Script Date: 20/05/2023 3:06:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FactAccident](
	[ID] [varchar](50) NOT NULL,
	[LocationKey] [int] NULL,
	[DateKey] [nvarchar](16) NULL,
	[TwilightKey] [int] NULL,
	[RoadFeatureKey] [int] NULL,
	[WeatherKey] [int] NULL,
	[DriverKey] [int] NULL,
	[SpeedLimitKey] [int] NULL,
	[VehicleKey] [int] NULL,
	[StartTimeAccident] [datetime] NULL,
	[Distance(mi)] [float] NULL,
	[NumberofCasualties] [int] NULL,
	[Severity] [int] NULL,
 CONSTRAINT [pkAccidentFactAccident] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DimRoadFeature]  WITH CHECK ADD  CONSTRAINT [fkAccidentDimRoadSurfaceConditionID] FOREIGN KEY([ID])
REFERENCES [dbo].[DimRoadSurfaceCondition] ([ID])
GO
ALTER TABLE [dbo].[DimRoadFeature] CHECK CONSTRAINT [fkAccidentDimRoadSurfaceConditionID]
GO
ALTER TABLE [dbo].[DimRoadFeature]  WITH CHECK ADD  CONSTRAINT [fkAccidentDimRoadTypeID] FOREIGN KEY([ID])
REFERENCES [dbo].[DimRoadType] ([ID])
GO
ALTER TABLE [dbo].[DimRoadFeature] CHECK CONSTRAINT [fkAccidentDimRoadTypeID]
GO
ALTER TABLE [dbo].[DimWeather]  WITH CHECK ADD  CONSTRAINT [fkAccidentDimWeatherConditionID] FOREIGN KEY([ID])
REFERENCES [dbo].[DimWeatherCondition] ([ID])
GO
ALTER TABLE [dbo].[DimWeather] CHECK CONSTRAINT [fkAccidentDimWeatherConditionID]
GO
ALTER TABLE [dbo].[FactAccident]  WITH CHECK ADD  CONSTRAINT [fkAccidentFactAccidentDateKey] FOREIGN KEY([DateKey])
REFERENCES [dbo].[DimDate] ([DateKey])
GO
ALTER TABLE [dbo].[FactAccident] CHECK CONSTRAINT [fkAccidentFactAccidentDateKey]
GO
ALTER TABLE [dbo].[FactAccident]  WITH CHECK ADD  CONSTRAINT [fkAccidentFactAccidentDriverKey] FOREIGN KEY([DriverKey])
REFERENCES [dbo].[DimDriver] ([DriverKey])
GO
ALTER TABLE [dbo].[FactAccident] CHECK CONSTRAINT [fkAccidentFactAccidentDriverKey]
GO
ALTER TABLE [dbo].[FactAccident]  WITH CHECK ADD  CONSTRAINT [fkAccidentFactAccidentLocationKey] FOREIGN KEY([LocationKey])
REFERENCES [dbo].[DimLocation] ([LocationKey])
GO
ALTER TABLE [dbo].[FactAccident] CHECK CONSTRAINT [fkAccidentFactAccidentLocationKey]
GO
ALTER TABLE [dbo].[FactAccident]  WITH CHECK ADD  CONSTRAINT [fkAccidentFactAccidentRoadFeatureKey] FOREIGN KEY([RoadFeatureKey])
REFERENCES [dbo].[DimRoadFeature] ([RoadFeatureKey])
GO
ALTER TABLE [dbo].[FactAccident] CHECK CONSTRAINT [fkAccidentFactAccidentRoadFeatureKey]
GO
ALTER TABLE [dbo].[FactAccident]  WITH CHECK ADD  CONSTRAINT [fkAccidentFactAccidentSpeedLimitKey] FOREIGN KEY([SpeedLimitKey])
REFERENCES [dbo].[DimSpeedLimit] ([SpeedLimitKey])
GO
ALTER TABLE [dbo].[FactAccident] CHECK CONSTRAINT [fkAccidentFactAccidentSpeedLimitKey]
GO
ALTER TABLE [dbo].[FactAccident]  WITH CHECK ADD  CONSTRAINT [fkAccidentFactAccidentTwilightKey] FOREIGN KEY([TwilightKey])
REFERENCES [dbo].[DimTwilight] ([TwilightKey])
GO
ALTER TABLE [dbo].[FactAccident] CHECK CONSTRAINT [fkAccidentFactAccidentTwilightKey]
GO
ALTER TABLE [dbo].[FactAccident]  WITH CHECK ADD  CONSTRAINT [fkAccidentFactAccidentVehicleKey] FOREIGN KEY([VehicleKey])
REFERENCES [dbo].[DimVehicle] ([VehicleKey])
GO
ALTER TABLE [dbo].[FactAccident] CHECK CONSTRAINT [fkAccidentFactAccidentVehicleKey]
GO
ALTER TABLE [dbo].[FactAccident]  WITH CHECK ADD  CONSTRAINT [fkAccidentFactAccidentWeatherKey] FOREIGN KEY([WeatherKey])
REFERENCES [dbo].[DimWeather] ([WeatherKey])
GO
ALTER TABLE [dbo].[FactAccident] CHECK CONSTRAINT [fkAccidentFactAccidentWeatherKey]
GO
USE [master]
GO
ALTER DATABASE [Accidents_DW] SET  READ_WRITE 
GO
