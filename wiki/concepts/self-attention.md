---
title: "Self-Attention"
slug: self-attention
type: concept
tags: [atenção, mecanismo, nlp, representação]
related_sources: [sources/attention-is-all-you-need]
related_entities: [entities/vaswani-et-al]
related_concepts: [concepts/transformer, concepts/multi-head-attention, concepts/positional-encoding]
---

## Definição

Self-attention (também chamada de intra-attention) é um mecanismo de atenção que relaciona diferentes posições de uma única sequência para computar uma representação dela. Diferentemente da atenção encoder-decoder clássica (que cruza duas sequências), self-attention opera dentro da mesma sequência, permitindo que cada posição "consulte" todas as demais.

## Como funciona

A self-attention no Transformer usa **Scaled Dot-Product Attention**:

```
Attention(Q, K, V) = softmax(QKᵀ / √d_k) · V
```

- **Q** (queries), **K** (keys), **V** (values) são projeções lineares da entrada.
- O fator de escala 1/√d_k evita que o produto interno cresça em magnitude para grandes d_k, o que empurraria o softmax para regiões de gradiente muito pequeno.
- No decoder, mascaramento (setting para −∞ antes do softmax) impede que posições atendam a posições futuras, preservando a propriedade auto-regressiva.

**Por que escalar?** Para componentes de q e k com média 0 e variância 1, o produto interno tem variância d_k. Sem escala, o softmax fica saturado para d_k grande, produzindo gradientes minúsculos.

**Complexidade por camada:** O(n²·d) — quadrático no comprimento da sequência. Comparado a RNNs (O(n·d²)) e convoluções (O(k·n·d²)), self-attention é mais rápida quando n < d (comum em tradução com representações word-piece/BPE).

**Comprimento do caminho máximo:** O(1) — qualquer duas posições se comunicam em uma única operação de atenção, facilitando o aprendizado de dependências de longo alcance.

## Evidências e alegações

De [[sources/attention-is-all-you-need]]:
- Self-attention conecta todas as posições com número constante de operações sequenciais — O(1) vs. O(n) de RNNs.
- Atenção restrita a vizinhança de tamanho r aumenta o caminho máximo para O(n/r), útil para sequências muito longas.
- Visualizações (Figuras 3–5) mostram que diferentes heads de self-attention capturam estruturas distintas: dependências de longa distância do verbo 'making', resolução de anáfora para 'its', e padrões estruturais da frase.

## Conexões

- [[concepts/multi-head-attention]] — extensão com múltiplas projeções paralelas
- [[concepts/transformer]] — contexto arquitetural onde self-attention é aplicada
- [[concepts/positional-encoding]] — complemento necessário, pois self-attention é invariante à permutação

## Questões em aberto

- Self-attention não tem noção de ordem posicional — ela é invariante à permutação das posições. Encodings posicionais são um paliativo; alternativas mais integradas são área de pesquisa ativa.
- A complexidade quadrática é o principal limitante para documentos longos.
