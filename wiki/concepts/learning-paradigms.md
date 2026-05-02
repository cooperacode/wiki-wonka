---
title: "Paradigmas de Aprendizado de ML"
slug: learning-paradigms
type: concept
tags: [machine-learning, fundamentos, supervisionado, não-supervisionado, reforço]
related_sources: [sources/flashcard-dia-01]
related_entities: []
related_concepts: [concepts/overfitting-underfitting]
---

## Definition

Os três paradigmas fundamentais de aprendizado de máquina classificam como um modelo aprende a partir de dados: supervisionado (com labels), não-supervisionado (sem labels) e por reforço (agente + ambiente + recompensa).

## How it works

**Aprendizado supervisionado**: o dataset contém pares (entrada, saída esperada). O modelo ajusta seus parâmetros para minimizar o erro entre predição e label. Tarefas: classificação e regressão.

**Aprendizado não-supervisionado**: o dataset não tem labels. O modelo descobre estrutura latente nos dados. Tarefas principais: clustering (K-Means), redução de dimensionalidade (PCA), detecção de anomalias.

**Aprendizado por reforço**: um agente interage com um ambiente, toma ações e recebe recompensas ou penalidades. O objetivo é maximizar a recompensa acumulada ao longo do tempo. Não há dataset fixo — os dados são gerados pelas interações.

Fluxo de decisão para escolha:
1. Tem labels? → Supervisionado
2. Quer agrupar/descobrir estrutura? → Não-supervisionado
3. Agente com recompensa/penalidade? → Reforço

## Evidence and claims

[[sources/flashcard-dia-01]] apresenta os três paradigmas com palavras-chave de identificação para exames: "rotulado/classificar/prever" → supervisionado; "agrupar/segmentar/descobrir" → não-supervisionado; "recompensa/penalidade/agente" → reforço.

## Connections

- [[concepts/overfitting-underfitting]] — fenômeno que ocorre no treinamento supervisionado
- [[entities/amazon-sagemaker]] — oferece algoritmos para os três paradigmas (XGBoost para supervisionado, K-Means para não-supervisionado, Random Cut Forest para não-supervisionado de anomalias)

## Open questions

- Como classificar aprendizado semi-supervisionado e self-supervised learning nessa taxonomia? (relevante para pré-treinamento de LLMs, que é tecnicamente não-supervisionado em escala massiva)
