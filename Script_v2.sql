USE [master]
GO
/****** Object:  Database [LigaDeFutbol]    Script Date: 06/22/2015 16:48:42 ******/
CREATE DATABASE [LigaDeFutbol] ON  PRIMARY 
( NAME = N'LigaDeFutbol', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS\MSSQL\DATA\LigaDeFutbol.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'LigaDeFutbol_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS\MSSQL\DATA\LigaDeFutbol_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [LigaDeFutbol] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [LigaDeFutbol].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [LigaDeFutbol] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [LigaDeFutbol] SET ANSI_NULLS OFF
GO
ALTER DATABASE [LigaDeFutbol] SET ANSI_PADDING OFF
GO
ALTER DATABASE [LigaDeFutbol] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [LigaDeFutbol] SET ARITHABORT OFF
GO
ALTER DATABASE [LigaDeFutbol] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [LigaDeFutbol] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [LigaDeFutbol] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [LigaDeFutbol] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [LigaDeFutbol] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [LigaDeFutbol] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [LigaDeFutbol] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [LigaDeFutbol] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [LigaDeFutbol] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [LigaDeFutbol] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [LigaDeFutbol] SET  DISABLE_BROKER
GO
ALTER DATABASE [LigaDeFutbol] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [LigaDeFutbol] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [LigaDeFutbol] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [LigaDeFutbol] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [LigaDeFutbol] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [LigaDeFutbol] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [LigaDeFutbol] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [LigaDeFutbol] SET  READ_WRITE
GO
ALTER DATABASE [LigaDeFutbol] SET RECOVERY SIMPLE
GO
ALTER DATABASE [LigaDeFutbol] SET  MULTI_USER
GO
ALTER DATABASE [LigaDeFutbol] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [LigaDeFutbol] SET DB_CHAINING OFF
GO
USE [LigaDeFutbol]
GO
/****** Object:  Table [dbo].[estado_partido]    Script Date: 06/22/2015 16:48:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[estado_partido](
	[idEstadoPartido] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [nvarchar](50) NULL,
 CONSTRAINT [PK_estado_partido] PRIMARY KEY CLUSTERED 
(
	[idEstadoPartido] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[estado_fecha]    Script Date: 06/22/2015 16:48:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[estado_fecha](
	[idEstadoFecha] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [nvarchar](50) NULL,
 CONSTRAINT [PK_estado_fecha] PRIMARY KEY CLUSTERED 
(
	[idEstadoFecha] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[estado_campeonato]    Script Date: 06/22/2015 16:48:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[estado_campeonato](
	[idEstadoCampeonato] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [nvarchar](50) NULL,
 CONSTRAINT [PK_estado_campeonato] PRIMARY KEY CLUSTERED 
(
	[idEstadoCampeonato] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[estado_campeonato] ON
INSERT [dbo].[estado_campeonato] ([idEstadoCampeonato], [descripcion]) VALUES (1, N'jugado')
INSERT [dbo].[estado_campeonato] ([idEstadoCampeonato], [descripcion]) VALUES (2, N'suspendido')
SET IDENTITY_INSERT [dbo].[estado_campeonato] OFF
/****** Object:  Table [dbo].[jugadores_partidos]    Script Date: 06/22/2015 16:48:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[jugadores_partidos](
	[idJugador] [int] NOT NULL,
	[idPartido] [int] NOT NULL,
	[titual] [bit] NULL,
	[numeroCamiseta] [int] NULL,
 CONSTRAINT [PK_jugadores_partidos_1] PRIMARY KEY CLUSTERED 
(
	[idJugador] ASC,
	[idPartido] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[jugador]    Script Date: 06/22/2015 16:48:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[jugador](
	[idJugador] [int] IDENTITY(1,1) NOT NULL,
	[idTipoDocumento] [int] NOT NULL,
	[numeroDocumento] [int] NOT NULL,
	[nombre] [nvarchar](50) NOT NULL,
	[apellido] [nvarchar](50) NOT NULL,
	[fechaNacimiento] [datetime] NULL,
	[disponibleParaFecha] [bit] NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[jugador] ON
INSERT [dbo].[jugador] ([idJugador], [idTipoDocumento], [numeroDocumento], [nombre], [apellido], [fechaNacimiento], [disponibleParaFecha]) VALUES (1, 1, 5555555, N'marcio', N'Bagnus', CAST(0x00008D3F00000000 AS DateTime), 0)
INSERT [dbo].[jugador] ([idJugador], [idTipoDocumento], [numeroDocumento], [nombre], [apellido], [fechaNacimiento], [disponibleParaFecha]) VALUES (2, 1, 5555555, N'marcio', N'aaaaaaaaaaaa', CAST(0x00008EAC00000000 AS DateTime), 0)
INSERT [dbo].[jugador] ([idJugador], [idTipoDocumento], [numeroDocumento], [nombre], [apellido], [fechaNacimiento], [disponibleParaFecha]) VALUES (3, 1, 1111111, N'b', N'b', CAST(0x00008EAC00000000 AS DateTime), 0)
INSERT [dbo].[jugador] ([idJugador], [idTipoDocumento], [numeroDocumento], [nombre], [apellido], [fechaNacimiento], [disponibleParaFecha]) VALUES (4, 1, 5555555, N'marcio', N'aaaaaaaaaaaa', CAST(0x00008EAC00000000 AS DateTime), 0)
INSERT [dbo].[jugador] ([idJugador], [idTipoDocumento], [numeroDocumento], [nombre], [apellido], [fechaNacimiento], [disponibleParaFecha]) VALUES (5, 1, 1111111, N'b', N'b', CAST(0x00008EAC00000000 AS DateTime), 0)
INSERT [dbo].[jugador] ([idJugador], [idTipoDocumento], [numeroDocumento], [nombre], [apellido], [fechaNacimiento], [disponibleParaFecha]) VALUES (6, 2, 35529832, N'Conejo', N'Saviola', CAST(0x00008D3F00000000 AS DateTime), 0)
INSERT [dbo].[jugador] ([idJugador], [idTipoDocumento], [numeroDocumento], [nombre], [apellido], [fechaNacimiento], [disponibleParaFecha]) VALUES (7, 1, 5555555, N'marcio', N'aaaaaaaaaaaa', CAST(0x00008EAC00000000 AS DateTime), 0)
INSERT [dbo].[jugador] ([idJugador], [idTipoDocumento], [numeroDocumento], [nombre], [apellido], [fechaNacimiento], [disponibleParaFecha]) VALUES (8, 1, 1111111, N'b', N'b', CAST(0x00008EAC00000000 AS DateTime), 0)
INSERT [dbo].[jugador] ([idJugador], [idTipoDocumento], [numeroDocumento], [nombre], [apellido], [fechaNacimiento], [disponibleParaFecha]) VALUES (9, 2, 35529832, N'Conejo', N'Saviola', CAST(0x00008D3F00000000 AS DateTime), 0)
INSERT [dbo].[jugador] ([idJugador], [idTipoDocumento], [numeroDocumento], [nombre], [apellido], [fechaNacimiento], [disponibleParaFecha]) VALUES (10, 1, 35529832, N'marcio', N'Bagnus', CAST(0x00008EAC00000000 AS DateTime), 0)
INSERT [dbo].[jugador] ([idJugador], [idTipoDocumento], [numeroDocumento], [nombre], [apellido], [fechaNacimiento], [disponibleParaFecha]) VALUES (11, 1, 5555555, N'marcio', N'aaaaaaaaaaaa', CAST(0x00008EAC00000000 AS DateTime), 0)
INSERT [dbo].[jugador] ([idJugador], [idTipoDocumento], [numeroDocumento], [nombre], [apellido], [fechaNacimiento], [disponibleParaFecha]) VALUES (12, 1, 1111111, N'b', N'b', CAST(0x00008EAC00000000 AS DateTime), 0)
INSERT [dbo].[jugador] ([idJugador], [idTipoDocumento], [numeroDocumento], [nombre], [apellido], [fechaNacimiento], [disponibleParaFecha]) VALUES (13, 2, 35529832, N'Conejo', N'Saviola', CAST(0x00008D3F00000000 AS DateTime), 0)
INSERT [dbo].[jugador] ([idJugador], [idTipoDocumento], [numeroDocumento], [nombre], [apellido], [fechaNacimiento], [disponibleParaFecha]) VALUES (14, 1, 35529832, N'marcio', N'Bagnus', CAST(0x00008EAC00000000 AS DateTime), 0)
INSERT [dbo].[jugador] ([idJugador], [idTipoDocumento], [numeroDocumento], [nombre], [apellido], [fechaNacimiento], [disponibleParaFecha]) VALUES (19, 2, 3552932, N'marcio', N'bagnus', CAST(0x0000A4B300000000 AS DateTime), 0)
INSERT [dbo].[jugador] ([idJugador], [idTipoDocumento], [numeroDocumento], [nombre], [apellido], [fechaNacimiento], [disponibleParaFecha]) VALUES (20, 1, 1222222, N'asd', N'ad', CAST(0x0000A4C200000000 AS DateTime), 0)
INSERT [dbo].[jugador] ([idJugador], [idTipoDocumento], [numeroDocumento], [nombre], [apellido], [fechaNacimiento], [disponibleParaFecha]) VALUES (15, 1, 6455555, N'gfh', N'ghf', CAST(0x00008D3F00000000 AS DateTime), 0)
INSERT [dbo].[jugador] ([idJugador], [idTipoDocumento], [numeroDocumento], [nombre], [apellido], [fechaNacimiento], [disponibleParaFecha]) VALUES (16, 1, 1111111, N'b', N'b', CAST(0x00008E6000000000 AS DateTime), 0)
INSERT [dbo].[jugador] ([idJugador], [idTipoDocumento], [numeroDocumento], [nombre], [apellido], [fechaNacimiento], [disponibleParaFecha]) VALUES (17, 1, 35529832, N'fghf', N'fgh', CAST(0x0000818900000000 AS DateTime), 0)
INSERT [dbo].[jugador] ([idJugador], [idTipoDocumento], [numeroDocumento], [nombre], [apellido], [fechaNacimiento], [disponibleParaFecha]) VALUES (18, 3, 6544666, N'gfh', N'Bagnus', CAST(0x00008E6000000000 AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[jugador] OFF
/****** Object:  Table [dbo].[cancha]    Script Date: 06/22/2015 16:48:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cancha](
	[idCancha] [int] IDENTITY(1,1) NOT NULL,
	[calle] [nvarchar](50) NOT NULL,
	[numeroCalle] [int] NOT NULL,
	[nombreCancha] [nvarchar](50) NULL,
	[habilitada] [bit] NULL,
	[fechaInaguracion] [datetime] NULL,
 CONSTRAINT [PK_cancha] PRIMARY KEY CLUSTERED 
(
	[idCancha] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[cancha] ON
INSERT [dbo].[cancha] ([idCancha], [calle], [numeroCalle], [nombreCancha], [habilitada], [fechaInaguracion]) VALUES (5, N'fdg', 654, N'gdf', 1, CAST(0x0000A4B300000000 AS DateTime))
SET IDENTITY_INSERT [dbo].[cancha] OFF
/****** Object:  Table [dbo].[arbitro_partido]    Script Date: 06/22/2015 16:48:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[arbitro_partido](
	[idPartido] [int] NOT NULL,
	[idArbitro] [int] NOT NULL,
	[esArbitro] [bit] NULL,
	[esLineaUno] [bit] NULL,
	[esLineaDos] [bit] NULL,
 CONSTRAINT [PK_arbitro_partido_1] PRIMARY KEY CLUSTERED 
(
	[idPartido] ASC,
	[idArbitro] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tipo_documento]    Script Date: 06/22/2015 16:48:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tipo_documento](
	[idTIpoDocumento] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [nvarchar](50) NULL,
 CONSTRAINT [PK_tipo_documento] PRIMARY KEY CLUSTERED 
(
	[idTIpoDocumento] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tipo_documento] ON
INSERT [dbo].[tipo_documento] ([idTIpoDocumento], [descripcion]) VALUES (1, N'DNI')
INSERT [dbo].[tipo_documento] ([idTIpoDocumento], [descripcion]) VALUES (2, N'LC')
INSERT [dbo].[tipo_documento] ([idTIpoDocumento], [descripcion]) VALUES (3, N'PASAPORTE')
INSERT [dbo].[tipo_documento] ([idTIpoDocumento], [descripcion]) VALUES (4, N'LE')
SET IDENTITY_INSERT [dbo].[tipo_documento] OFF
/****** Object:  Table [dbo].[rol]    Script Date: 06/22/2015 16:48:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rol](
	[idRol] [int] IDENTITY(1,1) NOT NULL,
	[nombreRol] [nvarchar](50) NULL,
 CONSTRAINT [PK_rol] PRIMARY KEY CLUSTERED 
(
	[idRol] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[rol] ON
INSERT [dbo].[rol] ([idRol], [nombreRol]) VALUES (1, N'Empleado')
INSERT [dbo].[rol] ([idRol], [nombreRol]) VALUES (2, N'Admin')
SET IDENTITY_INSERT [dbo].[rol] OFF
/****** Object:  Table [dbo].[gol]    Script Date: 06/22/2015 16:48:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[gol](
	[idGol] [int] NOT NULL,
	[minutoDeJuego] [int] NOT NULL,
	[esContra] [bit] NOT NULL,
	[idJugador] [int] NOT NULL,
 CONSTRAINT [PK_gol_1] PRIMARY KEY CLUSTERED 
(
	[idGol] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[usuario]    Script Date: 06/22/2015 16:48:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[usuario](
	[idUsuario] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](50) NULL,
	[password] [nvarchar](50) NULL,
	[idRol] [int] NULL,
 CONSTRAINT [PK_usuario] PRIMARY KEY CLUSTERED 
(
	[idUsuario] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[usuario] ON
INSERT [dbo].[usuario] ([idUsuario], [nombre], [password], [idRol]) VALUES (1, N'Empleado', N'Empleado', 1)
INSERT [dbo].[usuario] ([idUsuario], [nombre], [password], [idRol]) VALUES (2, N'Admin', N'Admin', 2)
SET IDENTITY_INSERT [dbo].[usuario] OFF
/****** Object:  Table [dbo].[club]    Script Date: 06/22/2015 16:48:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[club](
	[idClub] [int] IDENTITY(0,1) NOT NULL,
	[nombreClub] [nvarchar](50) NOT NULL,
	[calle] [nvarchar](50) NOT NULL,
	[numeroCalle] [int] NOT NULL,
	[fechaFundacion] [datetime] NULL,
	[participoAntesEnLiga] [bit] NULL,
	[idCancha] [int] NOT NULL,
 CONSTRAINT [PK_club] PRIMARY KEY CLUSTERED 
(
	[idClub] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[club] ON
INSERT [dbo].[club] ([idClub], [nombreClub], [calle], [numeroCalle], [fechaFundacion], [participoAntesEnLiga], [idCancha]) VALUES (4, N'fgh', N'fgh', 654, CAST(0x0000A4AB00000000 AS DateTime), 1, 5)
SET IDENTITY_INSERT [dbo].[club] OFF
/****** Object:  Table [dbo].[arbitro]    Script Date: 06/22/2015 16:48:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[arbitro](
	[idArbitro] [int] IDENTITY(1,1) NOT NULL,
	[idTipoDocumento] [int] NOT NULL,
	[numeroDocumento] [int] NOT NULL,
	[nombre] [nvarchar](50) NOT NULL,
	[apellido] [nvarchar](50) NOT NULL,
	[fechaNacimiento] [datetime] NOT NULL,
	[disponibleParaFecha] [bit] NOT NULL,
 CONSTRAINT [PK_arbitro] PRIMARY KEY CLUSTERED 
(
	[idArbitro] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[campeonato]    Script Date: 06/22/2015 16:48:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[campeonato](
	[idCampeonato] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](50) NULL,
	[fechaInicio] [datetime] NULL,
	[fechaFin] [datetime] NULL,
	[idEstadoCampeonato] [int] NOT NULL,
	[puntosPartidoGanado] [int] NULL,
	[puntosPartidoEmpatado] [int] NULL,
	[fechaLimiteInscripcion] [datetime] NULL,
 CONSTRAINT [PK_campeonato] PRIMARY KEY CLUSTERED 
(
	[idCampeonato] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[campeonato] ON
INSERT [dbo].[campeonato] ([idCampeonato], [nombre], [fechaInicio], [fechaFin], [idEstadoCampeonato], [puntosPartidoGanado], [puntosPartidoEmpatado], [fechaLimiteInscripcion]) VALUES (6, N'Apertura', CAST(0x0000A53400000000 AS DateTime), CAST(0x0000A60900000000 AS DateTime), 1, 3, 1, CAST(0x0000A53500000000 AS DateTime))
INSERT [dbo].[campeonato] ([idCampeonato], [nombre], [fechaInicio], [fechaFin], [idEstadoCampeonato], [puntosPartidoGanado], [puntosPartidoEmpatado], [fechaLimiteInscripcion]) VALUES (12, N'Clausura', CAST(0x0000A53400000000 AS DateTime), CAST(0x0000A60900000000 AS DateTime), 1, 3, 1, CAST(0x0000A53500000000 AS DateTime))
SET IDENTITY_INSERT [dbo].[campeonato] OFF
/****** Object:  Table [dbo].[inscripcion]    Script Date: 06/22/2015 16:48:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[inscripcion](
	[idInscripcion] [int] IDENTITY(1,1) NOT NULL,
	[idClub] [int] NOT NULL,
	[idCampeonato] [int] NOT NULL,
	[fechaInscripcion] [datetime] NULL,
 CONSTRAINT [PK_inscripcion_1] PRIMARY KEY CLUSTERED 
(
	[idInscripcion] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[inscripcion] ON
INSERT [dbo].[inscripcion] ([idInscripcion], [idClub], [idCampeonato], [fechaInscripcion]) VALUES (6, 4, 6, CAST(0x0000A4BF00000000 AS DateTime))
INSERT [dbo].[inscripcion] ([idInscripcion], [idClub], [idCampeonato], [fechaInscripcion]) VALUES (7, 4, 6, CAST(0x0000A4BF00000000 AS DateTime))
SET IDENTITY_INSERT [dbo].[inscripcion] OFF
/****** Object:  Table [dbo].[fecha_campeonato]    Script Date: 06/22/2015 16:48:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[fecha_campeonato](
	[idFechaCampeonato] [int] NOT NULL,
	[numeroFecha] [int] IDENTITY(1,1) NOT NULL,
	[idCampeonato] [int] NOT NULL,
	[fechaComienzo] [datetime] NULL,
	[idEstado] [int] NOT NULL,
 CONSTRAINT [PK_fecha_campeonato_1] PRIMARY KEY CLUSTERED 
(
	[idFechaCampeonato] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[partido]    Script Date: 06/22/2015 16:48:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[partido](
	[idPartido] [int] IDENTITY(1,1) NOT NULL,
	[fechaPartido] [datetime] NULL,
	[horaPartido] [datetime] NULL,
	[idEstado] [int] NOT NULL,
	[idClubLocal] [int] NOT NULL,
	[idClubVisitante] [int] NOT NULL,
	[golesLocal] [int] NULL,
	[golesVisitante] [int] NULL,
	[idFechaCampeonato] [int] NOT NULL,
	[descripcion] [nvarchar](50) NULL,
 CONSTRAINT [PK_partido] PRIMARY KEY CLUSTERED 
(
	[idPartido] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[detalle_inscripcion]    Script Date: 06/22/2015 16:48:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[detalle_inscripcion](
	[idDetalleInscripcion] [int] IDENTITY(1,1) NOT NULL,
	[idInscripcion] [int] NOT NULL,
	[idJugador] [int] NOT NULL,
 CONSTRAINT [PK_detalle_inscripcion] PRIMARY KEY CLUSTERED 
(
	[idDetalleInscripcion] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[detalle_inscripcion] ON
INSERT [dbo].[detalle_inscripcion] ([idDetalleInscripcion], [idInscripcion], [idJugador]) VALUES (37, 6, 0)
INSERT [dbo].[detalle_inscripcion] ([idDetalleInscripcion], [idInscripcion], [idJugador]) VALUES (38, 6, 0)
INSERT [dbo].[detalle_inscripcion] ([idDetalleInscripcion], [idInscripcion], [idJugador]) VALUES (39, 6, 0)
INSERT [dbo].[detalle_inscripcion] ([idDetalleInscripcion], [idInscripcion], [idJugador]) VALUES (40, 6, 0)
SET IDENTITY_INSERT [dbo].[detalle_inscripcion] OFF
/****** Object:  ForeignKey [FK_estado_fecha_estado_fecha]    Script Date: 06/22/2015 16:48:43 ******/
ALTER TABLE [dbo].[estado_fecha]  WITH CHECK ADD  CONSTRAINT [FK_estado_fecha_estado_fecha] FOREIGN KEY([idEstadoFecha])
REFERENCES [dbo].[estado_fecha] ([idEstadoFecha])
GO
ALTER TABLE [dbo].[estado_fecha] CHECK CONSTRAINT [FK_estado_fecha_estado_fecha]
GO
/****** Object:  ForeignKey [FK_rol_rol]    Script Date: 06/22/2015 16:48:43 ******/
ALTER TABLE [dbo].[rol]  WITH CHECK ADD  CONSTRAINT [FK_rol_rol] FOREIGN KEY([idRol])
REFERENCES [dbo].[rol] ([idRol])
GO
ALTER TABLE [dbo].[rol] CHECK CONSTRAINT [FK_rol_rol]
GO
/****** Object:  ForeignKey [FK_usuario_rol]    Script Date: 06/22/2015 16:48:43 ******/
ALTER TABLE [dbo].[usuario]  WITH CHECK ADD  CONSTRAINT [FK_usuario_rol] FOREIGN KEY([idRol])
REFERENCES [dbo].[rol] ([idRol])
GO
ALTER TABLE [dbo].[usuario] CHECK CONSTRAINT [FK_usuario_rol]
GO
/****** Object:  ForeignKey [FK_usuario_usuario]    Script Date: 06/22/2015 16:48:43 ******/
ALTER TABLE [dbo].[usuario]  WITH CHECK ADD  CONSTRAINT [FK_usuario_usuario] FOREIGN KEY([idUsuario])
REFERENCES [dbo].[usuario] ([idUsuario])
GO
ALTER TABLE [dbo].[usuario] CHECK CONSTRAINT [FK_usuario_usuario]
GO
/****** Object:  ForeignKey [FK_club_cancha]    Script Date: 06/22/2015 16:48:43 ******/
ALTER TABLE [dbo].[club]  WITH CHECK ADD  CONSTRAINT [FK_club_cancha] FOREIGN KEY([idCancha])
REFERENCES [dbo].[cancha] ([idCancha])
GO
ALTER TABLE [dbo].[club] CHECK CONSTRAINT [FK_club_cancha]
GO
/****** Object:  ForeignKey [FK_arbitro_tipo_documento]    Script Date: 06/22/2015 16:48:43 ******/
ALTER TABLE [dbo].[arbitro]  WITH CHECK ADD  CONSTRAINT [FK_arbitro_tipo_documento] FOREIGN KEY([idTipoDocumento])
REFERENCES [dbo].[tipo_documento] ([idTIpoDocumento])
GO
ALTER TABLE [dbo].[arbitro] CHECK CONSTRAINT [FK_arbitro_tipo_documento]
GO
/****** Object:  ForeignKey [FK_campeonato_estado_campeonato]    Script Date: 06/22/2015 16:48:43 ******/
ALTER TABLE [dbo].[campeonato]  WITH CHECK ADD  CONSTRAINT [FK_campeonato_estado_campeonato] FOREIGN KEY([idEstadoCampeonato])
REFERENCES [dbo].[estado_campeonato] ([idEstadoCampeonato])
GO
ALTER TABLE [dbo].[campeonato] CHECK CONSTRAINT [FK_campeonato_estado_campeonato]
GO
/****** Object:  ForeignKey [FK_inscripcion_campeonato]    Script Date: 06/22/2015 16:48:43 ******/
ALTER TABLE [dbo].[inscripcion]  WITH CHECK ADD  CONSTRAINT [FK_inscripcion_campeonato] FOREIGN KEY([idCampeonato])
REFERENCES [dbo].[campeonato] ([idCampeonato])
GO
ALTER TABLE [dbo].[inscripcion] CHECK CONSTRAINT [FK_inscripcion_campeonato]
GO
/****** Object:  ForeignKey [FK_inscripcion_club]    Script Date: 06/22/2015 16:48:43 ******/
ALTER TABLE [dbo].[inscripcion]  WITH CHECK ADD  CONSTRAINT [FK_inscripcion_club] FOREIGN KEY([idClub])
REFERENCES [dbo].[club] ([idClub])
GO
ALTER TABLE [dbo].[inscripcion] CHECK CONSTRAINT [FK_inscripcion_club]
GO
/****** Object:  ForeignKey [FK_fecha_campeonato_campeonato]    Script Date: 06/22/2015 16:48:43 ******/
ALTER TABLE [dbo].[fecha_campeonato]  WITH CHECK ADD  CONSTRAINT [FK_fecha_campeonato_campeonato] FOREIGN KEY([idCampeonato])
REFERENCES [dbo].[campeonato] ([idCampeonato])
GO
ALTER TABLE [dbo].[fecha_campeonato] CHECK CONSTRAINT [FK_fecha_campeonato_campeonato]
GO
/****** Object:  ForeignKey [FK_fecha_campeonato_estado_fecha]    Script Date: 06/22/2015 16:48:43 ******/
ALTER TABLE [dbo].[fecha_campeonato]  WITH CHECK ADD  CONSTRAINT [FK_fecha_campeonato_estado_fecha] FOREIGN KEY([idEstado])
REFERENCES [dbo].[estado_fecha] ([idEstadoFecha])
GO
ALTER TABLE [dbo].[fecha_campeonato] CHECK CONSTRAINT [FK_fecha_campeonato_estado_fecha]
GO
/****** Object:  ForeignKey [FK_partido_club]    Script Date: 06/22/2015 16:48:43 ******/
ALTER TABLE [dbo].[partido]  WITH CHECK ADD  CONSTRAINT [FK_partido_club] FOREIGN KEY([idClubLocal])
REFERENCES [dbo].[club] ([idClub])
GO
ALTER TABLE [dbo].[partido] CHECK CONSTRAINT [FK_partido_club]
GO
/****** Object:  ForeignKey [FK_partido_club1]    Script Date: 06/22/2015 16:48:43 ******/
ALTER TABLE [dbo].[partido]  WITH CHECK ADD  CONSTRAINT [FK_partido_club1] FOREIGN KEY([idClubVisitante])
REFERENCES [dbo].[club] ([idClub])
GO
ALTER TABLE [dbo].[partido] CHECK CONSTRAINT [FK_partido_club1]
GO
/****** Object:  ForeignKey [FK_partido_estado_partido]    Script Date: 06/22/2015 16:48:43 ******/
ALTER TABLE [dbo].[partido]  WITH CHECK ADD  CONSTRAINT [FK_partido_estado_partido] FOREIGN KEY([idEstado])
REFERENCES [dbo].[estado_partido] ([idEstadoPartido])
GO
ALTER TABLE [dbo].[partido] CHECK CONSTRAINT [FK_partido_estado_partido]
GO
/****** Object:  ForeignKey [FK_partido_fecha_campeonato]    Script Date: 06/22/2015 16:48:43 ******/
ALTER TABLE [dbo].[partido]  WITH CHECK ADD  CONSTRAINT [FK_partido_fecha_campeonato] FOREIGN KEY([idFechaCampeonato])
REFERENCES [dbo].[fecha_campeonato] ([idFechaCampeonato])
GO
ALTER TABLE [dbo].[partido] CHECK CONSTRAINT [FK_partido_fecha_campeonato]
GO
/****** Object:  ForeignKey [FK_detalle_inscripcion_inscripcion]    Script Date: 06/22/2015 16:48:43 ******/
ALTER TABLE [dbo].[detalle_inscripcion]  WITH CHECK ADD  CONSTRAINT [FK_detalle_inscripcion_inscripcion] FOREIGN KEY([idInscripcion])
REFERENCES [dbo].[inscripcion] ([idInscripcion])
GO
ALTER TABLE [dbo].[detalle_inscripcion] CHECK CONSTRAINT [FK_detalle_inscripcion_inscripcion]
GO
