-- criação da base
CREATE DATABASE controle_vencidos;  
GO -- *utilizado para executar o código em bloco separado

-- entrando na base
USE controle_vencidos; 

-- criando a tabela 
CREATE TABLE itens_vencidos (
    data_visita DATE NOT NULL,
    bandeira VARCHAR(50) NOT NULL,
    loja INT NOT NULL,
    quantidade INT NOT NULL,
    setor VARCHAR(50) NOT NULL,
    validade DATE NOT NULL
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