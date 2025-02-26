if exists (select * from sysobjects where id = object_id(N'[dbo].[Encuestas]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Encuestas]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[Preguntas]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Preguntas]
GO

CREATE TABLE [dbo].[Encuestas] (
	[Nombre] [nvarchar] (100) NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Preguntas] (
	[Encuesta] [nvarchar] (100) NOT NULL ,
	[Pregunta] [nvarchar] (100) NOT NULL ,
	[Tipo] [nvarchar] (100) NOT NULL ,
	[Opciones] [nvarchar] (100) NULL ,
	[Id] [int] IDENTITY (1, 1) NOT NULL 
) ON [PRIMARY]
GO

