USE [master]
GO
/****** Object:  Database [HappyProgramming_SWP]    Script Date: 11/8/2022 11:08:25 PM ******/
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
EXEC sys.sp_db_vardecimal_storage_format N'HappyProgramming_SWP', N'ON'
GO
USE [HappyProgramming_SWP]
GO
/****** Object:  Table [dbo].[MentorProfile]    Script Date: 11/8/2022 11:08:25 PM ******/
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
	[Profession] [nvarchar](500) NOT NULL,
 CONSTRAINT [PK_MentorProfile] PRIMARY KEY CLUSTERED 
(
	[mentorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MentorRegist]    Script Date: 11/8/2022 11:08:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MentorRegist](
	[registID] [int] NOT NULL,
	[menteeID] [int] NOT NULL,
	[date] [date] NOT NULL,
	[status] [int] NOT NULL,
 CONSTRAINT [PK_MentorRegist] PRIMARY KEY CLUSTERED 
(
	[registID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MentorSkill]    Script Date: 11/8/2022 11:08:25 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rating]    Script Date: 11/8/2022 11:08:25 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Request]    Script Date: 11/8/2022 11:08:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Request](
	[requestID] [int] NOT NULL,
	[mentorID] [int] NULL,
	[menteeID] [int] NOT NULL,
	[date] [date] NOT NULL,
	[status] [int] NOT NULL,
	[link] [nvarchar](500) NULL,
	[title] [nvarchar](50) NOT NULL,
	[content] [nvarchar](150) NOT NULL,
	[mentorStatus] [int] NOT NULL,
 CONSTRAINT [PK_Request] PRIMARY KEY CLUSTERED 
(
	[requestID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RequestSkill]    Script Date: 11/8/2022 11:08:25 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SkillCategory]    Script Date: 11/8/2022 11:08:25 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transaction]    Script Date: 11/8/2022 11:08:25 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 11/8/2022 11:08:25 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[MentorProfile] ([mentorID], [userID], [avatar], [introduction], [LinkedIn], [GitHub], [Profession]) VALUES (0, 0, N'.', N'.', NULL, NULL, N'.')
INSERT [dbo].[MentorProfile] ([mentorID], [userID], [avatar], [introduction], [LinkedIn], [GitHub], [Profession]) VALUES (1, 3, N'https://scontent.fhan3-4.fna.fbcdn.net/v/t1.6435-9/69087697_1091446437723634_8598457568051855360_n.jpg?_nc_cat=106&ccb=1-7&_nc_sid=174925&_nc_ohc=eoTbzXrNCjcAX_nIlYP&_nc_ht=scontent.fhan3-4.fna&oh=00_AfCnU_i-_ejWDPd-jDkaA0vpnHJ60RbfCEdgvZaIW7LcAg&oe=6391DB4D', N'Master of coding', N'https://www.linkedin.com/in/pham-hong-phuc-657729255/', N'https://github.com/ZellyFish18/HappyProgramming_SWP391', N'Developer')
INSERT [dbo].[MentorProfile] ([mentorID], [userID], [avatar], [introduction], [LinkedIn], [GitHub], [Profession]) VALUES (2, 2, N'https://scontent.fhan4-1.fna.fbcdn.net/v/t1.6435-9/100918565_1129332924115715_917140272641474560_n.jpg?_nc_cat=105&ccb=1-7&_nc_sid=174925&_nc_ohc=_jVssqF5VTgAX_BFfZv&_nc_ht=scontent.fhan4-1.fna&oh=00_AfCbFnY71iZ2tXTJUUkIvJq7bkdH0mAahDaGzhVt1DogtQ&oe=639181AE', N'Fullstack Dev', NULL, NULL, N'AI Engineer')
INSERT [dbo].[MentorProfile] ([mentorID], [userID], [avatar], [introduction], [LinkedIn], [GitHub], [Profession]) VALUES (3, 7, N'https://scontent.fhan4-3.fna.fbcdn.net/v/t1.6435-9/105915929_1194900747569119_4328530478202858643_n.jpg?_nc_cat=103&ccb=1-7&_nc_sid=174925&_nc_ohc=K0W3Gk38Ng8AX8NrL3T&tn=7EXyLHIGpoGiL9cv&_nc_ht=scontent.fhan4-3.fna&oh=00_AfAA259Tw2kE5bfae5HInigHzdT6rqa7pquKvEMbe94KFQ&oe=6391F0BD', N'Graduate from FPT University', N'waiting', N'https://github.com/Misaki1209', N'SE Engineer')
INSERT [dbo].[MentorProfile] ([mentorID], [userID], [avatar], [introduction], [LinkedIn], [GitHub], [Profession]) VALUES (4, 9, N'https://tse2.mm.bing.net/th?id=OIP.Ylq5JKzVFPj-cwYUZ-Z67wHaFj&pid=Api&P=0', N'Master of Front End', N'waiting', N'https://github.com/huydqhe161614', N'Front End Developer')
INSERT [dbo].[MentorProfile] ([mentorID], [userID], [avatar], [introduction], [LinkedIn], [GitHub], [Profession]) VALUES (5, 11, N'https://yt3.ggpht.com/a/AATXAJz_IAfvnLyh9CK8Umif5Mv0FXzIuNeiLfaU8g=s900-c-k-c0xffffffff-no-rj-mo', N'Beautiful Mentor', NULL, NULL, N'SE Engineer')
GO
INSERT [dbo].[MentorRegist] ([registID], [menteeID], [date], [status]) VALUES (1, 7, CAST(N'2000-01-01' AS Date), 2)
INSERT [dbo].[MentorRegist] ([registID], [menteeID], [date], [status]) VALUES (2, 2, CAST(N'2022-11-06' AS Date), 2)
INSERT [dbo].[MentorRegist] ([registID], [menteeID], [date], [status]) VALUES (3, 3, CAST(N'2022-11-08' AS Date), 2)
INSERT [dbo].[MentorRegist] ([registID], [menteeID], [date], [status]) VALUES (4, 9, CAST(N'2022-11-01' AS Date), 1)
INSERT [dbo].[MentorRegist] ([registID], [menteeID], [date], [status]) VALUES (5, 11, CAST(N'2022-11-01' AS Date), 2)
GO
INSERT [dbo].[MentorSkill] ([mentorSkillID], [mentorID], [skillID], [yearsOfExp], [description]) VALUES (1, 1, 2, 11, N'master of java coding')
INSERT [dbo].[MentorSkill] ([mentorSkillID], [mentorID], [skillID], [yearsOfExp], [description]) VALUES (2, 1, 5, 7, N'having WED201c certificate on cousera')
INSERT [dbo].[MentorSkill] ([mentorSkillID], [mentorID], [skillID], [yearsOfExp], [description]) VALUES (3, 1, 7, 3, N'having WED201c certificate on cousera')
INSERT [dbo].[MentorSkill] ([mentorSkillID], [mentorID], [skillID], [yearsOfExp], [description]) VALUES (4, 2, 5, 1, N'Fullstack Dev')
INSERT [dbo].[MentorSkill] ([mentorSkillID], [mentorID], [skillID], [yearsOfExp], [description]) VALUES (5, 2, 7, 1, N'Fullstack Dev')
INSERT [dbo].[MentorSkill] ([mentorSkillID], [mentorID], [skillID], [yearsOfExp], [description]) VALUES (6, 1, 3, 4, N'master of java coding')
INSERT [dbo].[MentorSkill] ([mentorSkillID], [mentorID], [skillID], [yearsOfExp], [description]) VALUES (7, 3, 2, 5, N'Certificate on Cousera')
INSERT [dbo].[MentorSkill] ([mentorSkillID], [mentorID], [skillID], [yearsOfExp], [description]) VALUES (8, 3, 6, 2, N'Can solve difficult problem')
INSERT [dbo].[MentorSkill] ([mentorSkillID], [mentorID], [skillID], [yearsOfExp], [description]) VALUES (9, 3, 4, 5, N'Master')
INSERT [dbo].[MentorSkill] ([mentorSkillID], [mentorID], [skillID], [yearsOfExp], [description]) VALUES (10, 4, 1, 3, N'M')
INSERT [dbo].[MentorSkill] ([mentorSkillID], [mentorID], [skillID], [yearsOfExp], [description]) VALUES (11, 4, 3, 4, N'M')
INSERT [dbo].[MentorSkill] ([mentorSkillID], [mentorID], [skillID], [yearsOfExp], [description]) VALUES (12, 4, 6, 2, N'M')
INSERT [dbo].[MentorSkill] ([mentorSkillID], [mentorID], [skillID], [yearsOfExp], [description]) VALUES (13, 5, 2, 5, N'M')
INSERT [dbo].[MentorSkill] ([mentorSkillID], [mentorID], [skillID], [yearsOfExp], [description]) VALUES (14, 5, 4, 2, N'M')
INSERT [dbo].[MentorSkill] ([mentorSkillID], [mentorID], [skillID], [yearsOfExp], [description]) VALUES (15, 5, 6, 3, N'M')
GO
INSERT [dbo].[Rating] ([rateID], [comment], [star], [menteeID], [mentorID]) VALUES (1, N'okay', 5, 6, 1)
INSERT [dbo].[Rating] ([rateID], [comment], [star], [menteeID], [mentorID]) VALUES (2, N'very good', 4, 6, 2)
GO
INSERT [dbo].[Request] ([requestID], [mentorID], [menteeID], [date], [status], [link], [title], [content], [mentorStatus]) VALUES (1, 1, 6, CAST(N'2022-02-10' AS Date), 2, N'abc.com', N'Please help me inprove my coding logic', N'I want a mentor who master at java so that he can help me improve my coding for my upcoming test', 3)
INSERT [dbo].[Request] ([requestID], [mentorID], [menteeID], [date], [status], [link], [title], [content], [mentorStatus]) VALUES (2, 1, 5, CAST(N'2002-10-15' AS Date), 2, N'https://meet.google.com/doe-rrwx-kmj', N'Web design', N'My designing skill is so bad, please help me improve it', 1)
INSERT [dbo].[Request] ([requestID], [mentorID], [menteeID], [date], [status], [link], [title], [content], [mentorStatus]) VALUES (3, 1, 5, CAST(N'2002-10-10' AS Date), 2, NULL, N'Check my code', N'I have some error need to be fix immediatly', 0)
INSERT [dbo].[Request] ([requestID], [mentorID], [menteeID], [date], [status], [link], [title], [content], [mentorStatus]) VALUES (4, 2, 6, CAST(N'2022-11-08' AS Date), 2, NULL, N'test1', N'test1', 0)
INSERT [dbo].[Request] ([requestID], [mentorID], [menteeID], [date], [status], [link], [title], [content], [mentorStatus]) VALUES (5, 3, 6, CAST(N'2002-11-08' AS Date), 0, N'https://meet.google.com/doe-rrwx-kmj', N'test2', N'test2', 2)
INSERT [dbo].[Request] ([requestID], [mentorID], [menteeID], [date], [status], [link], [title], [content], [mentorStatus]) VALUES (6, 4, 6, CAST(N'2022-11-08' AS Date), 1, NULL, N'test3', N'test3', 1)
INSERT [dbo].[Request] ([requestID], [mentorID], [menteeID], [date], [status], [link], [title], [content], [mentorStatus]) VALUES (7, 1, 5, CAST(N'2022-11-08' AS Date), 2, NULL, N'test5', N'test5', 2)
GO
INSERT [dbo].[RequestSkill] ([requestSkillID], [requestID], [skillID]) VALUES (1, 2, 6)
INSERT [dbo].[RequestSkill] ([requestSkillID], [requestID], [skillID]) VALUES (2, 3, 1)
INSERT [dbo].[RequestSkill] ([requestSkillID], [requestID], [skillID]) VALUES (3, 1, 1)
INSERT [dbo].[RequestSkill] ([requestSkillID], [requestID], [skillID]) VALUES (4, 4, 5)
INSERT [dbo].[RequestSkill] ([requestSkillID], [requestID], [skillID]) VALUES (5, 7, 3)
INSERT [dbo].[RequestSkill] ([requestSkillID], [requestID], [skillID]) VALUES (6, 6, 2)
INSERT [dbo].[RequestSkill] ([requestSkillID], [requestID], [skillID]) VALUES (7, 5, 4)
GO
INSERT [dbo].[SkillCategory] ([skillID], [skillName], [status]) VALUES (1, N'C', 1)
INSERT [dbo].[SkillCategory] ([skillID], [skillName], [status]) VALUES (2, N'C++', 1)
INSERT [dbo].[SkillCategory] ([skillID], [skillName], [status]) VALUES (3, N'C#', 1)
INSERT [dbo].[SkillCategory] ([skillID], [skillName], [status]) VALUES (4, N'Java', 1)
INSERT [dbo].[SkillCategory] ([skillID], [skillName], [status]) VALUES (5, N'Javascript', 1)
INSERT [dbo].[SkillCategory] ([skillID], [skillName], [status]) VALUES (6, N'Python', 0)
INSERT [dbo].[SkillCategory] ([skillID], [skillName], [status]) VALUES (7, N'HTML/CSS', 1)
INSERT [dbo].[SkillCategory] ([skillID], [skillName], [status]) VALUES (8, N'ASP.NET', 0)
INSERT [dbo].[SkillCategory] ([skillID], [skillName], [status]) VALUES (9, N'NodeJS', 0)
INSERT [dbo].[SkillCategory] ([skillID], [skillName], [status]) VALUES (10, N'VueJS', 0)
INSERT [dbo].[SkillCategory] ([skillID], [skillName], [status]) VALUES (11, N'ReactJS', 1)
INSERT [dbo].[SkillCategory] ([skillID], [skillName], [status]) VALUES (12, N'PHP', 1)
GO
INSERT [dbo].[User] ([ID], [username], [password], [fullname], [gender], [phone], [email], [dob], [address], [status], [role]) VALUES (0, N'admin', N'', N'Admin', 1, N'1234', N'admin@gmail.com', CAST(N'2022-01-01' AS Date), N'', 0, 0)
INSERT [dbo].[User] ([ID], [username], [password], [fullname], [gender], [phone], [email], [dob], [address], [status], [role]) VALUES (1, N'phucph', N'123', N'Pham Hong Phuc', 1, N'0128376291', N'phucph@gmail.com', CAST(N'2002-12-16' AS Date), N'Hai Phong', 0, 0)
INSERT [dbo].[User] ([ID], [username], [password], [fullname], [gender], [phone], [email], [dob], [address], [status], [role]) VALUES (2, N'hieulv', N'123', N'Le Vu Hieu', 1, N'0274087394', N'hieulv@gmail.com', CAST(N'2002-01-01' AS Date), N'Ha Noi', 1, 2)
INSERT [dbo].[User] ([ID], [username], [password], [fullname], [gender], [phone], [email], [dob], [address], [status], [role]) VALUES (3, N'khanhhg', N'123', N'Hoang Gia Khanh', 1, N'0734086281', N'khanhhg@gmail.com', CAST(N'2002-01-01' AS Date), N'Ha Noi', 0, 2)
INSERT [dbo].[User] ([ID], [username], [password], [fullname], [gender], [phone], [email], [dob], [address], [status], [role]) VALUES (4, N'vietbh', N'123', N'Bui Hoang Viet', 1, N'0183047652', N'vietbh@gmail,com', CAST(N'2002-01-01' AS Date), NULL, 1, 3)
INSERT [dbo].[User] ([ID], [username], [password], [fullname], [gender], [phone], [email], [dob], [address], [status], [role]) VALUES (5, N'sangdt', N'123', N'Dao Tan Sang', 1, N'0274058762', N'sangdt@gmail.com', CAST(N'1999-01-01' AS Date), NULL, 1, 3)
INSERT [dbo].[User] ([ID], [username], [password], [fullname], [gender], [phone], [email], [dob], [address], [status], [role]) VALUES (6, N'huonglm', N'123', N'Luu Minh Huong', 1, N'63127386', N'huonglm@gmail.com', CAST(N'2002-01-01' AS Date), N'', 1, 3)
INSERT [dbo].[User] ([ID], [username], [password], [fullname], [gender], [phone], [email], [dob], [address], [status], [role]) VALUES (7, N'khaitd', N'123', N'Trinh Dinh Khai', 1, N'08269487612', N'khaitd@gmail.com', CAST(N'2002-01-01' AS Date), N'Hai Phong', 1, 2)
INSERT [dbo].[User] ([ID], [username], [password], [fullname], [gender], [phone], [email], [dob], [address], [status], [role]) VALUES (8, N'landn', N'123', N'Dang Ngoc Lan', 1, N'0862541725', N'landn@gmail.com', CAST(N'2002-01-01' AS Date), N'Ha Noi', 1, 3)
INSERT [dbo].[User] ([ID], [username], [password], [fullname], [gender], [phone], [email], [dob], [address], [status], [role]) VALUES (9, N'huydq', N'123', N'Doan Quoc Huy', 1, N'08273921716', N'huydq@gmail.com', CAST(N'2002-09-02' AS Date), N'Ha Noi', 1, 2)
INSERT [dbo].[User] ([ID], [username], [password], [fullname], [gender], [phone], [email], [dob], [address], [status], [role]) VALUES (10, N'anhnm', N'123', N'Nguyen Minh Anh', 0, N'0826038761', N'anhnm@gmail.com', CAST(N'2002-08-01' AS Date), N'Hai Phong', 1, 0)
INSERT [dbo].[User] ([ID], [username], [password], [fullname], [gender], [phone], [email], [dob], [address], [status], [role]) VALUES (11, N'ngoclh', N'123', N'Ly Hong Ngoc', 0, N'0836472615', N'ngoclh@gmail.com', CAST(N'2002-01-01' AS Date), N'Bac Giang', 1, 2)
INSERT [dbo].[User] ([ID], [username], [password], [fullname], [gender], [phone], [email], [dob], [address], [status], [role]) VALUES (12, N'linhpn', N'123', N'Phan Nhat Linh', 0, N'0937409876', N'linhpn@gmail.com', CAST(N'2002-01-01' AS Date), N'Hai Duong', 1, 3)
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
