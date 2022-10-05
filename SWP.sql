﻿/****** Object:  Database [HappyProgramming_SWP]    Script Date: 10/3/2022 9:24:09 AM ******/
CREATE DATABASE [HappyProgramming_SWP]
GO
ALTER DATABASE [HappyProgramming_SWP] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HappyProgramming_SWP].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [HappyProgramming_SWP] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [HappyProgramming_SWP] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [HappyProgramming_SWP] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [HappyProgramming_SWP] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [HappyProgramming_SWP] SET ARITHABORT OFF 
GO
ALTER DATABASE [HappyProgramming_SWP] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [HappyProgramming_SWP] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [HappyProgramming_SWP] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [HappyProgramming_SWP] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [HappyProgramming_SWP] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [HappyProgramming_SWP] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [HappyProgramming_SWP] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [HappyProgramming_SWP] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [HappyProgramming_SWP] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [HappyProgramming_SWP] SET  DISABLE_BROKER 
GO
ALTER DATABASE [HappyProgramming_SWP] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [HappyProgramming_SWP] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [HappyProgramming_SWP] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [HappyProgramming_SWP] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [HappyProgramming_SWP] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [HappyProgramming_SWP] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [HappyProgramming_SWP] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [HappyProgramming_SWP] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [HappyProgramming_SWP] SET  MULTI_USER 
GO
ALTER DATABASE [HappyProgramming_SWP] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [HappyProgramming_SWP] SET DB_CHAINING OFF 
GO
ALTER DATABASE [HappyProgramming_SWP] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [HappyProgramming_SWP] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [HappyProgramming_SWP] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [HappyProgramming_SWP] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'HappyProgramming_SWP', N'ON'
GO
ALTER DATABASE [HappyProgramming_SWP] SET QUERY_STORE = OFF
GO
USE [HappyProgramming_SWP]
GO
/****** Object:  Table [dbo].[MentorProfile]    Script Date: 10/3/2022 9:24:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MentorProfile](
	[mentorID] [int] NOT NULL,
	[userID] [int] NOT NULL,
	[avatar] [nvarchar](500) NOT NULL,
	[introduction] [nvarchar](500) NOT NULL,
	[LinkedIn] [nvarchar](500) NULL,
	[GitHub] [nvarchar](500) NULL,
 CONSTRAINT [PK_MentorProfile] PRIMARY KEY CLUSTERED 
(
	[mentorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MentorRegist]    Script Date: 10/3/2022 9:24:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MentorRegist](
	[registID] [int] NOT NULL,
	[menteeID] [int] NOT NULL,
	[date] [date] NOT NULL,
	[status] [bit] NOT NULL,
 CONSTRAINT [PK_MentorRegist] PRIMARY KEY CLUSTERED 
(
	[registID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MentorSkill]    Script Date: 10/3/2022 9:24:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MentorSkill](
	[mentorSkillID] [int] NOT NULL,
	[mentorID] [int] NOT NULL,
	[skillID] [int] NOT NULL,
	[yearsOfExp] [int] NOT NULL,
	[description] [nvarchar](500) NOT NULL,
 CONSTRAINT [PK_MentorSkill] PRIMARY KEY CLUSTERED 
(
	[mentorSkillID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rating]    Script Date: 10/3/2022 9:24:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rating](
	[rateID] [int] NOT NULL,
	[comment] [nvarchar](150) NOT NULL,
	[star] [int] NOT NULL,
	[menteeID] [int] NOT NULL,
	[mentorID] [int] NOT NULL,
 CONSTRAINT [PK_Rating] PRIMARY KEY CLUSTERED 
(
	[rateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Request]    Script Date: 10/3/2022 9:24:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Request](
	[requestID] [int] NOT NULL,
	[mentorID] [int] NOT NULL,
	[menteeID] [int] NOT NULL,
	[date] [date] NOT NULL,
	[status] [int] NOT NULL,
	[link] [nvarchar](500) NULL,
	[title] [nvarchar](50) NOT NULL,
	[content] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_Request] PRIMARY KEY CLUSTERED 
(
	[requestID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RequestSkill]    Script Date: 10/3/2022 9:24:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RequestSkill](
	[requestSkillID] [int] NOT NULL,
	[requestID] [int] NOT NULL,
	[skillID] [int] NOT NULL,
 CONSTRAINT [PK_RequestSkill] PRIMARY KEY CLUSTERED 
(
	[requestSkillID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SkillCategory]    Script Date: 10/3/2022 9:24:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SkillCategory](
	[skillID] [int] NOT NULL,
	[skillName] [nvarchar](50) NOT NULL,
	[status] [bit] NOT NULL,
 CONSTRAINT [PK_Skill] PRIMARY KEY CLUSTERED 
(
	[skillID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transaction]    Script Date: 10/3/2022 9:24:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transaction](
	[transID] [int] NOT NULL,
	[menteeID] [int] NOT NULL,
	[mentorID] [int] NOT NULL,
	[date] [date] NOT NULL,
	[amount] [float] NOT NULL,
	[method] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Transaction] PRIMARY KEY CLUSTERED 
(
	[transID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 10/3/2022 9:24:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[ID] [int] NOT NULL,
	[username] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
	[fullname] [nvarchar](50) NOT NULL,
	[gender] [bit] NOT NULL,
	[phone] [nvarchar](50) NOT NULL,
	[email] [nvarchar](50) NOT NULL,
	[dob] [date] NOT NULL,
	[address] [nvarchar](150) NULL,
	[status] [bit] NOT NULL,
	[role] [int] NOT NULL,
 CONSTRAINT [PK_Mentee] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[MentorProfile] ([mentorID], [userID], [avatar], [introduction], [LinkedIn], [GitHub]) VALUES (1, 3, N'waiting', N'Master of coding', NULL, NULL)
GO
INSERT [dbo].[MentorSkill] ([mentorSkillID], [mentorID], [skillID], [yearsOfExp], [description]) VALUES (1, 1, 4, 10, N'master of java coding')
INSERT [dbo].[MentorSkill] ([mentorSkillID], [mentorID], [skillID], [yearsOfExp], [description]) VALUES (2, 1, 5, 6, N'having WED201c certificate on cousera')
INSERT [dbo].[MentorSkill] ([mentorSkillID], [mentorID], [skillID], [yearsOfExp], [description]) VALUES (3, 1, 7, 12, N'having WED201c certificate on cousera')
GO
INSERT [dbo].[Request] ([requestID], [mentorID], [menteeID], [date], [status], [link], [title], [content]) VALUES (1, 1, 6, CAST(N'2022-02-10' AS Date), 0, NULL, N'Please help me inprove my coding logic', N'I want a mentor who master at java so that he can help me improve my cofing for my upcoming test')
GO
INSERT [dbo].[RequestSkill] ([requestSkillID], [requestID], [skillID]) VALUES (1, 1, 4)
INSERT [dbo].[RequestSkill] ([requestSkillID], [requestID], [skillID]) VALUES (2, 1, 5)
INSERT [dbo].[RequestSkill] ([requestSkillID], [requestID], [skillID]) VALUES (3, 1, 7)
GO
INSERT [dbo].[SkillCategory] ([skillID], [skillName], [status]) VALUES (1, N'C', 1)
INSERT [dbo].[SkillCategory] ([skillID], [skillName], [status]) VALUES (2, N'C++', 1)
INSERT [dbo].[SkillCategory] ([skillID], [skillName], [status]) VALUES (3, N'C#', 1)
INSERT [dbo].[SkillCategory] ([skillID], [skillName], [status]) VALUES (4, N'Java', 1)
INSERT [dbo].[SkillCategory] ([skillID], [skillName], [status]) VALUES (5, N'Javascript', 1)
INSERT [dbo].[SkillCategory] ([skillID], [skillName], [status]) VALUES (6, N'Python', 0)
INSERT [dbo].[SkillCategory] ([skillID], [skillName], [status]) VALUES (7, N'HTML/CSS', 1)
INSERT [dbo].[SkillCategory] ([skillID], [skillName], [status]) VALUES (8, N'ASP.NET', 0)
GO
INSERT [dbo].[User] ([ID], [username], [password], [fullname], [gender], [phone], [email], [dob], [address], [status], [role]) VALUES (1, N'phucph', N'123', N'Pham Hong Phuc', 1, N'0128376291', N'phucph@gmail.com', CAST(N'2002-12-16' AS Date), N'Hai Phong', 0, 0)
INSERT [dbo].[User] ([ID], [username], [password], [fullname], [gender], [phone], [email], [dob], [address], [status], [role]) VALUES (2, N'hieulv', N'123', N'Le Vu Hieu', 1, N'0274087394', N'hieulv@gmail.com', CAST(N'2002-01-01' AS Date), NULL, 0, 1)
INSERT [dbo].[User] ([ID], [username], [password], [fullname], [gender], [phone], [email], [dob], [address], [status], [role]) VALUES (3, N'khanhhg', N'123', N'Hoang Gia Khanh', 1, N'0734086281', N'khanghg@gamil.com', CAST(N'2002-01-01' AS Date), NULL, 0, 2)
INSERT [dbo].[User] ([ID], [username], [password], [fullname], [gender], [phone], [email], [dob], [address], [status], [role]) VALUES (4, N'vietbh', N'123', N'Bui Hoang Viet', 1, N'0183047652', N'vietbh@gmail,com', CAST(N'2002-01-01' AS Date), NULL, 0, 3)
INSERT [dbo].[User] ([ID], [username], [password], [fullname], [gender], [phone], [email], [dob], [address], [status], [role]) VALUES (5, N'sangdt', N'123', N'Dao Tan Sang', 1, N'0274058762', N'sangdt@gmail.com', CAST(N'1999-01-01' AS Date), NULL, 0, 3)
INSERT [dbo].[User] ([ID], [username], [password], [fullname], [gender], [phone], [email], [dob], [address], [status], [role]) VALUES (6, N'huonglm', N'123', N'Luu Minh Huong', 0, N'0186309276', N'huonglm@gmail.com', CAST(N'2002-01-01' AS Date), NULL, 0, 3)
GO
ALTER TABLE [dbo].[MentorProfile]  WITH CHECK ADD  CONSTRAINT [FK_MentorProfile_userID] FOREIGN KEY([userID])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[MentorProfile] CHECK CONSTRAINT [FK_MentorProfile_userID]
GO
ALTER TABLE [dbo].[MentorRegist]  WITH CHECK ADD  CONSTRAINT [FK_MentorRegist_menteeID] FOREIGN KEY([menteeID])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[MentorRegist] CHECK CONSTRAINT [FK_MentorRegist_menteeID]
GO
ALTER TABLE [dbo].[MentorSkill]  WITH CHECK ADD  CONSTRAINT [FK_MentorSkill_mentorID] FOREIGN KEY([mentorID])
REFERENCES [dbo].[MentorProfile] ([mentorID])
GO
ALTER TABLE [dbo].[MentorSkill] CHECK CONSTRAINT [FK_MentorSkill_mentorID]
GO
ALTER TABLE [dbo].[MentorSkill]  WITH CHECK ADD  CONSTRAINT [FK_MentorSkill_skillID] FOREIGN KEY([skillID])
REFERENCES [dbo].[SkillCategory] ([skillID])
GO
ALTER TABLE [dbo].[MentorSkill] CHECK CONSTRAINT [FK_MentorSkill_skillID]
GO
ALTER TABLE [dbo].[Rating]  WITH CHECK ADD  CONSTRAINT [FK_Rating_menteeID] FOREIGN KEY([menteeID])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[Rating] CHECK CONSTRAINT [FK_Rating_menteeID]
GO
ALTER TABLE [dbo].[Rating]  WITH CHECK ADD  CONSTRAINT [FK_Rating_mentorID] FOREIGN KEY([mentorID])
REFERENCES [dbo].[MentorProfile] ([mentorID])
GO
ALTER TABLE [dbo].[Rating] CHECK CONSTRAINT [FK_Rating_mentorID]
GO
ALTER TABLE [dbo].[Request]  WITH CHECK ADD  CONSTRAINT [FK_Request_menteeID] FOREIGN KEY([menteeID])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[Request] CHECK CONSTRAINT [FK_Request_menteeID]
GO
ALTER TABLE [dbo].[Request]  WITH CHECK ADD  CONSTRAINT [FK_Request_mentorID] FOREIGN KEY([mentorID])
REFERENCES [dbo].[MentorProfile] ([mentorID])
GO
ALTER TABLE [dbo].[Request] CHECK CONSTRAINT [FK_Request_mentorID]
GO
ALTER TABLE [dbo].[RequestSkill]  WITH CHECK ADD  CONSTRAINT [FK_RequestSkill_requestID] FOREIGN KEY([requestID])
REFERENCES [dbo].[Request] ([requestID])
GO
ALTER TABLE [dbo].[RequestSkill] CHECK CONSTRAINT [FK_RequestSkill_requestID]
GO
ALTER TABLE [dbo].[RequestSkill]  WITH CHECK ADD  CONSTRAINT [FK_RequestSkill_skillID] FOREIGN KEY([skillID])
REFERENCES [dbo].[SkillCategory] ([skillID])
GO
ALTER TABLE [dbo].[RequestSkill] CHECK CONSTRAINT [FK_RequestSkill_skillID]
GO
ALTER TABLE [dbo].[Transaction]  WITH CHECK ADD  CONSTRAINT [FK_Transaction_menteeID] FOREIGN KEY([menteeID])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[Transaction] CHECK CONSTRAINT [FK_Transaction_menteeID]
GO
ALTER TABLE [dbo].[Transaction]  WITH CHECK ADD  CONSTRAINT [FK_Transaction_mentorID] FOREIGN KEY([mentorID])
REFERENCES [dbo].[MentorProfile] ([mentorID])
GO
ALTER TABLE [dbo].[Transaction] CHECK CONSTRAINT [FK_Transaction_mentorID]
GO
USE [master]
GO
ALTER DATABASE [HappyProgramming_SWP] SET  READ_WRITE 
GO
