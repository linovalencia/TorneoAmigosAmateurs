USE [ligaDeFutbolActualizada]
GO
/****** Object:  Table [dbo].[estado_partido]    Script Date: 06/19/2015 16:20:57 ******/
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
/****** Object:  Table [dbo].[estado_fecha]    Script Date: 06/19/2015 16:20:57 ******/
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
/****** Object:  Table [dbo].[estado_campeonato]    Script Date: 06/19/2015 16:20:57 ******/
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
/****** Object:  Table [dbo].[jugadores_partidos]    Script Date: 06/19/2015 16:20:57 ******/
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
/****** Object:  Table [dbo].[cancha]    Script Date: 06/19/2015 16:20:57 ******/
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
INSERT [dbo].[cancha] ([idCancha], [calle], [numeroCalle], [nombreCancha], [habilitada], [fechaInaguracion]) VALUES (1, N'Belgrano', 234, N'D.Armando', 1, CAST(0x00008EF800000000 AS DateTime))
INSERT [dbo].[cancha] ([idCancha], [calle], [numeroCalle], [nombreCancha], [habilitada], [fechaInaguracion]) VALUES (2, N'Independecia', 21, N'Bombone', 1, CAST(0x00008E3D00000000 AS DateTime))
SET IDENTITY_INSERT [dbo].[cancha] OFF
/****** Object:  Table [dbo].[arbitro_partido]    Script Date: 06/19/2015 16:20:57 ******/
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
/****** Object:  Table [dbo].[tipo_documento]    Script Date: 06/19/2015 16:20:57 ******/
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
/****** Object:  Table [dbo].[rol]    Script Date: 06/19/2015 16:20:57 ******/
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
/****** Object:  Table [dbo].[gol]    Script Date: 06/19/2015 16:20:57 ******/
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
/****** Object:  Table [dbo].[usuario]    Script Date: 06/19/2015 16:20:57 ******/
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
/****** Object:  Table [dbo].[club]    Script Date: 06/19/2015 16:20:57 ******/
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
INSERT [dbo].[club] ([idClub], [nombreClub], [calle], [numeroCalle], [fechaFundacion], [participoAntesEnLiga], [idCancha]) VALUES (1, N'Boca', N'Pueyrredon', 308, CAST(0x000000A000000000 AS DateTime), 1, 1)
SET IDENTITY_INSERT [dbo].[club] OFF
/****** Object:  Table [dbo].[arbitro]    Script Date: 06/19/2015 16:20:57 ******/
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
SET IDENTITY_INSERT [dbo].[arbitro] ON
INSERT [dbo].[arbitro] ([idArbitro], [idTipoDocumento], [numeroDocumento], [nombre], [apellido], [fechaNacimiento], [disponibleParaFecha]) VALUES (1, 1, 333333, N'max', N'detor', CAST(0x0000A01100000000 AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[arbitro] OFF
/****** Object:  Table [dbo].[campeonato]    Script Date: 06/19/2015 16:20:57 ******/
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
/****** Object:  Table [dbo].[jugador]    Script Date: 06/19/2015 16:20:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[jugador](
	[idJugador] [int] NOT NULL,
	[idTipoDocumento] [int] NOT NULL,
	[numeroDocumento] [int] NOT NULL,
	[nombre] [nvarchar](50) NOT NULL,
	[apellido] [nvarchar](50) NOT NULL,
	[fechaNacimiento] [datetime] NULL,
	[disponibleParaFecha] [bit] NULL,
 CONSTRAINT [PK_jugador_1] PRIMARY KEY CLUSTERED 
(
	[idJugador] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[inscripcion]    Script Date: 06/19/2015 16:20:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[inscripcion](
	[idInscripcion] [int] NOT NULL,
	[idClub] [int] NOT NULL,
	[idCampeonato] [int] NOT NULL,
	[fechaInscripcion] [datetime] NULL,
 CONSTRAINT [PK_inscripcion_1] PRIMARY KEY CLUSTERED 
(
	[idInscripcion] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[fecha_campeonato]    Script Date: 06/19/2015 16:20:57 ******/
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
/****** Object:  Table [dbo].[partido]    Script Date: 06/19/2015 16:20:57 ******/
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
/****** Object:  Table [dbo].[detalle_inscripcion]    Script Date: 06/19/2015 16:20:57 ******/
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
/****** Object:  ForeignKey [FK_arbitro_tipo_documento]    Script Date: 06/19/2015 16:20:57 ******/
ALTER TABLE [dbo].[arbitro]  WITH CHECK ADD  CONSTRAINT [FK_arbitro_tipo_documento] FOREIGN KEY([idTipoDocumento])
REFERENCES [dbo].[tipo_documento] ([idTIpoDocumento])
GO
ALTER TABLE [dbo].[arbitro] CHECK CONSTRAINT [FK_arbitro_tipo_documento]
GO
/****** Object:  ForeignKey [FK_campeonato_estado_campeonato]    Script Date: 06/19/2015 16:20:57 ******/
ALTER TABLE [dbo].[campeonato]  WITH CHECK ADD  CONSTRAINT [FK_campeonato_estado_campeonato] FOREIGN KEY([idEstadoCampeonato])
REFERENCES [dbo].[estado_campeonato] ([idEstadoCampeonato])
GO
ALTER TABLE [dbo].[campeonato] CHECK CONSTRAINT [FK_campeonato_estado_campeonato]
GO
/****** Object:  ForeignKey [FK_club_cancha]    Script Date: 06/19/2015 16:20:57 ******/
ALTER TABLE [dbo].[club]  WITH CHECK ADD  CONSTRAINT [FK_club_cancha] FOREIGN KEY([idCancha])
REFERENCES [dbo].[cancha] ([idCancha])
GO
ALTER TABLE [dbo].[club] CHECK CONSTRAINT [FK_club_cancha]
GO
/****** Object:  ForeignKey [FK_detalle_inscripcion_inscripcion]    Script Date: 06/19/2015 16:20:57 ******/
ALTER TABLE [dbo].[detalle_inscripcion]  WITH CHECK ADD  CONSTRAINT [FK_detalle_inscripcion_inscripcion] FOREIGN KEY([idInscripcion])
REFERENCES [dbo].[inscripcion] ([idInscripcion])
GO
ALTER TABLE [dbo].[detalle_inscripcion] CHECK CONSTRAINT [FK_detalle_inscripcion_inscripcion]
GO
/****** Object:  ForeignKey [FK_estado_fecha_estado_fecha]    Script Date: 06/19/2015 16:20:57 ******/
ALTER TABLE [dbo].[estado_fecha]  WITH CHECK ADD  CONSTRAINT [FK_estado_fecha_estado_fecha] FOREIGN KEY([idEstadoFecha])
REFERENCES [dbo].[estado_fecha] ([idEstadoFecha])
GO
ALTER TABLE [dbo].[estado_fecha] CHECK CONSTRAINT [FK_estado_fecha_estado_fecha]
GO
/****** Object:  ForeignKey [FK_fecha_campeonato_campeonato]    Script Date: 06/19/2015 16:20:57 ******/
ALTER TABLE [dbo].[fecha_campeonato]  WITH CHECK ADD  CONSTRAINT [FK_fecha_campeonato_campeonato] FOREIGN KEY([idCampeonato])
REFERENCES [dbo].[campeonato] ([idCampeonato])
GO
ALTER TABLE [dbo].[fecha_campeonato] CHECK CONSTRAINT [FK_fecha_campeonato_campeonato]
GO
/****** Object:  ForeignKey [FK_fecha_campeonato_estado_fecha]    Script Date: 06/19/2015 16:20:57 ******/
ALTER TABLE [dbo].[fecha_campeonato]  WITH CHECK ADD  CONSTRAINT [FK_fecha_campeonato_estado_fecha] FOREIGN KEY([idEstado])
REFERENCES [dbo].[estado_fecha] ([idEstadoFecha])
GO
ALTER TABLE [dbo].[fecha_campeonato] CHECK CONSTRAINT [FK_fecha_campeonato_estado_fecha]
GO
/****** Object:  ForeignKey [FK_inscripcion_campeonato]    Script Date: 06/19/2015 16:20:57 ******/
ALTER TABLE [dbo].[inscripcion]  WITH CHECK ADD  CONSTRAINT [FK_inscripcion_campeonato] FOREIGN KEY([idCampeonato])
REFERENCES [dbo].[campeonato] ([idCampeonato])
GO
ALTER TABLE [dbo].[inscripcion] CHECK CONSTRAINT [FK_inscripcion_campeonato]
GO
/****** Object:  ForeignKey [FK_inscripcion_club]    Script Date: 06/19/2015 16:20:57 ******/
ALTER TABLE [dbo].[inscripcion]  WITH CHECK ADD  CONSTRAINT [FK_inscripcion_club] FOREIGN KEY([idClub])
REFERENCES [dbo].[club] ([idClub])
GO
ALTER TABLE [dbo].[inscripcion] CHECK CONSTRAINT [FK_inscripcion_club]
GO
/****** Object:  ForeignKey [FK_jugador_tipo_documento]    Script Date: 06/19/2015 16:20:57 ******/
ALTER TABLE [dbo].[jugador]  WITH CHECK ADD  CONSTRAINT [FK_jugador_tipo_documento] FOREIGN KEY([idTipoDocumento])
REFERENCES [dbo].[tipo_documento] ([idTIpoDocumento])
GO
ALTER TABLE [dbo].[jugador] CHECK CONSTRAINT [FK_jugador_tipo_documento]
GO
/****** Object:  ForeignKey [FK_partido_club]    Script Date: 06/19/2015 16:20:57 ******/
ALTER TABLE [dbo].[partido]  WITH CHECK ADD  CONSTRAINT [FK_partido_club] FOREIGN KEY([idClubLocal])
REFERENCES [dbo].[club] ([idClub])
GO
ALTER TABLE [dbo].[partido] CHECK CONSTRAINT [FK_partido_club]
GO
/****** Object:  ForeignKey [FK_partido_club1]    Script Date: 06/19/2015 16:20:57 ******/
ALTER TABLE [dbo].[partido]  WITH CHECK ADD  CONSTRAINT [FK_partido_club1] FOREIGN KEY([idClubVisitante])
REFERENCES [dbo].[club] ([idClub])
GO
ALTER TABLE [dbo].[partido] CHECK CONSTRAINT [FK_partido_club1]
GO
/****** Object:  ForeignKey [FK_partido_estado_partido]    Script Date: 06/19/2015 16:20:57 ******/
ALTER TABLE [dbo].[partido]  WITH CHECK ADD  CONSTRAINT [FK_partido_estado_partido] FOREIGN KEY([idEstado])
REFERENCES [dbo].[estado_partido] ([idEstadoPartido])
GO
ALTER TABLE [dbo].[partido] CHECK CONSTRAINT [FK_partido_estado_partido]
GO
/****** Object:  ForeignKey [FK_partido_fecha_campeonato]    Script Date: 06/19/2015 16:20:57 ******/
ALTER TABLE [dbo].[partido]  WITH CHECK ADD  CONSTRAINT [FK_partido_fecha_campeonato] FOREIGN KEY([idFechaCampeonato])
REFERENCES [dbo].[fecha_campeonato] ([idFechaCampeonato])
GO
ALTER TABLE [dbo].[partido] CHECK CONSTRAINT [FK_partido_fecha_campeonato]
GO
/****** Object:  ForeignKey [FK_rol_rol]    Script Date: 06/19/2015 16:20:57 ******/
ALTER TABLE [dbo].[rol]  WITH CHECK ADD  CONSTRAINT [FK_rol_rol] FOREIGN KEY([idRol])
REFERENCES [dbo].[rol] ([idRol])
GO
ALTER TABLE [dbo].[rol] CHECK CONSTRAINT [FK_rol_rol]
GO
/****** Object:  ForeignKey [FK_usuario_rol]    Script Date: 06/19/2015 16:20:57 ******/
ALTER TABLE [dbo].[usuario]  WITH CHECK ADD  CONSTRAINT [FK_usuario_rol] FOREIGN KEY([idRol])
REFERENCES [dbo].[rol] ([idRol])
GO
ALTER TABLE [dbo].[usuario] CHECK CONSTRAINT [FK_usuario_rol]
GO
/****** Object:  ForeignKey [FK_usuario_usuario]    Script Date: 06/19/2015 16:20:57 ******/
ALTER TABLE [dbo].[usuario]  WITH CHECK ADD  CONSTRAINT [FK_usuario_usuario] FOREIGN KEY([idUsuario])
REFERENCES [dbo].[usuario] ([idUsuario])
GO
ALTER TABLE [dbo].[usuario] CHECK CONSTRAINT [FK_usuario_usuario]
GO
