---
title: "Overfitting e Underfitting"
slug: overfitting-underfitting
type: concept
tags: [machine-learning, bias-variância, generalização, regularização]
related_sources: [sources/flashcard-dia-01]
related_entities: []
related_concepts: [concepts/learning-paradigms]
---

## Definition

Overfitting (alta variância) e underfitting (alto bias) são os dois modos opostos de falha de generalização de um modelo de ML. Um modelo bem calibrado performa bem tanto no treino quanto em dados novos.

## How it works

**Overfitting**: o modelo memoriza os dados de treinamento em vez de aprender padrões generalizáveis. Sintoma: acurácia muito alta no treino (ex: 99%) e baixa no teste/validação (ex: 61%).

Causas: modelo muito complexo para o volume de dados; treinamento excessivo; ruído nos dados de treino aprendido como sinal.

Soluções:
- Mais dados de treinamento
- Regularização: L1 (Lasso), L2 (Ridge), Dropout
- Reduzir complexidade do modelo (menos camadas, menos parâmetros)
- Early stopping

**Underfitting**: o modelo é simples demais para capturar a estrutura dos dados. Sintoma: acurácia baixa tanto no treino quanto no teste (ambos ~60%).

Causas: modelo insuficientemente complexo; poucas features relevantes; regularização excessiva.

Soluções:
- Aumentar complexidade do modelo
- Adicionar features relevantes (feature engineering)
- Reduzir regularização
- Treinar por mais épocas

## Evidence and claims

[[sources/flashcard-dia-01]] define o diagnóstico pelo padrão de acurácia treino/teste e lista soluções distintas para cada caso. Modelo balanceado: treino bom + validação boa → generaliza.

## Connections

- [[concepts/learning-paradigms]] — overfitting/underfitting ocorrem no aprendizado supervisionado
- [[concepts/foundation-model]] — LLMs são extremamente suscetíveis a overfitting no fine-tuning com datasets pequenos

## Open questions

- Como a curva de loss dupla (treino vs validação) pode ser usada para detectar overfitting antes de avaliar no test set?
