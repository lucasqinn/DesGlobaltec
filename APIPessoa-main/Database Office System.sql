	CREATE DATABASE DBOfficeSystem

GO
USE DBOfficeSystem

GO

CREATE TABLE TB_FUNCIONARIO
(
ID_FUNCIONARIO  INT IDENTITY (1,1) NOT NULL PRIMARY KEY,
NOME_FUNC			VARCHAR (100)  NOT NULL,
RG_FUNC				VARCHAR (12)   NOT NULL,
CPF_FUNC			VARCHAR	(14)   NOT NULL,
DTNASCIMENTO_FUNC	VARCHAR (11)   NOT NULL,
SEXO_FUNC			VARCHAR	(2)	   NOT NULL,
CEP_FUNC			VARCHAR (8)	   NOT NULL,
UF_FUNC				VARCHAR	(2)	   NOT NULL,
CIDADE_FUNC			VARCHAR (50)   NOT NULL,
ENDERECO_FUNC		VARCHAR (70)   NOT NULL,
BAIRRO_FUNC			VARCHAR (50)   NOT NULL,
N_CASA_FUNC			VARCHAR (6)	   NOT NULL,
TELEFONE_FUNC		VARCHAR (13) 	   NULL,
CELULAR_FUNC		VARCHAR	(14)	   NULL,
EMAIL_FUNC			VARCHAR (40)	   NULL,
)


CREATE TABLE TB_CLIENTE
(
ID_CLIENTE		INT IDENTITY (1,1)		NOT NULL PRIMARY KEY,
NOME_CLI			VARCHAR	(100)		NOT NULL,
RG_CLI				VARCHAR (12)			NULL,
CPF_CLI				VARCHAR (14)			NULL,
CNPJ_CLI			VARCHAR	(25)			NULL,
DTNASCIMENTO_CLI	VARCHAR (11)			NULL,
CEP_CLI				VARCHAR (9)				NULL,
UF_CLI				VARCHAR	(2)				NULL,
CIDADE_CLI			VARCHAR (50)			NULL,
ENDERECO_CLI		VARCHAR (70)			NULL,
BAIRRO_CLI			VARCHAR (50)			NULL,
N_CASA_CLI			VARCHAR (6)				NULL,
TELEFONE_CLI		VARCHAR (13)			NULL,
CELULAR_CLI			VARCHAR	(14)			NULL,
EMAIL_CLI			VARCHAR	(30)			NULL,
)

CREATE TABLE TB_VEICULO
(
ID_VEICULO		INT IDENTITY (1,1) NOT NULL PRIMARY	KEY,
MODELO			VARCHAR	(30)		NOT NULL,
PLACA			VARCHAR	(8)			NULL,
CHASSI			VARCHAR	(17)		NULL,
COR				VARCHAR	(30)		NULL,
FABRICANTE		VARCHAR	(30)		NULL,
COMBUSTIVEL		VARCHAR	(30)		NULL,
ANO				VARCHAR	(4)			NULL,
ID_CLIENTE		INT					NOT NULL,
FOREIGN KEY (ID_CLIENTE) REFERENCES TB_CLIENTE (ID_CLIENTE)
)


CREATE TABLE TB_AGENDAMENTO
(
ID_AGENDAMENTO	INT IDENTITY (1,1) NOT NULL	PRIMARY	KEY,
DTAGENDAMENTO	VARCHAR	(50)	   NOT NULL,
OBSERVACOES		VARCHAR	(200)		   NULL,
HORARIO			VARCHAR(5)		   NOT NULL,
ID_CLIENTE		INT				   NOT NULL,
FOREIGN KEY (ID_CLIENTE)	REFERENCES	TB_CLIENTE	(ID_CLIENTE)
)



create table TB_SERVICOS
(

ID_SERVICO	INT	IDENTITY	(1,1)	NOT	NULL PRIMARY KEY,
SERVICOS	VARCHAR(50)	NOT NULL,
--VALOR		SMALLMONEY  NULL

)


--ALTER TABLE TB_AGENDAMENTO
--ADD ID_CLIENTE INT NOT NULL,
--FOREIGN KEY (ID_CLIENTE)	REFERENCES	TB_CLIENTE	(ID_CLIENTE)

CREATE TABLE TB_ORCAMENTO
(
ID_ORCAMENTO	INT IDENTITY (1,1) NOT NULL	PRIMARY	KEY,
OBSERVACOES		VARCHAR (200)		NULL,
TOTAL			SMALLMONEY			NOT	NULL,
SERVICO			VARCHAR(100)		NOT NULL,
VALOR			SMALLMONEY			NOT NULL,
ID_CLIENTE		INT					NOT	NULL,
ID_VEICULO		INT					NOT	NULL,
ID_FUNCIONARIO	INT					NOT	NULL,
FOREIGN KEY (ID_CLIENTE)	REFERENCES	TB_CLIENTE	(ID_CLIENTE),
FOREIGN KEY	(ID_VEICULO)	REFERENCES	TB_VEICULO	(ID_VEICULO),
FOREIGN	KEY	(ID_FUNCIONARIO)	REFERENCES	TB_FUNCIONARIO	(ID_FUNCIONARIO)
)




CREATE TABLE TB_ACESSO
(
ID_LOGIN	INT IDENTITY (1,1)	NOT NULL PRIMARY KEY,
USUARIO		VARCHAR(15)			NOT NULL,
SENHA		VARCHAR	(15)		NOT NULL,
)



CREATE TABLE TB_CONTROLE
(
ID_CONTROLE		INT	IDENTITY	(1,1)	NOT	NULL PRIMARY KEY,
VALOR			SMALLMONEY				NOT	NULL,
FORMA_PGTO		VARCHAR			(16)	NOT	NULL,
PARCELAS		INT						NULL,
VALOR_PARCELA	SMALLMONEY				NULL,
DATA			VARCHAR(11)				NULL,	
ID_CLIENTE		INT						NOT NULL,
FOREIGN KEY (ID_CLIENTE)	REFERENCES	TB_CLIENTE	(ID_CLIENTE)
)




CREATE TABLE TB_DETALHE_ORC
(	
	ID_ORCAMENTO int not null,
	foreign key (ID_ORCAMENTO) references TB_ORCAMENTO(ID_ORCAMENTO)
)

--INSERT INTO TB_FUNCIONARIO VALUES('SAMUEL FELIPE', '42994195X', '454.493.818-08', '05/05/1997', 'M', '18111135', 'SP', 'CIDADE', 'AV CARLITO DE G�ES', 'VILA VASQUES', '225', '(15)3343-4399', '(15)99840-0280', 'D.RODRIGUES05@LIVE.COM')
--INSERT INTO TB_CLIENTE VALUES('DAVID RODRIGUES', '42994195X', '454.493.818-08', '', '05/05/1997', '18111135', 'SP', 'CIDADE', 'AV CARLITO DE G�ES', 'VILA VASQUES', '225', '(15)3343-4399', '(15)99840-0280', 'D.RODRIGUES05@LIVE.COM')
--INSERT INTO TB_VEICULO VALUES('CAMARO', 'ETX5050', '', 'AMARELO', 'GM/CHEVROLET', 'GASOLINA', '2014', '1')
--INSERT INTO TB_SERVICOS VALUES('REVITALIZA��O(LATERAL DIREITA)')
insert into TB_ACESSO values('MARCOS', 'martelinho')



--SELECT  V.ID_VEICULO AS C�DIGO, V.MODELO, V.PLACA, V.CHASSI, V.COR, V.FABRICANTE, V.ANO, V.COMBUSTIVEL, C.NOME_CLI
--FROM TB_VEICULO V, TB_CLIENTE C
--WHERE V.ID_CLIENTE = C.ID_CLIENTE

--INSERT INTO TB_VEICULO values('civic', 'etx 2012', '', 'rosa', 'audi', 'diesel', '', '2014', '1')

--INSERT INTO TB_VEICULO values('civic', 'etx 2012', '', 'rosa', 'audi', 'diesel', '', '2014', '1')

--ALTER TABLE TB_VEICULO
--DROP COLUMN KM

--SELECT O.ID_ORCAMENTO, S.ID_SERVICO, C.NOME_CLI, C.CPF_CLI, C.CNPJ_CLI, C.ENDERECO_CLI, C.TELEFONE_CLI, V.MODELO,
--V.PLACA, V.COR, S.SERVICOS, F.NOME_FUNC
--FROM TB_ORCAMENTO O, TB_FUNCIONARIO F, TB_VEICULO V, TB_CLIENTE C, TB_SERVICOS S
--WHERE O.ID_ORCAMENTO = '0' AND S.ID_SERVICO = '0' AND C.NOME_CLI = 'DAVID%'

--INSERT INTO TB_DETALHE_ORC VALUES('1', '1')


