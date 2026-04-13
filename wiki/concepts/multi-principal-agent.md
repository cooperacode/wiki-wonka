---
title: "Cenário Multi-Principal–Agente"
slug: multi-principal-agent
type: concept
tags: [multi-usuario, teoria-do-agente, decisao, conflito, utilidade]
related_sources: [sources/multi-user-llm-agents]
related_entities: []
related_concepts: [concepts/hipotese-usuario-unico, concepts/muses-bench]
---

## Definição

O **cenário multi-principal–agente** descreve uma configuração em que um único agente (no contexto de LLMs, um modelo de linguagem) deve servir múltiplos usuários simultaneamente, cada um atuando como um principal independente com objetivos, papéis, níveis de autoridade e contextos privados distintos. Contrasta com o cenário single-principal–agente — predominante no treinamento dos LLMs atuais — onde o agente otimiza a utilidade de um único usuário.

## Como funciona

Formalmente (segundo [[sources/multi-user-llm-agents]]), dado um conjunto de usuários $\mathcal{U} = \{u_1, \ldots, u_N\}$, cada usuário $u_i$ é caracterizado por:

- **Persona de autoridade** $p_i$: nível de privilégio do usuário, sempre visível ao agente.
- **Contexto privado** $C_i$: informações sensíveis do usuário, visíveis ao agente apenas quando compartilhadas explicitamente.
- **Função de utilidade** $U_i$: captura sucesso na tarefa, preservação de privacidade e satisfação de preferências.

O agente otimiza um **objetivo social ponderado**:

$$\max_{a \in \mathcal{A}} \sum_{i=1}^{N} w_i \, U_i(a; C_i, p_i)$$

onde $w_i \geq 0$ é um peso de prioridade baseado no papel ou autoridade do usuário. A otimização é sujeita a restrições de controle de acesso que limitam o que pode ser revelado a cada usuário.

Os três desafios estruturais que emergem nesse cenário são:

1. **Modelagem de papel e preferência:** o agente deve identificar quem fala, o que cada usuário quer e quais restrições se aplicam.
2. **Assimetria de informação e visibilidade seletiva:** cada usuário tem um contexto privado com escopo de permissão. O agente media o acesso sem violar privacidade.
3. **Resolução de conflitos:** quando objetivos são incompatíveis, o agente precisa arbitrar com base em hierarquia de autoridade e objetivos globais — mecanismo ausente no treinamento padrão.

## Evidências e afirmações

Segundo [[sources/multi-user-llm-agents]], os LLMs atuais falham sistematicamente em todos os três desafios:

- Seleção e execução de instruções são dissociadas sob conflito.
- Proteção de privacidade deteriora progressivamente em interações multi-turno.
- Coordenação sob informação parcial apresenta gargalos de eficiência persistentes.

A transição do cenário single para multi-principal é descrita como "uma mudança qualitativa no problema, não uma generalização superficial."

## Conexões

- [[concepts/hipotese-usuario-unico]] — o pressuposto de treinamento que impede LLMs de nativamente suportar cenários multi-principal.
- [[concepts/muses-bench]] — o benchmark que stress-testa modelos nesse cenário.

## Questões em aberto

- Como incorporar objetivos de escolha social (ex: bem-estar de Rawls, utilitarismo) nos objetivos de treinamento de LLMs multi-principal?
- É possível treinar agentes que internalizem hierarquias de autoridade sem overfitting a estruturas específicas de papel?
- Qual é o limite teórico de desempenho sob conflito irresolúvel de utilidades?
