USE [master]
GO

/****** Object:  Database [WHQJGroupDB]    Script Date: 2018/3/15 11:33:15 ******/
CREATE DATABASE [WHQJGroupDB] ON  PRIMARY 
( NAME = N'WHQJGroupDB', FILENAME = N'D:\数据库\旗舰平台\WHQJGroupDB.mdf' , SIZE = 11264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'WHQJGroupDB_log', FILENAME = N'D:\数据库\旗舰平台\WHQJGroupDB_log.ldf' , SIZE = 47616KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
COLLATE Chinese_PRC_CI_AS
GO

EXEC dbo.sp_dbcmptlevel @dbname=N'WHQJGroupDB', @new_cmptlevel=90
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [WHQJGroupDB].[dbo].[sp_fulltext_database] @action = 'disable'
end
GO

ALTER DATABASE [WHQJGroupDB] SET ANSI_NULL_DEFAULT OFF 
GO

ALTER DATABASE [WHQJGroupDB] SET ANSI_NULLS OFF 
GO

ALTER DATABASE [WHQJGroupDB] SET ANSI_PADDING OFF 
GO

ALTER DATABASE [WHQJGroupDB] SET ANSI_WARNINGS OFF 
GO

ALTER DATABASE [WHQJGroupDB] SET ARITHABORT OFF 
GO

ALTER DATABASE [WHQJGroupDB] SET AUTO_CLOSE OFF 
GO

ALTER DATABASE [WHQJGroupDB] SET AUTO_CREATE_STATISTICS ON 
GO

ALTER DATABASE [WHQJGroupDB] SET AUTO_SHRINK OFF 
GO

ALTER DATABASE [WHQJGroupDB] SET AUTO_UPDATE_STATISTICS ON 
GO

ALTER DATABASE [WHQJGroupDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO

ALTER DATABASE [WHQJGroupDB] SET CURSOR_DEFAULT  GLOBAL 
GO

ALTER DATABASE [WHQJGroupDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO

ALTER DATABASE [WHQJGroupDB] SET NUMERIC_ROUNDABORT OFF 
GO

ALTER DATABASE [WHQJGroupDB] SET QUOTED_IDENTIFIER OFF 
GO

ALTER DATABASE [WHQJGroupDB] SET RECURSIVE_TRIGGERS OFF 
GO

ALTER DATABASE [WHQJGroupDB] SET  DISABLE_BROKER 
GO

ALTER DATABASE [WHQJGroupDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO

ALTER DATABASE [WHQJGroupDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO

ALTER DATABASE [WHQJGroupDB] SET TRUSTWORTHY OFF 
GO

ALTER DATABASE [WHQJGroupDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO

ALTER DATABASE [WHQJGroupDB] SET PARAMETERIZATION SIMPLE 
GO

ALTER DATABASE [WHQJGroupDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO

ALTER DATABASE [WHQJGroupDB] SET HONOR_BROKER_PRIORITY OFF 
GO

ALTER DATABASE [WHQJGroupDB] SET RECOVERY FULL 
GO

ALTER DATABASE [WHQJGroupDB] SET  MULTI_USER 
GO

ALTER DATABASE [WHQJGroupDB] SET PAGE_VERIFY CHECKSUM  
GO

ALTER DATABASE [WHQJGroupDB] SET DB_CHAINING OFF 
GO

ALTER DATABASE [WHQJGroupDB] SET  READ_WRITE 
GO


