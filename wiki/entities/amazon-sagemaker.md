---
title: "Amazon SageMaker"
slug: amazon-sagemaker
type: entity
subtype: product
tags: [aws, machine-learning, mlops, treinamento, deploy]
related_sources: [sources/flashcard-dia-02]
related_concepts: [concepts/learning-paradigms, concepts/foundation-model, concepts/llm]
---

## Descrição

Amazon SageMaker é a plataforma de ML gerenciada da AWS para treinar, ajustar (fine-tune) e deployar modelos de machine learning e deep learning. Oferece ambiente completo de MLOps com notebooks, pipelines, registro de modelos e monitoramento em produção.

## Algoritmos built-in

Algoritmos nativos do SageMaker otimizados para escala:

| Algoritmo | Quando usar |
|---|---|
| **XGBoost** | Dados tabulares — classificação e regressão supervisionada |
| **Linear Learner** | Regressão linear / classificação logística em escala |
| **K-Means** | Clustering não-supervisionado — segmentar grupos sem labels |
| **Random Cut Forest (RCF)** | Detecção de anomalias — séries temporais, IoT, fraude |
| **BlazingText** | Classificação de texto e word embeddings |
| **Factorization Machines** | Sistemas de recomendação |
| **Object Detection** | Detectar e localizar objetos em imagens |

## SageMaker JumpStart

Repositório de modelos pré-treinados (incluindo FMs open-source como Llama, Mistral, Falcon) que podem ser deployados com um clique ou fine-tuned em infraestrutura dedicada. Diferente do Bedrock: o modelo roda em instâncias EC2 gerenciadas pelo cliente, não serverless.

## Regras de decisão para o exame

- Anomalias em IoT/séries temporais → **Random Cut Forest**
- Clustering de clientes → **K-Means**
- Churn prediction (classificação supervisionada tabular) → **XGBoost**
- Fine-tuning de FM open-source com controle total → **SageMaker JumpStart**
- Acesso a Claude/outros FMs sem infra → **Amazon Bedrock**

## Evidence and claims

[[sources/flashcard-dia-02]]: "Para times de ML com necessidade de controle e customização" (SageMaker vs Bedrock).
