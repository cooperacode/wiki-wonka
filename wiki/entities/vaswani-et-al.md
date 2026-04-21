---
title: "Vaswani et al. (Transformer team)"
slug: vaswani-et-al
type: entity
subtype: person
tags: [google-brain, google-research, nlp, deep-learning]
related_sources: [sources/attention-is-all-you-need]
related_concepts: [concepts/transformer, concepts/multi-head-attention, concepts/self-attention, concepts/positional-encoding]
---

## Descrição

Grupo de oito pesquisadores responsáveis pelo artigo "Attention Is All You Need" (NeurIPS 2017), que introduziu o Transformer. Todos com contribuição igual (ordem de listagem aleatória segundo nota de rodapé):

| Pesquisador | Afiliação | Contribuição principal |
|---|---|---|
| Ashish Vaswani | Google Brain | Design e implementação dos primeiros modelos Transformer |
| Noam Shazeer | Google Brain | Scaled dot-product attention, multi-head attention, representação posicional |
| Niki Parmar | Google Research | Implementação, tuning, avaliação de variantes |
| Jakob Uszkoreit | Google Research | Propôs substituir RNNs por self-attention |
| Llion Jones | Google Research | Variantes de modelo, codebase original, visualizações |
| Aidan N. Gomez | University of Toronto | Experimentos e implementação (trabalho realizado no Google Brain) |
| Łukasz Kaiser | Google Brain | Design de partes da arquitetura, tensor2tensor |
| Illia Polosukhin | (independente) | Implementação e codebase tensor2tensor |

O código foi disponibilizado publicamente no repositório tensorflow/tensor2tensor.

## Conexões

- [[sources/attention-is-all-you-need]] — artigo principal do grupo
- [[concepts/transformer]] — contribuição central
