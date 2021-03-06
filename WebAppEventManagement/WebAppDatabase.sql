USE [master]
GO
/****** Object:  Database [WebAppEventManagement]    Script Date: 2.2.2015 г. 11:12:17 ******/
CREATE DATABASE [WebAppEventManagement]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'WebApp', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER2012\MSSQL\DATA\WebApp.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'WebApp_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER2012\MSSQL\DATA\WebApp_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [WebAppEventManagement] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [WebAppEventManagement].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [WebAppEventManagement] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [WebAppEventManagement] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [WebAppEventManagement] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [WebAppEventManagement] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [WebAppEventManagement] SET ARITHABORT OFF 
GO
ALTER DATABASE [WebAppEventManagement] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [WebAppEventManagement] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [WebAppEventManagement] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [WebAppEventManagement] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [WebAppEventManagement] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [WebAppEventManagement] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [WebAppEventManagement] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [WebAppEventManagement] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [WebAppEventManagement] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [WebAppEventManagement] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [WebAppEventManagement] SET  DISABLE_BROKER 
GO
ALTER DATABASE [WebAppEventManagement] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [WebAppEventManagement] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [WebAppEventManagement] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [WebAppEventManagement] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [WebAppEventManagement] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [WebAppEventManagement] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [WebAppEventManagement] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [WebAppEventManagement] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [WebAppEventManagement] SET  MULTI_USER 
GO
ALTER DATABASE [WebAppEventManagement] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [WebAppEventManagement] SET DB_CHAINING OFF 
GO
ALTER DATABASE [WebAppEventManagement] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [WebAppEventManagement] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [WebAppEventManagement]
GO
/****** Object:  StoredProcedure [dbo].[insertEmployees]    Script Date: 2.2.2015 г. 11:12:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[insertEmployees] 
	-- Add the parameters for the stored procedure here
	@id int,
	@FirstName nvarchar(50),
	@LastName nvarchar(50),
	@Position int,
	@Email nvarchar(50),
	@PhoneNumber nvarchar(50)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	insert into Employee (EmployeeID, EmployeeFirtName, EmployeeLastName, PositionID, Email, PhoneNumber)
	values (@id, @FirstName, @LastName, @Position, @Email, @PhoneNumber)
END

GO
/****** Object:  StoredProcedure [dbo].[updateEmployees]    Script Date: 2.2.2015 г. 11:12:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[updateEmployees] 
	-- Add the parameters for the stored procedure here
	@EmployeeID int,
	@FirstName nvarchar(50),
	@LastName nvarchar(50),
	@Position int,
	@Email nvarchar(50),
	@PhoneNumber nvarchar(50)
AS
BEGIN
update Employee
set 
	EmployeeFirtName=@FirstName,
    EmployeeLastName=@LastName,
	PositionID=@Position,
	Email=@Email,
	PhoneNumber=@PhoneNumber
	where EmployeeID=@EmployeeID
	
END


GO
/****** Object:  Table [dbo].[Employee]    Script Date: 2.2.2015 г. 11:12:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[EmployeeID] [int] NOT NULL,
	[EmployeeFirtName] [nvarchar](50) NOT NULL,
	[EmployeeLastName] [nvarchar](50) NOT NULL,
	[PositionID] [int] NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[PhoneNumber] [nvarchar](50) NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Event]    Script Date: 2.2.2015 г. 11:12:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Event](
	[EventID] [int] NOT NULL,
	[EventName] [nvarchar](50) NOT NULL,
	[Place] [nvarchar](50) NOT NULL,
	[Date] [date] NOT NULL,
	[Time] [time](7) NOT NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_Event] PRIMARY KEY CLUSTERED 
(
	[EventID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[EventEmployee]    Script Date: 2.2.2015 г. 11:12:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EventEmployee](
	[EventID] [int] NOT NULL,
	[EmployeeID] [int] NOT NULL,
	[Task] [nvarchar](max) NULL,
 CONSTRAINT [PK_EventEmployee] PRIMARY KEY CLUSTERED 
(
	[EventID] ASC,
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Guest]    Script Date: 2.2.2015 г. 11:12:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Guest](
	[GuestID] [int] NOT NULL,
	[GuestFirstName] [nvarchar](50) NOT NULL,
	[GuestLastName] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Guest] PRIMARY KEY CLUSTERED 
(
	[GuestID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[GuestEvent]    Script Date: 2.2.2015 г. 11:12:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GuestEvent](
	[GuestID] [int] NOT NULL,
	[EventID] [int] NOT NULL,
 CONSTRAINT [PK_GuestEvent] PRIMARY KEY CLUSTERED 
(
	[GuestID] ASC,
	[EventID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Position]    Script Date: 2.2.2015 г. 11:12:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Position](
	[PositionID] [int] NOT NULL,
	[PositionName] [nvarchar](50) NOT NULL,
	[Salary] [money] NOT NULL,
 CONSTRAINT [PK_Position] PRIMARY KEY CLUSTERED 
(
	[PositionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[EmpEvent]    Script Date: 2.2.2015 г. 11:12:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[EmpEvent]
as
select e.EventName, em.EmployeeFirtName, em.EmployeeLastName, eem.Task
from Event e inner join EventEmployee eem on e.EventID=eem.EventID
			inner join Employee em on em.EmployeeID=eem.EmployeeID

GO
/****** Object:  View [dbo].[Employees4Event]    Script Date: 2.2.2015 г. 11:12:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[Employees4Event]
as
select e.EventName, em.EmployeeFirtName, em.EmployeeLastName
from Event e inner join EventEmployee eem on e.EventID=eem.EventID
			inner join Employee em on em.EmployeeID=eem.EmployeeID
GO
/****** Object:  View [dbo].[Employees4EventPosition]    Script Date: 2.2.2015 г. 11:12:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[Employees4EventPosition]
as
select e.EventName, em.EmployeeFirtName, em.EmployeeLastName, p.PositionName
from Event e inner join EventEmployee eem on e.EventID=eem.EventID
			inner join Employee em on em.EmployeeID=eem.EmployeeID, 
			Position p where p.PositionID=em.PositionID
GO
/****** Object:  View [dbo].[Guests@Events]    Script Date: 2.2.2015 г. 11:12:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE view [dbo].[Guests@Events]
as
select eg.GuestID, g.Email, g.GuestFirstName, g.GuestLastName, eg.EventID, e.EventName
from Event e inner join GuestEvent eg on e.EventID = eg.EventID
             inner join Guest g on g.GuestID = eg.GuestID 


GO
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeFirtName], [EmployeeLastName], [PositionID], [Email], [PhoneNumber]) VALUES (1, N'Jimmy ', N'Choo', 3, N'choo@mail.com', N'35966378')
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeFirtName], [EmployeeLastName], [PositionID], [Email], [PhoneNumber]) VALUES (2, N'Galin', N'Mushev', 3, N'gm@mail.com', N'35988774')
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeFirtName], [EmployeeLastName], [PositionID], [Email], [PhoneNumber]) VALUES (3, N'Jason', N'Clinton', 1, N'jc@mail.com', N'35989645')
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeFirtName], [EmployeeLastName], [PositionID], [Email], [PhoneNumber]) VALUES (4, N'Janet', N'Jackson', 2, N'jackson@mail.com', N'35968971')
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeFirtName], [EmployeeLastName], [PositionID], [Email], [PhoneNumber]) VALUES (5, N'Mila', N'Kunis', 2, N'ku@mail.com', N'44569876')
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeFirtName], [EmployeeLastName], [PositionID], [Email], [PhoneNumber]) VALUES (6, N'Carla', N'Bruni', 3, N'kb@mail.com', N'32568715')
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeFirtName], [EmployeeLastName], [PositionID], [Email], [PhoneNumber]) VALUES (7, N'Justin ', N'Tim', 3, N'tim@mail.com', N'65897426')
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeFirtName], [EmployeeLastName], [PositionID], [Email], [PhoneNumber]) VALUES (8, N'Anna', N'Karenina', 3, N'kari@mail.com', N'45698715')
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeFirtName], [EmployeeLastName], [PositionID], [Email], [PhoneNumber]) VALUES (9, N'Michael', N'Schumacher', 1, N'schu@mail.com', N'12365899')
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeFirtName], [EmployeeLastName], [PositionID], [Email], [PhoneNumber]) VALUES (10, N'Ali', N'Baba', 3, N'ali!mail.com', N'12365477')
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeFirtName], [EmployeeLastName], [PositionID], [Email], [PhoneNumber]) VALUES (11, N'Zdrawko', N'Georgiev', 1, N'g@mail.com', N'21654984')
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeFirtName], [EmployeeLastName], [PositionID], [Email], [PhoneNumber]) VALUES (12, N'Emo', N'Iv', 1, N'emo@abv.bg', N'4598765')
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeFirtName], [EmployeeLastName], [PositionID], [Email], [PhoneNumber]) VALUES (13, N'Emo', N'Iv', 1, N'emo@abv.bg', N'4598765')
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeFirtName], [EmployeeLastName], [PositionID], [Email], [PhoneNumber]) VALUES (14, N'Emo', N'Iv', 1, N'emo@abv.bg', N'4598765')
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeFirtName], [EmployeeLastName], [PositionID], [Email], [PhoneNumber]) VALUES (15, N'Emo', N'Iv', 1, N'emo@abv.bg', N'1234567')
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeFirtName], [EmployeeLastName], [PositionID], [Email], [PhoneNumber]) VALUES (16, N'Krasi', N'Benin', 1, N'krasi@abv.bg', N'1236547')
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeFirtName], [EmployeeLastName], [PositionID], [Email], [PhoneNumber]) VALUES (17, N'Papi', N'Pap', 2, N'papi@abv.bg', N'1588756')
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeFirtName], [EmployeeLastName], [PositionID], [Email], [PhoneNumber]) VALUES (18, N'Rosen', N'Gyurov', 1, N'rosen@abv.bg', N'154116')
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeFirtName], [EmployeeLastName], [PositionID], [Email], [PhoneNumber]) VALUES (19, N'Mina', N'Val', 1, N'mina@g.com', N'58787\')
INSERT [dbo].[Event] ([EventID], [EventName], [Place], [Date], [Time], [Description]) VALUES (1, N'Business Idea', N'Hilton', CAST(0x84380B00 AS Date), CAST(0x070080461C860000 AS Time), N'')
INSERT [dbo].[Event] ([EventID], [EventName], [Place], [Date], [Time], [Description]) VALUES (2, N'Innovation', N'Galaxy Center', CAST(0x92380B00 AS Date), CAST(0x0700E80A7E8E0000 AS Time), NULL)
INSERT [dbo].[Event] ([EventID], [EventName], [Place], [Date], [Time], [Description]) VALUES (3, N' Celebrities Fashion', N'NPC', CAST(0x9C380B00 AS Date), CAST(0x0700881C05B00000 AS Time), NULL)
INSERT [dbo].[Event] ([EventID], [EventName], [Place], [Date], [Time], [Description]) VALUES (4, N'Kids Talented', N'Mall Sofia', CAST(0x92380B00 AS Date), CAST(0x0700A8E76F4B0000 AS Time), NULL)
INSERT [dbo].[Event] ([EventID], [EventName], [Place], [Date], [Time], [Description]) VALUES (5, N'Fairytale ', N'NPC', CAST(0xBB380B00 AS Date), CAST(0x07007870335C0000 AS Time), NULL)
INSERT [dbo].[Event] ([EventID], [EventName], [Place], [Date], [Time], [Description]) VALUES (6, N'Collections', N'Sopharma Business Center', CAST(0xE9380B00 AS Date), CAST(0x07001882BA7D0000 AS Time), NULL)
INSERT [dbo].[Event] ([EventID], [EventName], [Place], [Date], [Time], [Description]) VALUES (7, N'State of Trance', N'Arena Armeec', CAST(0xEA380B00 AS Date), CAST(0x0700F0E066B80000 AS Time), N'special guest Armin ')
INSERT [dbo].[Event] ([EventID], [EventName], [Place], [Date], [Time], [Description]) VALUES (8, N'Tomorrowland', N'OpenAir', CAST(0xF6380B00 AS Date), CAST(0x0700F0E066B80000 AS Time), NULL)
INSERT [dbo].[Event] ([EventID], [EventName], [Place], [Date], [Time], [Description]) VALUES (9, N'Copy Me', N'Universiada', CAST(0x21380B00 AS Date), CAST(0x0700B0BD58750000 AS Time), NULL)
INSERT [dbo].[Event] ([EventID], [EventName], [Place], [Date], [Time], [Description]) VALUES (10, N'NY Culture', N'Paradise Center', CAST(0xEA370B00 AS Date), CAST(0x07007870335C0000 AS Time), NULL)
INSERT [dbo].[Event] ([EventID], [EventName], [Place], [Date], [Time], [Description]) VALUES (11, N'China Town', N'bul. Vitosha', CAST(0xC9370B00 AS Date), CAST(0x07001417C6680000 AS Time), NULL)
INSERT [dbo].[Event] ([EventID], [EventName], [Place], [Date], [Time], [Description]) VALUES (12, N'Racing', N'Ring Road', CAST(0x3F390B00 AS Date), CAST(0x0700BCFE35B40000 AS Time), N'like crazy')
INSERT [dbo].[Event] ([EventID], [EventName], [Place], [Date], [Time], [Description]) VALUES (13, N'Sofia Life ', N'Sofia', CAST(0xDA360B00 AS Date), CAST(0x070080461C860000 AS Time), NULL)
INSERT [dbo].[Event] ([EventID], [EventName], [Place], [Date], [Time], [Description]) VALUES (14, N'Lifestyle', N'Burgas', CAST(0xB4390B00 AS Date), CAST(0x0700B0BD58750000 AS Time), N'for better life')
INSERT [dbo].[Event] ([EventID], [EventName], [Place], [Date], [Time], [Description]) VALUES (15, N'Team Building UBB', N'Ba', CAST(0x9A390B00 AS Date), CAST(0x0700A8E76F4B0000 AS Time), NULL)
INSERT [dbo].[EventEmployee] ([EventID], [EmployeeID], [Task]) VALUES (1, 2, N'Guests Responsible')
INSERT [dbo].[EventEmployee] ([EventID], [EmployeeID], [Task]) VALUES (1, 3, N'Advertisement')
INSERT [dbo].[EventEmployee] ([EventID], [EmployeeID], [Task]) VALUES (1, 8, N'Special Guests')
INSERT [dbo].[EventEmployee] ([EventID], [EmployeeID], [Task]) VALUES (1, 10, N'Partners Talk')
INSERT [dbo].[EventEmployee] ([EventID], [EmployeeID], [Task]) VALUES (2, 4, N'Hostess')
INSERT [dbo].[EventEmployee] ([EventID], [EmployeeID], [Task]) VALUES (2, 5, N'Music')
INSERT [dbo].[EventEmployee] ([EventID], [EmployeeID], [Task]) VALUES (2, 6, N'Guests Responsible')
INSERT [dbo].[EventEmployee] ([EventID], [EmployeeID], [Task]) VALUES (2, 9, N'Advertisement')
INSERT [dbo].[EventEmployee] ([EventID], [EmployeeID], [Task]) VALUES (3, 6, N'Advertisement')
INSERT [dbo].[EventEmployee] ([EventID], [EmployeeID], [Task]) VALUES (3, 7, N'Social Media')
INSERT [dbo].[EventEmployee] ([EventID], [EmployeeID], [Task]) VALUES (3, 8, N'Partners')
INSERT [dbo].[EventEmployee] ([EventID], [EmployeeID], [Task]) VALUES (3, 10, N'Guests Emails')
INSERT [dbo].[EventEmployee] ([EventID], [EmployeeID], [Task]) VALUES (4, 2, N'Guests')
INSERT [dbo].[EventEmployee] ([EventID], [EmployeeID], [Task]) VALUES (4, 3, N'Social Media')
INSERT [dbo].[EventEmployee] ([EventID], [EmployeeID], [Task]) VALUES (5, 1, N'Partners')
INSERT [dbo].[EventEmployee] ([EventID], [EmployeeID], [Task]) VALUES (5, 6, N'Guests')
INSERT [dbo].[EventEmployee] ([EventID], [EmployeeID], [Task]) VALUES (6, 4, N'Advertisement')
INSERT [dbo].[EventEmployee] ([EventID], [EmployeeID], [Task]) VALUES (6, 5, N'Scenery')
INSERT [dbo].[EventEmployee] ([EventID], [EmployeeID], [Task]) VALUES (6, 9, N'Invitations')
INSERT [dbo].[EventEmployee] ([EventID], [EmployeeID], [Task]) VALUES (7, 1, N'Partners')
INSERT [dbo].[EventEmployee] ([EventID], [EmployeeID], [Task]) VALUES (7, 3, N'Invitations')
INSERT [dbo].[EventEmployee] ([EventID], [EmployeeID], [Task]) VALUES (7, 6, N'Guests')
INSERT [dbo].[EventEmployee] ([EventID], [EmployeeID], [Task]) VALUES (8, 5, N'Partners')
INSERT [dbo].[EventEmployee] ([EventID], [EmployeeID], [Task]) VALUES (8, 6, N'Hostess')
INSERT [dbo].[EventEmployee] ([EventID], [EmployeeID], [Task]) VALUES (8, 8, N'Advertisement')
INSERT [dbo].[EventEmployee] ([EventID], [EmployeeID], [Task]) VALUES (8, 10, N'Guests')
INSERT [dbo].[EventEmployee] ([EventID], [EmployeeID], [Task]) VALUES (9, 9, N'Guests')
INSERT [dbo].[EventEmployee] ([EventID], [EmployeeID], [Task]) VALUES (10, 2, N'Guests')
INSERT [dbo].[EventEmployee] ([EventID], [EmployeeID], [Task]) VALUES (10, 3, N'Invitations')
INSERT [dbo].[EventEmployee] ([EventID], [EmployeeID], [Task]) VALUES (11, 6, N'Guests')
INSERT [dbo].[EventEmployee] ([EventID], [EmployeeID], [Task]) VALUES (11, 8, N'Partners')
INSERT [dbo].[Guest] ([GuestID], [GuestFirstName], [GuestLastName], [Email]) VALUES (1, N'Ivan', N'George', N'george@mail.com')
INSERT [dbo].[Guest] ([GuestID], [GuestFirstName], [GuestLastName], [Email]) VALUES (2, N'Mimi', N'Bu', N'bu@mail.com')
INSERT [dbo].[Guest] ([GuestID], [GuestFirstName], [GuestLastName], [Email]) VALUES (3, N'Peter', N'Pan', N'pan@mail.com')
INSERT [dbo].[Guest] ([GuestID], [GuestFirstName], [GuestLastName], [Email]) VALUES (4, N'Mous', N'Che', N'mous@mail.com')
INSERT [dbo].[Guest] ([GuestID], [GuestFirstName], [GuestLastName], [Email]) VALUES (5, N'Kolya', N'Perepelitsa', N'kol@mail.com')
INSERT [dbo].[Guest] ([GuestID], [GuestFirstName], [GuestLastName], [Email]) VALUES (6, N'Jim', N'Beam', N'jb@mail.com')
INSERT [dbo].[Guest] ([GuestID], [GuestFirstName], [GuestLastName], [Email]) VALUES (7, N'Jack', N'Daniels', N'jd@mail.com')
INSERT [dbo].[Guest] ([GuestID], [GuestFirstName], [GuestLastName], [Email]) VALUES (8, N'Ralph', N'Lauren', N'lauren@mail.com')
INSERT [dbo].[Guest] ([GuestID], [GuestFirstName], [GuestLastName], [Email]) VALUES (9, N'Donna', N'Karen', N'dkny@mail.com')
INSERT [dbo].[Guest] ([GuestID], [GuestFirstName], [GuestLastName], [Email]) VALUES (10, N'Michael', N'Kors', N'mk@mail.com')
INSERT [dbo].[GuestEvent] ([GuestID], [EventID]) VALUES (1, 1)
INSERT [dbo].[GuestEvent] ([GuestID], [EventID]) VALUES (1, 3)
INSERT [dbo].[GuestEvent] ([GuestID], [EventID]) VALUES (1, 8)
INSERT [dbo].[GuestEvent] ([GuestID], [EventID]) VALUES (1, 11)
INSERT [dbo].[GuestEvent] ([GuestID], [EventID]) VALUES (2, 5)
INSERT [dbo].[GuestEvent] ([GuestID], [EventID]) VALUES (2, 6)
INSERT [dbo].[GuestEvent] ([GuestID], [EventID]) VALUES (2, 7)
INSERT [dbo].[GuestEvent] ([GuestID], [EventID]) VALUES (2, 9)
INSERT [dbo].[GuestEvent] ([GuestID], [EventID]) VALUES (2, 11)
INSERT [dbo].[GuestEvent] ([GuestID], [EventID]) VALUES (3, 2)
INSERT [dbo].[GuestEvent] ([GuestID], [EventID]) VALUES (3, 4)
INSERT [dbo].[GuestEvent] ([GuestID], [EventID]) VALUES (3, 7)
INSERT [dbo].[GuestEvent] ([GuestID], [EventID]) VALUES (3, 10)
INSERT [dbo].[GuestEvent] ([GuestID], [EventID]) VALUES (4, 2)
INSERT [dbo].[GuestEvent] ([GuestID], [EventID]) VALUES (4, 4)
INSERT [dbo].[GuestEvent] ([GuestID], [EventID]) VALUES (4, 6)
INSERT [dbo].[GuestEvent] ([GuestID], [EventID]) VALUES (5, 2)
INSERT [dbo].[GuestEvent] ([GuestID], [EventID]) VALUES (5, 3)
INSERT [dbo].[GuestEvent] ([GuestID], [EventID]) VALUES (5, 4)
INSERT [dbo].[GuestEvent] ([GuestID], [EventID]) VALUES (5, 7)
INSERT [dbo].[GuestEvent] ([GuestID], [EventID]) VALUES (5, 11)
INSERT [dbo].[GuestEvent] ([GuestID], [EventID]) VALUES (6, 4)
INSERT [dbo].[GuestEvent] ([GuestID], [EventID]) VALUES (6, 8)
INSERT [dbo].[GuestEvent] ([GuestID], [EventID]) VALUES (6, 11)
INSERT [dbo].[GuestEvent] ([GuestID], [EventID]) VALUES (7, 2)
INSERT [dbo].[GuestEvent] ([GuestID], [EventID]) VALUES (7, 5)
INSERT [dbo].[GuestEvent] ([GuestID], [EventID]) VALUES (7, 9)
INSERT [dbo].[GuestEvent] ([GuestID], [EventID]) VALUES (8, 3)
INSERT [dbo].[GuestEvent] ([GuestID], [EventID]) VALUES (8, 9)
INSERT [dbo].[GuestEvent] ([GuestID], [EventID]) VALUES (9, 1)
INSERT [dbo].[GuestEvent] ([GuestID], [EventID]) VALUES (9, 5)
INSERT [dbo].[GuestEvent] ([GuestID], [EventID]) VALUES (9, 10)
INSERT [dbo].[GuestEvent] ([GuestID], [EventID]) VALUES (10, 1)
INSERT [dbo].[Position] ([PositionID], [PositionName], [Salary]) VALUES (1, N'Manager', 2000.0000)
INSERT [dbo].[Position] ([PositionID], [PositionName], [Salary]) VALUES (2, N'Team Leader', 1000.0000)
INSERT [dbo].[Position] ([PositionID], [PositionName], [Salary]) VALUES (3, N'Organiser', 700.0000)
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Position] FOREIGN KEY([PositionID])
REFERENCES [dbo].[Position] ([PositionID])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Position]
GO
ALTER TABLE [dbo].[EventEmployee]  WITH CHECK ADD  CONSTRAINT [FK_EventEmployee_Employee] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employee] ([EmployeeID])
GO
ALTER TABLE [dbo].[EventEmployee] CHECK CONSTRAINT [FK_EventEmployee_Employee]
GO
ALTER TABLE [dbo].[EventEmployee]  WITH CHECK ADD  CONSTRAINT [FK_EventEmployee_Event] FOREIGN KEY([EventID])
REFERENCES [dbo].[Event] ([EventID])
GO
ALTER TABLE [dbo].[EventEmployee] CHECK CONSTRAINT [FK_EventEmployee_Event]
GO
ALTER TABLE [dbo].[GuestEvent]  WITH CHECK ADD  CONSTRAINT [FK_GuestEvent_Event] FOREIGN KEY([EventID])
REFERENCES [dbo].[Event] ([EventID])
GO
ALTER TABLE [dbo].[GuestEvent] CHECK CONSTRAINT [FK_GuestEvent_Event]
GO
ALTER TABLE [dbo].[GuestEvent]  WITH CHECK ADD  CONSTRAINT [FK_GuestEvent_Guest] FOREIGN KEY([GuestID])
REFERENCES [dbo].[Guest] ([GuestID])
GO
ALTER TABLE [dbo].[GuestEvent] CHECK CONSTRAINT [FK_GuestEvent_Guest]
GO
USE [master]
GO
ALTER DATABASE [WebAppEventManagement] SET  READ_WRITE 
GO
