/*CREACION DE TABLAS*/
/* DIMENSIÓN CONVENIENCIA */
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Conveniencia](
[convenienciaID] [int] NOT NULL,
[satis_virtual] [int] NOT NULL,
[satis_presencial] [int] NOT NULL,
[learn_virtual] [int] NOT NULL,
[learn_presencial] [int] NOT NULL,
[carga_virtual] [int] NOT NULL,
[carga_presencial] [int] NOT NULL,
[beneficiados] [varchar](50) NOT NULL,
[motivo] [varchar](200) NOT NULL,
CONSTRAINT [PK_Conveniencia]
PRIMARY KEY CLUSTERED ([convenienciaID] ASC)) 


/* DIMENSIÓN DESCENTRALIZACIÓN */
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Descentralizacion](
[descentralizacionID] [int]  NOT NULL,
[departamento_procedencia] [varchar](100) NOT NULL,
[departamento_estudio] [varchar](100) NOT NULL,
CONSTRAINT [PK_Descentralizacion] 
PRIMARY KEY CLUSTERED ([descentralizacionID] ASC))


/* DIMENSIÓN ESTUDIANTE */
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Estudiante](
[estudianteID] [int] NOT NULL,
[sexo] [varchar](50) NOT NULL,
[edad] [int] NOT NULL,
[sisfoh] [varchar](100) NOT NULL,
[herramienta_digital] [varchar](200) NOT NULL,
[beca] [varchar](50) NOT NULL,
[internet] [varchar](50) NOT NULL,
[t_educ] [int] NOT NULL,
[permanencia] [varchar](50) NOT NULL,
[cantidad][int] NOT NULL,
CONSTRAINT [PK_Estudiante]
PRIMARY KEY CLUSTERED([estudianteID] ASC))



/*DIMENSION FECHA*/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Fecha](
[fechaID] [int] NOT NULL,
[anio] [int] NOT NULL,
CONSTRAINT [PK_Fecha]
PRIMARY KEY CLUSTERED ([fechaID] ASC))


/*DIMENSION TRABAJO*/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Trabajo](
[trabajoID] [int] NOT NULL,
[practicas_pre] [varchar](50) NOT NULL,
[extracurricular] [varchar](50) NOT NULL,
CONSTRAINT [PK_Trabajo] PRIMARY KEY CLUSTERED
([trabajoID] ASC))



/*DIMENSION UNIVERSIDAD*/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Universidad](
[universidadID] [int]  NOT NULL,
[nombre] [varchar](300) NOT NULL,
[departamento] [varchar](100) NOT NULL,
[provincia] [varchar](100) NOT NULL,
[tipo] [varchar](100) NOT NULL,
[creacion] [varchar](50) NOT NULL,
CONSTRAINT [PK_Universidad] 
PRIMARY KEY CLUSTERED ([universidadID] ASC))



/* FACT TABLE DESERCIÓN */
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Desercion](
[estudianteID] [int] NOT NULL,
[trabajoID] [int] NOT NULL,
[universidadID] [int] NOT NULL,
[fechaID] [int] NOT NULL,
[descentralizacionID] [int] NOT NULL,
[convenienciaID] [int] NOT NULL,
CONSTRAINT [FK_Desercion_Conveniencia] FOREIGN KEY([convenienciaID])
REFERENCES [dbo].[Conveniencia] ([convenienciaID]),
CONSTRAINT [FK_Desercion_Descentralizacion] FOREIGN KEY([descentralizacionID])
REFERENCES [dbo].[Descentralizacion] ([descentralizacionID]),CONSTRAINT [FK_Desercion_Estudiante] FOREIGN KEY([estudianteID])
REFERENCES [dbo].[Estudiante] ([estudianteID]),CONSTRAINT [FK_Desercion_Fecha] FOREIGN KEY([fechaID])
REFERENCES [dbo].[Fecha] ([fechaID]),CONSTRAINT [FK_Desercion_Trabajo] FOREIGN KEY([trabajoID])
REFERENCES [dbo].[Trabajo] ([trabajoID]),CONSTRAINT [FK_Desercion_Universidad] FOREIGN KEY([universidadID])
REFERENCES [dbo].[Universidad] ([universidadID]))




