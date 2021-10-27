USE [Desafio2DB]
GO
/****** Object:  Table [dbo].[ContasAPagar]    Script Date: 27/10/2021 17:36:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
/****** Object:  Table [dbo].[ContasPagas]    Script Date: 27/10/2021 17:36:07 ******/
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
/****** Object:  Table [dbo].[Pessoas]    Script Date: 27/10/2021 17:36:07 ******/
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
