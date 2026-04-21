---
title: "Positional Encoding"
slug: positional-encoding
type: concept
tags: [posição, embedding, transformer, sequência]
related_sources: [sources/attention-is-all-you-need]
related_entities: [entities/vaswani-et-al]
related_concepts: [concepts/transformer, concepts/self-attention]
---

## Definição

Positional Encoding é o mecanismo pelo qual o Transformer injeta informação sobre a posição de cada token na sequência. Como self-attention é invariante à permutação das posições (não tem noção implícita de ordem), encodings posicionais são somados aos embeddings de entrada no pé do encoder e do decoder para suprir essa informação.

## Como funciona

O Transformer usa encodings sinusoidais fixos (não aprendidos):

```
PE(pos, 2i)   = sin(pos / 10000^(2i/d_model))
PE(pos, 2i+1) = cos(pos / 10000^(2i/d_model))
```

- `pos` é a posição na sequência; `i` é a dimensão.
- Cada dimensão corresponde a uma senóide com frequência diferente — comprimentos de onda de 2π a 10000·2π.
- Os encodings têm a mesma dimensão d_model que os embeddings, permitindo a soma direta.

**Por que sinusoidal?** Os autores hipotetizaram que a função permite ao modelo aprender a atender por offset relativo: para qualquer offset fixo k, PE(pos+k) pode ser representado como uma transformação linear de PE(pos). Isso facilitaria a generalização a comprimentos de sequência não vistos no treinamento.

## Evidências e alegações

De [[sources/attention-is-all-you-need]]:
- Encodings sinusoidais produzem resultados quase idênticos a positional embeddings aprendidos (Tabela 3, linha E: mesma perplexidade 4,92, BLEU 25,7 vs. 25,8 do base).
- Sinusoidal foi escolhido por poder extrapolatar a sequências mais longas que as do treinamento — vantagem hipotética, não demonstrada empiricamente no artigo.

## Conexões

- [[concepts/self-attention]] — complementa self-attention, que por si só é invariante à ordem
- [[concepts/transformer]] — componente de entrada do encoder e do decoder

## Questões em aberto

- A superioridade dos encodings sinusoidais em extrapolação a sequências longas é assumida mas não testada rigorosamente neste artigo.
- Encodings posicionais relativos (em vez de absolutos) são uma direção alternativa — o modelo poderia raciocinar diretamente sobre distâncias entre posições.
