---
title: "Foundation Models (FMs)"
slug: foundation-model
type: concept
tags: [foundation-model, llm, transfer-learning, deep-learning, generative-ai]
related_sources: [sources/flashcard-dia-02]
related_entities: [entities/amazon-bedrock, entities/amazon-sagemaker]
related_concepts: [concepts/llm]
---

## Definition

Foundation Model (FM) é um modelo treinado em escala massiva em dados gerais não rotulados, que serve como base para múltiplas aplicações downstream sem re-treinamento completo. O termo foi cunhado pelo Stanford CRFM (2021) para descrever modelos como GPT-3 e BERT.

## How it works

FMs são treinados com self-supervised learning em corpora enormes (texto, imagem, código, áudio). O resultado é um modelo de propósito geral que pode ser adaptado a tarefas específicas por:

1. **Prompting**: nenhuma atualização de parâmetros — apenas instruções em linguagem natural
2. **Fine-tuning**: ajuste de parâmetros em dataset específico (menor custo que treinar do zero)
3. **RAG (Retrieval-Augmented Generation)**: combinação com base de conhecimento externa para augmentar o contexto

Taxonomia de FMs:
- **LLMs**: focados em linguagem (Claude, GPT-4, Llama, Amazon Titan Text) — subconjunto de FMs
- **Modelos multimodais**: texto + imagem (GPT-4V, Claude 3, Stable Diffusion)
- **Modelos de código**: GitHub Copilot, Amazon Q Developer

No AWS:
- **Amazon Bedrock**: acesso a FMs de terceiros (Anthropic, Meta, Mistral, Cohere, Stability AI) via API serverless
- **SageMaker JumpStart**: deploy de FMs open-source em infraestrutura dedicada para fine-tuning

## Evidence and claims

[[sources/flashcard-dia-02]] estabelece que FM é o conceito mais amplo: "LLMs são subconjunto de FMs — focados em linguagem. Modelos multimodais (texto + imagem) também são FMs."

## Connections

- [[concepts/llm]] — LLMs são o subconjunto de FMs focado em texto
- [[entities/amazon-bedrock]] — plataforma AWS para acesso a FMs via API
- [[entities/amazon-sagemaker]] — plataforma para fine-tuning de FMs open-source

## Open questions

- Onde traçar a linha entre "foundation model" e modelo pré-treinado convencional? Escala? Multi-tarefa? Emergência?
- Fine-tuning vs. RAG: quando cada abordagem é preferível para adaptar um FM a domínio específico?
