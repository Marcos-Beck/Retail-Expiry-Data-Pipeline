-- criação da base
CREATE DATABASE controle_vencidos;  
GO -- *utilizado para executar o código em bloco separado

-- entrando na base
USE controle_vencidos; 

-- criando a tabela 
CREATE TABLE itens_vencidos (
    data_visita DATE,
    bandeira VARCHAR(50),
    loja INT,
    quantidade INT,
    setor VARCHAR(50),
    validade DATE
);

--- inserindo dados do arquivo
BULK INSERT itens_vencidos
FROM 'Caminho_do_arquivo/arquivo.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    CODEPAGE = '65001',
    TABLOCK
);