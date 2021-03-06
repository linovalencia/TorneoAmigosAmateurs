USE [ligaDeFutbolActualizada]
GO
/****** Object:  Table [dbo].[estado_partido]    Script Date: 06/21/2015 01:17:05 ******/
/****** Object:  Table [dbo].[estado_fecha]    Script Date: 06/21/2015 01:17:05 ******/
/****** Object:  Table [dbo].[estado_campeonato]    Script Date: 06/21/2015 01:17:05 ******/
SET IDENTITY_INSERT [dbo].[estado_campeonato] ON
INSERT [dbo].[estado_campeonato] ([idEstadoCampeonato], [descripcion]) VALUES (1, N'creado')
INSERT [dbo].[estado_campeonato] ([idEstadoCampeonato], [descripcion]) VALUES (2, N'comenzado')
INSERT [dbo].[estado_campeonato] ([idEstadoCampeonato], [descripcion]) VALUES (3, N'finalizado')
SET IDENTITY_INSERT [dbo].[estado_campeonato] OFF
/****** Object:  Table [dbo].[jugadores_partidos]    Script Date: 06/21/2015 01:17:05 ******/
/****** Object:  Table [dbo].[cancha]    Script Date: 06/21/2015 01:17:05 ******/
SET IDENTITY_INSERT [dbo].[cancha] ON
INSERT [dbo].[cancha] ([idCancha], [calle], [numeroCalle], [nombreCancha], [habilitada], [fechaInaguracion]) VALUES (1, N'Belgrano', 234, N'D.Armando', 1, CAST(0x00008EF800000000 AS DateTime))
INSERT [dbo].[cancha] ([idCancha], [calle], [numeroCalle], [nombreCancha], [habilitada], [fechaInaguracion]) VALUES (2, N'Independecia', 21, N'Bombone', 1, CAST(0x00008E3D00000000 AS DateTime))
SET IDENTITY_INSERT [dbo].[cancha] OFF
/****** Object:  Table [dbo].[arbitro_partido]    Script Date: 06/21/2015 01:17:05 ******/
/****** Object:  Table [dbo].[tipo_documento]    Script Date: 06/21/2015 01:17:05 ******/
SET IDENTITY_INSERT [dbo].[tipo_documento] ON
INSERT [dbo].[tipo_documento] ([idTIpoDocumento], [descripcion]) VALUES (1, N'DNI')
INSERT [dbo].[tipo_documento] ([idTIpoDocumento], [descripcion]) VALUES (2, N'LC')
INSERT [dbo].[tipo_documento] ([idTIpoDocumento], [descripcion]) VALUES (3, N'PASAPORTE')
INSERT [dbo].[tipo_documento] ([idTIpoDocumento], [descripcion]) VALUES (4, N'LE')
SET IDENTITY_INSERT [dbo].[tipo_documento] OFF
/****** Object:  Table [dbo].[rol]    Script Date: 06/21/2015 01:17:05 ******/
/****** Object:  Table [dbo].[gol]    Script Date: 06/21/2015 01:17:05 ******/
/****** Object:  Table [dbo].[usuario]    Script Date: 06/21/2015 01:17:05 ******/
/****** Object:  Table [dbo].[club]    Script Date: 06/21/2015 01:17:05 ******/
SET IDENTITY_INSERT [dbo].[club] ON
INSERT [dbo].[club] ([idClub], [nombreClub], [calle], [numeroCalle], [fechaFundacion], [participoAntesEnLiga], [idCancha]) VALUES (1, N'Boca', N'Pueyrredon', 308, CAST(0x000000A000000000 AS DateTime), 1, 1)
INSERT [dbo].[club] ([idClub], [nombreClub], [calle], [numeroCalle], [fechaFundacion], [participoAntesEnLiga], [idCancha]) VALUES (2, N'Riber', N'Antartica', 100, CAST(0x00000E9600000000 AS DateTime), 1, 1)
INSERT [dbo].[club] ([idClub], [nombreClub], [calle], [numeroCalle], [fechaFundacion], [participoAntesEnLiga], [idCancha]) VALUES (3, N'Estudiantes', N'España', 1030, CAST(0x000047BB00000000 AS DateTime), 0, 2)
SET IDENTITY_INSERT [dbo].[club] OFF
/****** Object:  Table [dbo].[arbitro]    Script Date: 06/21/2015 01:17:05 ******/
SET IDENTITY_INSERT [dbo].[arbitro] ON
INSERT [dbo].[arbitro] ([idArbitro], [idTipoDocumento], [numeroDocumento], [nombre], [apellido], [fechaNacimiento], [disponibleParaFecha]) VALUES (1, 1, 333333, N'max', N'detor', CAST(0x0000A01100000000 AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[arbitro] OFF
/****** Object:  Table [dbo].[campeonato]    Script Date: 06/21/2015 01:17:05 ******/
SET IDENTITY_INSERT [dbo].[campeonato] ON
INSERT [dbo].[campeonato] ([idCampeonato], [nombre], [fechaInicio], [fechaFin], [idEstadoCampeonato], [puntosPartidoGanado], [puntosPartidoEmpatado], [fechaLimiteInscripcion]) VALUES (3, N'Apertura', CAST(0x0000A4C900000000 AS DateTime), CAST(0x0000A57400000000 AS DateTime), 1, 3, 1, CAST(0x0000A4C200000000 AS DateTime))
INSERT [dbo].[campeonato] ([idCampeonato], [nombre], [fechaInicio], [fechaFin], [idEstadoCampeonato], [puntosPartidoGanado], [puntosPartidoEmpatado], [fechaLimiteInscripcion]) VALUES (4, N'Clasusura', CAST(0x0000A44F00000000 AS DateTime), CAST(0x0000A4BD00000000 AS DateTime), 1, 2, 1, CAST(0x0000A44A00000000 AS DateTime))
SET IDENTITY_INSERT [dbo].[campeonato] OFF
/****** Object:  Table [dbo].[jugador]    Script Date: 06/21/2015 01:17:05 ******/
/****** Object:  Table [dbo].[inscripcion]    Script Date: 06/21/2015 01:17:05 ******/
INSERT [dbo].[inscripcion] ([idInscripcion], [idClub], [idCampeonato], [fechaInscripcion]) VALUES (1, 2, 3, CAST(0x0000A43200000000 AS DateTime))
INSERT [dbo].[inscripcion] ([idInscripcion], [idClub], [idCampeonato], [fechaInscripcion]) VALUES (2, 1, 3, CAST(0x0000A43A00000000 AS DateTime))
INSERT [dbo].[inscripcion] ([idInscripcion], [idClub], [idCampeonato], [fechaInscripcion]) VALUES (3, 3, 3, CAST(0x0000A43800000000 AS DateTime))
/****** Object:  Table [dbo].[fecha_campeonato]    Script Date: 06/21/2015 01:17:05 ******/
/****** Object:  Table [dbo].[partido]    Script Date: 06/21/2015 01:17:05 ******/
/****** Object:  Table [dbo].[detalle_inscripcion]    Script Date: 06/21/2015 01:17:05 ******/
