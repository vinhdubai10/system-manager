
ALTER DATABASE [PRJ301_Assignment1] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PRJ301_Assignment1] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PRJ301_Assignment1] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PRJ301_Assignment1] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PRJ301_Assignment1] SET ARITHABORT OFF 
GO
ALTER DATABASE [PRJ301_Assignment1] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PRJ301_Assignment1] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PRJ301_Assignment1] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PRJ301_Assignment1] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PRJ301_Assignment1] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PRJ301_Assignment1] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PRJ301_Assignment1] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PRJ301_Assignment1] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PRJ301_Assignment1] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PRJ301_Assignment1] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PRJ301_Assignment1] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PRJ301_Assignment1] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PRJ301_Assignment1] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PRJ301_Assignment1] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PRJ301_Assignment1] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PRJ301_Assignment1] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PRJ301_Assignment1] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PRJ301_Assignment1] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [PRJ301_Assignment1] SET  MULTI_USER 
GO
ALTER DATABASE [PRJ301_Assignment1] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PRJ301_Assignment1] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PRJ301_Assignment1] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PRJ301_Assignment1] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PRJ301_Assignment1] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PRJ301_Assignment1] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [PRJ301_Assignment1] SET QUERY_STORE = OFF
GO
USE [PRJ301_Assignment1]
GO
/****** Object:  Table [dbo].[Assessments]    Script Date: 28/02/2023 23:05:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Assessments](
	[AssessmentID] [nvarchar](10) NOT NULL,
	[AssessmentName] [nvarchar](30) NOT NULL,
	[Weight] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[AssessmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Attend]    Script Date: 28/02/2023 23:05:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Attend](
	[AttendID] [nvarchar](10) NOT NULL,
	[Status] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[AttendID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AttendDetail]    Script Date: 28/02/2023 23:05:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AttendDetail](
	[AttendDetailID] [nvarchar](10) NOT NULL,
	[AttendID] [nvarchar](10) NULL,
	[SlotID] [nvarchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[AttendDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Classes]    Script Date: 28/02/2023 23:05:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Classes](
	[ClassID] [nvarchar](10) NOT NULL,
	[ClassName] [nvarchar](10) NOT NULL,
	[InstructorID] [nvarchar](10) NULL,
	[SubjectID] [nvarchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[ClassID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MarkReport]    Script Date: 28/02/2023 23:05:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MarkReport](
	[MarkReportID] [nvarchar](10) NOT NULL,
	[UserID] [nvarchar](10) NULL,
	[ClassID] [nvarchar](10) NULL,
	[TotalMark] [float] NOT NULL,
	[StatusResult] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MarkReportID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MarkReportDetail]    Script Date: 28/02/2023 23:05:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MarkReportDetail](
	[MarkReportID] [nvarchar](10) NOT NULL,
	[AssessmentID] [nvarchar](10) NOT NULL,
	[Score] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MarkReportID] ASC,
	[AssessmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Message]    Script Date: 28/02/2023 23:05:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Message](
	[MessageID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [nvarchar](10) NULL,
	[Type] [nvarchar](100) NULL,
	[Purpose] [nvarchar](3000) NULL,
	[DateCreate] [date] NULL,
	[Response] [nvarchar](3000) NULL,
	[DateResponse] [date] NULL,
	[Status] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MessageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Programming]    Script Date: 28/02/2023 23:05:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Programming](
	[ProgrammingID] [nvarchar](10) NOT NULL,
	[ProgrammingName] [nvarchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ProgrammingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProgrammingLinkSubjects]    Script Date: 28/02/2023 23:05:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProgrammingLinkSubjects](
	[ProgramingID] [nvarchar](10) NOT NULL,
	[SubjectID] [nvarchar](10) NOT NULL,
	[Semester] [nvarchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ProgramingID] ASC,
	[SubjectID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Question]    Script Date: 28/02/2023 23:05:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Question](
	[QID] [int] IDENTITY(1,1) NOT NULL,
	[Question] [nvarchar](3000) NULL,
	[A] [nvarchar](3000) NULL,
	[B] [nvarchar](3000) NULL,
	[C] [nvarchar](3000) NULL,
	[D] [nvarchar](3000) NULL,
	[Answer] [nvarchar](3000) NULL,
PRIMARY KEY CLUSTERED 
(
	[QID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Slots]    Script Date: 28/02/2023 23:05:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Slots](
	[SlotID] [nvarchar](10) NOT NULL,
	[ClassID] [nvarchar](10) NULL,
	[Level] [int] NOT NULL,
	[Date] [date] NOT NULL,
	[Time] [nvarchar](30) NOT NULL,
	[Room] [nvarchar](10) NOT NULL,
	[StudentID] [nvarchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[SlotID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Subjects]    Script Date: 28/02/2023 23:05:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subjects](
	[SubjectID] [nvarchar](10) NOT NULL,
	[SubjectName] [nvarchar](30) NOT NULL,
	[NumberCredits] [int] NOT NULL,
	[Fee] [int] NULL,
	[FeeInternational] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[SubjectID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 28/02/2023 23:05:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [nvarchar](10) NOT NULL,
	[Name] [nvarchar](30) NOT NULL,
	[Gender] [int] NOT NULL,
	[Email] [nvarchar](20) NOT NULL,
	[PassWord] [nvarchar](20) NOT NULL,
	[DateOfBirth] [date] NULL,
	[NumberPhone] [varchar](10) NULL,
	[Role] [nvarchar](10) NOT NULL,
	[ProgrammingID] [nvarchar](10) NULL,
	[Status] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Assessments] ([AssessmentID], [AssessmentName], [Weight]) VALUES (N'AS1', N'ProgressTest', 30)
GO
INSERT [dbo].[Attend] ([AttendID], [Status]) VALUES (N'AT1', 1)
INSERT [dbo].[Attend] ([AttendID], [Status]) VALUES (N'AT10', 1)
INSERT [dbo].[Attend] ([AttendID], [Status]) VALUES (N'AT11', 1)
INSERT [dbo].[Attend] ([AttendID], [Status]) VALUES (N'AT12', 1)
INSERT [dbo].[Attend] ([AttendID], [Status]) VALUES (N'AT13', 1)
INSERT [dbo].[Attend] ([AttendID], [Status]) VALUES (N'AT14', 1)
INSERT [dbo].[Attend] ([AttendID], [Status]) VALUES (N'AT15', 1)
INSERT [dbo].[Attend] ([AttendID], [Status]) VALUES (N'AT16', 0)
INSERT [dbo].[Attend] ([AttendID], [Status]) VALUES (N'AT17', 1)
INSERT [dbo].[Attend] ([AttendID], [Status]) VALUES (N'AT18', 1)
INSERT [dbo].[Attend] ([AttendID], [Status]) VALUES (N'AT19', 0)
INSERT [dbo].[Attend] ([AttendID], [Status]) VALUES (N'AT2', 1)
INSERT [dbo].[Attend] ([AttendID], [Status]) VALUES (N'AT20', 1)
INSERT [dbo].[Attend] ([AttendID], [Status]) VALUES (N'AT21', 2)
INSERT [dbo].[Attend] ([AttendID], [Status]) VALUES (N'AT22', 2)
INSERT [dbo].[Attend] ([AttendID], [Status]) VALUES (N'AT23', 2)
INSERT [dbo].[Attend] ([AttendID], [Status]) VALUES (N'AT24', 2)
INSERT [dbo].[Attend] ([AttendID], [Status]) VALUES (N'AT3', 1)
INSERT [dbo].[Attend] ([AttendID], [Status]) VALUES (N'AT4', 1)
INSERT [dbo].[Attend] ([AttendID], [Status]) VALUES (N'AT5', 1)
INSERT [dbo].[Attend] ([AttendID], [Status]) VALUES (N'AT6', 1)
INSERT [dbo].[Attend] ([AttendID], [Status]) VALUES (N'AT7', 1)
INSERT [dbo].[Attend] ([AttendID], [Status]) VALUES (N'AT8', 1)
INSERT [dbo].[Attend] ([AttendID], [Status]) VALUES (N'AT9', 1)
GO
INSERT [dbo].[AttendDetail] ([AttendDetailID], [AttendID], [SlotID]) VALUES (N'AD1', N'AT1', N'SL1')
INSERT [dbo].[AttendDetail] ([AttendDetailID], [AttendID], [SlotID]) VALUES (N'AD10', N'AT10', N'SL10')
INSERT [dbo].[AttendDetail] ([AttendDetailID], [AttendID], [SlotID]) VALUES (N'AD11', N'AT11', N'SL11')
INSERT [dbo].[AttendDetail] ([AttendDetailID], [AttendID], [SlotID]) VALUES (N'AD12', N'AT12', N'SL12')
INSERT [dbo].[AttendDetail] ([AttendDetailID], [AttendID], [SlotID]) VALUES (N'AD13', N'AT13', N'SL13')
INSERT [dbo].[AttendDetail] ([AttendDetailID], [AttendID], [SlotID]) VALUES (N'AD14', N'AT14', N'SL14')
INSERT [dbo].[AttendDetail] ([AttendDetailID], [AttendID], [SlotID]) VALUES (N'AD15', N'AT15', N'SL15')
INSERT [dbo].[AttendDetail] ([AttendDetailID], [AttendID], [SlotID]) VALUES (N'AD16', N'AT16', N'SL16')
INSERT [dbo].[AttendDetail] ([AttendDetailID], [AttendID], [SlotID]) VALUES (N'AD17', N'AT17', N'SL17')
INSERT [dbo].[AttendDetail] ([AttendDetailID], [AttendID], [SlotID]) VALUES (N'AD18', N'AT18', N'SL18')
INSERT [dbo].[AttendDetail] ([AttendDetailID], [AttendID], [SlotID]) VALUES (N'AD19', N'AT19', N'SL19')
INSERT [dbo].[AttendDetail] ([AttendDetailID], [AttendID], [SlotID]) VALUES (N'AD2', N'AT2', N'SL2')
INSERT [dbo].[AttendDetail] ([AttendDetailID], [AttendID], [SlotID]) VALUES (N'AD20', N'AT20', N'SL20')
INSERT [dbo].[AttendDetail] ([AttendDetailID], [AttendID], [SlotID]) VALUES (N'AD21', N'AT21', N'SL21')
INSERT [dbo].[AttendDetail] ([AttendDetailID], [AttendID], [SlotID]) VALUES (N'AD22', N'AT22', N'SL22')
INSERT [dbo].[AttendDetail] ([AttendDetailID], [AttendID], [SlotID]) VALUES (N'AD23', N'AT23', N'SL23')
INSERT [dbo].[AttendDetail] ([AttendDetailID], [AttendID], [SlotID]) VALUES (N'AD24', N'AT24', N'SL24')
INSERT [dbo].[AttendDetail] ([AttendDetailID], [AttendID], [SlotID]) VALUES (N'AD3', N'AT3', N'SL3')
INSERT [dbo].[AttendDetail] ([AttendDetailID], [AttendID], [SlotID]) VALUES (N'AD4', N'AT4', N'SL4')
INSERT [dbo].[AttendDetail] ([AttendDetailID], [AttendID], [SlotID]) VALUES (N'AD5', N'AT5', N'SL5')
INSERT [dbo].[AttendDetail] ([AttendDetailID], [AttendID], [SlotID]) VALUES (N'AD6', N'AT6', N'SL6')
INSERT [dbo].[AttendDetail] ([AttendDetailID], [AttendID], [SlotID]) VALUES (N'AD7', N'AT7', N'SL7')
INSERT [dbo].[AttendDetail] ([AttendDetailID], [AttendID], [SlotID]) VALUES (N'AD8', N'AT8', N'SL8')
INSERT [dbo].[AttendDetail] ([AttendDetailID], [AttendID], [SlotID]) VALUES (N'AD9', N'AT9', N'SL9')
GO
INSERT [dbo].[Classes] ([ClassID], [ClassName], [InstructorID], [SubjectID]) VALUES (N'SE1637', N'SE1637', N'TienTD17', N'PRJ301')
INSERT [dbo].[Classes] ([ClassID], [ClassName], [InstructorID], [SubjectID]) VALUES (N'SE1637a', N'SE1637', N'AnhKD', N'IOT102')
INSERT [dbo].[Classes] ([ClassID], [ClassName], [InstructorID], [SubjectID]) VALUES (N'SE1637b', N'SE1637', N'DungNT', N'MAS291')
INSERT [dbo].[Classes] ([ClassID], [ClassName], [InstructorID], [SubjectID]) VALUES (N'SE1637c', N'SE1637', N'HanhVB', N'JPD113')
INSERT [dbo].[Classes] ([ClassID], [ClassName], [InstructorID], [SubjectID]) VALUES (N'SE1637d', N'SE1637', N'ThuyNTB', N'DBI202')
INSERT [dbo].[Classes] ([ClassID], [ClassName], [InstructorID], [SubjectID]) VALUES (N'SE1637e', N'SE1637', N'TruongNQ', N'CSD201')
INSERT [dbo].[Classes] ([ClassID], [ClassName], [InstructorID], [SubjectID]) VALUES (N'SE1637f', N'SE1637', N'TuanVM', N'LAB211')
INSERT [dbo].[Classes] ([ClassID], [ClassName], [InstructorID], [SubjectID]) VALUES (N'SE1637g', N'SE1637', N'TungHT', N'WED201c')
INSERT [dbo].[Classes] ([ClassID], [ClassName], [InstructorID], [SubjectID]) VALUES (N'SE1637h', N'SE1637', N'VanDT', N'JPD123')
GO
INSERT [dbo].[MarkReport] ([MarkReportID], [UserID], [ClassID], [TotalMark], [StatusResult]) VALUES (N'MR1', N'HE160669', N'SE1637', 7, 1)
INSERT [dbo].[MarkReport] ([MarkReportID], [UserID], [ClassID], [TotalMark], [StatusResult]) VALUES (N'MR2', N'HE160669', N'SE1637a', 9, 1)
INSERT [dbo].[MarkReport] ([MarkReportID], [UserID], [ClassID], [TotalMark], [StatusResult]) VALUES (N'MR3', N'HE160669', N'SE1637b', 9, 1)
INSERT [dbo].[MarkReport] ([MarkReportID], [UserID], [ClassID], [TotalMark], [StatusResult]) VALUES (N'MR4', N'HE160669', N'SE1637c', 9.7, 1)
INSERT [dbo].[MarkReport] ([MarkReportID], [UserID], [ClassID], [TotalMark], [StatusResult]) VALUES (N'MR5', N'HE160669', N'SE1637d', 8.7, 1)
INSERT [dbo].[MarkReport] ([MarkReportID], [UserID], [ClassID], [TotalMark], [StatusResult]) VALUES (N'MR6', N'HE160669', N'SE1637e', 8.5, 1)
INSERT [dbo].[MarkReport] ([MarkReportID], [UserID], [ClassID], [TotalMark], [StatusResult]) VALUES (N'MR7', N'HE160669', N'SE1637f', 8, 1)
INSERT [dbo].[MarkReport] ([MarkReportID], [UserID], [ClassID], [TotalMark], [StatusResult]) VALUES (N'MR8', N'HE160669', N'SE1637g', 10, 1)
INSERT [dbo].[MarkReport] ([MarkReportID], [UserID], [ClassID], [TotalMark], [StatusResult]) VALUES (N'MR9', N'HE160669', N'SE1637h', 9.5, 1)
GO
INSERT [dbo].[MarkReportDetail] ([MarkReportID], [AssessmentID], [Score]) VALUES (N'MR1', N'AS1', 9)
GO
SET IDENTITY_INSERT [dbo].[Message] ON 

INSERT [dbo].[Message] ([MessageID], [UserID], [Type], [Purpose], [DateCreate], [Response], [DateResponse], [Status]) VALUES (1, N'HE160669', N'Request for exemption from attendance', N'I wanna be exempted from attendance', CAST(N'2022-11-07' AS Date), N'No, you can''t', CAST(N'2022-11-07' AS Date), 0)
INSERT [dbo].[Message] ([MessageID], [UserID], [Type], [Purpose], [DateCreate], [Response], [DateResponse], [Status]) VALUES (2, N'HE160669', N'Register to study beyond block 1-4', N'Can I register learn a subject in the next semester soon', CAST(N'2022-10-05' AS Date), N'Yes, you can', CAST(N'2022-10-06' AS Date), 1)
INSERT [dbo].[Message] ([MessageID], [UserID], [Type], [Purpose], [DateCreate], [Response], [DateResponse], [Status]) VALUES (3, N'HE160660', N'Proposal to move facility', N'Can I move facility', CAST(N'2022-10-20' AS Date), N'Yes, you can', CAST(N'2022-11-07' AS Date), 1)
INSERT [dbo].[Message] ([MessageID], [UserID], [Type], [Purpose], [DateCreate], [Response], [DateResponse], [Status]) VALUES (4, N'HE160660', N'Register for online assessment of subjects', N'Because I am free in this time, I wanna register networking subject', CAST(N'2022-10-29' AS Date), N'No. you must learn follow your right progress', CAST(N'2022-11-07' AS Date), 0)
INSERT [dbo].[Message] ([MessageID], [UserID], [Type], [Purpose], [DateCreate], [Response], [DateResponse], [Status]) VALUES (5, N'HE160669', N'Register to study beyond block 1-4', N'I wanna register to study SWT in this seemester', CAST(N'2022-11-07' AS Date), N'Yes, you can', CAST(N'2022-11-09' AS Date), 1)
INSERT [dbo].[Message] ([MessageID], [UserID], [Type], [Purpose], [DateCreate], [Response], [DateResponse], [Status]) VALUES (6, N'HE160669', N'Register for online assessment of subjects', N'I wanna reguster for online assessment of subjects', CAST(N'2022-11-08' AS Date), NULL, NULL, 2)
INSERT [dbo].[Message] ([MessageID], [UserID], [Type], [Purpose], [DateCreate], [Response], [DateResponse], [Status]) VALUES (7, N'HE160669', N'Others', N'I wanna be reattended', CAST(N'2022-11-08' AS Date), N'No, you can''t', CAST(N'2022-11-08' AS Date), 0)
INSERT [dbo].[Message] ([MessageID], [UserID], [Type], [Purpose], [DateCreate], [Response], [DateResponse], [Status]) VALUES (8, N'HE160669', N'Request for exemption from attendance', N'ASDFRFG', CAST(N'2022-11-09' AS Date), N'fyregfewcwh', CAST(N'2022-11-09' AS Date), 0)
INSERT [dbo].[Message] ([MessageID], [UserID], [Type], [Purpose], [DateCreate], [Response], [DateResponse], [Status]) VALUES (9, N'HE160669', N'Application to change of major', N'I want to buy an apple', CAST(N'2023-02-14' AS Date), N'Yes, I do', CAST(N'2023-02-14' AS Date), 1)
SET IDENTITY_INSERT [dbo].[Message] OFF
GO
INSERT [dbo].[Programming] ([ProgrammingID], [ProgrammingName]) VALUES (N'AI', N'Artificial Intelligence')
INSERT [dbo].[Programming] ([ProgrammingID], [ProgrammingName]) VALUES (N'GD', N'Graphic Design')
INSERT [dbo].[Programming] ([ProgrammingID], [ProgrammingName]) VALUES (N'IB', N'International Business')
INSERT [dbo].[Programming] ([ProgrammingID], [ProgrammingName]) VALUES (N'IS', N'Information System')
INSERT [dbo].[Programming] ([ProgrammingID], [ProgrammingName]) VALUES (N'MKT', N'Marketing')
INSERT [dbo].[Programming] ([ProgrammingID], [ProgrammingName]) VALUES (N'null', N'null')
INSERT [dbo].[Programming] ([ProgrammingID], [ProgrammingName]) VALUES (N'SE', N'softwareEngineering')
GO
INSERT [dbo].[ProgrammingLinkSubjects] ([ProgramingID], [SubjectID], [Semester]) VALUES (N'SE', N'CSD201', N'3')
INSERT [dbo].[ProgrammingLinkSubjects] ([ProgramingID], [SubjectID], [Semester]) VALUES (N'SE', N'DBI202', N'3')
INSERT [dbo].[ProgrammingLinkSubjects] ([ProgramingID], [SubjectID], [Semester]) VALUES (N'SE', N'IOT102', N'4')
INSERT [dbo].[ProgrammingLinkSubjects] ([ProgramingID], [SubjectID], [Semester]) VALUES (N'SE', N'JPD113', N'3')
INSERT [dbo].[ProgrammingLinkSubjects] ([ProgramingID], [SubjectID], [Semester]) VALUES (N'SE', N'JPD123', N'4')
INSERT [dbo].[ProgrammingLinkSubjects] ([ProgramingID], [SubjectID], [Semester]) VALUES (N'SE', N'LAB211', N'3')
INSERT [dbo].[ProgrammingLinkSubjects] ([ProgramingID], [SubjectID], [Semester]) VALUES (N'SE', N'MAS291', N'4')
INSERT [dbo].[ProgrammingLinkSubjects] ([ProgramingID], [SubjectID], [Semester]) VALUES (N'SE', N'PRJ301', N'4')
INSERT [dbo].[ProgrammingLinkSubjects] ([ProgramingID], [SubjectID], [Semester]) VALUES (N'SE', N'WED201c', N'3')
GO
SET IDENTITY_INSERT [dbo].[Question] ON 

INSERT [dbo].[Question] ([QID], [Question], [A], [B], [C], [D], [Answer]) VALUES (1, N'In Viet Nam, how many seasons are there?', N'1', N'2', N'3', N'4', N'D')
SET IDENTITY_INSERT [dbo].[Question] OFF
GO
INSERT [dbo].[Slots] ([SlotID], [ClassID], [Level], [Date], [Time], [Room], [StudentID]) VALUES (N'SL1', N'SE1637a', 1, CAST(N'2022-10-03' AS Date), N'7:30-9:00', N'DE-C205', N'HE160669')
INSERT [dbo].[Slots] ([SlotID], [ClassID], [Level], [Date], [Time], [Room], [StudentID]) VALUES (N'SL10', N'SE1637a', 1, CAST(N'2022-10-07' AS Date), N'7:30-9:00', N'DE-C205', N'HE160669')
INSERT [dbo].[Slots] ([SlotID], [ClassID], [Level], [Date], [Time], [Room], [StudentID]) VALUES (N'SL11', N'SE1637', 2, CAST(N'2022-10-07' AS Date), N'9:10-10:40', N'DE-C209', N'HE160669')
INSERT [dbo].[Slots] ([SlotID], [ClassID], [Level], [Date], [Time], [Room], [StudentID]) VALUES (N'SL12', N'SE1637b', 3, CAST(N'2022-10-07' AS Date), N'10:50-12:20', N'DE-C209', N'HE160669')
INSERT [dbo].[Slots] ([SlotID], [ClassID], [Level], [Date], [Time], [Room], [StudentID]) VALUES (N'SL13', N'SE1637a', 1, CAST(N'2022-10-10' AS Date), N'9:10-10:40', N'DE-C205', N'HE160669')
INSERT [dbo].[Slots] ([SlotID], [ClassID], [Level], [Date], [Time], [Room], [StudentID]) VALUES (N'SL14', N'SE1637', 2, CAST(N'2022-10-10' AS Date), N'10:50-12:20', N'DE-C209', N'HE160669')
INSERT [dbo].[Slots] ([SlotID], [ClassID], [Level], [Date], [Time], [Room], [StudentID]) VALUES (N'SL15', N'SE1637b', 3, CAST(N'2022-10-10' AS Date), N'10:50-12:20', N'DE-C209', N'HE160669')
INSERT [dbo].[Slots] ([SlotID], [ClassID], [Level], [Date], [Time], [Room], [StudentID]) VALUES (N'SL16', N'SE1637h', 3, CAST(N'2022-10-11' AS Date), N'10:50-12:20', N'DE-C301', N'HE160669')
INSERT [dbo].[Slots] ([SlotID], [ClassID], [Level], [Date], [Time], [Room], [StudentID]) VALUES (N'SL17', N'SE1637a', 1, CAST(N'2022-10-12' AS Date), N'7:30-9:00', N'DE-C205', N'HE160669')
INSERT [dbo].[Slots] ([SlotID], [ClassID], [Level], [Date], [Time], [Room], [StudentID]) VALUES (N'SL18', N'SE1637', 2, CAST(N'2022-10-12' AS Date), N'9:10-10:40', N'DE-C209', N'HE160669')
INSERT [dbo].[Slots] ([SlotID], [ClassID], [Level], [Date], [Time], [Room], [StudentID]) VALUES (N'SL19', N'SE1637b', 3, CAST(N'2022-10-12' AS Date), N'10:50-12:20', N'DE-C209', N'HE160669')
INSERT [dbo].[Slots] ([SlotID], [ClassID], [Level], [Date], [Time], [Room], [StudentID]) VALUES (N'SL2', N'SE1637', 2, CAST(N'2022-10-03' AS Date), N'9:10-10:40', N'DE-C209', N'HE160669')
INSERT [dbo].[Slots] ([SlotID], [ClassID], [Level], [Date], [Time], [Room], [StudentID]) VALUES (N'SL20', N'SE1637h', 2, CAST(N'2022-10-13' AS Date), N'9:10-10:40', N'DE-C301', N'HE160669')
INSERT [dbo].[Slots] ([SlotID], [ClassID], [Level], [Date], [Time], [Room], [StudentID]) VALUES (N'SL21', N'SE1637h', 3, CAST(N'2022-10-13' AS Date), N'10:50-12:20', N'DE-C301', N'HE160669')
INSERT [dbo].[Slots] ([SlotID], [ClassID], [Level], [Date], [Time], [Room], [StudentID]) VALUES (N'SL22', N'SE1637a', 1, CAST(N'2022-10-14' AS Date), N'7:30-9:00', N'DE-C205', N'HE160669')
INSERT [dbo].[Slots] ([SlotID], [ClassID], [Level], [Date], [Time], [Room], [StudentID]) VALUES (N'SL23', N'SE1637', 2, CAST(N'2022-10-14' AS Date), N'9:10-10:40', N'DE-C209', N'HE160669')
INSERT [dbo].[Slots] ([SlotID], [ClassID], [Level], [Date], [Time], [Room], [StudentID]) VALUES (N'SL24', N'SE1637b', 3, CAST(N'2022-10-14' AS Date), N'10:50-12:20', N'DE-C209', N'HE160669')
INSERT [dbo].[Slots] ([SlotID], [ClassID], [Level], [Date], [Time], [Room], [StudentID]) VALUES (N'SL3', N'SE1637b', 3, CAST(N'2022-10-03' AS Date), N'10:50-12:20', N'DE-C209', N'HE160669')
INSERT [dbo].[Slots] ([SlotID], [ClassID], [Level], [Date], [Time], [Room], [StudentID]) VALUES (N'SL4', N'SE1637h', 3, CAST(N'2022-10-04' AS Date), N'10:50-12:20', N'DE-C301', N'HE160669')
INSERT [dbo].[Slots] ([SlotID], [ClassID], [Level], [Date], [Time], [Room], [StudentID]) VALUES (N'SL5', N'SE1637a', 1, CAST(N'2022-10-05' AS Date), N'7:30-9:00', N'DE-C205', N'HE160669')
INSERT [dbo].[Slots] ([SlotID], [ClassID], [Level], [Date], [Time], [Room], [StudentID]) VALUES (N'SL6', N'SE1637', 2, CAST(N'2022-10-05' AS Date), N'9:10-10:40', N'DE-C209', N'HE160669')
INSERT [dbo].[Slots] ([SlotID], [ClassID], [Level], [Date], [Time], [Room], [StudentID]) VALUES (N'SL7', N'SE1637b', 3, CAST(N'2022-10-05' AS Date), N'10:50-12:20', N'DE-C209', N'HE160669')
INSERT [dbo].[Slots] ([SlotID], [ClassID], [Level], [Date], [Time], [Room], [StudentID]) VALUES (N'SL8', N'SE1637h', 2, CAST(N'2022-10-06' AS Date), N'9:10-10:40', N'DE-C301', N'HE160669')
INSERT [dbo].[Slots] ([SlotID], [ClassID], [Level], [Date], [Time], [Room], [StudentID]) VALUES (N'SL9', N'SE1637h', 3, CAST(N'2022-10-06' AS Date), N'10:50-12:20', N'DE-C301', N'HE160669')
GO
INSERT [dbo].[Subjects] ([SubjectID], [SubjectName], [NumberCredits], [Fee], [FeeInternational]) VALUES (N'CSD201', N'Data Structures and Algorithms', 3, 5010000, 6513000)
INSERT [dbo].[Subjects] ([SubjectID], [SubjectName], [NumberCredits], [Fee], [FeeInternational]) VALUES (N'DBI202', N'Introduction to Databases', 3, 5010000, 6513000)
INSERT [dbo].[Subjects] ([SubjectID], [SubjectName], [NumberCredits], [Fee], [FeeInternational]) VALUES (N'IOT102', N'Internet of Things', 3, 5010000, 6513000)
INSERT [dbo].[Subjects] ([SubjectID], [SubjectName], [NumberCredits], [Fee], [FeeInternational]) VALUES (N'JPD113', N'Elementary Japanese 1-A1.1', 3, 5010000, 6513000)
INSERT [dbo].[Subjects] ([SubjectID], [SubjectName], [NumberCredits], [Fee], [FeeInternational]) VALUES (N'JPD123', N'Elementary Japanese 1-A1.2', 3, 5010000, 6513000)
INSERT [dbo].[Subjects] ([SubjectID], [SubjectName], [NumberCredits], [Fee], [FeeInternational]) VALUES (N'JPD133', N'Elementary Japanese1-A1/A2', 3, 5010000, 6513000)
INSERT [dbo].[Subjects] ([SubjectID], [SubjectName], [NumberCredits], [Fee], [FeeInternational]) VALUES (N'LAB211', N'OOP with Java Lab', 3, 5010000, 6513000)
INSERT [dbo].[Subjects] ([SubjectID], [SubjectName], [NumberCredits], [Fee], [FeeInternational]) VALUES (N'MAD101', N'Discrete mathematics', 3, 5010000, 6513000)
INSERT [dbo].[Subjects] ([SubjectID], [SubjectName], [NumberCredits], [Fee], [FeeInternational]) VALUES (N'MAE101', N'Mathematic for Engineering', 3, 5010000, 6513000)
INSERT [dbo].[Subjects] ([SubjectID], [SubjectName], [NumberCredits], [Fee], [FeeInternational]) VALUES (N'MAS291', N'Statistics and Probability', 3, 5010000, 6513000)
INSERT [dbo].[Subjects] ([SubjectID], [SubjectName], [NumberCredits], [Fee], [FeeInternational]) VALUES (N'PRF191', N'Programming Fundamentals', 3, 5010000, 6513000)
INSERT [dbo].[Subjects] ([SubjectID], [SubjectName], [NumberCredits], [Fee], [FeeInternational]) VALUES (N'PRJ301', N'JavaWebApplicationDevelopment', 3, 5010000, 6513000)
INSERT [dbo].[Subjects] ([SubjectID], [SubjectName], [NumberCredits], [Fee], [FeeInternational]) VALUES (N'SWP291', N'SoftwareProjects', 3, 5010000, 6513000)
INSERT [dbo].[Subjects] ([SubjectID], [SubjectName], [NumberCredits], [Fee], [FeeInternational]) VALUES (N'WED201c', N'Web Design', 3, 5010000, 6513000)
GO
INSERT [dbo].[Users] ([UserID], [Name], [Gender], [Email], [PassWord], [DateOfBirth], [NumberPhone], [Role], [ProgrammingID], [Status]) VALUES (N'ADM', N'Admin', 1, N'admin', N'admin123', CAST(N'1990-04-04' AS Date), N'0456789123', N'Admin', N'null', 1)
INSERT [dbo].[Users] ([UserID], [Name], [Gender], [Email], [PassWord], [DateOfBirth], [NumberPhone], [Role], [ProgrammingID], [Status]) VALUES (N'AnhKD', N'KhuatDucAnh', 1, N'anhkd', N'123456', CAST(N'1986-05-26' AS Date), N'', N'Teacher', N'null', 1)
INSERT [dbo].[Users] ([UserID], [Name], [Gender], [Email], [PassWord], [DateOfBirth], [NumberPhone], [Role], [ProgrammingID], [Status]) VALUES (N'DungNT', N'NguyenTienDung', 1, N'dungnt', N'123456', CAST(N'1986-05-26' AS Date), N'', N'Teacher', N'null', 1)
INSERT [dbo].[Users] ([UserID], [Name], [Gender], [Email], [PassWord], [DateOfBirth], [NumberPhone], [Role], [ProgrammingID], [Status]) VALUES (N'HanhVB', N'VuBichHanh', 2, N'hanhvb', N'123456', CAST(N'1986-05-26' AS Date), N'', N'Teacher', N'null', 1)
INSERT [dbo].[Users] ([UserID], [Name], [Gender], [Email], [PassWord], [DateOfBirth], [NumberPhone], [Role], [ProgrammingID], [Status]) VALUES (N'HE160490', N'VuDaoNgocHai', 1, N'haivdnhe160490', N'123456', CAST(N'2002-02-07' AS Date), N'0568752154', N'Student', N'SE', 1)
INSERT [dbo].[Users] ([UserID], [Name], [Gender], [Email], [PassWord], [DateOfBirth], [NumberPhone], [Role], [ProgrammingID], [Status]) VALUES (N'HE160660', N'NguyenDucMinhVuong', 1, N'vuongndmhe160660', N'123456', CAST(N'2002-12-30' AS Date), N'0568752154', N'Student', N'IS', 1)
INSERT [dbo].[Users] ([UserID], [Name], [Gender], [Email], [PassWord], [DateOfBirth], [NumberPhone], [Role], [ProgrammingID], [Status]) VALUES (N'HE160682', N'TongVanVinh', 1, N'vinhtvhe160682', N'123456', CAST(N'2002-05-20' AS Date), N'0336684199', N'Student', N'SE', 1)
INSERT [dbo].[Users] ([UserID], [Name], [Gender], [Email], [PassWord], [DateOfBirth], [NumberPhone], [Role], [ProgrammingID], [Status]) VALUES (N'HE161111', N'NguyenVanA', 1, N'anvhe161111', N'456789', CAST(N'2022-11-03' AS Date), N'0954715867', N'Student', N'AI', 1)
INSERT [dbo].[Users] ([UserID], [Name], [Gender], [Email], [PassWord], [DateOfBirth], [NumberPhone], [Role], [ProgrammingID], [Status]) VALUES (N'HE161367', N'BuiKieuMai', 0, N'maibkhe161367', N'456789', CAST(N'2002-08-27' AS Date), N'0568752154', N'Student', N'AI', 1)
INSERT [dbo].[Users] ([UserID], [Name], [Gender], [Email], [PassWord], [DateOfBirth], [NumberPhone], [Role], [ProgrammingID], [Status]) VALUES (N'HE1633449', N'HaThiLanh', 0, N'lanhhe163349', N'456789', CAST(N'2002-09-11' AS Date), N'0877016691', N'Admin', N'null', 1)
INSERT [dbo].[Users] ([UserID], [Name], [Gender], [Email], [PassWord], [DateOfBirth], [NumberPhone], [Role], [ProgrammingID], [Status]) VALUES (N'ThuyNTB', N'NguyenThiBichThuy', 2, N'thuyntb', N'123456', CAST(N'1986-05-26' AS Date), N'', N'Teacher', N'null', 1)
INSERT [dbo].[Users] ([UserID], [Name], [Gender], [Email], [PassWord], [DateOfBirth], [NumberPhone], [Role], [ProgrammingID], [Status]) VALUES (N'TienTD17', N'TaDinhTien', 1, N'tientd17', N'123456', CAST(N'1986-05-26' AS Date), N'0954412454', N'Teacher', N'null', 1)
INSERT [dbo].[Users] ([UserID], [Name], [Gender], [Email], [PassWord], [DateOfBirth], [NumberPhone], [Role], [ProgrammingID], [Status]) VALUES (N'TruongNQ', N'NguyenQuangTruong', 1, N'truongnq', N'123456', CAST(N'1986-05-26' AS Date), N'', N'Teacher', N'null', 1)
INSERT [dbo].[Users] ([UserID], [Name], [Gender], [Email], [PassWord], [DateOfBirth], [NumberPhone], [Role], [ProgrammingID], [Status]) VALUES (N'TuanVM', N'VuongMinhTuan', 1, N'tuanvm', N'123456', CAST(N'1986-05-26' AS Date), N'', N'Teacher', N'null', 1)
INSERT [dbo].[Users] ([UserID], [Name], [Gender], [Email], [PassWord], [DateOfBirth], [NumberPhone], [Role], [ProgrammingID], [Status]) VALUES (N'TungHT', N'HoangThanhTung', 1, N'tunght', N'123456', CAST(N'1986-05-26' AS Date), N'', N'Teacher', N'null', 1)
INSERT [dbo].[Users] ([UserID], [Name], [Gender], [Email], [PassWord], [DateOfBirth], [NumberPhone], [Role], [ProgrammingID], [Status]) VALUES (N'VanDT', N'DoThiVan', 2, N'vandt', N'123456', CAST(N'1986-05-26' AS Date), N'', N'Teacher', N'null', 1)
GO
ALTER TABLE [dbo].[Attend] ADD  DEFAULT ('1') FOR [Status]
GO
ALTER TABLE [dbo].[MarkReport] ADD  DEFAULT ('1') FOR [StatusResult]
GO
ALTER TABLE [dbo].[Message] ADD  DEFAULT ('2') FOR [Status]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT ('1') FOR [Status]
GO
ALTER TABLE [dbo].[AttendDetail]  WITH CHECK ADD FOREIGN KEY([AttendID])
REFERENCES [dbo].[Attend] ([AttendID])
GO
ALTER TABLE [dbo].[AttendDetail]  WITH CHECK ADD FOREIGN KEY([SlotID])
REFERENCES [dbo].[Slots] ([SlotID])
GO
ALTER TABLE [dbo].[Classes]  WITH CHECK ADD FOREIGN KEY([InstructorID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Classes]  WITH CHECK ADD FOREIGN KEY([SubjectID])
REFERENCES [dbo].[Subjects] ([SubjectID])
GO
ALTER TABLE [dbo].[Classes]  WITH CHECK ADD  CONSTRAINT [SBUD1] FOREIGN KEY([SubjectID])
REFERENCES [dbo].[Subjects] ([SubjectID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Classes] CHECK CONSTRAINT [SBUD1]
GO
ALTER TABLE [dbo].[MarkReport]  WITH CHECK ADD  CONSTRAINT [C1] FOREIGN KEY([ClassID])
REFERENCES [dbo].[Classes] ([ClassID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[MarkReport] CHECK CONSTRAINT [C1]
GO
ALTER TABLE [dbo].[MarkReport]  WITH CHECK ADD FOREIGN KEY([ClassID])
REFERENCES [dbo].[Classes] ([ClassID])
GO
ALTER TABLE [dbo].[MarkReport]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[MarkReportDetail]  WITH CHECK ADD FOREIGN KEY([AssessmentID])
REFERENCES [dbo].[Assessments] ([AssessmentID])
GO
ALTER TABLE [dbo].[MarkReportDetail]  WITH CHECK ADD FOREIGN KEY([MarkReportID])
REFERENCES [dbo].[MarkReport] ([MarkReportID])
GO
ALTER TABLE [dbo].[Message]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[ProgrammingLinkSubjects]  WITH CHECK ADD FOREIGN KEY([ProgramingID])
REFERENCES [dbo].[Programming] ([ProgrammingID])
GO
ALTER TABLE [dbo].[ProgrammingLinkSubjects]  WITH CHECK ADD FOREIGN KEY([SubjectID])
REFERENCES [dbo].[Subjects] ([SubjectID])
GO
ALTER TABLE [dbo].[ProgrammingLinkSubjects]  WITH CHECK ADD  CONSTRAINT [SBUD2] FOREIGN KEY([SubjectID])
REFERENCES [dbo].[Subjects] ([SubjectID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ProgrammingLinkSubjects] CHECK CONSTRAINT [SBUD2]
GO
ALTER TABLE [dbo].[Slots]  WITH CHECK ADD FOREIGN KEY([ClassID])
REFERENCES [dbo].[Classes] ([ClassID])
GO
ALTER TABLE [dbo].[Slots]  WITH CHECK ADD FOREIGN KEY([StudentID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD FOREIGN KEY([ProgrammingID])
REFERENCES [dbo].[Programming] ([ProgrammingID])
GO
USE [master]
GO
ALTER DATABASE [PRJ301_Assignment] SET  READ_WRITE 
GO
