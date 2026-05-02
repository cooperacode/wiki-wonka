---
title: "Serviços AWS de NLP"
slug: aws-nlp-services
type: entity
subtype: product
tags: [aws, nlp, transcribe, polly, translate, comprehend, lex]
related_sources: [sources/flashcard-dia-02]
related_concepts: [concepts/nlp]
---

## Descrição

Conjunto de serviços gerenciados da AWS para tarefas de Processamento de Linguagem Natural. Cada serviço resolve uma tarefa específica; confundi-los é uma das armadilhas mais comuns do exame AIF-C01.

## Serviços

### Amazon Transcribe
**Voz → Texto** (speech-to-text). Transcreve áudio de reuniões, chamadas, podcasts. Suporta múltiplos idiomas, identificação de falantes (speaker diarization) e vocabulários customizados.

### Amazon Polly
**Texto → Voz** (text-to-speech). Converte texto em fala sintética. Vozes neurais (NTTS) com prosódia natural. Mnemônico: Polly = papagaio (fala).

### Amazon Translate
**Tradução automática** entre idiomas. Suporta tradução em tempo real e em batch. Integrado com outros serviços AWS para pipelines multilíngues.

### Amazon Comprehend
**Analisa texto existente**. Não gera texto — extrai informação de texto fornecido:
- Análise de sentimento (positivo/negativo/neutro/misto)
- NER — entidades nomeadas (pessoas, locais, datas, organizações)
- Detecção e mascaramento de PII (dados pessoais)
- Classificação customizada de documentos
- Detecção de idioma

### Amazon Lex
**Chatbot com NLU e gerenciamento de diálogo**. Entende intenção do usuário (NLU), extrai slots (parâmetros) e gerencia o fluxo da conversa. Usa a tecnologia da Alexa. Casos: atendimento ao cliente, IVR, reservas.

## Regra de diferenciação Comprehend vs Lex

| | Comprehend | Lex |
|---|---|---|
| O que faz | Analisa texto existente | Conversa com usuário |
| Output | Entidades, sentimento, PII | Resposta no diálogo |
| Estado | Stateless | Stateful (gerencia turno) |
| Uso típico | Análise de reviews, compliance | Chatbot, assistente virtual |

## Pipeline típico de integração

Textract (extrai texto de PDF) → Comprehend (analisa conteúdo) → banco de dados ou dashboard.

## Evidence and claims

[[sources/flashcard-dia-02]] fornece mnemônico e tabela de diferenciação. Lex não responde perguntas abertas sobre documentos — para isso usar [[entities/amazon-bedrock]] Knowledge Bases (RAG).
