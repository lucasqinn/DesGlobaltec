CREATE DATABASE [Desafio2DB]
GO

USE [Desafio2DB]
GO


CREATE TABLE [dbo].[ContasAPagar](
	[CodigoFornecedor] [bigint] IDENTITY(1,1) NOT NULL,
	[DataVencimento] [date] NOT NULL,
	[DataProrrogação] [date] NULL,
	[Valor] [numeric](18, 6) NOT NULL,
	[Acrescimo] [numeric](18, 6) NULL,
	[Desconto] [numeric](18, 6) NULL,
 CONSTRAINT [PK_ContasAPagar] PRIMARY KEY CLUSTERED 
(
	[CodigoFornecedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ContasPagas]    Script Date: 27/10/2021 17:41:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContasPagas](
	[Numero] [bigint] IDENTITY(1,1) NOT NULL,
	[CodigoFornecedor] [bigint] NOT NULL,
	[DataVencimento] [date] NOT NULL,
	[DataPagamento] [date] NOT NULL,
	[Valor] [numeric](18, 6) NOT NULL,
	[Acrescimo] [numeric](18, 6) NULL,
	[Desconto] [numeric](18, 6) NULL,
 CONSTRAINT [PK_ContasPagas] PRIMARY KEY CLUSTERED 
(
	[Numero] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pessoas]    Script Date: 27/10/2021 17:41:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pessoas](
	[Codigo] [bigint] IDENTITY(1,1) NOT NULL,
	[Nome] [varchar](110) NOT NULL,
	[cpfCNPJ] [varchar](14) NOT NULL,
 CONSTRAINT [PK_Pessoas] PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ContasPagas] ON 
GO
INSERT [dbo].[ContasPagas] ([Numero], [CodigoFornecedor], [DataVencimento], [DataPagamento], [Valor], [Acrescimo], [Desconto]) VALUES (1, 1, CAST(N'2021-12-10' AS Date), CAST(N'2021-10-27' AS Date), CAST(50.000000 AS Numeric(18, 6)), CAST(0.000000 AS Numeric(18, 6)), CAST(0.000000 AS Numeric(18, 6)))
GO
INSERT [dbo].[ContasPagas] ([Numero], [CodigoFornecedor], [DataVencimento], [DataPagamento], [Valor], [Acrescimo], [Desconto]) VALUES (5, 2, CAST(N'2021-12-10' AS Date), CAST(N'2021-10-26' AS Date), CAST(75.000000 AS Numeric(18, 6)), CAST(0.000000 AS Numeric(18, 6)), CAST(0.000000 AS Numeric(18, 6)))
GO
INSERT [dbo].[ContasPagas] ([Numero], [CodigoFornecedor], [DataVencimento], [DataPagamento], [Valor], [Acrescimo], [Desconto]) VALUES (6, 3, CAST(N'2021-12-10' AS Date), CAST(N'2021-10-25' AS Date), CAST(100.000000 AS Numeric(18, 6)), CAST(0.000000 AS Numeric(18, 6)), CAST(0.000000 AS Numeric(18, 6)))
GO
INSERT [dbo].[ContasPagas] ([Numero], [CodigoFornecedor], [DataVencimento], [DataPagamento], [Valor], [Acrescimo], [Desconto]) VALUES (7, 4, CAST(N'2021-12-10' AS Date), CAST(N'2021-10-24' AS Date), CAST(1000.000000 AS Numeric(18, 6)), CAST(0.000000 AS Numeric(18, 6)), CAST(10.000000 AS Numeric(18, 6)))
GO
INSERT [dbo].[ContasPagas] ([Numero], [CodigoFornecedor], [DataVencimento], [DataPagamento], [Valor], [Acrescimo], [Desconto]) VALUES (8, 5, CAST(N'2021-12-14' AS Date), CAST(N'2021-09-21' AS Date), CAST(15.000000 AS Numeric(18, 6)), CAST(0.000000 AS Numeric(18, 6)), CAST(1.000000 AS Numeric(18, 6)))
GO
INSERT [dbo].[ContasPagas] ([Numero], [CodigoFornecedor], [DataVencimento], [DataPagamento], [Valor], [Acrescimo], [Desconto]) VALUES (9, 6, CAST(N'2021-11-02' AS Date), CAST(N'2021-08-22' AS Date), CAST(14.000000 AS Numeric(18, 6)), CAST(5.000000 AS Numeric(18, 6)), CAST(2.000000 AS Numeric(18, 6)))
GO
SET IDENTITY_INSERT [dbo].[ContasPagas] OFF
GO
SET IDENTITY_INSERT [dbo].[Pessoas] ON 
GO
INSERT [dbo].[Pessoas] ([Codigo], [Nome], [cpfCNPJ]) VALUES (2, N'Bernardo Lucas Levi Assunção', N'731.418.593-02')
GO
INSERT [dbo].[Pessoas] ([Codigo], [Nome], [cpfCNPJ]) VALUES (3, N'Laís Giovana Assunção', N'830.227.548-41')
GO
INSERT [dbo].[Pessoas] ([Codigo], [Nome], [cpfCNPJ]) VALUES (4, N'Milena Francisca Martins', N'982.101.286-80')
GO
INSERT [dbo].[Pessoas] ([Codigo], [Nome], [cpfCNPJ]) VALUES (5, N'Fabiana Patrícia Marina Farias', N'792.733.428-09')
GO
INSERT [dbo].[Pessoas] ([Codigo], [Nome], [cpfCNPJ]) VALUES (7, N'Elisa Giovanna Daniela Bernardes', N'180.633.409-73')
GO
SET IDENTITY_INSERT [dbo].[Pessoas] OFF
GO
