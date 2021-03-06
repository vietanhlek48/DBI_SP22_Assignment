USE [master]
GO
/****** Object:  Database [Assignment_DBI]    Script Date: 14/07/2022 10:44:24 SA ******/
CREATE DATABASE [Assignment_DBI]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Assignment_DBI', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.VANH\MSSQL\DATA\Assignment_DBI.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Assignment_DBI_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.VANH\MSSQL\DATA\Assignment_DBI_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Assignment_DBI] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Assignment_DBI].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Assignment_DBI] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Assignment_DBI] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Assignment_DBI] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Assignment_DBI] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Assignment_DBI] SET ARITHABORT OFF 
GO
ALTER DATABASE [Assignment_DBI] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Assignment_DBI] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Assignment_DBI] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Assignment_DBI] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Assignment_DBI] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Assignment_DBI] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Assignment_DBI] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Assignment_DBI] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Assignment_DBI] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Assignment_DBI] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Assignment_DBI] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Assignment_DBI] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Assignment_DBI] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Assignment_DBI] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Assignment_DBI] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Assignment_DBI] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Assignment_DBI] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Assignment_DBI] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Assignment_DBI] SET  MULTI_USER 
GO
ALTER DATABASE [Assignment_DBI] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Assignment_DBI] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Assignment_DBI] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Assignment_DBI] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Assignment_DBI] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Assignment_DBI] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Assignment_DBI', N'ON'
GO
ALTER DATABASE [Assignment_DBI] SET QUERY_STORE = OFF
GO
USE [Assignment_DBI]
GO
/****** Object:  Table [dbo].[Assessment]    Script Date: 14/07/2022 10:44:24 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Assessment](
	[AssId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nchar](15) NOT NULL,
	[Type] [nvarchar](15) NULL,
	[Part] [int] NOT NULL,
	[Weight] [float] NOT NULL,
	[CompletionCiteria] [int] NULL,
	[Duration] [nvarchar](50) NULL,
	[Noquestion] [int] NULL,
	[SubjectId] [int] NULL,
 CONSTRAINT [PK_Assessment] PRIMARY KEY CLUSTERED 
(
	[AssId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Enroll]    Script Date: 14/07/2022 10:44:24 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Enroll](
	[StudentId] [int] NOT NULL,
	[GroupId] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GroupS]    Script Date: 14/07/2022 10:44:24 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GroupS](
	[GroupId] [int] IDENTITY(1,1) NOT NULL,
	[SubjectId] [int] NOT NULL,
	[SemesterId] [int] NOT NULL,
	[GroupCode] [nchar](10) NULL,
 CONSTRAINT [PK_GroupS] PRIMARY KEY CLUSTERED 
(
	[GroupId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Mark]    Script Date: 14/07/2022 10:44:24 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mark](
	[MarkId] [int] IDENTITY(1,1) NOT NULL,
	[StudentId] [int] NULL,
	[AsssessId] [int] NULL,
	[Mark] [int] NULL,
 CONSTRAINT [PK_Mark] PRIMARY KEY CLUSTERED 
(
	[MarkId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Semester]    Script Date: 14/07/2022 10:44:24 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Semester](
	[SemesterId] [int] IDENTITY(1,1) NOT NULL,
	[SemesterName] [nchar](15) NULL,
 CONSTRAINT [PK_Semester] PRIMARY KEY CLUSTERED 
(
	[SemesterId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 14/07/2022 10:44:24 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[StudentId] [int] IDENTITY(1,1) NOT NULL,
	[Dob] [date] NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NULL,
	[Gender] [bit] NULL,
	[StudentCode] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[StudentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Subject]    Script Date: 14/07/2022 10:44:24 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subject](
	[SubjectId] [int] IDENTITY(1,1) NOT NULL,
	[SubjectCode] [nchar](10) NULL,
	[SubjectName] [nvarchar](50) NULL,
 CONSTRAINT [PK_Subject] PRIMARY KEY CLUSTERED 
(
	[SubjectId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Teach]    Script Date: 14/07/2022 10:44:24 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Teach](
	[TeacherId] [int] NOT NULL,
	[GroupId] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Teacher]    Script Date: 14/07/2022 10:44:24 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Teacher](
	[TeacherId] [int] IDENTITY(1,1) NOT NULL,
	[Dob] [date] NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Gender] [bit] NULL,
 CONSTRAINT [PK_Teacher] PRIMARY KEY CLUSTERED 
(
	[TeacherId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Assessment] ON 

INSERT [dbo].[Assessment] ([AssId], [Name], [Type], [Part], [Weight], [CompletionCiteria], [Duration], [Noquestion], [SubjectId]) VALUES (1, N'Progess Test   ', N'quiz', 2, 5, 0, N'20m', 20, 1)
INSERT [dbo].[Assessment] ([AssId], [Name], [Type], [Part], [Weight], [CompletionCiteria], [Duration], [Noquestion], [SubjectId]) VALUES (2, N'Assignment     ', N'on-going', 1, 20, 0, N'at home', 0, 1)
INSERT [dbo].[Assessment] ([AssId], [Name], [Type], [Part], [Weight], [CompletionCiteria], [Duration], [Noquestion], [SubjectId]) VALUES (3, N'Labs           ', N'on-going', 5, 3, 0, N'in lab session', 0, 1)
INSERT [dbo].[Assessment] ([AssId], [Name], [Type], [Part], [Weight], [CompletionCiteria], [Duration], [Noquestion], [SubjectId]) VALUES (4, N'Practical Exam ', N'practical exam', 1, 25, 0, N'85m', 0, 1)
INSERT [dbo].[Assessment] ([AssId], [Name], [Type], [Part], [Weight], [CompletionCiteria], [Duration], [Noquestion], [SubjectId]) VALUES (5, N'Final Exam     ', N'final exam', 1, 30, 5, N'in lab session', 60, 1)
INSERT [dbo].[Assessment] ([AssId], [Name], [Type], [Part], [Weight], [CompletionCiteria], [Duration], [Noquestion], [SubjectId]) VALUES (6, N'Progess Test   ', N'quiz', 2, 10, 0, N'20m', 50, 3)
INSERT [dbo].[Assessment] ([AssId], [Name], [Type], [Part], [Weight], [CompletionCiteria], [Duration], [Noquestion], [SubjectId]) VALUES (7, N'Mid-term       ', N'Mid-term', 1, 30, 0, N'60m', 50, 3)
INSERT [dbo].[Assessment] ([AssId], [Name], [Type], [Part], [Weight], [CompletionCiteria], [Duration], [Noquestion], [SubjectId]) VALUES (8, N'Participation  ', N'Participation', 1, 10, 0, N'along semester', 0, 3)
INSERT [dbo].[Assessment] ([AssId], [Name], [Type], [Part], [Weight], [CompletionCiteria], [Duration], [Noquestion], [SubjectId]) VALUES (9, N'Final Exam     ', N'final exam', 1, 40, 5, N'multiple choices', 60, 3)
INSERT [dbo].[Assessment] ([AssId], [Name], [Type], [Part], [Weight], [CompletionCiteria], [Duration], [Noquestion], [SubjectId]) VALUES (10, N'Progess Test   ', N'quiz', 2, 5, 0, N'20m', 20, 2)
INSERT [dbo].[Assessment] ([AssId], [Name], [Type], [Part], [Weight], [CompletionCiteria], [Duration], [Noquestion], [SubjectId]) VALUES (11, N'Assignment     ', N'on-going', 1, 20, 0, N'at home', 0, 2)
INSERT [dbo].[Assessment] ([AssId], [Name], [Type], [Part], [Weight], [CompletionCiteria], [Duration], [Noquestion], [SubjectId]) VALUES (12, N'Labs           ', N'on-going', 5, 3, 0, N'in lab session', 0, 2)
INSERT [dbo].[Assessment] ([AssId], [Name], [Type], [Part], [Weight], [CompletionCiteria], [Duration], [Noquestion], [SubjectId]) VALUES (13, N'Practical Exam ', N'practical exam', 1, 25, 0, N'85m', 0, 2)
INSERT [dbo].[Assessment] ([AssId], [Name], [Type], [Part], [Weight], [CompletionCiteria], [Duration], [Noquestion], [SubjectId]) VALUES (14, N'Final Exam     ', N'final exam', 1, 30, 5, N'Multiple choices', 60, 2)
INSERT [dbo].[Assessment] ([AssId], [Name], [Type], [Part], [Weight], [CompletionCiteria], [Duration], [Noquestion], [SubjectId]) VALUES (15, N'Progess Test   ', N'quiz', 2, 5, 0, N'20m', 20, 4)
INSERT [dbo].[Assessment] ([AssId], [Name], [Type], [Part], [Weight], [CompletionCiteria], [Duration], [Noquestion], [SubjectId]) VALUES (16, N'Assignment     ', N'on-going', 1, 20, 0, N'at home', 0, 4)
INSERT [dbo].[Assessment] ([AssId], [Name], [Type], [Part], [Weight], [CompletionCiteria], [Duration], [Noquestion], [SubjectId]) VALUES (17, N'Labs           ', N'on-going', 5, 3, 0, N'in lab session', 0, 4)
INSERT [dbo].[Assessment] ([AssId], [Name], [Type], [Part], [Weight], [CompletionCiteria], [Duration], [Noquestion], [SubjectId]) VALUES (18, N'Practical Exam ', N'practical exam', 1, 25, 0, N'85m', 0, 4)
INSERT [dbo].[Assessment] ([AssId], [Name], [Type], [Part], [Weight], [CompletionCiteria], [Duration], [Noquestion], [SubjectId]) VALUES (19, N'Final Exam     ', N'final exam', 1, 30, 5, N'Multiple choices', 60, 4)
SET IDENTITY_INSERT [dbo].[Assessment] OFF
GO
INSERT [dbo].[Enroll] ([StudentId], [GroupId]) VALUES (1, 1)
INSERT [dbo].[Enroll] ([StudentId], [GroupId]) VALUES (2, 1)
INSERT [dbo].[Enroll] ([StudentId], [GroupId]) VALUES (3, 1)
INSERT [dbo].[Enroll] ([StudentId], [GroupId]) VALUES (4, 1)
INSERT [dbo].[Enroll] ([StudentId], [GroupId]) VALUES (5, 1)
INSERT [dbo].[Enroll] ([StudentId], [GroupId]) VALUES (6, 1)
INSERT [dbo].[Enroll] ([StudentId], [GroupId]) VALUES (7, 1)
INSERT [dbo].[Enroll] ([StudentId], [GroupId]) VALUES (8, 1)
INSERT [dbo].[Enroll] ([StudentId], [GroupId]) VALUES (9, 1)
INSERT [dbo].[Enroll] ([StudentId], [GroupId]) VALUES (10, 1)
INSERT [dbo].[Enroll] ([StudentId], [GroupId]) VALUES (11, 2)
INSERT [dbo].[Enroll] ([StudentId], [GroupId]) VALUES (12, 2)
INSERT [dbo].[Enroll] ([StudentId], [GroupId]) VALUES (13, 2)
INSERT [dbo].[Enroll] ([StudentId], [GroupId]) VALUES (4, 2)
INSERT [dbo].[Enroll] ([StudentId], [GroupId]) VALUES (5, 2)
INSERT [dbo].[Enroll] ([StudentId], [GroupId]) VALUES (6, 2)
INSERT [dbo].[Enroll] ([StudentId], [GroupId]) VALUES (7, 2)
INSERT [dbo].[Enroll] ([StudentId], [GroupId]) VALUES (8, 2)
INSERT [dbo].[Enroll] ([StudentId], [GroupId]) VALUES (9, 2)
INSERT [dbo].[Enroll] ([StudentId], [GroupId]) VALUES (10, 2)
INSERT [dbo].[Enroll] ([StudentId], [GroupId]) VALUES (15, 3)
INSERT [dbo].[Enroll] ([StudentId], [GroupId]) VALUES (16, 3)
INSERT [dbo].[Enroll] ([StudentId], [GroupId]) VALUES (11, 3)
INSERT [dbo].[Enroll] ([StudentId], [GroupId]) VALUES (12, 3)
INSERT [dbo].[Enroll] ([StudentId], [GroupId]) VALUES (13, 3)
INSERT [dbo].[Enroll] ([StudentId], [GroupId]) VALUES (14, 3)
INSERT [dbo].[Enroll] ([StudentId], [GroupId]) VALUES (7, 3)
INSERT [dbo].[Enroll] ([StudentId], [GroupId]) VALUES (8, 3)
INSERT [dbo].[Enroll] ([StudentId], [GroupId]) VALUES (9, 3)
INSERT [dbo].[Enroll] ([StudentId], [GroupId]) VALUES (10, 3)
INSERT [dbo].[Enroll] ([StudentId], [GroupId]) VALUES (15, 4)
INSERT [dbo].[Enroll] ([StudentId], [GroupId]) VALUES (16, 4)
INSERT [dbo].[Enroll] ([StudentId], [GroupId]) VALUES (11, 4)
INSERT [dbo].[Enroll] ([StudentId], [GroupId]) VALUES (12, 4)
INSERT [dbo].[Enroll] ([StudentId], [GroupId]) VALUES (13, 4)
INSERT [dbo].[Enroll] ([StudentId], [GroupId]) VALUES (14, 4)
INSERT [dbo].[Enroll] ([StudentId], [GroupId]) VALUES (17, 4)
INSERT [dbo].[Enroll] ([StudentId], [GroupId]) VALUES (18, 4)
INSERT [dbo].[Enroll] ([StudentId], [GroupId]) VALUES (9, 4)
INSERT [dbo].[Enroll] ([StudentId], [GroupId]) VALUES (5, 4)
INSERT [dbo].[Enroll] ([StudentId], [GroupId]) VALUES (17, 5)
INSERT [dbo].[Enroll] ([StudentId], [GroupId]) VALUES (18, 5)
INSERT [dbo].[Enroll] ([StudentId], [GroupId]) VALUES (15, 5)
INSERT [dbo].[Enroll] ([StudentId], [GroupId]) VALUES (16, 5)
INSERT [dbo].[Enroll] ([StudentId], [GroupId]) VALUES (1, 5)
INSERT [dbo].[Enroll] ([StudentId], [GroupId]) VALUES (2, 5)
INSERT [dbo].[Enroll] ([StudentId], [GroupId]) VALUES (3, 5)
INSERT [dbo].[Enroll] ([StudentId], [GroupId]) VALUES (4, 5)
INSERT [dbo].[Enroll] ([StudentId], [GroupId]) VALUES (9, 5)
INSERT [dbo].[Enroll] ([StudentId], [GroupId]) VALUES (5, 5)
INSERT [dbo].[Enroll] ([StudentId], [GroupId]) VALUES (17, 6)
INSERT [dbo].[Enroll] ([StudentId], [GroupId]) VALUES (18, 6)
INSERT [dbo].[Enroll] ([StudentId], [GroupId]) VALUES (15, 6)
INSERT [dbo].[Enroll] ([StudentId], [GroupId]) VALUES (16, 6)
INSERT [dbo].[Enroll] ([StudentId], [GroupId]) VALUES (13, 6)
INSERT [dbo].[Enroll] ([StudentId], [GroupId]) VALUES (12, 6)
INSERT [dbo].[Enroll] ([StudentId], [GroupId]) VALUES (11, 6)
INSERT [dbo].[Enroll] ([StudentId], [GroupId]) VALUES (4, 6)
INSERT [dbo].[Enroll] ([StudentId], [GroupId]) VALUES (9, 6)
INSERT [dbo].[Enroll] ([StudentId], [GroupId]) VALUES (5, 6)
INSERT [dbo].[Enroll] ([StudentId], [GroupId]) VALUES (17, 7)
INSERT [dbo].[Enroll] ([StudentId], [GroupId]) VALUES (18, 7)
INSERT [dbo].[Enroll] ([StudentId], [GroupId]) VALUES (15, 7)
INSERT [dbo].[Enroll] ([StudentId], [GroupId]) VALUES (16, 7)
INSERT [dbo].[Enroll] ([StudentId], [GroupId]) VALUES (13, 7)
INSERT [dbo].[Enroll] ([StudentId], [GroupId]) VALUES (12, 7)
INSERT [dbo].[Enroll] ([StudentId], [GroupId]) VALUES (11, 7)
INSERT [dbo].[Enroll] ([StudentId], [GroupId]) VALUES (14, 7)
INSERT [dbo].[Enroll] ([StudentId], [GroupId]) VALUES (10, 7)
INSERT [dbo].[Enroll] ([StudentId], [GroupId]) VALUES (5, 7)
GO
SET IDENTITY_INSERT [dbo].[GroupS] ON 

INSERT [dbo].[GroupS] ([GroupId], [SubjectId], [SemesterId], [GroupCode]) VALUES (1, 1, 2, N'SE1607    ')
INSERT [dbo].[GroupS] ([GroupId], [SubjectId], [SemesterId], [GroupCode]) VALUES (2, 2, 3, N'SE1506    ')
INSERT [dbo].[GroupS] ([GroupId], [SubjectId], [SemesterId], [GroupCode]) VALUES (3, 3, 4, N'IOT1513   ')
INSERT [dbo].[GroupS] ([GroupId], [SubjectId], [SemesterId], [GroupCode]) VALUES (4, 4, 5, N'SE1506    ')
INSERT [dbo].[GroupS] ([GroupId], [SubjectId], [SemesterId], [GroupCode]) VALUES (5, 5, 6, N'SE1617    ')
INSERT [dbo].[GroupS] ([GroupId], [SubjectId], [SemesterId], [GroupCode]) VALUES (6, 6, 7, N'JP1513    ')
INSERT [dbo].[GroupS] ([GroupId], [SubjectId], [SemesterId], [GroupCode]) VALUES (7, 7, 8, N'AI1603    ')
INSERT [dbo].[GroupS] ([GroupId], [SubjectId], [SemesterId], [GroupCode]) VALUES (8, 8, 9, N'AI1605    ')
INSERT [dbo].[GroupS] ([GroupId], [SubjectId], [SemesterId], [GroupCode]) VALUES (9, 9, 10, N'HS1515    ')
INSERT [dbo].[GroupS] ([GroupId], [SubjectId], [SemesterId], [GroupCode]) VALUES (10, 10, 2, N'HS1535    ')
SET IDENTITY_INSERT [dbo].[GroupS] OFF
GO
SET IDENTITY_INSERT [dbo].[Mark] ON 

INSERT [dbo].[Mark] ([MarkId], [StudentId], [AsssessId], [Mark]) VALUES (1, 1, 1, 5)
INSERT [dbo].[Mark] ([MarkId], [StudentId], [AsssessId], [Mark]) VALUES (2, 1, 1, 7)
INSERT [dbo].[Mark] ([MarkId], [StudentId], [AsssessId], [Mark]) VALUES (3, 1, 2, 6)
INSERT [dbo].[Mark] ([MarkId], [StudentId], [AsssessId], [Mark]) VALUES (4, 1, 3, 5)
INSERT [dbo].[Mark] ([MarkId], [StudentId], [AsssessId], [Mark]) VALUES (5, 1, 3, 6)
INSERT [dbo].[Mark] ([MarkId], [StudentId], [AsssessId], [Mark]) VALUES (6, 1, 3, 7)
INSERT [dbo].[Mark] ([MarkId], [StudentId], [AsssessId], [Mark]) VALUES (7, 1, 3, 4)
INSERT [dbo].[Mark] ([MarkId], [StudentId], [AsssessId], [Mark]) VALUES (8, 1, 3, 8)
INSERT [dbo].[Mark] ([MarkId], [StudentId], [AsssessId], [Mark]) VALUES (9, 1, 4, 8)
INSERT [dbo].[Mark] ([MarkId], [StudentId], [AsssessId], [Mark]) VALUES (10, 1, 5, 6)
INSERT [dbo].[Mark] ([MarkId], [StudentId], [AsssessId], [Mark]) VALUES (11, 2, 1, 7)
INSERT [dbo].[Mark] ([MarkId], [StudentId], [AsssessId], [Mark]) VALUES (12, 2, 1, 8)
INSERT [dbo].[Mark] ([MarkId], [StudentId], [AsssessId], [Mark]) VALUES (13, 2, 2, 9)
INSERT [dbo].[Mark] ([MarkId], [StudentId], [AsssessId], [Mark]) VALUES (14, 2, 3, 9)
INSERT [dbo].[Mark] ([MarkId], [StudentId], [AsssessId], [Mark]) VALUES (15, 2, 3, 8)
INSERT [dbo].[Mark] ([MarkId], [StudentId], [AsssessId], [Mark]) VALUES (16, 2, 3, 7)
INSERT [dbo].[Mark] ([MarkId], [StudentId], [AsssessId], [Mark]) VALUES (17, 2, 3, 7)
INSERT [dbo].[Mark] ([MarkId], [StudentId], [AsssessId], [Mark]) VALUES (18, 2, 3, 6)
INSERT [dbo].[Mark] ([MarkId], [StudentId], [AsssessId], [Mark]) VALUES (19, 2, 4, 5)
INSERT [dbo].[Mark] ([MarkId], [StudentId], [AsssessId], [Mark]) VALUES (20, 2, 5, 7)
INSERT [dbo].[Mark] ([MarkId], [StudentId], [AsssessId], [Mark]) VALUES (21, 3, 1, 6)
INSERT [dbo].[Mark] ([MarkId], [StudentId], [AsssessId], [Mark]) VALUES (22, 3, 1, 6)
INSERT [dbo].[Mark] ([MarkId], [StudentId], [AsssessId], [Mark]) VALUES (23, 3, 2, 6)
INSERT [dbo].[Mark] ([MarkId], [StudentId], [AsssessId], [Mark]) VALUES (24, 3, 3, 9)
INSERT [dbo].[Mark] ([MarkId], [StudentId], [AsssessId], [Mark]) VALUES (25, 3, 3, 5)
INSERT [dbo].[Mark] ([MarkId], [StudentId], [AsssessId], [Mark]) VALUES (26, 3, 3, 7)
INSERT [dbo].[Mark] ([MarkId], [StudentId], [AsssessId], [Mark]) VALUES (27, 3, 3, 8)
INSERT [dbo].[Mark] ([MarkId], [StudentId], [AsssessId], [Mark]) VALUES (28, 3, 3, 6)
INSERT [dbo].[Mark] ([MarkId], [StudentId], [AsssessId], [Mark]) VALUES (29, 3, 4, 5)
INSERT [dbo].[Mark] ([MarkId], [StudentId], [AsssessId], [Mark]) VALUES (30, 3, 5, 9)
INSERT [dbo].[Mark] ([MarkId], [StudentId], [AsssessId], [Mark]) VALUES (31, 4, 1, 7)
INSERT [dbo].[Mark] ([MarkId], [StudentId], [AsssessId], [Mark]) VALUES (32, 4, 1, 7)
INSERT [dbo].[Mark] ([MarkId], [StudentId], [AsssessId], [Mark]) VALUES (33, 4, 2, 7)
INSERT [dbo].[Mark] ([MarkId], [StudentId], [AsssessId], [Mark]) VALUES (34, 4, 3, 7)
INSERT [dbo].[Mark] ([MarkId], [StudentId], [AsssessId], [Mark]) VALUES (35, 4, 3, 8)
INSERT [dbo].[Mark] ([MarkId], [StudentId], [AsssessId], [Mark]) VALUES (36, 4, 3, 8)
INSERT [dbo].[Mark] ([MarkId], [StudentId], [AsssessId], [Mark]) VALUES (37, 4, 3, 8)
INSERT [dbo].[Mark] ([MarkId], [StudentId], [AsssessId], [Mark]) VALUES (38, 4, 3, 5)
INSERT [dbo].[Mark] ([MarkId], [StudentId], [AsssessId], [Mark]) VALUES (39, 4, 4, 7)
INSERT [dbo].[Mark] ([MarkId], [StudentId], [AsssessId], [Mark]) VALUES (40, 4, 5, 9)
SET IDENTITY_INSERT [dbo].[Mark] OFF
GO
SET IDENTITY_INSERT [dbo].[Semester] ON 

INSERT [dbo].[Semester] ([SemesterId], [SemesterName]) VALUES (1, N'Summer2019     ')
INSERT [dbo].[Semester] ([SemesterId], [SemesterName]) VALUES (2, N'Summer2020     ')
INSERT [dbo].[Semester] ([SemesterId], [SemesterName]) VALUES (3, N'Summer2021     ')
INSERT [dbo].[Semester] ([SemesterId], [SemesterName]) VALUES (4, N'Summer2022     ')
INSERT [dbo].[Semester] ([SemesterId], [SemesterName]) VALUES (5, N'Spring2019     ')
INSERT [dbo].[Semester] ([SemesterId], [SemesterName]) VALUES (6, N'Spring2020     ')
INSERT [dbo].[Semester] ([SemesterId], [SemesterName]) VALUES (7, N'Spring2021     ')
INSERT [dbo].[Semester] ([SemesterId], [SemesterName]) VALUES (8, N'Spring2022     ')
INSERT [dbo].[Semester] ([SemesterId], [SemesterName]) VALUES (9, N'Fall2019       ')
INSERT [dbo].[Semester] ([SemesterId], [SemesterName]) VALUES (10, N'Fall2020       ')
INSERT [dbo].[Semester] ([SemesterId], [SemesterName]) VALUES (11, N'Fall2021       ')
SET IDENTITY_INSERT [dbo].[Semester] OFF
GO
SET IDENTITY_INSERT [dbo].[Student] ON 

INSERT [dbo].[Student] ([StudentId], [Dob], [Name], [Email], [Gender], [StudentCode]) VALUES (1, CAST(N'2001-05-06' AS Date), N'Le Quang Manh', N'manh@gmail.com', 1, N'HE163617')
INSERT [dbo].[Student] ([StudentId], [Dob], [Name], [Email], [Gender], [StudentCode]) VALUES (2, CAST(N'2002-07-06' AS Date), N'Le Hong Quan', N'quan@gmail.com', 1, N'HE153617')
INSERT [dbo].[Student] ([StudentId], [Dob], [Name], [Email], [Gender], [StudentCode]) VALUES (3, CAST(N'2002-07-06' AS Date), N'Doan Hai Manh', N'manh@gmail.com', 1, N'HE143617')
INSERT [dbo].[Student] ([StudentId], [Dob], [Name], [Email], [Gender], [StudentCode]) VALUES (4, CAST(N'2003-05-08' AS Date), N'Trinh Quang Thang', N'manh@gmail.com', 1, N'HE173617')
INSERT [dbo].[Student] ([StudentId], [Dob], [Name], [Email], [Gender], [StudentCode]) VALUES (5, CAST(N'2002-10-06' AS Date), N'Dinh Tien Manh', N'manh@gmail.com', 1, N'HE164619')
INSERT [dbo].[Student] ([StudentId], [Dob], [Name], [Email], [Gender], [StudentCode]) VALUES (6, CAST(N'2002-04-09' AS Date), N'Le Quang Trung', N'manh@gmail.com', 1, N'HE123613')
INSERT [dbo].[Student] ([StudentId], [Dob], [Name], [Email], [Gender], [StudentCode]) VALUES (7, CAST(N'2001-05-06' AS Date), N' Quang Manh', N'manh@gmail.com', 1, N'HE163617')
INSERT [dbo].[Student] ([StudentId], [Dob], [Name], [Email], [Gender], [StudentCode]) VALUES (8, CAST(N'2002-03-03' AS Date), N'Le Hong ', N'quan@gmail.com', 1, N'HE153635')
INSERT [dbo].[Student] ([StudentId], [Dob], [Name], [Email], [Gender], [StudentCode]) VALUES (9, CAST(N'2002-07-07' AS Date), N'Doan Hai ', N'hai@gmail.com', 1, N'HE143435')
INSERT [dbo].[Student] ([StudentId], [Dob], [Name], [Email], [Gender], [StudentCode]) VALUES (10, CAST(N'2003-08-08' AS Date), N'Trinh  Thang', N'Thang@gmail.com', 1, N'HE171234')
INSERT [dbo].[Student] ([StudentId], [Dob], [Name], [Email], [Gender], [StudentCode]) VALUES (11, CAST(N'2002-10-10' AS Date), N'Dinh  Manh', N'Manh@gmail.com', 1, N'HE164456')
INSERT [dbo].[Student] ([StudentId], [Dob], [Name], [Email], [Gender], [StudentCode]) VALUES (12, CAST(N'2002-09-09' AS Date), N'Le  Trung', N'Trung@gmail.com', 1, N'HE145632')
INSERT [dbo].[Student] ([StudentId], [Dob], [Name], [Email], [Gender], [StudentCode]) VALUES (13, CAST(N'2001-01-06' AS Date), N' Quang Manh Hang', N'Hang@gmail.com', 0, N'HE153617')
INSERT [dbo].[Student] ([StudentId], [Dob], [Name], [Email], [Gender], [StudentCode]) VALUES (14, CAST(N'2001-03-03' AS Date), N'Le Hong Trung', N'Trung@gmail.com', 0, N'HE153638')
INSERT [dbo].[Student] ([StudentId], [Dob], [Name], [Email], [Gender], [StudentCode]) VALUES (15, CAST(N'2003-07-07' AS Date), N'Doan Hai An', N'An@gmail.com', 0, N'HE143439')
INSERT [dbo].[Student] ([StudentId], [Dob], [Name], [Email], [Gender], [StudentCode]) VALUES (16, CAST(N'2002-08-08' AS Date), N'Trinh Thang Nhe', N'Nhe@gmail.com', 0, N'HE171238')
INSERT [dbo].[Student] ([StudentId], [Dob], [Name], [Email], [Gender], [StudentCode]) VALUES (17, CAST(N'2001-10-10' AS Date), N'Dinh  Manh Phong', N'Phong@gmail.com', 0, N'HE164457')
INSERT [dbo].[Student] ([StudentId], [Dob], [Name], [Email], [Gender], [StudentCode]) VALUES (18, CAST(N'2002-03-09' AS Date), N'Le  Trung Hung', N'Hung@gmail.com', 0, N'HE145633')
SET IDENTITY_INSERT [dbo].[Student] OFF
GO
SET IDENTITY_INSERT [dbo].[Subject] ON 

INSERT [dbo].[Subject] ([SubjectId], [SubjectCode], [SubjectName]) VALUES (1, N'WED201c   ', N'Web Design')
INSERT [dbo].[Subject] ([SubjectId], [SubjectCode], [SubjectName]) VALUES (2, N'2DP49     ', N'Digital project 2D')
INSERT [dbo].[Subject] ([SubjectId], [SubjectCode], [SubjectName]) VALUES (3, N'JPD113    ', N'Elementary Japanese 1-A1.1')
INSERT [dbo].[Subject] ([SubjectId], [SubjectCode], [SubjectName]) VALUES (4, N'IOT102    ', N'Internet of Things')
INSERT [dbo].[Subject] ([SubjectId], [SubjectCode], [SubjectName]) VALUES (5, N'ACC101    ', N'Principles of Accounting ')
INSERT [dbo].[Subject] ([SubjectId], [SubjectCode], [SubjectName]) VALUES (6, N'SWE201c   ', N'Introduction to Software Engineering')
INSERT [dbo].[Subject] ([SubjectId], [SubjectCode], [SubjectName]) VALUES (7, N'SWP391    ', N'Application development project')
INSERT [dbo].[Subject] ([SubjectId], [SubjectCode], [SubjectName]) VALUES (8, N'CSD201    ', N'Data Structures and Algorithms ')
INSERT [dbo].[Subject] ([SubjectId], [SubjectCode], [SubjectName]) VALUES (9, N'PRE201c   ', N'Excel Skills for Business ')
INSERT [dbo].[Subject] ([SubjectId], [SubjectCode], [SubjectName]) VALUES (10, N'SWT301    ', N'Software Testing')
INSERT [dbo].[Subject] ([SubjectId], [SubjectCode], [SubjectName]) VALUES (11, N'JPD123    ', N'Elementary Japanese 1-A1.2')
SET IDENTITY_INSERT [dbo].[Subject] OFF
GO
INSERT [dbo].[Teach] ([TeacherId], [GroupId]) VALUES (1, 1)
INSERT [dbo].[Teach] ([TeacherId], [GroupId]) VALUES (2, 2)
INSERT [dbo].[Teach] ([TeacherId], [GroupId]) VALUES (3, 3)
INSERT [dbo].[Teach] ([TeacherId], [GroupId]) VALUES (4, 4)
INSERT [dbo].[Teach] ([TeacherId], [GroupId]) VALUES (1, 5)
INSERT [dbo].[Teach] ([TeacherId], [GroupId]) VALUES (2, 6)
INSERT [dbo].[Teach] ([TeacherId], [GroupId]) VALUES (3, 7)
INSERT [dbo].[Teach] ([TeacherId], [GroupId]) VALUES (1, 2)
INSERT [dbo].[Teach] ([TeacherId], [GroupId]) VALUES (4, 8)
INSERT [dbo].[Teach] ([TeacherId], [GroupId]) VALUES (1, 9)
INSERT [dbo].[Teach] ([TeacherId], [GroupId]) VALUES (2, 10)
GO
SET IDENTITY_INSERT [dbo].[Teacher] ON 

INSERT [dbo].[Teacher] ([TeacherId], [Dob], [Name], [Email], [Gender]) VALUES (1, CAST(N'1990-04-03' AS Date), N'Haint', N'hai@gmail.com', 0)
INSERT [dbo].[Teacher] ([TeacherId], [Dob], [Name], [Email], [Gender]) VALUES (2, CAST(N'1985-05-03' AS Date), N'Trunglt', N'trung@gmail.com', 1)
INSERT [dbo].[Teacher] ([TeacherId], [Dob], [Name], [Email], [Gender]) VALUES (3, CAST(N'1980-08-03' AS Date), N'Dangva', N'dang@gmail.com', 1)
INSERT [dbo].[Teacher] ([TeacherId], [Dob], [Name], [Email], [Gender]) VALUES (4, CAST(N'1980-08-05' AS Date), N'Chilt', N'chi@gmail.com', 0)
SET IDENTITY_INSERT [dbo].[Teacher] OFF
GO
ALTER TABLE [dbo].[Assessment]  WITH CHECK ADD  CONSTRAINT [FK_Assessment_Subject] FOREIGN KEY([SubjectId])
REFERENCES [dbo].[Subject] ([SubjectId])
GO
ALTER TABLE [dbo].[Assessment] CHECK CONSTRAINT [FK_Assessment_Subject]
GO
ALTER TABLE [dbo].[Enroll]  WITH CHECK ADD  CONSTRAINT [FK_Enroll_GroupS] FOREIGN KEY([GroupId])
REFERENCES [dbo].[GroupS] ([GroupId])
GO
ALTER TABLE [dbo].[Enroll] CHECK CONSTRAINT [FK_Enroll_GroupS]
GO
ALTER TABLE [dbo].[Enroll]  WITH CHECK ADD  CONSTRAINT [FK_Enroll_Student] FOREIGN KEY([StudentId])
REFERENCES [dbo].[Student] ([StudentId])
GO
ALTER TABLE [dbo].[Enroll] CHECK CONSTRAINT [FK_Enroll_Student]
GO
ALTER TABLE [dbo].[GroupS]  WITH CHECK ADD  CONSTRAINT [FK_GroupS_Semester] FOREIGN KEY([SemesterId])
REFERENCES [dbo].[Semester] ([SemesterId])
GO
ALTER TABLE [dbo].[GroupS] CHECK CONSTRAINT [FK_GroupS_Semester]
GO
ALTER TABLE [dbo].[GroupS]  WITH CHECK ADD  CONSTRAINT [FK_GroupS_Subject] FOREIGN KEY([SubjectId])
REFERENCES [dbo].[Subject] ([SubjectId])
GO
ALTER TABLE [dbo].[GroupS] CHECK CONSTRAINT [FK_GroupS_Subject]
GO
ALTER TABLE [dbo].[Mark]  WITH CHECK ADD  CONSTRAINT [FK_Mark_Assessment] FOREIGN KEY([AsssessId])
REFERENCES [dbo].[Assessment] ([AssId])
GO
ALTER TABLE [dbo].[Mark] CHECK CONSTRAINT [FK_Mark_Assessment]
GO
ALTER TABLE [dbo].[Mark]  WITH CHECK ADD  CONSTRAINT [FK_Mark_Student] FOREIGN KEY([StudentId])
REFERENCES [dbo].[Student] ([StudentId])
GO
ALTER TABLE [dbo].[Mark] CHECK CONSTRAINT [FK_Mark_Student]
GO
ALTER TABLE [dbo].[Teach]  WITH CHECK ADD  CONSTRAINT [FK_Teach_GroupS] FOREIGN KEY([GroupId])
REFERENCES [dbo].[GroupS] ([GroupId])
GO
ALTER TABLE [dbo].[Teach] CHECK CONSTRAINT [FK_Teach_GroupS]
GO
ALTER TABLE [dbo].[Teach]  WITH CHECK ADD  CONSTRAINT [FK_Teach_Teacher] FOREIGN KEY([TeacherId])
REFERENCES [dbo].[Teacher] ([TeacherId])
GO
ALTER TABLE [dbo].[Teach] CHECK CONSTRAINT [FK_Teach_Teacher]
GO
USE [master]
GO
ALTER DATABASE [Assignment_DBI] SET  READ_WRITE 
GO
