---
title: "Multi-Head Attention"
slug: multi-head-attention
type: concept
tags: [atenção, mecanismo, nlp, representação, paralelismo]
related_sources: [sources/attention-is-all-you-need]
related_entities: [entities/vaswani-et-al]
related_concepts: [concepts/transformer, concepts/self-attention]
---

## Definição

Multi-Head Attention é uma extensão da atenção scaled dot-product que aplica h projeções lineares aprendidas em paralelo sobre queries, keys e values, executa atenção em cada "cabeça" (head) independentemente, e concatena os resultados. Isso permite ao modelo atender simultaneamente a informações de diferentes subespaços de representação em diferentes posições.

## Como funciona

```
MultiHead(Q, K, V) = Concat(head₁, ..., headₕ) · Wᴼ
onde headᵢ = Attention(QWᵢᴼ, KWᵢᴷ, VWᵢᵛ)
```

Parâmetros no Transformer base:
- h = 8 cabeças paralelas
- d_model = 512, portanto d_k = d_v = d_model/h = 64
- Matrizes de projeção: Wᵢᴼ ∈ ℝ^(d_model × d_k), Wᵢᴷ ∈ ℝ^(d_model × d_k), Wᵢᵛ ∈ ℝ^(d_model × d_v)
- Wᴼ ∈ ℝ^(hd_v × d_model)

Como d_k = d_model/h, o custo computacional total é similar ao de atenção single-head com dimensionalidade completa.

O Transformer usa multi-head attention em três papéis distintos:
1. **Encoder self-attention** — todas as posições atendem a todas as posições da camada anterior do encoder.
2. **Decoder self-attention mascarada** — cada posição atende a todas as posições até e incluindo ela mesma.
3. **Cross-attention encoder-decoder** — queries vêm do decoder, keys e values vêm da saída do encoder.

## Evidências e alegações

De [[sources/attention-is-all-you-need]]:
- Single-head attention com mesma dimensionalidade é 0,9 BLEU pior que o melhor setting (Tabela 3, linha A, h=1 vs. h=8).
- Muito mais cabeças (h=32 com d_k=16) também degrada — sugerindo que a relação d_k/d_model é importante.
- Visualizações confirmam que heads diferentes especializaram-se em tarefas diferentes (anáfora, dependências sintáticas de longo alcance, estrutura local).

## Conexões

- [[concepts/self-attention]] — mecanismo base que cada head executa
- [[concepts/transformer]] — contexto arquitetural

## Questões em aberto

- O número ótimo de heads parece depender da tarefa e do tamanho do modelo — não há teoria que preveja h ideal.
- Heads individuais são interpretáveis em exemplos curados, mas a análise sistemática de interpretabilidade de heads é área de pesquisa em aberto.
