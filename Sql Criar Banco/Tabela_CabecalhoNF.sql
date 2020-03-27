CREATE TABLE CABNFE
(
  NRONFE Integer NOT NULL,
  NATOPERACAO Varchar(40),
  EMISSAO Date,
  STATUS Varchar(50),
  EMI_NOME Varchar(50),
  EMI_CNPJ Varchar(15),
  EMI_END Varchar(50),
  EMI_BAI Varchar(50),
  EMI_CID Varchar(50),
  DES_NOME Varchar(50),
  DES_CNPJ Varchar(15),
  DES_END Varchar(50),
  DES_BAI Varchar(50),
  DES_CID Varchar(50),
  CONSTRAINT PK_CABNFE PRIMARY KEY (NRONFE)
);