USE [master]
GO
/****** Object:  Database [PreguntadORT]    Script Date: 23/8/2023 09:03:05 ******/
CREATE DATABASE [PreguntadORT]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PreguntadORT', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\PreguntadORT.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PreguntadORT_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\PreguntadORT_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [PreguntadORT] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PreguntadORT].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PreguntadORT] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PreguntadORT] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PreguntadORT] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PreguntadORT] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PreguntadORT] SET ARITHABORT OFF 
GO
ALTER DATABASE [PreguntadORT] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PreguntadORT] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PreguntadORT] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PreguntadORT] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PreguntadORT] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PreguntadORT] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PreguntadORT] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PreguntadORT] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PreguntadORT] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PreguntadORT] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PreguntadORT] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PreguntadORT] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PreguntadORT] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PreguntadORT] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PreguntadORT] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PreguntadORT] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PreguntadORT] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PreguntadORT] SET RECOVERY FULL 
GO
ALTER DATABASE [PreguntadORT] SET  MULTI_USER 
GO
ALTER DATABASE [PreguntadORT] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PreguntadORT] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PreguntadORT] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PreguntadORT] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PreguntadORT] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'PreguntadORT', N'ON'
GO
ALTER DATABASE [PreguntadORT] SET QUERY_STORE = OFF
GO
USE [PreguntadORT]
GO
/****** Object:  User [alumno]    Script Date: 23/8/2023 09:03:05 ******/
CREATE USER [alumno] FOR LOGIN [alumno] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Categorias]    Script Date: 23/8/2023 09:03:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categorias](
	[idCategoria] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[foto] [varchar](8000) NULL,
 CONSTRAINT [PK_Categorias] PRIMARY KEY CLUSTERED 
(
	[idCategoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dificultades]    Script Date: 23/8/2023 09:03:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dificultades](
	[idDificultad] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Dificultades] PRIMARY KEY CLUSTERED 
(
	[idDificultad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Preguntas]    Script Date: 23/8/2023 09:03:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Preguntas](
	[idPregunta] [int] IDENTITY(1,1) NOT NULL,
	[idCategoria] [int] NOT NULL,
	[idDificultad] [int] NOT NULL,
	[enunciado] [varchar](200) NOT NULL,
	[foto] [varchar](8000) NULL,
 CONSTRAINT [PK_Preguntas] PRIMARY KEY CLUSTERED 
(
	[idPregunta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Puntajes]    Script Date: 23/8/2023 09:03:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Puntajes](
	[idPuntaje] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Numero] [int] NOT NULL,
 CONSTRAINT [PK_Puntajes] PRIMARY KEY CLUSTERED 
(
	[idPuntaje] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Respuestas]    Script Date: 23/8/2023 09:03:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Respuestas](
	[idRespuesta] [int] IDENTITY(1,1) NOT NULL,
	[idPregunta] [int] NOT NULL,
	[texto] [varchar](200) NOT NULL,
	[foto] [varchar](8000) NULL,
	[correcta] [bit] NOT NULL,
 CONSTRAINT [PK_Respuestas] PRIMARY KEY CLUSTERED 
(
	[idRespuesta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Categorias] ON 

INSERT [dbo].[Categorias] ([idCategoria], [nombre], [foto]) VALUES (1, N'Animales', N'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.flaticon.es%2Ficono-gratis%2Festampado-de-pata-de-animal_64431&psig=AOvVaw3eaEeX9LtrsSIEqWHujwhK&ust=1692103879634000&source=images&cd=vfe&opi=89978449&ved=0CBEQjRxqFwoTCIiCiKeY3IADFQAAAAAdAAAAABAE')
INSERT [dbo].[Categorias] ([idCategoria], [nombre], [foto]) VALUES (2, N'Cine', N'data:image/png;base64,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')
INSERT [dbo].[Categorias] ([idCategoria], [nombre], [foto]) VALUES (3, N'Deportes', N'https://static.vecteezy.com/system/resources/previews/013/366/694/original/foot-ball-or-soccer-ball-icon-symbol-for-art-illustration-logo-website-apps-pictogram-news-infographic-or-graphic-design-element-format-png.png')
INSERT [dbo].[Categorias] ([idCategoria], [nombre], [foto]) VALUES (4, N'Random', N'https://images.vexels.com/media/users/3/189702/isolated/preview/0909c4a72562b45eb247012f1606c4c6-icono-de-juguete-de-dados.png')
SET IDENTITY_INSERT [dbo].[Categorias] OFF
GO
SET IDENTITY_INSERT [dbo].[Dificultades] ON 

INSERT [dbo].[Dificultades] ([idDificultad], [nombre]) VALUES (1, N'Facil')
INSERT [dbo].[Dificultades] ([idDificultad], [nombre]) VALUES (2, N'Normal')
INSERT [dbo].[Dificultades] ([idDificultad], [nombre]) VALUES (3, N'Dificil')
INSERT [dbo].[Dificultades] ([idDificultad], [nombre]) VALUES (4, N'Random')
SET IDENTITY_INSERT [dbo].[Dificultades] OFF
GO
SET IDENTITY_INSERT [dbo].[Preguntas] ON 

INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [enunciado], [foto]) VALUES (1, 1, 1, N'¿Qué animal es conocido como el "Rey de la selva"?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [enunciado], [foto]) VALUES (2, 1, 1, N'¿Qué animal es conocido por su trompa larga?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [enunciado], [foto]) VALUES (3, 1, 1, N'¿Qué animal vuela y puede girar la cabeza 180 grados?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [enunciado], [foto]) VALUES (4, 1, 1, N'¿Cuál es el animal nacional de Australia que lleva a sus crías en una bolsa?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [enunciado], [foto]) VALUES (5, 1, 1, N'¿Cómo se llama el proceso por el cual las orugas se convierten en mariposas?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [enunciado], [foto]) VALUES (6, 1, 1, N'¿Qué animal es símbolo de sabiduría en muchas culturas?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [enunciado], [foto]) VALUES (7, 1, 1, N'¿Cuál es el animal más rápido en tierra?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [enunciado], [foto]) VALUES (8, 1, 1, N'¿Cuál es el nombre científico de la especie humana?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [enunciado], [foto]) VALUES (9, 1, 1, N'¿Cuál es el animal más grande que ha existido en la Tierra?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [enunciado], [foto]) VALUES (10, 1, 1, N'¿Qué mamífero tiene una lengua azul y es conocido por su gran tamaño?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [enunciado], [foto]) VALUES (11, 1, 2, N'¿Qué animal es el símbolo de la longevidad en algunas culturas?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [enunciado], [foto]) VALUES (12, 1, 2, N'¿Cuál es el mamífero más grande del mundo?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [enunciado], [foto]) VALUES (13, 1, 2, N'¿Qué animal es famoso por su capacidad de regenerar extremidades?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [enunciado], [foto]) VALUES (14, 1, 2, N'¿Cuál es el nombre común de la serpiente que mata a sus presas por constricción?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [enunciado], [foto]) VALUES (15, 1, 2, N'¿Qué animal es conocido por su capacidad de cambiar de color para camuflarse?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [enunciado], [foto]) VALUES (16, 1, 2, N'¿Cuál es el depredador marino más temido y conocido como el "lobo del mar"?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [enunciado], [foto]) VALUES (17, 1, 2, N'¿Qué animal es el único mamífero que puede volar y tiene dedos en sus alas?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [enunciado], [foto]) VALUES (18, 1, 2, N'¿Cuál es el animal que es capaz de correr sobre el agua debido a su estructura anatómica?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [enunciado], [foto]) VALUES (19, 1, 2, N'¿Cuál es el único primate que se encuentra fuera de Asia y África?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [enunciado], [foto]) VALUES (20, 1, 2, N'¿Cuál es el ave nacional de Nueva Zelanda y es incapaz de volar?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [enunciado], [foto]) VALUES (21, 1, 3, N'¿Cuál es el único mamífero capaz de volar?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [enunciado], [foto]) VALUES (22, 1, 3, N'¿Qué animal es conocido por su capacidad de mimetismo y cambio de color?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [enunciado], [foto]) VALUES (23, 1, 3, N'¿Qué ave no puede mover los ojos y debe girar la cabeza para ver?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [enunciado], [foto]) VALUES (24, 1, 3, N'¿Cómo se llama el proceso de desprendimiento de las astas de los ciervos y su regeneración?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [enunciado], [foto]) VALUES (25, 1, 3, N'¿Qué mamífero tiene un hocico alargado y está adaptado para alimentarse de hormigas y termitas?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [enunciado], [foto]) VALUES (26, 1, 3, N'¿Cuál es el felino más grande del mundo?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [enunciado], [foto]) VALUES (27, 1, 3, N'¿Qué animal marino es conocido por su veneno altamente mortal y forma en sombrilla?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [enunciado], [foto]) VALUES (28, 1, 3, N'¿Qué reptil gigante prehistórico es conocido por su capacidad de nadar en el océano?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [enunciado], [foto]) VALUES (29, 1, 3, N'¿Cuál es el ave más grande y pesada que vuela?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [enunciado], [foto]) VALUES (30, 1, 3, N'¿Qué especie de delfín es famosa por su nariz alargada similar a un pico?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [enunciado], [foto]) VALUES (31, 2, 1, N'¿En qué película un tiburón blanco aterroriza a un pueblo costero?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [enunciado], [foto]) VALUES (32, 2, 1, N'¿Quién interpretó el papel de Iron Man en las películas de Marvel?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [enunciado], [foto]) VALUES (33, 2, 1, N'¿Cuál es el nombre del hobbit protagonista en la trilogía de "El Señor de los Anillos"?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [enunciado], [foto]) VALUES (34, 2, 1, N'¿En qué película un niño queda atrapado en una fábrica de chocolate?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [enunciado], [foto]) VALUES (35, 2, 1, N'¿Cuál es la película animada de Pixar sobre un pez payaso en busca de su hijo?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [enunciado], [foto]) VALUES (36, 2, 1, N'¿Quién es el actor conocido por su papel como Jack en "Titanic"?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [enunciado], [foto]) VALUES (37, 2, 1, N'¿En qué película de ciencia ficción un robot llamado WALL-E encuentra una planta?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [enunciado], [foto]) VALUES (38, 2, 1, N'¿Cuál es la película en la que Tom Hanks interpreta a un náufrago en una isla desierta?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [enunciado], [foto]) VALUES (39, 2, 1, N'¿En qué película el personaje Forrest Gump dice: "La vida es como una caja de chocolates"?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [enunciado], [foto]) VALUES (40, 2, 1, N'¿Cuál es el título de la película que narra la historia de un pianista polaco durante el Holocausto?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [enunciado], [foto]) VALUES (41, 2, 2, N'¿En qué película el personaje Jack Dawson dice: "Soy el rey del mundo"?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [enunciado], [foto]) VALUES (42, 2, 2, N'¿Cuál es la película de ciencia ficción dirigida por Ridley Scott ambientada en el espacio profundo?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [enunciado], [foto]) VALUES (43, 2, 2, N'¿Quién interpretó el papel de Neo en la película "Matrix"?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [enunciado], [foto]) VALUES (44, 2, 2, N'¿En qué película un joven es transportado a un mundo de criaturas mágicas y debe destruir un anillo?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [enunciado], [foto]) VALUES (45, 2, 2, N'¿Cuál es el título de la película en la que un equipo de atracadores usa los nombres de ciudades?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [enunciado], [foto]) VALUES (46, 2, 2, N'¿En qué película el personaje Joker dice: "¿Por qué tan serio?"?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [enunciado], [foto]) VALUES (47, 2, 2, N'¿Cuál es la película basada en una historia real de un hombre que pasó años en una prisión en Shawshank?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [enunciado], [foto]) VALUES (48, 2, 2, N'¿En qué película una joven rebelde lucha contra un sistema opresivo en una sociedad futurista?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [enunciado], [foto]) VALUES (49, 2, 2, N'¿Cuál es el nombre de la película en la que una máquina del tiempo transporta a Marty McFly al pasado?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [enunciado], [foto]) VALUES (50, 2, 2, N'¿En qué película el personaje Tony Montana dice: "El mundo es tuyo"?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [enunciado], [foto]) VALUES (51, 2, 3, N'¿Quién dirigió la película "2001: Una odisea del espacio"?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [enunciado], [foto]) VALUES (52, 2, 3, N'¿Cuál es la película en blanco y negro sobre el poder y la corrupción en el mundo del periodismo?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [enunciado], [foto]) VALUES (53, 2, 3, N'¿En qué película el personaje Travis Bickle dice la famosa frase: "You talkin` to me?"?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [enunciado], [foto]) VALUES (54, 2, 3, N'¿Qué película cuenta la historia de un hombre atrapado en el mismo día una y otra vez?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [enunciado], [foto]) VALUES (55, 2, 3, N'¿En qué película un grupo de personas es reclutado para realizar un robo en Las Vegas durante un combate de boxeo?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [enunciado], [foto]) VALUES (56, 2, 3, N'¿Cuál es la película animada en la que un ratón parisino sueña con convertirse en chef?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [enunciado], [foto]) VALUES (57, 2, 3, N'¿En qué película un equipo de magos realiza robos espectaculares durante sus shows?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [enunciado], [foto]) VALUES (58, 2, 3, N'¿Cuál es el nombre de la película en la que una joven descubre que es una "dama de honor" en 27 bodas?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [enunciado], [foto]) VALUES (59, 2, 3, N'¿En qué película un astronauta queda varado en Marte y lucha por sobrevivir mientras espera rescate?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [enunciado], [foto]) VALUES (60, 2, 3, N'¿En qué año se estrenó la película "Ciudadano Kane" dirigida por Orson Welles?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [enunciado], [foto]) VALUES (61, 3, 1, N'¿En qué deporte se utiliza una pelota y una canasta?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [enunciado], [foto]) VALUES (62, 3, 1, N'¿Cuál es el deporte conocido como el "rey de los deportes"?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [enunciado], [foto]) VALUES (63, 3, 1, N'¿En qué deporte se anota un touchdown?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [enunciado], [foto]) VALUES (64, 3, 1, N'¿Qué deporte se juega en un campo ovalado y se anotan "tries"?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [enunciado], [foto]) VALUES (65, 3, 1, N'¿En qué deporte se lanza un disco a una portería y se desliza sobre hielo?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [enunciado], [foto]) VALUES (66, 3, 1, N'¿Cuál es el deporte de equipo en el que se usa una pelota y una cancha rectangular dividida por una red?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [enunciado], [foto]) VALUES (67, 3, 1, N'¿Qué deporte de raqueta se juega en una cancha dividida por una red y se compite en singles y dobles?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [enunciado], [foto]) VALUES (68, 3, 1, N'¿En qué deporte se gana por puntuar "goles", "trys" y "conversions"?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [enunciado], [foto]) VALUES (69, 3, 1, N'¿Cuál es el deporte en el que se realiza una secuencia de movimientos gimnásticos en un aparato alto?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [enunciado], [foto]) VALUES (70, 3, 1, N'¿En qué deporte los equipos compiten para llevar un disco a la zona de anotación del oponente?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [enunciado], [foto]) VALUES (71, 3, 2, N'¿Cuántos jugadores conforman un equipo de fútbol en el campo durante un partido?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [enunciado], [foto]) VALUES (72, 3, 2, N'¿En qué deporte se utiliza un bate y una pelota, y se juega en un diamante?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [enunciado], [foto]) VALUES (73, 3, 2, N'¿Cuál es el nombre completo del evento deportivo conocido como los "Juegos Olímpicos"?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [enunciado], [foto]) VALUES (74, 3, 2, N'¿En qué deporte se utiliza una raqueta y una pelota pequeña amarilla?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [enunciado], [foto]) VALUES (75, 3, 2, N'¿Cuál es el deporte en el que dos equipos compiten por llevar un balón ovalado detrás de la línea del oponente?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [enunciado], [foto]) VALUES (76, 3, 2, N'¿En qué deporte los jugadores corren entre bases, robando bases y anotando carreras?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [enunciado], [foto]) VALUES (77, 3, 2, N'¿Qué deporte de equipo se juega en una piscina y los jugadores intentan marcar goles en la portería rival?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [enunciado], [foto]) VALUES (78, 3, 2, N'¿En qué deporte los jugadores lanzan una esfera pesada por encima de una línea y luchan por el control de la esfera?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [enunciado], [foto]) VALUES (79, 3, 2, N'¿Cuál es el deporte que involucra saltar y correr en una pista con obstáculos?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [enunciado], [foto]) VALUES (80, 3, 2, N'¿En qué deporte los jugadores intentan derribar bolos lanzando una pelota pesada?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [enunciado], [foto]) VALUES (81, 3, 3, N'¿En qué deporte se mencionan términos como "smash", "saque" y "match"?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [enunciado], [foto]) VALUES (82, 3, 3, N'¿En qué deporte se compite saltando hacia una piscina?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [enunciado], [foto]) VALUES (83, 3, 3, N'¿Cuál es el deporte que involucra esgrima, natación, ciclismo y una carrera?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [enunciado], [foto]) VALUES (84, 3, 3, N'¿En qué deporte se utiliza un "giro" para ejecutar una rotación de 720 grados en el aire?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [enunciado], [foto]) VALUES (85, 3, 3, N'¿Cuál es el nombre del evento multideportivo en el que los países compiten por la "Copa del Mundo"?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [enunciado], [foto]) VALUES (86, 3, 3, N'¿En qué deporte los equipos buscan lanzar una pelota por encima de la red para marcar puntos?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [enunciado], [foto]) VALUES (87, 3, 3, N'¿Cuál es el deporte de lucha que se originó en Japón y se enfoca en lanzamientos y agarres?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [enunciado], [foto]) VALUES (88, 3, 3, N'¿En qué deporte se compite en una pista de hielo, realizando piruetas y saltos?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [enunciado], [foto]) VALUES (89, 3, 3, N'¿Cuál es el deporte acuático que involucra deslizarse sobre el agua con una tabla propulsada por una vela?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [enunciado], [foto]) VALUES (90, 3, 3, N'¿Qué atleta jamaiquino ostenta el récord mundial de los 100 metros lisos?', NULL)
SET IDENTITY_INSERT [dbo].[Preguntas] OFF
GO
SET IDENTITY_INSERT [dbo].[Respuestas] ON 

INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [texto], [foto], [correcta]) VALUES (92, 1, N'León', NULL, 1)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [texto], [foto], [correcta]) VALUES (93, 1, N'Elefante', NULL, 0)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [texto], [foto], [correcta]) VALUES (94, 1, N'Tigre', NULL, 0)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [texto], [foto], [correcta]) VALUES (95, 1, N'Gorila', NULL, 0)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [texto], [foto], [correcta]) VALUES (96, 2, N'León', NULL, 0)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [texto], [foto], [correcta]) VALUES (97, 2, N'Elefante', NULL, 1)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [texto], [foto], [correcta]) VALUES (98, 2, N'Tigre', NULL, 0)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [texto], [foto], [correcta]) VALUES (99, 2, N'Gorila', NULL, 0)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [texto], [foto], [correcta]) VALUES (100, 3, N'búho', NULL, 1)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [texto], [foto], [correcta]) VALUES (101, 3, N'águila', NULL, 0)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [texto], [foto], [correcta]) VALUES (102, 3, N'pingüino', NULL, 0)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [texto], [foto], [correcta]) VALUES (103, 3, N'cóndor', NULL, 0)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [texto], [foto], [correcta]) VALUES (104, 4, N'koala', NULL, 0)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [texto], [foto], [correcta]) VALUES (105, 4, N'Elefante', NULL, 0)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [texto], [foto], [correcta]) VALUES (106, 4, N'canguro', NULL, 1)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [texto], [foto], [correcta]) VALUES (107, 4, N'equidna', NULL, 0)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [texto], [foto], [correcta]) VALUES (108, 5, N'mutación', NULL, 0)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [texto], [foto], [correcta]) VALUES (109, 5, N'evolución', NULL, 0)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [texto], [foto], [correcta]) VALUES (110, 5, N'transformación', NULL, 0)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [texto], [foto], [correcta]) VALUES (111, 5, N'metamorfosis', NULL, 1)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [texto], [foto], [correcta]) VALUES (112, 6, N'pingüino', NULL, 0)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [texto], [foto], [correcta]) VALUES (113, 6, N'águila', NULL, 0)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [texto], [foto], [correcta]) VALUES (114, 6, N'búho', NULL, 1)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [texto], [foto], [correcta]) VALUES (115, 6, N'cóndor', NULL, 0)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [texto], [foto], [correcta]) VALUES (116, 7, N'humano', NULL, 0)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [texto], [foto], [correcta]) VALUES (117, 7, N'tigre', NULL, 0)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [texto], [foto], [correcta]) VALUES (118, 7, N'guepardo', NULL, 1)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [texto], [foto], [correcta]) VALUES (119, 7, N'chita', NULL, 0)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [texto], [foto], [correcta]) VALUES (120, 8, N'humanus', NULL, 0)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [texto], [foto], [correcta]) VALUES (121, 8, N'homo sapiens', NULL, 1)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [texto], [foto], [correcta]) VALUES (122, 8, N'homo erectus', NULL, 0)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [texto], [foto], [correcta]) VALUES (123, 8, N'ninguna de las anteriores', NULL, 0)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [texto], [foto], [correcta]) VALUES (124, 9, N'elefante', NULL, 0)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [texto], [foto], [correcta]) VALUES (125, 9, N'T-rex', NULL, 0)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [texto], [foto], [correcta]) VALUES (126, 9, N'megalodón', NULL, 0)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [texto], [foto], [correcta]) VALUES (127, 9, N'ballena azul', NULL, 1)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [texto], [foto], [correcta]) VALUES (128, 10, N'elefante', NULL, 0)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [texto], [foto], [correcta]) VALUES (129, 10, N'hipopotamo', NULL, 0)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [texto], [foto], [correcta]) VALUES (130, 10, N'cocodrilo', NULL, 0)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [texto], [foto], [correcta]) VALUES (131, 10, N'ballena azul', NULL, 1)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [texto], [foto], [correcta]) VALUES (132, 11, N'tortuga', NULL, 1)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [texto], [foto], [correcta]) VALUES (133, 11, N'búho', NULL, 0)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [texto], [foto], [correcta]) VALUES (134, 11, N'cocodrilo', NULL, 0)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [texto], [foto], [correcta]) VALUES (135, 11, N'pez', NULL, 0)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [texto], [foto], [correcta]) VALUES (136, 12, N'elefante', NULL, 0)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [texto], [foto], [correcta]) VALUES (137, 12, N'hipopotamo', NULL, 0)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [texto], [foto], [correcta]) VALUES (138, 12, N'ballena dinosaurio', NULL, 0)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [texto], [foto], [correcta]) VALUES (139, 12, N'ballena azul', NULL, 1)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [texto], [foto], [correcta]) VALUES (140, 13, N'lagartija', NULL, 0)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [texto], [foto], [correcta]) VALUES (141, 13, N'medusas', NULL, 0)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [texto], [foto], [correcta]) VALUES (142, 13, N'todas son corectas', NULL, 1)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [texto], [foto], [correcta]) VALUES (143, 13, N'estrella de mar', NULL, 0)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [texto], [foto], [correcta]) VALUES (144, 14, N'estranguladora', NULL, 0)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [texto], [foto], [correcta]) VALUES (145, 14, N'boa constrictora', NULL, 1)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [texto], [foto], [correcta]) VALUES (146, 14, N'todas son corectas', NULL, 0)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [texto], [foto], [correcta]) VALUES (147, 14, N'pitón de cascabel', NULL, 0)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [texto], [foto], [correcta]) VALUES (148, 15, N'lagartija', NULL, 0)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [texto], [foto], [correcta]) VALUES (149, 15, N'camaleón', NULL, 1)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [texto], [foto], [correcta]) VALUES (150, 15, N'dragón de comodo', NULL, 0)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [texto], [foto], [correcta]) VALUES (151, 15, N'humano', NULL, 0)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [texto], [foto], [correcta]) VALUES (152, 16, N'lobo de mar', NULL, 0)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [texto], [foto], [correcta]) VALUES (153, 16, N'tiburón blanco', NULL, 0)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [texto], [foto], [correcta]) VALUES (154, 16, N'orca', NULL, 1)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [texto], [foto], [correcta]) VALUES (155, 16, N'tiburon martillo', NULL, 0)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [texto], [foto], [correcta]) VALUES (156, 17, N'kiwi', NULL, 0)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [texto], [foto], [correcta]) VALUES (157, 17, N'murcielagos', NULL, 1)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [texto], [foto], [correcta]) VALUES (158, 17, N'omnitorrinco', NULL, 0)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [texto], [foto], [correcta]) VALUES (159, 17, N'gallinas', NULL, 0)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [texto], [foto], [correcta]) VALUES (160, 18, N'kiwi', NULL, 0)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [texto], [foto], [correcta]) VALUES (161, 18, N'dragon de agua', NULL, 0)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [texto], [foto], [correcta]) VALUES (162, 18, N'gecko pigmemeo', NULL, 1)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [texto], [foto], [correcta]) VALUES (163, 18, N'pez jesus', NULL, 0)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [texto], [foto], [correcta]) VALUES (164, 19, N'Anthropoidea', NULL, 0)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [texto], [foto], [correcta]) VALUES (165, 19, N'Indriidae', NULL, 0)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [texto], [foto], [correcta]) VALUES (166, 19, N'Glires', NULL, 0)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [texto], [foto], [correcta]) VALUES (167, 19, N'ninguna es correcta', NULL, 1)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [texto], [foto], [correcta]) VALUES (168, 20, N'kiwi', NULL, 1)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [texto], [foto], [correcta]) VALUES (169, 20, N'pingüino', NULL, 0)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [texto], [foto], [correcta]) VALUES (170, 20, N'omnitorrinco', NULL, 0)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [texto], [foto], [correcta]) VALUES (171, 20, N'gallinas', NULL, 0)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [texto], [foto], [correcta]) VALUES (172, 20, N'kiwi', NULL, 1)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [texto], [foto], [correcta]) VALUES (173, 20, N'pingüino', NULL, 0)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [texto], [foto], [correcta]) VALUES (174, 20, N'omnitorrinco', NULL, 0)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [texto], [foto], [correcta]) VALUES (175, 20, N'gallinas', NULL, 0)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [texto], [foto], [correcta]) VALUES (176, 21, N'kiwi', NULL, 0)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [texto], [foto], [correcta]) VALUES (177, 21, N'murcielagos', NULL, 1)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [texto], [foto], [correcta]) VALUES (178, 21, N'omnitorrinco', NULL, 0)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [texto], [foto], [correcta]) VALUES (179, 21, N'gallinas', NULL, 0)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [texto], [foto], [correcta]) VALUES (180, 22, N'lagartija', NULL, 0)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [texto], [foto], [correcta]) VALUES (181, 22, N'camaleón', NULL, 1)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [texto], [foto], [correcta]) VALUES (182, 22, N'dragón de comodo', NULL, 0)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [texto], [foto], [correcta]) VALUES (183, 22, N'pez globo', NULL, 0)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [texto], [foto], [correcta]) VALUES (184, 23, N'búho', NULL, 1)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [texto], [foto], [correcta]) VALUES (185, 23, N'águila', NULL, 0)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [texto], [foto], [correcta]) VALUES (186, 23, N'pingüino', NULL, 0)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [texto], [foto], [correcta]) VALUES (187, 23, N'cóndor', NULL, 0)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [texto], [foto], [correcta]) VALUES (188, 24, N'cambio de cuenros', NULL, 0)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [texto], [foto], [correcta]) VALUES (189, 24, N'mutilación', NULL, 0)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [texto], [foto], [correcta]) VALUES (190, 24, N'desprendimiento', NULL, 0)
GO
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [texto], [foto], [correcta]) VALUES (191, 24, N'desmogue', NULL, 1)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [texto], [foto], [correcta]) VALUES (192, 25, N'oso bichero', NULL, 0)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [texto], [foto], [correcta]) VALUES (193, 25, N'come bichos', NULL, 0)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [texto], [foto], [correcta]) VALUES (194, 25, N'oso hormiguero', NULL, 1)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [texto], [foto], [correcta]) VALUES (195, 25, N'oso alrgado', NULL, 0)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [texto], [foto], [correcta]) VALUES (196, 26, N'gatito UwU', NULL, 0)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [texto], [foto], [correcta]) VALUES (197, 26, N'leon africano', NULL, 0)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [texto], [foto], [correcta]) VALUES (198, 26, N'gato egipcio', NULL, 0)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [texto], [foto], [correcta]) VALUES (199, 26, N'tigre siberiano', NULL, 1)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [texto], [foto], [correcta]) VALUES (200, 27, N'medusa', NULL, 1)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [texto], [foto], [correcta]) VALUES (201, 27, N'mantarraya', NULL, 0)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [texto], [foto], [correcta]) VALUES (202, 27, N'leon de mar', NULL, 0)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [texto], [foto], [correcta]) VALUES (203, 27, N'ninguno de los anteriores', NULL, 0)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [texto], [foto], [correcta]) VALUES (204, 28, N'T-rex', NULL, 0)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [texto], [foto], [correcta]) VALUES (205, 28, N'triceratops', NULL, 0)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [texto], [foto], [correcta]) VALUES (206, 28, N'pachicefalosaurio', NULL, 0)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [texto], [foto], [correcta]) VALUES (207, 28, N'ninguno de los anteriores', NULL, 1)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [texto], [foto], [correcta]) VALUES (208, 29, N'pingüino', NULL, 0)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [texto], [foto], [correcta]) VALUES (209, 29, N'cóndor andino', NULL, 1)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [texto], [foto], [correcta]) VALUES (210, 29, N'águila calva', NULL, 0)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [texto], [foto], [correcta]) VALUES (211, 29, N'albatros', NULL, 0)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [texto], [foto], [correcta]) VALUES (212, 30, N'delfin alargado', NULL, 0)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [texto], [foto], [correcta]) VALUES (213, 30, N'delfin mular', NULL, 1)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [texto], [foto], [correcta]) VALUES (214, 30, N'delfin extramular', NULL, 0)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [texto], [foto], [correcta]) VALUES (215, 30, N'ninguna de las anteriores', NULL, 0)
SET IDENTITY_INSERT [dbo].[Respuestas] OFF
GO
ALTER TABLE [dbo].[Preguntas]  WITH CHECK ADD  CONSTRAINT [FK_Preguntas_Categorias] FOREIGN KEY([idCategoria])
REFERENCES [dbo].[Categorias] ([idCategoria])
GO
ALTER TABLE [dbo].[Preguntas] CHECK CONSTRAINT [FK_Preguntas_Categorias]
GO
ALTER TABLE [dbo].[Preguntas]  WITH CHECK ADD  CONSTRAINT [FK_Preguntas_Dificultades] FOREIGN KEY([idDificultad])
REFERENCES [dbo].[Dificultades] ([idDificultad])
GO
ALTER TABLE [dbo].[Preguntas] CHECK CONSTRAINT [FK_Preguntas_Dificultades]
GO
ALTER TABLE [dbo].[Respuestas]  WITH CHECK ADD  CONSTRAINT [FK_Respuestas_Preguntas1] FOREIGN KEY([idPregunta])
REFERENCES [dbo].[Preguntas] ([idPregunta])
GO
ALTER TABLE [dbo].[Respuestas] CHECK CONSTRAINT [FK_Respuestas_Preguntas1]
GO
USE [master]
GO
ALTER DATABASE [PreguntadORT] SET  READ_WRITE 
GO
