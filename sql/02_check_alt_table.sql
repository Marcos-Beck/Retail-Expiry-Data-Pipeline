-- ! CHECK DAS COLUNAS --

USE controle_vencidos;

-- verifica 10 primeiras linhas 
SELECT TOP 10 *
FROM itens_vencidos;

-- quantidade total de registros 
SELECT COUNT(*) FROM itens_vencidos;

-- conferindo se há valores nulos
SELECT *
FROM itens_vencidos
WHERE data_visita IS NULL
	OR loja IS NULL
	OR quantidade IS NULL;

-- primeira e ultima data de registro
SELECT 
	MIN(data_visita) AS min_data,
	MAX(data_visita) AS max_data
FROM itens_vencidos;

-- ! ALTERAÇÃO DE TABELA --

-- cria coluna de id unico para cada registro
ALTER TABLE itens_vencidos
ADD id INT IDENTITY (1,1);

-- transforma coluna id em pk 
ALTER TABLE itens_vencidos
ADD CONSTRAINT PK_itens_vencidos
PRIMARY KEY (id);

-- cria coluna calculada de dias vencidos
ALTER TABLE itens_vencidos
ADD dias_vencidos AS DATEDIFF(DAY, validade, data_visita);
