---
title: "Processamento de Linguagem Natural (NLP)"
slug: nlp
type: concept
tags: [nlp, linguagem, text-mining, aws-services]
related_sources: [sources/flashcard-dia-02]
related_entities: [entities/aws-nlp-services]
related_concepts: [concepts/llm, concepts/foundation-model]
---

## Definition

Natural Language Processing (NLP) é o domínio da IA que habilita sistemas a compreender, interpretar e gerar linguagem humana. Abrange desde tarefas clássicas (classificação de texto, análise de sentimento) até geração de linguagem natural por LLMs.

## How it works

NLP opera sobre texto ou fala como entrada. As abordagens evoluíram de sistemas baseados em regras e estatística (n-gramas, TF-IDF, bag-of-words) para embeddings (Word2Vec, GloVe) e atualmente para Transformers e LLMs que processam texto como sequências de tokens.

Principais tarefas e serviços AWS correspondentes:

| Tarefa | Descrição | Serviço AWS |
|---|---|---|
| Speech-to-Text | Voz → texto | Amazon Transcribe |
| Text-to-Speech | Texto → voz | Amazon Polly |
| Tradução | Idioma A → idioma B | Amazon Translate |
| Análise de sentimento / NER / PII | Analisa texto existente | Amazon Comprehend |
| Chatbot / NLU | Entende intenção, gerencia diálogo | Amazon Lex |
| Sumarização / Q&A / Geração | Geração de linguagem natural | Amazon Bedrock |

## Evidence and claims

[[sources/flashcard-dia-02]] define NLP e mapeia cada serviço AWS a sua função. Comprehend e Lex são frequentemente confundidos no exame: Comprehend *analisa* texto existente; Lex *conversa* com usuário gerenciando fluxo de diálogo.

## Connections

- [[entities/aws-nlp-services]] — todos os serviços AWS de NLP gerenciados
- [[concepts/llm]] — LLMs representam o estado da arte em NLP, especialmente para geração e Q&A
- [[entities/amazon-bedrock]] — plataforma para acesso a LLMs com capacidades avançadas de NLP

## Open questions

- Como o emergência de LLMs reposiciona serviços como Comprehend e Lex — substituição, complemento ou nicho específico?
