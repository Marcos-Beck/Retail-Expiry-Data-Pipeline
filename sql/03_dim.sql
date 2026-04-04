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

-- removendo colunas antigas
ALTER TABLE itens_vencidos
DROP COLUMN setor,
            bandeira;