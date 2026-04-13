---
title: "Hipótese do Usuário Único"
slug: hipotese-usuario-unico
type: concept
tags: [treinamento-llm, sft, rlhf, single-principal, chat-template, limitacao]
related_sources: [sources/multi-user-llm-agents]
related_entities: []
related_concepts: [concepts/multi-principal-agent, concepts/muses-bench]
---

## Definição

A **hipótese do usuário único** é o pressuposto implícito que permeia o treinamento dos LLMs modernos: os dados de treinamento, os objetivos de otimização e os formatos de interação assumem que existe um único usuário cujos objetivos o modelo deve satisfazer. Essa hipótese não é uma decisão de design explícita, mas emerge da estrutura dos pipelines padrão de instrução-tuning e aprendizado por reforço com feedback humano (RLHF).

## Como funciona

Há três mecanismos pelos quais a hipótese se manifesta (segundo [[sources/multi-user-llm-agents]]):

**1. Chat templates de usuário único**
Os templates de instrução-tuning representam a interação como uma sequência de mensagens sob uma única role `user`. Mesmo quando múltiplos usuários participam, seus inputs são **serializados** em uma única role — ex: `"userA says: ... userB says: ..."` — impedindo a modelagem explícita de identidades, papéis e autoridades distintas.

**2. SFT como otimização single-principal**
O fine-tuning supervisionado minimiza a log-verossimilhança negativa sobre pares prompt-resposta de um único usuário, aprendendo uma única distribuição condicional $p_\theta(y \mid x)$. O modelo aprende a gerar "a melhor resposta" para um único contexto — não a arbitrar entre múltiplas utilidades.

**3. RLHF induz uma preferência escalar única**
O modelo de recompensa do RLHF aprende um sinal escalar $r_\phi(x, y) \in \mathbb{R}$ a partir de comparações de pares, onde as labels de preferência refletem o que um usuário "médio" ou agregado consideraria melhor. Isso conflate objetivos específicos de usuários em uma única recompensa compartilhada, tornando impossível para o agente representar múltiplos principais ou raciocinar sobre trade-offs entre eles.

## Evidências e afirmações

[[sources/multi-user-llm-agents]] demonstra empiricamente as consequências dessa hipótese:

- Todos os modelos avaliados, inclusive modelos de fronteira, sofrem degradação sistemática sob cenários multi-principal.
- A simples serialização de múltiplos usuários em um único campo `user` não é suficiente para comportamento robusto.
- Modelos oscilam em priorização sob conflito, sugerindo que não internalizaram hierarquias de autoridade — apenas respondem a pistas superficiais de instrução.

## Conexões

- [[concepts/multi-principal-agent]] — o cenário que a hipótese do usuário único impede de ser suportado nativamente.
- [[concepts/muses-bench]] — benchmark que expõe as falhas decorrentes dessa hipótese.

## Questões em aberto

- Como projetar dados de treinamento que representem nativamente múltiplos usuários com identidades e papéis explícitos?
- É possível corrigir a hipótese via prompting/fine-tuning leve, ou é necessário reformular o pipeline completo de treinamento?
- A hipótese do usuário único é específica a LLMs ou é uma limitação mais ampla de sistemas de agente?
