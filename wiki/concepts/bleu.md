---
title: "BLEU (Bilingual Evaluation Understudy)"
slug: bleu
type: concept
tags: [avaliação, tradução-automática, nlp, métrica]
related_sources: [sources/attention-is-all-you-need]
related_entities: []
related_concepts: [concepts/transformer]
---

## Source question

> "o que é a métrica BLEU"
> Filed: 2026-04-20

## Definição

A wiki não possui uma fonte dedicada que defina BLEU. O conceito aparece nos resultados empíricos de [[sources/attention-is-all-you-need]] como métrica de qualidade em tradução automática, mas não é explicado ali.

> [!gap] Não há página de fonte que defina BLEU, seu cálculo (n-gram precision com brevity penalty) ou suas limitações. Os valores abaixo vêm de uso empírico, não de definição.

## Evidências e alegações

De [[sources/attention-is-all-you-need]]:

- O Transformer base alcançou **BLEU de 28,4** em English-German (WMT 2014), superando todos os modelos e ensembles anteriores em mais de 2 pontos BLEU.
- Alcançou **BLEU de 41,8** em English-French (WMT 2014), novo estado da arte para modelo único, com custo de treinamento ~1/4 do modelo concorrente.
- Single-head attention com mesma dimensionalidade é **0,9 BLEU pior** que 8 heads — usada como evidência quantitativa da utilidade de [[concepts/multi-head-attention]].

## Conexões

- [[concepts/transformer]] — arquitetura cujos resultados são reportados em BLEU
- [[sources/attention-is-all-you-need]] — única fonte atual que menciona BLEU

## Questões em aberto

- O wiki não cobre: o que é BLEU, como é calculado, quais são suas limitações conhecidas, ou alternativas (METEOR, chrF, COMET).
- Vale ingerir: Papineni et al. (2002) "BLEU: a Method for Automatic Evaluation of Machine Translation" para cobrir a definição e o mecanismo.
