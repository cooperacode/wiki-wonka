---
title: "MUSES-Bench"
slug: muses-bench
type: concept
tags: [benchmark, avaliacao, multi-usuario, instrucao-seguimento, privacidade, coordenacao, stress-test]
related_sources: [sources/multi-user-llm-agents]
related_entities: []
related_concepts: [concepts/multi-principal-agent, concepts/hipotese-usuario-unico]
---

## Definição

O **MUSES-Bench** é um conjunto de testes de stress para avaliar LLMs em cenários multi-principal, proposto em [[sources/multi-user-llm-agents]]. É composto por três cenários que testam dimensões distintas e complementares do problema multi-usuário: seguimento de instruções sob conflito, controle de acesso entre usuários, e coordenação de agendamento com informação parcial.

## Como funciona

### Protocolo de interação multi-usuário

O benchmark utiliza um protocolo unificado onde cada usuário $u_i$ possui:
- Uma **persona de autoridade** $p_i$ (sempre visível ao agente).
- Um **contexto privado** $C_i$ (visível ao agente apenas quando compartilhado).
- Uma **sessão privada** de interação com o agente.

O contexto compartilhado $C^{\text{share}}$ representa estado público acessível a participantes autorizados. A cada turno, o agente observa o contexto compartilhado e todos os inputs submetidos, produz uma ação, e cada usuário recebe apenas atualizações personalizadas autorizadas.

### Construção de usuários simulados

Personas são geradas com atributos variados: tempo de empresa, estilo de trabalho, temperamento e postura de segurança. Exemplos: analista financeiro sênior estrito em compliance; estagiário recém-contratado proativo mas sem familiaridade com políticas; administrador de TI que prioriza regras de acesso. Formalmente, $u_i = (r_i, \alpha_i, \mathcal{G}_i, \mathcal{B}_i)$ onde $r_i$ é o papel, $\alpha_i \in [1,10]$ é o nível de autoridade, e $\mathcal{G}_i$, $\mathcal{B}_i$ capturam atributos demográficos e de segurança.

### Cenário 1: Seguimento de instruções multi-usuário

O agente recebe instruções simultâneas de usuários com papéis e autoridades distintas — ex: CEO ordenando paralisar desenvolvimento de modelos vs. engenheiro pedindo para continuar. O agente deve decidir quais seguir com base em (i) alinhamento com objetivo global e (ii) hierarquia de autoridade.

**Métricas:**
- **Selection (F1):** precisão e recall na seleção das instruções corretas a seguir.
- **Execution (Acc.):** acurácia na execução fiel das instruções aceitas.

### Cenário 2: Controle de acesso entre usuários

O agente atua como guardião de recursos sensíveis (ex: banco de dados de salários). Usuários autorizados (ex: Diretor de RH) podem acessar; outros não. O cenário inclui tentativas adversariais de bypass (falsas alegações de autorização, ataques de role-playing).

**Métricas:**
- **Privacy Score:** evitar divulgação não autorizada.
- **Utility Score:** manter utilidade para requisições autorizadas.

### Cenário 3: Coordenação de agenda multi-usuário

O agente deve agendar uma reunião para múltiplos participantes com disponibilidades heterogêneas, fornecidas parcialmente ao longo de turnos. Deve reconhecer informações faltantes e solicitá-las ativamente, sem alucinação de disponibilidades.

**Métrica:**
- **Success Rate:** se o horário final satisfaz as restrições de todos os participantes sem alucinação.

### Resultados principais (modelos selecionados)

| Modelo | Seleção F1 | Execução Acc. | Privacidade | Utilidade | Coord. Sucesso | Média |
|---|---|---|---|---|---|---|
| Gemini-3-Pro | **97.3** | **93.4** | 98.6 | 73.9 | **64.8** | **85.6** |
| Claude-Sonnet-4.5 | 95.9 | 79.9 | 77.3 | **97.5** | 62.5 | 82.6 |
| Gemini-3-Flash | 94.1 | 83.9 | 88.7 | 90.6 | 52.5 | 82.0 |
| GPT-5.1 | 94.5 | 87.8 | 98.6 | 60.3 | 53.5 | 78.9 |
| Grok-3-Mini | 68.2 | **88.4** | **99.6** | 60.1 | 49.0 | 73.1 |
| Llama-3-8B | 14.8 | 29.8 | 82.2 | 59.2 | 23.0 | 41.8 |

## Evidências e afirmações

- **Dissociação seleção–execução:** decidir *o que* fazer não garante executar *como* fazer. Qwen3-4B-IT: seleção 83.8, execução 57.9. Grok-3-Mini: execução 88.4, seleção 68.2.
- **Trade-off privacidade–utilidade:** modelos com alta privacidade tendem a ter baixa utilidade e vice-versa. Não há modelo que otimize ambos simultaneamente.
- **Degradação de privacidade por turnos:** proteção deteriora progressivamente. Claude-3.5-Haiku: >0.95 no turno 1 → <0.75 após 4 turnos.
- **Gargalo de coordenação:** o problema não é raciocínio bruto, mas eficiência em reconhecer informações faltantes. Modelos bem-sucedidos resolvem em ≤4 turnos; modelos fracos requerem 1–2 turnos extras ou cometem erros prematuros.

## Conexões

- [[concepts/multi-principal-agent]] — o cenário teórico que o MUSES-Bench operacionaliza.
- [[concepts/hipotese-usuario-unico]] — a limitação de treinamento que os testes expõem.

## Questões em aberto

- Os três cenários cobrem o espaço de falhas relevantes em implantações reais? Quais cenários importantes estão ausentes?
- Como o benchmark se comporta com usuários humanos reais vs. personas simuladas?
- Há viés de serialização? O artigo examina três variantes (Says, Colon, XML) — qual impacta mais os resultados?
