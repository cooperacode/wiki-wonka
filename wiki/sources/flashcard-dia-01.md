---
title: "Flashcards — Dia 01: AI, ML, Deep Learning e Redes Neurais"
slug: flashcard-dia-01
type: source
date_ingested: 2026-05-01
original_file: raw/flashcard-dia-01.html
authors: []
tags: [aws-aif-c01, machine-learning, deep-learning, neural-networks, fundamentos]
related_concepts: [concepts/learning-paradigms, concepts/overfitting-underfitting, concepts/foundation-model]
related_entities: []
---

## Summary

Material de estudo em formato flashcard (13 cards) para o exame AWS Certified AI Practitioner (AIF-C01). Cobre os fundamentos conceituais de IA, ML e Deep Learning com foco em aplicação prática para cenários de exame.

O material estabelece a hierarquia de contenção AI ⊃ ML ⊃ Deep Learning ⊃ Redes Neurais e usa essa estrutura para calibrar o raciocínio do candidato em questões que envolvem sistemas baseados em regras (AI sem ML), algoritmos clássicos como Random Forest (ML sem DL) e arquiteturas convolucionais (DL para dados não-estruturados).

Os flashcards abordam o ciclo completo de desenvolvimento de um modelo: da escolha do paradigma de aprendizado (supervisionado, não-supervisionado, por reforço) até o treinamento da rede neural (forward pass → loss → backpropagation → gradient descent → épocas), passando por pré-processamento (feature engineering, data leakage, splits de dados).

## Key claims

- **Hierarquia de contenção**: todo DL é ML, mas nem todo ML é DL; um chatbot com 300 regras if/then é AI mas não é ML.
- **Overfitting vs underfitting**: overfitting = acurácia ótima no treino + ruim no teste; underfitting = ruim nos dois. Soluções distintas: regularização/mais dados vs. mais complexidade/menos regularização.
- **Parâmetros vs hiperparâmetros**: parâmetros são aprendidos automaticamente (pesos, biases); hiperparâmetros são definidos pelo humano antes do treinamento (learning rate, batch size, épocas).
- **Quando usar DL**: dado não-estruturado (imagem, áudio, texto) em escala (centenas de milhares+). Dados tabulares → ML tradicional (XGBoost, Random Forest).
- **Data leakage**: modelo com 99% de accuracy no dev que falha em produção é sinal clássico. Causa: estatísticas calculadas com dados de teste ou features pós-evento.
- **Deep = camadas ocultas**: "profunda" não tem número exato, mas 1–2 camadas ocultas é rede simples — não o que se entende por DL moderno.

## Connections to existing wiki

Este material é introdutório ao domínio que sustenta [[sources/attention-is-all-you-need]] — a arquitetura Transformer pressupõe todos esses fundamentos (redes neurais, gradient descent, backpropagation). Os flashcards não citam Transformers diretamente, mas o ciclo de treinamento descrito (5 etapas) se aplica identicamente ao pré-treinamento de LLMs.

## Open questions

- Qual o limiar prático de número de camadas para ser considerado DL moderno hoje (2024–2025)?
- Como K-Fold Cross Validation se relaciona com os splits padrão em datasets pequenos — quando exatamente a troca compensa?

## Notable quotes

> "Armadilha do exame: chatbot com regras if/then é AI, mas NÃO é ML."

> "Sinal de alerta: modelo com 99% de accuracy no desenvolvimento que falha em produção." (data leakage)

> "Hiperparâmetros = configurações do forno; parâmetros = resultado da receita."
