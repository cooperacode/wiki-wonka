---
title: "Amazon Bedrock"
slug: amazon-bedrock
type: entity
subtype: product
tags: [aws, foundation-model, llm, serverless, generative-ai]
related_sources: [sources/flashcard-dia-02]
related_concepts: [concepts/foundation-model, concepts/llm, concepts/nlp]
---

## Descrição

Amazon Bedrock é um serviço serverless da AWS que oferece acesso a Foundation Models (FMs) de múltiplos provedores via API unificada, sem necessidade de gerenciar infraestrutura. Lançado em 2023, é a plataforma principal da AWS para desenvolvimento de aplicações de IA generativa.

## Provedores e modelos disponíveis

- **Anthropic**: Claude (família completa)
- **Meta**: Llama
- **Mistral AI**: Mistral e Mixtral
- **Cohere**: Command e Embed
- **Stability AI**: Stable Diffusion (imagens)
- **Amazon**: Titan Text, Titan Embeddings, Titan Image

## Recursos integrados

- **Knowledge Bases**: implementação gerenciada de RAG (Retrieval-Augmented Generation) — indexa documentos em vector store e recupera contexto relevante para o FM gerar respostas fundamentadas
- **Agents**: orquestração de fluxos multi-etapa com tool use (function calling)
- **Guardrails**: controles de segurança e conformidade (filtros de conteúdo, PII, tópicos bloqueados)
- **Model Evaluation**: avaliação automatizada de modelos

## Posicionamento vs SageMaker

| Critério | Bedrock | SageMaker |
|---|---|---|
| Infraestrutura | Serverless | Instâncias EC2 gerenciadas |
| Modelos | FMs de terceiros | Open-source + customizados |
| Fine-tuning | Disponível (via console) | Controle total |
| Público-alvo | Devs de aplicações GenAI | Times de ML |
| Pricing | Por token | Por instância/hora |

## Evidence and claims

[[sources/flashcard-dia-02]]: "Para devs construindo aplicações de GenAI sem expertise em ML" (Bedrock). Q&A sobre documentos privados → Bedrock Knowledge Bases (RAG); não Amazon Lex (fluxos fixos) nem Comprehend (não gera respostas).
