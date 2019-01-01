
CREATE DATABASE [Туристична агенція]
 
GO
ALTER DATABASE [Туристична агенція] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Туристична агенція].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Туристична агенція] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Туристична агенція] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Туристична агенція] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Туристична агенція] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Туристична агенція] SET ARITHABORT OFF 
GO
ALTER DATABASE [Туристична агенція] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Туристична агенція] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Туристична агенція] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Туристична агенція] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Туристична агенція] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Туристична агенція] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Туристична агенція] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Туристична агенція] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Туристична агенція] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Туристична агенція] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Туристична агенція] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Туристична агенція] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Туристична агенція] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Туристична агенція] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Туристична агенція] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Туристична агенція] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Туристична агенція] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Туристична агенція] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Туристична агенція] SET  MULTI_USER 
GO
ALTER DATABASE [Туристична агенція] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Туристична агенція] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Туристична агенція] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Туристична агенція] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Туристична агенція] SET DELAYED_DURABILITY = DISABLED 
GO
USE [Туристична агенція]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Авіаперевізники](
	[Авіаперевізник] [nvarchar](30) NOT NULL,
	[Країна вильоту] [nvarchar](30) NOT NULL,
	[Місто вильоту] [nvarchar](30) NOT NULL,
	[Рейси] [nvarchar](max) NULL,
 CONSTRAINT [PK_Авіаперевізники] PRIMARY KEY CLUSTERED 
(
	[Авіаперевізник] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Замовлення](
	[Ідентифікаційний код клієнта] [int] NOT NULL,
	[Код туру] [int] NOT NULL,
	[Ціна туру] [money] NOT NULL,
	[Кількість путівок] [int] NOT NULL,
	[Авіаперевізник] [nvarchar](30) NOT NULL,
	[Дата оплати] [date] NULL,
 CONSTRAINT [PK_Замовлення] PRIMARY KEY CLUSTERED 
(
	[Ідентифікаційний код клієнта] ASC,
	[Код туру] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Клієнти](
	[Ідентифікаційний код клієнта] [int] NOT NULL,
	[Прізвище] [nvarchar](50) NOT NULL,
	[Ім'я] [nvarchar](20) NOT NULL,
	[По батькові] [nvarchar](50) NULL,
 CONSTRAINT [PK_Клієнти] PRIMARY KEY CLUSTERED 
(
	[Ідентифікаційний код клієнта] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Напрямки](
	[Код напрямку] [int] NOT NULL,
	[Країна] [nvarchar](30) NOT NULL,
	[Місто] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_Напрямки] PRIMARY KEY CLUSTERED 
(
	[Код напрямку] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Тури](
	[Код туру] [int] NOT NULL,
	[Код напрямку] [int] NOT NULL,
	[Тривалість туру] [int] NOT NULL,
	[Ціна туру] [money] NOT NULL,
 CONSTRAINT [PK_Тури] PRIMARY KEY CLUSTERED 
(
	[Код туру] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Замовлення]  WITH CHECK ADD  CONSTRAINT [FK_Замовлення_Авіаперевізники] FOREIGN KEY([Авіаперевізник])
REFERENCES [dbo].[Авіаперевізники] ([Авіаперевізник])
GO
ALTER TABLE [dbo].[Замовлення] CHECK CONSTRAINT [FK_Замовлення_Авіаперевізники]
GO
ALTER TABLE [dbo].[Замовлення]  WITH CHECK ADD  CONSTRAINT [FK_Замовлення_Клієнти] FOREIGN KEY([Ідентифікаційний код клієнта])
REFERENCES [dbo].[Клієнти] ([Ідентифікаційний код клієнта])
GO
ALTER TABLE [dbo].[Замовлення] CHECK CONSTRAINT [FK_Замовлення_Клієнти]
GO
ALTER TABLE [dbo].[Замовлення]  WITH CHECK ADD  CONSTRAINT [FK_Замовлення_Тури] FOREIGN KEY([Код туру])
REFERENCES [dbo].[Тури] ([Код туру])
GO
ALTER TABLE [dbo].[Замовлення] CHECK CONSTRAINT [FK_Замовлення_Тури]
GO
ALTER TABLE [dbo].[Тури]  WITH CHECK ADD  CONSTRAINT [FK_Тури_Напрямки] FOREIGN KEY([Код напрямку])
REFERENCES [dbo].[Напрямки] ([Код напрямку])
GO
ALTER TABLE [dbo].[Тури] CHECK CONSTRAINT [FK_Тури_Напрямки]
GO
USE [master]
GO
ALTER DATABASE [Туристична агенція] SET  READ_WRITE 
GO
