-- criando view fatos

CREATE VIEW vw_fatos_vencidos AS
SELECT
    -- ids
    id,
    id_setor,
    id_bandeira,
    -- data
    data_visita,
    validade,
    -- outros campos
    loja,
    quantidade,
    dias_vencidos
FROM itens_vencidos;
GO

-- views para dimensões (facilita consultas e garante integridade e performance)

CREATE VIEW vw_dim_setor AS
SELECT
    id_setor AS id,
    nome_setor AS setor
FROM dim_setor;
GO

CREATE VIEW vw_dim_bandeira AS
SELECT
    id_bandeira AS id,
    nome_bandeira AS bandeira
FROM dim_bandeira;
GO
CREATE VIEW vw_dim_data AS
SELECT
    data,
    ano,
    mes,
    dia,
    nome_mes
FROM dim_data;

-- check das views
SELECT *
FROM vw_fatos_vencidos;

SELECT *
FROM vw_dim_setor;

SELECT *
FROM vw_dim_bandeira;

SELECT *
FROM vw_dim_data;


