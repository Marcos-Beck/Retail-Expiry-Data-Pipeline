# Visualização dos Dados - Dashboard Power BI

## Sobre o Dashboard

O dashboard foi desenvolvido no Power BI, utilizando os dados tratados e estruturados na modelagem SQL. Ele oferece uma visão consolidada e interativa sobre os itens vencidos em uma rede de supermercados, permitindo análises detalhadas por loja, setor e período focada para auxiliar na tomada de decisão e no monitoramento da qualidade dos produtos dos gestores.

## Visão Geral

O dashboard é composto por 3 páginas principais:

### **1. HOME**:

![Página HOME](https://github.com/user-attachments/assets/1ff90083-f534-4026-9681-a643413f93c0)

A página inicial foi desenvolvida para fornecer uma visão executiva do desempenho geral das ocorrências de produtos vencidos. Seu objetivo é permitir que gestores identifiquem rapidamente o cenário atual antes de aprofundar a análise nas demais páginas do dashboard.

#### Destaques
- Indicador de criticidade baseado no limite de tolerância de produtos vencidos, permitindo uma rápida avaliação do desempenho da loja.
- Total de ocorrências de produtos vencidos, oferecendo uma visão geral do volume de itens vencidos.
- Comparativo com o mesmo período do ano anterior, permitindo identificar tendências e variações sazonais.
- Identificação automática de lojas e setor com maior incidência de produtos vencidos, facilitando a priorização de ações corretivas.
- Distruibuição de ocorrências por bandeira, permitindo uma análise comparativa.
- Evolução das ocorrências por tipo de setor.
- Filtros interativos para seleção de período, loja, setor e bandeira, permitindo uma análise personalizada e detalhada.
- Navegação direta para as páginas de análise detalhada, facilitando a exploração dos dados.

### **2. ANALITÍCA**:

![Página ANALITÍCA](https://github.com/user-attachments/assets/377595d9-8f0d-4606-ba5e-20f84c053dd6)

A página analítica do dashboard reúne indicadores estratégicos e operacionais para investigação das ocorrências. Os visuais são totalmente interativos, permitindo que qualquer seleção atualize automaticamente todos os indicadores da página.

#### Destaques
- Nivel de criticidade.
- Total de ocorrências de produtos vencidos.
- Comparativo com o mês anterior.
- Média mensal de ocorrências.
- Média de ocorrências por visita, oferecendo uma visão mais detalhada sobre a frequência das ocorrências.
- Comparativo com o limite de tolerância, permitindo avaliar se a loja está dentro dos padrões estabelecidos.

#### Recursos 
- Tooltip personalizado com informações detalhadas para cada mês, incluindo total de ocorrências, quantidade de visitas, quantidade de lojas averiguadas, diferença percentual do limite de tolerância e média de ocorrências por visita.
- Evolução temporal das ocorrências, permitindo identificar tendências e padrões de comportamento ao longo do tempo.
- Ranking das lojas com maior volume de produtos vencidos, facilitando a identificação de áreas críticas.
- Distribuição das ocorrências por setor, permitindo uma análise detalhada do desempenho de cada área.
- Distribuição por unidade, permitindo uma análise comparativa entre diferentes bandeiras.
- Classificação visual das lojas por status de criticidade, facilitando a identificação de áreas que necessitam de atenção imediata.
- Segmentação por bandeira, loja, periodo e setor.

### **3. SOBRE**:

![Página SOBRE](https://github.com/user-attachments/assets/74541130-29aa-466d-83d9-bcbc3f659cce)

Página destinada à contextualização do projeto, apresentando seu objetivo, escopo e limitações.

#### São apresentados

- Finalidade do projeto, destacando que se trata de um estudo de caso para fins de aprendizado e desenvolvimento de portfólio.
- Contexto da pipiline analítica.
- Utilização de dados reais anonimizados, garantindo a privacidade e confidencialidade das informações.
- Links para o perfil do autor e repositorio do projeto no GitHub, permitindo acesso ao código-fonte e documentação completa.

## Observações Finais

Os dados apresentados no dashboard são provenientes do pipeline de ETL, que inclui a limpeza e padronização dos dados nos notebooks Jupyter, a modelagem em SQL e a visualização no Power BI. A integração entre essas etapas garante que as informações exibidas sejam precisas, confiáveis e relevantes para os gestores de loja.
Todas as informações apresentadas foram anonimizadas ou removidas, o projeto é apenas para fins de estudo e enriquecimento de portfólio.