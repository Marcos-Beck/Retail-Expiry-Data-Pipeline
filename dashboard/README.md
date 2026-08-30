# Visualização dos Dados - Dashboard Power BI

## Sobre o Dashboard

O dashboard foi desenvolvido no Power BI, utilizando os dados tratados e estruturados na modelagem SQL. Ele oferece uma visão consolidada e interativa sobre os itens vencidos em uma rede de supermercados, permitindo análises detalhadas por loja, setor e período focada para auxiliar na tomada de decisão e no monitoramento da qualidade dos produtos dos gestores.

## Visão Geral

O dashboard é composto por 3 páginas principais:

### **1. HOME**:

![Página - Monitoramento Geral](https://github.com/user-attachments/assets/ae4bfe69-3f21-4bbd-87f0-18aa482f11b4)

A página inicial foi desenvolvida para fornecer uma visão executiva do desempenho geral das ocorrências de produtos vencidos. Seu objetivo é permitir que gestores identifiquem rapidamente o cenário atual antes de aprofundar a análise nas demais páginas do dashboard.

#### Destaques
- Indicador de criticidade baseado no limite de tolerância de produtos vencidos, permitindo uma rápida avaliação do desempenho da loja.
- Identificação automática de lojas e setor com maior incidência de produtos vencidos, facilitando a priorização de ações corretivas.
- Distruibuição de ocorrências por bandeira, permitindo uma análise comparativa.
- Evolução das ocorrências por tipo de setor.
- Navegação direta para as páginas de análise detalhada, facilitando a exploração dos dados.

### **2. ANALITÍCA**:

![Página - Monitoramento Analítico](https://github.com/user-attachments/assets/4976344a-4387-49e6-b13c-3dc86b8bb065)

A página analítica do dashboard reúne indicadores estratégicos e operacionais para investigação das ocorrências. Os visuais são totalmente interativos, permitindo que qualquer seleção atualize automaticamente todos os indicadores da página.

#### Destaques
- Indicador de criticidade.
- Comparativo com o limite de tolerância, permitindo avaliar se a loja está dentro dos padrões estabelecidos.
- Tooltip personalizado com informações detalhadas para cada mês, incluindo total de ocorrências, quantidade de visitas, quantidade de lojas averiguadas, diferença percentual do limite de tolerância e média de ocorrências por visita.
- Ranking das lojas com maior volume de produtos vencidos, facilitando a identificação de áreas críticas.
- Cards auxiliares nos gráficos de ranking por setor e por loja, exibindo respectivamente o percentual dos top 2 setores e o percentual das top 5 lojas, permitindo uma análise rápida da concentração de ocorrências.
- Classificação visual das lojas por status de criticidade, facilitando a identificação de áreas que necessitam de atenção imediata.

### **3. PONTUAL *v1_desktop***: 

![Página - Detalhamento do Mês](https://github.com/user-attachments/assets/d049968b-3126-44f0-baa0-4fc35a179338)

A página pontual do dashboard foi desenvolvida para fornecer uma visão detalhada das ocorrências de produtos vencidos mês a mês, com foco na evolução semanal. Seu objetivo é permitir que gestores analisem o desempenho de cada loja e setor em um curto periodo de tempo, identificando problemas pontuais e tendências emergentes.

#### Destaques
- Distribuição das ocorrências por dia da semana e por semana do mês, permitindo uma análise detalhada do comportamento das ocorrências em curtos períodos.
- Visualização em heatmap das ocorrências por loja, facilitando a identificação de padrões e áreas críticas.
- Cards informativos com as principais informações de destaque negativo do mês, o dia de maior ocorrência, as lojas envolvidas e os totais de ocorrências, permitindo uma análise rápida e eficiente.

### **4. PONTUAL *v2_web***:

![Página - Detalhamento do Mês](https://github.com/user-attachments/assets/4b9060b6-b7ea-48c6-b69d-6b172d5f9127)

A versão web da página foi desenvolvida para fornecer uma versão parecida com a versão desktop, pois apresenta limitações de recursos e visualizações no Power BI Web.

### **5. SOBRE**:

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