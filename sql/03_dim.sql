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
