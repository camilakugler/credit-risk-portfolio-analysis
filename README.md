# Análise de Risco de Crédito

## 1. Visão Geral do Projeto

Este projeto tem como objetivo analisar dados históricos de empréstimos da Lending Club para avaliar o desempenho de uma carteira de crédito e identificar padrões associados às perdas financeiras.

A análise concentra-se em **empréstimos com prazo de 36 meses, concedidos entre 2011 e 2015**, investigando o desempenho dos contratos, as características financeiras dos tomadores, as taxas de juros e as classificações de risco de crédito.

## 2. Problema de Negócio

A equipe de Gestão de Risco de Crédito de uma instituição financeira precisa avaliar o desempenho histórico de sua carteira de empréstimos, identificar segmentos associados a maiores perdas e fornecer informações que contribuam para futuras avaliações da política de concessão de crédito.

Para isso, o projeto busca responder às seguintes perguntas:

1. Como evoluiu o volume de empréstimos concedidos entre 2011 e 2015?
2. Como variou a proporção de contratos quitados e baixados como perda ao longo dos anos?
3. Quais classificações de risco de crédito apresentaram maiores proporções de contratos baixados como perda?
4. Qual é a relação entre o índice de endividamento (DTI) e os resultados dos empréstimos?
5. Como as taxas de juros se relacionam com o desempenho dos contratos?
6. Quais finalidades de empréstimo apresentaram maiores proporções de perdas?

## 3. Dataset

**Fonte:** [Lending Club Loan Data — Kaggle](https://www.kaggle.com/datasets/wordsforthewise/lending-club)

**Características dos dados:**

- Dataset original: 2.267.701 registros e 151 colunas.
- Dataset selecionado: 603.736 contratos e 11 colunas.
- Período de concessão: 2011 a 2015.
- Prazo dos empréstimos: 36 meses.

O dataset original não está incluído neste repositório devido ao seu tamanho. Os dados foram utilizados exclusivamente para fins educacionais e de desenvolvimento de portfólio.

## 4. Tecnologias Utilizadas

- **Python e Pandas:** exploração inicial, avaliação da qualidade e preparação dos dados.
- **PostgreSQL:** consultas SQL e análise dos indicadores de risco de crédito.
- **Power BI:** desenvolvimento de dashboard interativo e visualização dos indicadores.
- **PowerPoint:** apresentação executiva dos resultados e conclusões.

## 5. Qualidade e Preparação dos Dados

A exploração inicial identificou a existência de valores ausentes em diferentes colunas do dataset original.

Após a seleção dos contratos de 36 meses concedidos entre 2011 e 2015, foram realizadas verificações de integridade e qualidade dos dados.

O conjunto de dados preparado foi exportado para CSV, preservando o arquivo original.

## 6. Status do Projeto

**Em desenvolvimento — Etapa de preparação dos dados concluída.**

A próxima etapa consiste na importação dos dados para o PostgreSQL e no desenvolvimento das consultas SQL que responderão às perguntas de negócio.

Posteriormente, os resultados serão apresentados em um dashboard interativo no Power BI e em uma apresentação executiva com as principais conclusões e recomendações.
