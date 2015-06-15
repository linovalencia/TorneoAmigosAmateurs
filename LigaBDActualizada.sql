USE [master]
GO
/****** Object:  Database [LigaDeFutbol]    Script Date: 06/15/2015 03:58:29 ******/
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
/****** Object:  Table [dbo].[jugadores_partidos]    Script Date: 06/15/2015 03:58:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[jugadores_partidos](
	[idPartido] [int] NOT NULL,
	[idTipoDocumentoJugador] [int] NOT NULL,
	[numeroDocumentoJugador] [int] NOT NULL,
	[titual] [bit] NULL,
	[numeroCamiseta] [int] NULL,
 CONSTRAINT [PK_jugadores_partidos] PRIMARY KEY CLUSTERED 
(
	[idPartido] ASC,
	[idTipoDocumentoJugador] ASC,
	[numeroDocumentoJugador] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[jugador]    Script Date: 06/15/2015 03:58:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[jugador](
	[idTipoDocumento] [int] NOT NULL,
	[numeroDocumento] [int] NOT NULL,
	[nombre] [nvarchar](50) NOT NULL,
	[apellido] [nvarchar](50) NOT NULL,
	[fechaNacimiento] [datetime] NULL,
	[disponibleParaFecha] [bit] NULL,
 CONSTRAINT [PK_jugador] PRIMARY KEY CLUSTERED 
(
	[idTipoDocumento] ASC,
	[numeroDocumento] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tipo_documento]    Script Date: 06/15/2015 03:58:30 ******/
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
/****** Object:  Table [dbo].[rol]    Script Date: 06/15/2015 03:58:30 ******/
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
/****** Object:  Table [dbo].[estado_partido]    Script Date: 06/15/2015 03:58:30 ******/
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
/****** Object:  Table [dbo].[estado_fecha]    Script Date: 06/15/2015 03:58:30 ******/
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
/****** Object:  Table [dbo].[estado_campeonato]    Script Date: 06/15/2015 03:58:30 ******/
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
/****** Object:  Table [dbo].[club]    Script Date: 06/15/2015 03:58:30 ******/
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
/****** Object:  Table [dbo].[cancha]    Script Date: 06/15/2015 03:58:30 ******/
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
/****** Object:  Table [dbo].[arbitro_partido]    Script Date: 06/15/2015 03:58:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[arbitro_partido](
	[idPartido] [int] NOT NULL,
	[idTipoDocumentoArbitro] [int] NOT NULL,
	[numeroDocumentoArbitro] [int] NOT NULL,
	[esArbitro] [bit] NULL,
	[esLineaUno] [bit] NULL,
	[esLineaDos] [bit] NULL,
 CONSTRAINT [PK_arbitro_partido] PRIMARY KEY CLUSTERED 
(
	[idPartido] ASC,
	[idTipoDocumentoArbitro] ASC,
	[numeroDocumentoArbitro] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[arbitro]    Script Date: 06/15/2015 03:58:30 ******/
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
	[disponibleParaFecha] [bit] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[gol]    Script Date: 06/15/2015 03:58:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[gol](
	[minutoDeJuego] [int] NOT NULL,
	[esContra] [bit] NOT NULL,
	[idTipoDocumento] [int] NOT NULL,
	[numeroDocumento] [int] NOT NULL,
 CONSTRAINT [PK_gol] PRIMARY KEY CLUSTERED 
(
	[minutoDeJuego] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[fecha_campeonato]    Script Date: 06/15/2015 03:58:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[fecha_campeonato](
	[numeroFecha] [int] IDENTITY(1,1) NOT NULL,
	[idCampeonato] [int] NOT NULL,
	[fechaComienzo] [datetime] NULL,
	[idEstado] [int] NOT NULL,
 CONSTRAINT [PK_fecha_campeonato] PRIMARY KEY CLUSTERED 
(
	[numeroFecha] ASC,
	[idCampeonato] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[campeonato]    Script Date: 06/15/2015 03:58:30 ******/
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
/****** Object:  Table [dbo].[detalle_inscripcion]    Script Date: 06/15/2015 03:58:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[detalle_inscripcion](
	[idDetalleInscripcion] [int] IDENTITY(1,1) NOT NULL,
	[idTipoDocumento] [int] NOT NULL,
	[numeroDocumento] [int] NOT NULL,
 CONSTRAINT [PK_detalle_inscripcion] PRIMARY KEY CLUSTERED 
(
	[idDetalleInscripcion] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[usuario]    Script Date: 06/15/2015 03:58:30 ******/
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
/****** Object:  StoredProcedure [dbo].[usp_Arbitro_Insertar]    Script Date: 06/15/2015 03:58:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_Arbitro_Insertar]
	(@idTipoDocumento int output,
	@numeroDocumento int,
	@nombre varchar(50),
	@apellido varchar(50),
	@fechaNacimiento datetime,
	@legajo int,
	@disponibleParaFecha bit)
AS
BEGIN
	SET NOCOUNT ON;

	INSERT INTO Arbitro (idTipoDocumento,numeroDocumento,nombre, apellido,fechaNacimiento, legajo,disponibleParaFecha)
	VALUES (@idTipoDocumento, @numeroDocumento, @nombre, @apellido, @fechaNacimiento, @legajo, @disponibleParaFecha)
END
GO
/****** Object:  Table [dbo].[partido]    Script Date: 06/15/2015 03:58:36 ******/
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
	[numeroFecha] [int] NOT NULL,
	[idCampeonato] [int] NOT NULL,
	[descripcion] [nvarchar](50) NULL,
 CONSTRAINT [PK_partido] PRIMARY KEY CLUSTERED 
(
	[idPartido] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[inscripcion]    Script Date: 06/15/2015 03:58:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[inscripcion](
	[idClub] [int] NOT NULL,
	[idCampeonato] [int] NOT NULL,
	[numeroInscripcion] [int] NOT NULL,
	[fechaInscripcion] [datetime] NULL,
	[idDetalleInscripcion] [int] NOT NULL,
 CONSTRAINT [PK_inscripcion] PRIMARY KEY CLUSTERED 
(
	[idClub] ASC,
	[idCampeonato] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  ForeignKey [FK_rol_rol]    Script Date: 06/15/2015 03:58:30 ******/
ALTER TABLE [dbo].[rol]  WITH CHECK ADD  CONSTRAINT [FK_rol_rol] FOREIGN KEY([idRol])
REFERENCES [dbo].[rol] ([idRol])
GO
ALTER TABLE [dbo].[rol] CHECK CONSTRAINT [FK_rol_rol]
GO
/****** Object:  ForeignKey [FK_estado_fecha_estado_fecha]    Script Date: 06/15/2015 03:58:30 ******/
ALTER TABLE [dbo].[estado_fecha]  WITH CHECK ADD  CONSTRAINT [FK_estado_fecha_estado_fecha] FOREIGN KEY([idEstadoFecha])
REFERENCES [dbo].[estado_fecha] ([idEstadoFecha])
GO
ALTER TABLE [dbo].[estado_fecha] CHECK CONSTRAINT [FK_estado_fecha_estado_fecha]
GO
/****** Object:  ForeignKey [FK_gol_jugador]    Script Date: 06/15/2015 03:58:30 ******/
ALTER TABLE [dbo].[gol]  WITH CHECK ADD  CONSTRAINT [FK_gol_jugador] FOREIGN KEY([idTipoDocumento], [numeroDocumento])
REFERENCES [dbo].[jugador] ([idTipoDocumento], [numeroDocumento])
GO
ALTER TABLE [dbo].[gol] CHECK CONSTRAINT [FK_gol_jugador]
GO
/****** Object:  ForeignKey [FK_fecha_campeonato_estado_fecha]    Script Date: 06/15/2015 03:58:30 ******/
ALTER TABLE [dbo].[fecha_campeonato]  WITH CHECK ADD  CONSTRAINT [FK_fecha_campeonato_estado_fecha] FOREIGN KEY([idEstado])
REFERENCES [dbo].[estado_fecha] ([idEstadoFecha])
GO
ALTER TABLE [dbo].[fecha_campeonato] CHECK CONSTRAINT [FK_fecha_campeonato_estado_fecha]
GO
/****** Object:  ForeignKey [FK_campeonato_estado_campeonato]    Script Date: 06/15/2015 03:58:30 ******/
ALTER TABLE [dbo].[campeonato]  WITH CHECK ADD  CONSTRAINT [FK_campeonato_estado_campeonato] FOREIGN KEY([idEstadoCampeonato])
REFERENCES [dbo].[estado_campeonato] ([idEstadoCampeonato])
GO
ALTER TABLE [dbo].[campeonato] CHECK CONSTRAINT [FK_campeonato_estado_campeonato]
GO
/****** Object:  ForeignKey [FK_detalle_inscripcion_jugador]    Script Date: 06/15/2015 03:58:30 ******/
ALTER TABLE [dbo].[detalle_inscripcion]  WITH CHECK ADD  CONSTRAINT [FK_detalle_inscripcion_jugador] FOREIGN KEY([idTipoDocumento], [numeroDocumento])
REFERENCES [dbo].[jugador] ([idTipoDocumento], [numeroDocumento])
GO
ALTER TABLE [dbo].[detalle_inscripcion] CHECK CONSTRAINT [FK_detalle_inscripcion_jugador]
GO
/****** Object:  ForeignKey [FK_usuario_rol]    Script Date: 06/15/2015 03:58:30 ******/
ALTER TABLE [dbo].[usuario]  WITH CHECK ADD  CONSTRAINT [FK_usuario_rol] FOREIGN KEY([idRol])
REFERENCES [dbo].[rol] ([idRol])
GO
ALTER TABLE [dbo].[usuario] CHECK CONSTRAINT [FK_usuario_rol]
GO
/****** Object:  ForeignKey [FK_usuario_usuario]    Script Date: 06/15/2015 03:58:30 ******/
ALTER TABLE [dbo].[usuario]  WITH CHECK ADD  CONSTRAINT [FK_usuario_usuario] FOREIGN KEY([idUsuario])
REFERENCES [dbo].[usuario] ([idUsuario])
GO
ALTER TABLE [dbo].[usuario] CHECK CONSTRAINT [FK_usuario_usuario]
GO
/****** Object:  ForeignKey [FK_partido_club]    Script Date: 06/15/2015 03:58:36 ******/
ALTER TABLE [dbo].[partido]  WITH CHECK ADD  CONSTRAINT [FK_partido_club] FOREIGN KEY([idClubLocal])
REFERENCES [dbo].[club] ([idClub])
GO
ALTER TABLE [dbo].[partido] CHECK CONSTRAINT [FK_partido_club]
GO
/****** Object:  ForeignKey [FK_partido_club1]    Script Date: 06/15/2015 03:58:36 ******/
ALTER TABLE [dbo].[partido]  WITH CHECK ADD  CONSTRAINT [FK_partido_club1] FOREIGN KEY([idClubVisitante])
REFERENCES [dbo].[club] ([idClub])
GO
ALTER TABLE [dbo].[partido] CHECK CONSTRAINT [FK_partido_club1]
GO
/****** Object:  ForeignKey [FK_partido_estado_partido]    Script Date: 06/15/2015 03:58:36 ******/
ALTER TABLE [dbo].[partido]  WITH CHECK ADD  CONSTRAINT [FK_partido_estado_partido] FOREIGN KEY([idEstado])
REFERENCES [dbo].[estado_partido] ([idEstadoPartido])
GO
ALTER TABLE [dbo].[partido] CHECK CONSTRAINT [FK_partido_estado_partido]
GO
/****** Object:  ForeignKey [FK_partido_fecha_campeonato]    Script Date: 06/15/2015 03:58:36 ******/
ALTER TABLE [dbo].[partido]  WITH CHECK ADD  CONSTRAINT [FK_partido_fecha_campeonato] FOREIGN KEY([numeroFecha], [idCampeonato])
REFERENCES [dbo].[fecha_campeonato] ([numeroFecha], [idCampeonato])
GO
ALTER TABLE [dbo].[partido] CHECK CONSTRAINT [FK_partido_fecha_campeonato]
GO
/****** Object:  ForeignKey [FK_inscripcion_detalle_inscripcion]    Script Date: 06/15/2015 03:58:36 ******/
ALTER TABLE [dbo].[inscripcion]  WITH CHECK ADD  CONSTRAINT [FK_inscripcion_detalle_inscripcion] FOREIGN KEY([idDetalleInscripcion])
REFERENCES [dbo].[detalle_inscripcion] ([idDetalleInscripcion])
GO
ALTER TABLE [dbo].[inscripcion] CHECK CONSTRAINT [FK_inscripcion_detalle_inscripcion]
GO
