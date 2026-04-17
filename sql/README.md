# Modelagem do Banco de Dados - Scripts SQL

Este diretório contém todos os scripts SQL para criar e estruturar o banco de dados de controle de itens vencidos em uma rede de varejo. Os scripts devem ser executados em sequência para garantir o funcionamento correto do pipeline.

## Visão Geral 

A arquitetura foi projetada utilizando o modelo **Star Schema**, com foco em performance analítica e organização dos dados para consumo no Power BI, ela apresenta:

- **Tabela de Fatos**: `itens_vencidos` (registros principais)
- **Tabelas Dimensionais**: `dim_setor`, `dim_bandeira`, `dim_data`
- **Views**: Para facilitar consultas e manter a integridade

## Scripts SQL

### `01_init_database.sql`

**Objetivo**: Criar a base de dados e tabela principal

**Ações executadas:**

- Cria o banco de dados `controle_vencidos`
- Define a tabela `itens_vencidos` com as colunas:
  - `data_visita`: Data da visita/inspeção
  - `bandeira`: Rede de mercado
  - `loja`: Identificador da loja
  - `quantidade`: Quantidade de itens vencidos
  - `setor`: Setor do varejo
  - `validade`: Data de validade do produto
- Importa dados de arquivo CSV com `BULK INSERT`

**Status**: Tabela rasa com dados brutos

### `02_check_alt_table.sql`

**Objetivo**: Validar, limpar e enriquecer dados

**Validações executadas:**

- Mostra as primeiras 10 linhas
- Conta total de registros
- Identifica valores nulos
- Encontra amplitude temporal (data mín/máx)

**Alterações da tabela:**

- Adiciona coluna `id` como chave primária = `IDENTITY`
- Cria coluna calculada `dias_vencidos` = `DATEDIFF(DAY, validade, data_visita)`

**Verificações finais:**

- Validação de IDs únicos (sem duplicatas)
- Distribuição de `dias_vencidos` (min, max, média)
- Detecção de produtos ainda válidos (dias_vencidos < 0)

### `03_dim.sql`

**Objetivo**: Criar modelo dimensional (Star Schema)

**Tabelas dimensionais criadas:**

1. **`dim_setor`**
   - Extrai valores únicos de setores
   - Cria ID sequencial para cada setor

2. **`dim_bandeira`**
   - Extrai valores únicos de bandeiras/redes
   - Cria ID sequencial para cada bandeira

3. **`dim_data`**
   - Gera série completa de datas (2022 a 2025)
   - Calcula: ano, mês, dia, nome do mês
   - Garante todas as datas possíveis disponíveis

**Alterações na tabela de fatos:**

- Adiciona colunas `id_setor` e `id_bandeira`
- Popula IDs baseado em JOINs com dimensões
- Remove colunas originais (`setor`, `bandeira`)
- Cria chaves estrangeiras para integridade referencial:
  - `fk_setor` → `dim_setor`
  - `fk_bandeira` → `dim_bandeira`
  - `fk_data` → `dim_data`

**Resultado**: Banco normalizado pronto para análises e consultas.

### `04_views.sql`

**Objetivo**: Criar camada de abstração para consultas

**Views criadas:**

1. **`vw_fatos_vencidos`**
   - Exibe dados essenciais da tabela de fatos para análises
   - Inclui: id, ids das dimensões, datas, loja, quantidade, dias_vencidos
   - Facilita consultas sem expor estrutura interna

2. **`vw_dim_setor`**
   - Normaliza nomes de coluna (id_setor → id, nome_setor → setor)

3. **`vw_dim_bandeira`**
   - Normaliza nomes (id_bandeira → id, nome_bandeira → bandeira)

4. **`vw_dim_data`**
   - Acesso facilitado à dimensão de data

**Benefícios das views:**

Mesmo em um projeto de menor escala, as views foram implementadas para simular um ambiente de produção, onde:

- O acesso direto às tabelas é evitado
- Existe uma camada de abstração para consumo dos dados
- Mudanças estruturais no banco não impactam diretamente o BI
---

## Fluxo de execução obrigatório

1. Execute `01_init_database.sql` para criar a base e importar os dados
2. Execute `02_check_alt_table.sql` para validar e enriquecer a tabela de fatos
3. Execute `03_dim.sql` para criar o modelo dimensional
4. Execute `04_views.sql` para criar as views de abstração

**Observações:**
- Scripts devem rodar em MS SQL Server
- O caminho do arquivo CSV deve ser especificado em `01_init_database.sql`
- Usar `GO` para separar blocos de execução
- Configuração de idioma: Português (em `03_dim.sql`)

## Modelo de Dados

![Modelo Dimensional](https://github.com/user-attachments/assets/847f07d2-c043-46c0-8e04-7960a4806a5c)

O modelo abaixo representa a estrutura dimensional adotada, com a tabela fato central conectada às dimensões de apoio.

## Decisões Técnicas

- A coluna `loja` não foi transformada em dimensão, pois a análise de lojas específicas não é o foco principal do projeto, além das informações especificas das lojas terem sido previamente removidas por motivos de privacidade
- A dimensão de datas foi definida com um intervalo fixo, pois o projeto não possui atualização contínua de dados.
- Utilização de **Star Schema** para otimizar análises e facilitar integração com ferramentas de BI
- Separação de dimensões para evitar redundância e melhorar manutenção dos dados
- Criação de coluna calculada `dias_vencidos` diretamente no banco para padronizar regras de negócio
- Uso de **views** como camada de consumo, evitando acesso direto às tabelas físicas
- Importação via `BULK INSERT` para simular cenários reais de ingestão de dados

## Próximos Passos

Com o banco de dados estruturado e as views criadas, a próxima etapa é a construção do dashboard no Power BI, utilizando as views como fonte de dados para criar visualizações e análises interativas sobre os itens vencidos.
