---
title: "Attention Is All You Need"
slug: attention-is-all-you-need
type: source
date_ingested: 2026-04-20
original_file: raw/1706.03762v7.pdf
authors: [Ashish Vaswani, Noam Shazeer, Niki Parmar, Jakob Uszkoreit, Llion Jones, Aidan N. Gomez, Łukasz Kaiser, Illia Polosukhin]
tags: [transformer, self-attention, machine-translation, nlp, deep-learning]
related_concepts: [concepts/transformer, concepts/self-attention, concepts/multi-head-attention, concepts/positional-encoding]
related_entities: [entities/vaswani-et-al]
---

## Resumo

Este artigo apresenta o Transformer, uma nova arquitetura de rede neural para transdução de sequências que abandona completamente recorrência e convoluções, baseando-se exclusivamente em mecanismos de atenção. Publicado no NeurIPS 2017 por pesquisadores do Google Brain, Google Research e Universidade de Toronto, o trabalho representa uma ruptura fundamental com o paradigma dominante à época, em que modelos encoder-decoder combinavam RNNs com atenção como componente auxiliar.

A motivação central é eliminar a dependência sequencial das RNNs, que impede paralelização durante o treinamento. O Transformer computa representações de todas as posições simultaneamente via atenção, reduzindo o número de operações sequenciais para O(1) independentemente do comprimento da sequência. Isso não apenas acelera o treinamento como também facilita o aprendizado de dependências de longo alcance.

O artigo demonstra que a arquitetura supera o estado da arte em tradução automática (EN-DE e EN-FR no WMT 2014) com uma fração do custo computacional, e generaliza para tarefas estruturalmente distintas como parsing de constituintes em inglês.

## Alegações principais

- **BLEU EN-DE de 28,4** — supera todos os modelos e ensembles anteriores em mais de 2 pontos no WMT 2014 English-German.
- **BLEU EN-FR de 41,8** — novo estado da arte para modelo único, com custo de treinamento ~1/4 do modelo anterior SOTA (GNMT+RL ensemble).
- **Treinamento em 3,5 dias em 8 GPUs P100** — ordens de magnitude mais eficiente que concorrentes com desempenho similar.
- **Self-attention com O(1) operações sequenciais vs. O(n) de RNNs** — caminho máximo entre posições também é O(1), facilitando dependências de longo alcance.
- **Heads de atenção especializam-se empiricamente** — visualizações mostram heads capturando anáfora, dependências sintáticas de longa distância e estrutura frasal, sugerindo divisão de trabalho emergente.
- **Encodings posicionais sinusoidais ≈ aprendidos** — experimento (Tabela 3, linha E) mostra resultados quase idênticos, mas sinusoidais foram preferidos por possível extrapolação a sequências mais longas.

## Conexões com o wiki existente

Esta é a primeira fonte ingerida. Ver [[concepts/transformer]], [[concepts/self-attention]], [[concepts/multi-head-attention]], [[concepts/positional-encoding]].

## Questões em aberto

- O Transformer escala bem para sequências muito longas? A complexidade O(n²·d) por camada de self-attention torna-se proibitiva para n grande — o próprio artigo menciona atenção restrita como trabalho futuro.
- Os encodings posicionais sinusoidais realmente extrapolam melhor para sequências mais longas do que os aprendidos? O experimento aqui apenas iguala os resultados, não demonstra superioridade em extrapolação.
- O que acontece com a atenção em modalidades além de texto (imagens, áudio, vídeo)? Os autores indicam isso como direção futura.
- A especialização de heads é estável entre runs? Interpretabilidade de heads individuais é observacional, não garantida.

## Citações notáveis

> "We propose a new simple network architecture, the Transformer, based solely on attention mechanisms, dispensing with recurrence and convolutions entirely." (Abstract)

> "The Transformer allows for significantly more parallelization and can reach a new state of the art in translation quality after being trained for as little as twelve hours on eight P100 GPUs." (§1)

> "Not only do individual attention heads clearly learn to perform different tasks, many appear to exhibit behavior related to the syntactic and semantic structure of the sentences." (§4)
