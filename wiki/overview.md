---
title: "Visão Geral do Wiki"
type: overview
last_updated: 2026-05-01
---

# Visão Geral

Este wiki documenta fontes, conceitos e entidades relacionadas a arquiteturas de modelos de linguagem, aprendizado profundo e o ecossistema de IA aplicada — com foco em fundamentos que sustentam os grandes modelos de linguagem modernos e em aplicações práticas no contexto AWS.

## Estado atual do conhecimento

O corpus atual cobre dois níveis complementares: fundamentos teóricos de redes neurais e ML (via material de estudo AIF-C01) e a base arquitetural do Transformer (via Vaswani et al., 2017). Juntos, estabelecem uma cadeia completa: conceitos de ML/DL → arquitetura Transformer → LLMs → Foundation Models → serviços AWS de IA generativa.

A tese central até agora: **atenção é suficiente** (Vaswani et al.) e **escala habilita emergência** (LLMs). Esses dois princípios juntos explicam por que modelos como Claude e GPT-4 conseguem realizar múltiplas tarefas sem re-treinamento — o Transformer paralelizável possibilitou treinamento em escala massiva, e essa escala gerou capacidades emergentes.

### Do ingest — "Attention Is All You Need" (2017)

O Transformer representa ruptura com o paradigma RNN+atenção. Ao eliminar recorrência, ganha paralelização total e reduz comprimento do caminho entre posições para O(1). O custo — complexidade quadrática em sequência O(n²·d) — tornou-se o principal gargalo atacado por trabalhos posteriores (atenção esparsa, linear attention, etc.).

### Dos flashcards AIF-C01 — Dia 01 e Dia 02

Material pedagógico que cobre:
- **Fundamentos ML**: hierarquia AI ⊃ ML ⊃ DL ⊃ Redes Neurais; 3 paradigmas de aprendizado; overfitting vs underfitting; parâmetros vs hiperparâmetros; ciclo de treinamento neural; data leakage; feature engineering
- **Serviços AWS**: NLP (Transcribe, Polly, Translate, Comprehend, Lex) e Computer Vision (Rekognition, Textract, Lookout for Vision) com regras de decisão claras
- **Camada GenAI**: LLMs como subconjunto de Foundation Models baseados em Transformer; Bedrock (serverless, FMs de terceiros) vs SageMaker (controle total, fine-tuning)

Conexão explícita: os flashcards do Dia 02 afirmam que LLMs são FMs baseados na arquitetura Transformer — fechando o loop com Vaswani et al.

## Tensões em aberto

- **Complexidade quadrática vs. sequências longas** — self-attention padrão é O(n²), inviável para documentos muito longos. Literatura posterior propõe aproximações.
- **Interpretabilidade de heads** — evidências visuais sugerem especialização, mas análise sistemática é escassa.
- **Encodings posicionais absolutos vs. relativos** — artigo original usa posições absolutas; RoPE, ALiBi sugerem que relativas generalizam melhor.
- **Bedrock vs SageMaker** — linha entre "conveniência serverless" e "controle de fine-tuning" nem sempre é clara em casos reais de produção.
- **Self-supervised learning na taxonomia** — pré-treinamento de LLMs é tecnicamente não-supervisionado, mas a taxonomia supervisionado/não-supervisionado/reforço dos flashcards não acomoda isso explicitamente.
