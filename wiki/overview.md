---
title: "Visão Geral do Wiki"
type: overview
last_updated: 2026-04-20
---

# Visão Geral

Este wiki documenta fontes, conceitos e entidades relacionadas a arquiteturas de modelos de linguagem e aprendizado profundo, com foco em fundamentos que sustentam os grandes modelos de linguagem modernos.

## Estado atual do conhecimento

O corpus atual é composto por uma fonte fundacional: o artigo que introduziu o Transformer (Vaswani et al., 2017). Este trabalho estabelece a base arquitetural sobre a qual praticamente toda a pesquisa em LLMs subsequente foi construída — BERT, GPT, T5, e seus sucessores todos derivam diretamente desta arquitetura.

A tese central até agora: **atenção é suficiente** — recorrência e convoluções são dispensáveis para transdução de sequências de alta qualidade, e a eliminação da dependência sequencial habilita paralelismo que torna o treinamento em escala viável.

### Do primeiro ingest — "Attention Is All You Need" (2017)

O Transformer representa uma ruptura com o paradigma RNN+atenção dominante à época. Ao eliminar recorrência, o modelo ganha paralelização total durante o treinamento e reduz o comprimento do caminho entre posições para O(1), facilitando dependências de longo alcance. O custo é uma complexidade quadrática em sequência (O(n²·d)), que se tornaria o principal gargalo a ser atacado por trabalhos subsequentes (atenção esparsa, linear attention, etc.).

Pontos de tensão não resolvidos neste artigo: escalabilidade para sequências longas, interpretabilidade sistemática de heads de atenção, e se encodings posicionais sinusoidais realmente generalizam melhor que os aprendidos para comprimentos fora da distribuição de treinamento.

## Tensões em aberto

- **Complexidade quadrática vs. sequências longas** — self-attention padrão é O(n²), inviável para documentos muito longos. A literatura posterior propõe diversas aproximações.
- **Interpretabilidade de heads** — evidências visuais sugerem especialização, mas análise sistemática é escassa.
- **Encodings posicionais absolutos vs. relativos** — o artigo original usa posições absolutas; pesquisa posterior (RoPE, ALiBi, etc.) sugere que posições relativas generalizam melhor.
