---
title: "Multi-User Large Language Model Agents"
slug: multi-user-llm-agents
type: source
date_ingested: 2026-04-13
original_file: raw/paper.txt
authors: [Shu Yang, Shenzhe Zhu, Hao Zhu, José Ramón Enríquez, Di Wang, Alex Pentland, Michiel A. Bakker, Jiaxin Pei]
tags: [llm-agents, multi-usuario, multi-principal, benchmarking, privacidade, instrucao-seguimento, coordenacao]
related_concepts: [concepts/multi-principal-agent, concepts/hipotese-usuario-unico, concepts/muses-bench]
related_entities: []
---

## Resumo

Este artigo apresenta o primeiro estudo sistemático de agentes LLM em cenários multi-usuário. Os autores partem de uma constatação estrutural: os LLMs modernos são treinados sob a hipótese de um único usuário — tanto no formato dos dados de treinamento (chat templates com uma única role `user`) quanto nos objetivos de otimização (SFT com uma distribuição condicional única; RLHF com um único sinal escalar de preferência). Essa limitação de treino impede que os modelos representem nativamente múltiplos usuários com identidades, papéis e objetivos distintos.

Para preencher essa lacuna, o artigo formaliza a interação multi-usuário como um **problema de decisão multi-principal**, onde um único agente deve otimizar um objetivo social ponderado sobre as utilidades de N usuários, sujeito a restrições de controle de acesso. Em seguida, propõe um protocolo unificado de interação e um conjunto de testes de stress — o **MUSES-Bench** — com três cenários: seguimento de instruções com conflito de autoridade, controle de acesso entre usuários, e coordenação de agendamento multi-usuário.

Os resultados mostram que mesmo modelos de fronteira (GPT-5.1, Gemini-3-Pro, Claude-Sonnet-4.5) falham de maneira sistemática: a seleção de instruções e a fidelidade de execução são desacopladas, as garantias de privacidade se deterioram ao longo de múltiplos turnos, e a coordenação sob informação incompleta apresenta gargalos persistentes de eficiência.

## Afirmações principais

- LLMs são treinados sob a hipótese de usuário único: chat templates colapsam múltiplos usuários em uma única role `user`; SFT e RLHF supervisionam uma única utilidade agregada.
- A passagem para cenários multi-principal é uma mudança qualitativa no problema, não uma generalização superficial — exige repensar tanto os objetivos de treino quanto os protocolos de avaliação.
- No MUSES-Bench, modelos exibem dissociação entre seleção de instrução e fidelidade de execução: Qwen3-4B-IT seleciona bem (83.8 F1) mas executa mal (57.9 Acc.); Grok-3-Mini executa bem (88.4) mas seleciona mal (68.2).
- A proteção de privacidade deteriora progressivamente com turnos: Claude-3.5-Haiku cai de >0.95 no 1º turno para <0.75 após apenas 4 turnos.
- Coordenação multi-usuário permanece longe de resolvida: até o melhor modelo (Gemini-3-Pro, 64.8% de sucesso) falha em ~35% dos casos; o gargalo principal é reconhecer e solicitar informações faltantes, não raciocínio bruto.
- Modelos que priorizam privacidade tendem a penalizar utilidade (GPT-5.1: Privacy 98.6, Utility 60.3); modelos úteis para usuários autorizados tendem a vazar informações (GPT-OSS-120B: Utility 94.8, Privacy 92.2).

## Conexões com o wiki existente

Este é o primeiro artigo ingerido no wiki. Estabelece as fundações conceituais para [[concepts/multi-principal-agent]], [[concepts/hipotese-usuario-unico]] e [[concepts/muses-bench]].

## Questões em aberto

- Como treinar LLMs com objetivos nativamente multi-principal sem colapsar identidades de usuários?
- Qual é o trade-off fundamental entre privacidade e utilidade em sistemas multi-usuário — é possível otimizá-los conjuntamente?
- Os cenários do MUSES-Bench capturam os padrões de falha que mais importam em implantações reais? Estudos com usuários humanos são necessários.
- Como mecanismos de escolha social (teoria dos jogos, design de mecanismos) podem ser incorporados nos objetivos de resolução de conflitos?
- A deterioração de privacidade em múltiplos turnos é inerente ao mecanismo de atenção ou é um artefato de treinamento corrigível?

## Citações notáveis

> "Extending LLMs from single principal–agent scenarios to genuine multi-principal settings is not a superficial generalization, but a qualitative shift in problem formulation, requiring rethinking both training objectives and evaluation protocols."

> "The presence of inter-user conflict leads to a clear and consistent performance drop [...] these results highlight a fundamental limitation of current models: multi-user instruction following is fragile in the presence of conflict."

> "Multi-user privacy control remains brittle under sustained interaction, and that maintaining long-term privacy consistency is a fundamentally harder problem than passing isolated access-control checks."
