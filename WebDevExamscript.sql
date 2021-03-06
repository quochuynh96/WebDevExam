USE [master]
GO
/****** Object:  Database [WebDevExam]    Script Date: 5/13/2019 12:40:38 PM ******/
CREATE DATABASE [WebDevExam]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'WebDevExam', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\WebDevExam.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'WebDevExam_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\WebDevExam_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [WebDevExam] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [WebDevExam].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [WebDevExam] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [WebDevExam] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [WebDevExam] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [WebDevExam] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [WebDevExam] SET ARITHABORT OFF 
GO
ALTER DATABASE [WebDevExam] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [WebDevExam] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [WebDevExam] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [WebDevExam] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [WebDevExam] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [WebDevExam] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [WebDevExam] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [WebDevExam] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [WebDevExam] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [WebDevExam] SET  DISABLE_BROKER 
GO
ALTER DATABASE [WebDevExam] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [WebDevExam] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [WebDevExam] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [WebDevExam] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [WebDevExam] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [WebDevExam] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [WebDevExam] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [WebDevExam] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [WebDevExam] SET  MULTI_USER 
GO
ALTER DATABASE [WebDevExam] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [WebDevExam] SET DB_CHAINING OFF 
GO
ALTER DATABASE [WebDevExam] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [WebDevExam] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [WebDevExam] SET DELAYED_DURABILITY = DISABLED 
GO
USE [WebDevExam]
GO
/****** Object:  Table [dbo].[Course]    Script Date: 5/13/2019 12:40:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Course](
	[CourseID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](max) NULL,
	[Credits] [float] NULL,
 CONSTRAINT [PK_Course] PRIMARY KEY CLUSTERED 
(
	[CourseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Enrollment]    Script Date: 5/13/2019 12:40:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Enrollment](
	[EnrollmentID] [int] IDENTITY(1,1) NOT NULL,
	[Grade] [int] NULL,
	[CourselD] [int] NULL,
	[StudentID] [int] NULL,
 CONSTRAINT [PK_Enrollment] PRIMARY KEY CLUSTERED 
(
	[EnrollmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Student]    Script Date: 5/13/2019 12:40:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[StudentID] [int] IDENTITY(1,1) NOT NULL,
	[LastName] [nvarchar](50) NULL,
	[FirstName] [nvarchar](50) NULL,
	[EnrollmentDate] [date] NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[StudentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Course] ON 

INSERT [dbo].[Course] ([CourseID], [Title], [Credits]) VALUES (1, N'Java Basic', 100000)
INSERT [dbo].[Course] ([CourseID], [Title], [Credits]) VALUES (2, N'C', 100000)
INSERT [dbo].[Course] ([CourseID], [Title], [Credits]) VALUES (3, N'C#', 200000)
INSERT [dbo].[Course] ([CourseID], [Title], [Credits]) VALUES (4, N'C++', 300000)
INSERT [dbo].[Course] ([CourseID], [Title], [Credits]) VALUES (5, N'Pascal', 500000)
INSERT [dbo].[Course] ([CourseID], [Title], [Credits]) VALUES (6, N'HTML', 450000)
INSERT [dbo].[Course] ([CourseID], [Title], [Credits]) VALUES (7, N'CSS', 100000)
INSERT [dbo].[Course] ([CourseID], [Title], [Credits]) VALUES (11, N'JSa', 123123)
SET IDENTITY_INSERT [dbo].[Course] OFF
SET IDENTITY_INSERT [dbo].[Enrollment] ON 

INSERT [dbo].[Enrollment] ([EnrollmentID], [Grade], [CourselD], [StudentID]) VALUES (2, 2, 1, 2)
INSERT [dbo].[Enrollment] ([EnrollmentID], [Grade], [CourselD], [StudentID]) VALUES (4, 3, 3, 2)
INSERT [dbo].[Enrollment] ([EnrollmentID], [Grade], [CourselD], [StudentID]) VALUES (5, 1, 3, 4)
INSERT [dbo].[Enrollment] ([EnrollmentID], [Grade], [CourselD], [StudentID]) VALUES (7, 1, 1, 3)
INSERT [dbo].[Enrollment] ([EnrollmentID], [Grade], [CourselD], [StudentID]) VALUES (8, 1, 1, 4)
INSERT [dbo].[Enrollment] ([EnrollmentID], [Grade], [CourselD], [StudentID]) VALUES (10, 2, 2, 2)
INSERT [dbo].[Enrollment] ([EnrollmentID], [Grade], [CourselD], [StudentID]) VALUES (11, 2, 2, 1)
INSERT [dbo].[Enrollment] ([EnrollmentID], [Grade], [CourselD], [StudentID]) VALUES (12, 2, 2, 3)
INSERT [dbo].[Enrollment] ([EnrollmentID], [Grade], [CourselD], [StudentID]) VALUES (13, 2, 2, 4)
SET IDENTITY_INSERT [dbo].[Enrollment] OFF
SET IDENTITY_INSERT [dbo].[Student] ON 

INSERT [dbo].[Student] ([StudentID], [LastName], [FirstName], [EnrollmentDate]) VALUES (1, N'Truong Quoc', N'Huynh', CAST(N'2019-06-03' AS Date))
INSERT [dbo].[Student] ([StudentID], [LastName], [FirstName], [EnrollmentDate]) VALUES (2, N'Nguyen Van', N'A', CAST(N'2019-05-02' AS Date))
INSERT [dbo].[Student] ([StudentID], [LastName], [FirstName], [EnrollmentDate]) VALUES (3, N'Nguyen Van', N'B', CAST(N'2019-05-06' AS Date))
INSERT [dbo].[Student] ([StudentID], [LastName], [FirstName], [EnrollmentDate]) VALUES (4, N'Le Van', N'C', CAST(N'2019-07-08' AS Date))
INSERT [dbo].[Student] ([StudentID], [LastName], [FirstName], [EnrollmentDate]) VALUES (5, N'Le Thi', N'D', CAST(N'2019-04-05' AS Date))
SET IDENTITY_INSERT [dbo].[Student] OFF
ALTER TABLE [dbo].[Enrollment]  WITH CHECK ADD  CONSTRAINT [FK_Enrollment_Course] FOREIGN KEY([CourselD])
REFERENCES [dbo].[Course] ([CourseID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Enrollment] CHECK CONSTRAINT [FK_Enrollment_Course]
GO
ALTER TABLE [dbo].[Enrollment]  WITH CHECK ADD  CONSTRAINT [FK_Enrollment_Student] FOREIGN KEY([StudentID])
REFERENCES [dbo].[Student] ([StudentID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Enrollment] CHECK CONSTRAINT [FK_Enrollment_Student]
GO
USE [master]
GO
ALTER DATABASE [WebDevExam] SET  READ_WRITE 
GO
