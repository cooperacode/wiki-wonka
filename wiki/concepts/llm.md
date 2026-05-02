---
title: "Large Language Models (LLMs)"
slug: llm
type: concept
tags: [llm, foundation-model, transformer, deep-learning, nlp]
related_sources: [sources/flashcard-dia-02]
related_entities: [entities/amazon-bedrock, entities/amazon-sagemaker]
related_concepts: [concepts/foundation-model, concepts/nlp]
---

## Definition

Large Language Models (LLMs) são modelos de aprendizado profundo baseados na arquitetura Transformer, treinados em corpus massivos de texto (escala da internet), capazes de executar múltiplas tarefas de linguagem sem re-treinamento — apenas via prompts ou fine-tuning leve.

## How it works

LLMs são pré-treinados com objetivos de modelagem de linguagem (predizer o próximo token, mascarar e reconstruir tokens) em trilhões de tokens de texto. O resultado é um modelo com bilhões a trilhões de parâmetros que captura conhecimento linguístico, factual e de raciocínio de forma emergente.

Diferenças fundamentais em relação ao ML tradicional:

| Aspecto | ML Tradicional | LLM |
|---|---|---|
| Escopo | Tarefa única | Multi-tarefa |
| Parâmetros | Milhares–milhões | Bilhões–trilhões |
| Treinamento | Dataset específico | Corpus massivo |
| Adaptação | Re-treino completo | Prompts ou fine-tuning |
| Entrada/saída | Tabela → classe/valor | Texto → texto gerado |

Capacidades emergentes surgem com escala — habilidades não explicitamente treinadas que aparecem ao aumentar o número de parâmetros e dados.

## Evidence and claims

[[sources/flashcard-dia-02]] define LLMs como FMs baseados na arquitetura Transformer com capacidades emergentes. Exemplos citados: Claude, GPT, Llama, Amazon Titan Text — todos acessíveis via [[entities/amazon-bedrock]].

A conexão arquitetural é direta: [[sources/attention-is-all-you-need]] (Vaswani et al., 2017) introduziu o Transformer que serve de base para todos esses modelos.

## Connections

- [[concepts/foundation-model]] — LLMs são subconjunto de FMs (FMs incluem modelos multimodais)
- [[concepts/nlp]] — LLMs são o estado da arte atual para tarefas de NLP
- [[entities/amazon-bedrock]] — acesso serverless a LLMs via API

## Open questions

- Qual é o limiar de parâmetros que define "large" em LLM? O termo é relativo e muda conforme a escala da indústria avança.
- Como capacidades emergentes surgem — descontinuidade real ou artefato de métricas de avaliação?
