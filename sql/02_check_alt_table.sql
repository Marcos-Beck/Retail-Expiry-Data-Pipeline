--- ! CHECK DAS COLUNAS ---

--- verifica 10 primeiras linhas 
SELECT TOP 10 *
FROM itens_vencidos;

--- quantidade total de registros 
SELECT COUNT(*) FROM itens_vencidos;

--- conferindo se há valores nulos
SELECT *
FROM itens_vencidos
WHERE data_visita IS NULL
	OR loja IS NULL
	OR quantidade IS NULL;

--- primeira e ultima data de registro
SELECT 
	MIN(data_visita) AS min_data,
	MAX(data_visita) AS max_data
FROM itens_vencidos;

--- ! ALTERAÇÃO DE TABELA ---

