---
title: "Visão Geral"
type: overview
last_updated: 2026-04-13
---

# Visão Geral do Wiki

Este wiki documenta e sintetiza conhecimento sobre **agentes LLM em cenários multi-usuário** — um campo emergente que examina como modelos de linguagem se comportam quando precisam servir múltiplos usuários com papéis, objetivos e restrições de privacidade distintos.

---

## Estado atual do conhecimento

### Tese central

Os LLMs modernos são estruturalmente inadequados para cenários multi-usuário porque foram treinados sob a **hipótese do usuário único**: dados de instrução-tuning, objetivos SFT e pipelines RLHF assumem um único usuário cujos objetivos o modelo deve satisfazer. Essa não é uma limitação superficial corrigível por prompting — é uma limitação de formulação que exige repensar objetivos de treinamento e protocolos de avaliação.

### O que os modelos atuais conseguem fazer

Modelos de fronteira (Gemini-3-Pro, Claude-Sonnet-4.5, GPT-5.1) demonstram alguma capacidade out-of-the-box para lidar com cenários multi-principal — provavelmente por exposição incidental a dados com múltiplos interlocutores durante pré-treinamento. Gemini-3-Pro atinge 85.6% de média no MUSES-Bench.

### O que os modelos ainda não conseguem fazer

Três falhas sistemáticas emergem consistentemente em todos os modelos avaliados:

1. **Instrução sob conflito:** seleção e execução de instruções são dissociadas. Modelos não internalizam hierarquias de autoridade de forma robusta — dependem de pistas superficiais que falham sob pressão de conflito.
2. **Privacidade multi-turno:** proteção de acesso se deteriora progressivamente ao longo de interações. Manter consistência de privacidade em longo prazo é fundamentalmente mais difícil do que passar verificações isoladas.
3. **Coordenação sob incerteza:** o gargalo não é capacidade de raciocínio, mas eficiência em reconhecer e solicitar informações faltantes de múltiplos participantes.

---

## Tensões em aberto

- **Privacidade vs. utilidade:** modelos que maximizam privacidade tendem a ser menos úteis para usuários autorizados, e vice-versa. Nenhum modelo avaliado otimiza os dois simultaneamente.
- **Treinamento vs. prompting:** não está claro se as falhas observadas são corrigíveis com fine-tuning leve sobre dados multi-usuário, ou se exigem reformulação completa dos objetivos de otimização.
- **Simulação vs. realidade:** todos os resultados do MUSES-Bench usam usuários simulados. A validade ecológica dos cenários — se capturam os padrões de falha que mais importam em implantações reais — permanece em aberto.

---

## Contribuições por fonte

### [[sources/multi-user-llm-agents]] (Yang et al., 2025)

Estabelece as fundações do campo: formalização do problema multi-principal, protocolo de interação unificado, benchmark MUSES-Bench com três cenários de stress-test, e avaliação empírica de 19 modelos (12 proprietários + 7 open-weight). É o primeiro estudo sistemático do tema e define os conceitos centrais do wiki.
