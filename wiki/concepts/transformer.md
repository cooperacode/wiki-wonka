---
title: "Transformer"
slug: transformer
type: concept
tags: [arquitetura, nlp, deep-learning, seq2seq, atenção]
related_sources: [sources/attention-is-all-you-need]
related_entities: [entities/vaswani-et-al]
related_concepts: [concepts/self-attention, concepts/multi-head-attention, concepts/positional-encoding]
---

## Definição

O Transformer é uma arquitetura de rede neural para transdução de sequências que substitui as camadas recorrentes (RNN/LSTM/GRU) e convolucionais por empilhamentos de atenção e redes feed-forward ponto-a-ponto. Proposto por Vaswani et al. (2017), tornou-se a base de praticamente todos os grandes modelos de linguagem subsequentes (BERT, GPT, T5, etc.).

## Como funciona

A arquitetura segue a estrutura encoder-decoder clássica, porém inteiramente baseada em atenção:

**Encoder** — pilha de N=6 camadas idênticas. Cada camada tem duas sub-camadas:
1. Multi-head self-attention
2. Rede feed-forward ponto-a-ponto (FFN): FFN(x) = max(0, xW₁+b₁)W₂+b₂

**Decoder** — pilha de N=6 camadas idênticas. Cada camada tem três sub-camadas:
1. Multi-head self-attention **mascarada** (impede acesso a posições futuras)
2. Multi-head cross-attention sobre saída do encoder
3. Rede feed-forward ponto-a-ponto

Todas as sub-camadas usam conexões residuais seguidas de layer normalization: saída = LayerNorm(x + Sublayer(x)).

A dimensionalidade do modelo é d_model=512. A camada interna do FFN tem d_ff=2048. Os embeddings e a transformação linear pré-softmax compartilham a mesma matriz de pesos.

**Diagrama (Figura 1 do artigo):** encoder à esquerda com positional encoding → input embedding; decoder à direita com positional encoding → output embedding (shifted right); saída final via linear + softmax.

## Evidências e alegações

De [[sources/attention-is-all-you-need]]:
- Supera todos os modelos e ensembles anteriores em EN-DE (28,4 BLEU) e EN-FR (41,8 BLEU) no WMT 2014.
- Treinamento base: 100K steps, ~12h em 8 P100s. Modelo big: 300K steps, 3,5 dias.
- Generaliza para parsing de constituintes: 92,7 F1 (semi-supervisionado), superando todos os modelos exceto o Recurrent Neural Network Grammar.
- Modelo big (N=6, d_model=1024, h=16, 213M parâmetros) tem perplexidade 4,33 e BLEU 26,4 no dev set EN-DE.

## Conexões

- [[concepts/self-attention]] — mecanismo fundamental que substitui recorrência
- [[concepts/multi-head-attention]] — versão com múltiplas cabeças paralelas usada em todas as camadas
- [[concepts/positional-encoding]] — necessário porque a arquitetura não tem noção implícita de ordem

## Questões em aberto

- Complexidade O(n²·d) por camada torna-se gargalo para sequências longas. Atenção esparsa/local é uma direção ativa de pesquisa.
- Por que N=6 camadas? A ablação (Tabela 3) testa 2, 4 e 6 mas não explora profundidades maiores.
