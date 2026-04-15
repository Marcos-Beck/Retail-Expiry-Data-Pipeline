# Limpeza e Análise Inicial - Notebooks

## Visão Geral

Este diretório contém notebooks Jupyter responsáveis pela exploração, limpeza, processamento e análise exploratória inicial dos dados.

Essa etapa tem como objetivo garantir a qualidade dos dados antes da modelagem em SQL e construção do dashboard, identificando inconsistências, padrões e possíveis problemas nos registros.

---

## Notebooks

### 01_data_cleaning.ipynb

**Objetivo:** Realizar a limpeza e padronização dos dados brutos, garantindo consistência para as etapas seguintes.

**Principais etapas:**

- Carregamento e inspeção inicial dos dados
- Identificação e tratamento de valores nulos
- Remoção de registros duplicados
- Validação e ajuste de tipos de dados
- Padronização de datas
- Limpeza de caracteres especiais e espaços em branco

**Decisões importantes:**

- Datas foram convertidas para o formato ISO (YYYY-MM-DD) visando integração com a modelagem SQL
- Campo textual "setor" foi padronizado devido a variações de nomenclatura e erros de digitação.
- A conferência do coluna dias vencidos foi realizada e apresentou inconsistencias, levando a sua exclusão. A análise de dias vencidos será realizada diretamente na modelagem SQL, garantindo maior precisão e controle sobre os cálculos.


### 02_data_vis.ipynb

**Objetivo:** Validar a consistência das transformações realizadas e explorar os dados já tratados.

**Principais análises:**
- Distribuição de itens vencidos por loja, setor e bandeira
- Análise temporal das ocorrências
- Comparação de volume por períodos
- Identificação de padrões e tendências iniciais

**Insights iniciais:**
- Identificação de setores com maior incidência de produtos vencidos
- Diferenças relevantes entre lojas/bandeiras
- Indícios de padrões temporais nas ocorrências

---

## Fluxo de execução recomendado

1. Execute `01_data_cleaning.ipynb`
2. Gere o dataset tratado
3. Execute `02_data_vis.ipynb`
4. Analise os resultados e gráficos gerados

---

## Próximos passos

Os dados tratados nesta etapa são utilizados na modelagem em SQL, onde são estruturados em um modelo dimensional (star schema) para posterior consumo no Power BI.

Essa etapa garante que as análises e visualizações sejam baseadas em dados consistentes e confiáveis.