-- ! CRIAÇÃO E POPULAÇÃO DAS TABELAS DIM

-- criando tabela dim setor
CREATE TABLE dim_setor (
    id_setor INT PRIMARY KEY IDENTITY(1,1),
    nome_setor VARCHAR(50) UNIQUE NOT NULL
);

-- populando tabela dim setor
INSERT INTO dim_setor (nome_setor)
SELECT DISTINCT setor
FROM itens_vencidos;

-- criando tabela dim bandeira
CREATE TABLE dim_bandeira (
    id_bandeira INT PRIMARY KEY IDENTITY(1,1),
    nome_bandeira VARCHAR(50) UNIQUE NOT NULL
);

-- populando tabela dim bandeira
INSERT INTO dim_bandeira (nome_bandeira)
SELECT DISTINCT bandeira
FROM itens_vencidos;

-- criando tabela dim data
CREATE TABLE dim_data (
    data DATE PRIMARY KEY,
    ano INT NOT NULL,
    mes INT NOT NULL,
    dia INT NOT NULL,
    nome_mes VARCHAR(20) NOT NULL
);

-- configurando antes da inserção 

SET LANGUAGE Portuguese;

WITH datas AS (
    SELECT CAST('2022-01-01' AS DATE) AS data
    UNION ALL
    SELECT DATEADD(DAY, 1, data)
    FROM datas
    WHERE data < '2025-12-31'
)

-- populando tabela dim data
INSERT INTO dim_data
SELECT 
    data,
    YEAR(data) AS ano,
    MONTH(data) AS mes,
    DAY(data) AS dia,
    DATENAME(MONTH, data) AS nome_mes
FROM datas
OPTION (MAXRECURSION 0);

-- ! AJUSTES NA TABELA DE FATOS

-- adicionando colunas de id
ALTER TABLE itens_vencidos
ADD id_setor INT,
    id_bandeira INT;

-- atualizando colunas de id
UPDATE f
SET 
    f.id_setor = s.id_setor,
    f.id_bandeira = b.id_bandeira
FROM itens_vencidos f
JOIN dim_setor s 
    ON f.setor = s.nome_setor
JOIN dim_bandeira b 
    ON f.bandeira = b.nome_bandeira;

-- criando chaves estrangeiras
ALTER TABLE itens_vencidos
ADD CONSTRAINT fk_setor
FOREIGN KEY (id_setor) REFERENCES dim_setor(id_setor);

ALTER TABLE itens_vencidos
ADD CONSTRAINT fk_bandeira
FOREIGN KEY (id_bandeira) REFERENCES dim_bandeira(id_bandeira);

ALTER TABLE itens_vencidos
ADD CONSTRAINT fk_data
FOREIGN KEY (data_visita) REFERENCES dim_data(data);

-- removendo colunas antigas desnecessárias
ALTER TABLE itens_vencidos
DROP COLUMN setor,
            bandeira;

-- ! CHECKS E OTIMIZAÇÕES --

-- check de preenchimento
SELECT *
FROM itens_vencidos
WHERE id_setor IS NULL
   OR id_bandeira IS NULL;

-- check de valores
SELECT *
FROM dim_bandeira

SELECT *
FROM dim_setor --! foi identificado valores diferentes com o mesmo significado, "food service mercearia" e "mercearia food service". É necessário padronizar os dados para garantir a integridade referencial.

-- corrigindo ids na tabela fatos
UPDATE itens_vencidos
SET id_setor = 18 -- id se mercearia food service
WHERE id_setor = 4 -- id de food service mercearia

-- removendo setor antigo
DELETE FROM dim_setor
WHERE id_setor = 4;

-- criação de index para otimizar consultas
CREATE INDEX idx_setor 
ON itens_vencidos(id_setor);

CREATE INDEX idx_bandeira 
ON itens_vencidos(id_bandeira);

CREATE INDEX idx_data
ON itens_vencidos(data_visita);