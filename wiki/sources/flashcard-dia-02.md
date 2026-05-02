---
title: "Flashcards — Dia 02: NLP, Computer Vision, LLMs e Serviços AWS"
slug: flashcard-dia-02
type: source
date_ingested: 2026-05-01
original_file: raw/flashcard-dia-02.html
authors: []
tags: [aws-aif-c01, nlp, computer-vision, llm, foundation-model, aws-services, amazon-bedrock, amazon-sagemaker]
related_concepts: [concepts/llm, concepts/foundation-model, concepts/nlp, concepts/computer-vision]
related_entities: [entities/amazon-bedrock, entities/amazon-sagemaker, entities/aws-nlp-services, entities/aws-cv-services]
---

## Summary

Material de estudo em formato flashcard (13 cards) para o exame AWS Certified AI Practitioner (AIF-C01). Cobre domínios aplicados: NLP, Computer Vision, LLMs, Foundation Models e o ecossistema de serviços AWS de IA gerenciada.

O material mapeia de forma sistemática os serviços AWS de NLP (Transcribe, Polly, Translate, Comprehend, Lex) e Computer Vision (Rekognition, Textract, Lookout for Vision) com suas funções específicas, criando regras de decisão claras para cenários de exame. Estabelece distinções conceituais entre algoritmo e modelo, entre LLM e ML tradicional, e entre Foundation Model e LLM.

A comparação central do material é entre Amazon Bedrock (acesso serverless a FMs de terceiros via API) e Amazon SageMaker (plataforma para treinar, ajustar e deployar modelos com controle de infraestrutura). Esta distinção é apresentada como um dos pontos de maior confusão no exame AIF-C01.

## Key claims

- **Algoritmo vs modelo**: algoritmo é a receita (antes/durante treinamento); modelo é o artefato resultante (após treinamento). Inferência é feita com o modelo, não com o algoritmo.
- **LLM vs ML tradicional**: LLMs são multi-tarefa, bilhões–trilhões de parâmetros, treinados em corpus massivo, adaptáveis via prompts/fine-tuning. ML tradicional: tarefa única, dataset específico, re-treino completo para adaptação.
- **Foundation Model é mais amplo que LLM**: LLMs focam em linguagem; FMs incluem modelos multimodais (texto+imagem). LLMs são subconjunto de FMs.
- **Bedrock vs SageMaker**: Bedrock = serverless, acesso a FMs de terceiros, pricing por token, sem gerenciar infraestrutura; SageMaker = controle total, fine-tuning, deploy em instâncias EC2.
- **Textract vs Rekognition**: Textract para documentos estruturados (formulários, tabelas, pares chave-valor); Rekognition para imagens gerais (rostos, objetos, cenas, moderação).
- **SageMaker built-in**: XGBoost → tabulares; K-Means → clustering; Random Cut Forest → anomalias; BlazingText → NLP; Factorization Machines → recomendação.
- **Bedrock Knowledge Bases (RAG)**: para Q&A sobre documentos privados com LLM. Lex não responde perguntas abertas; Comprehend não gera respostas.

## Connections to existing wiki

LLMs são explicitamente descritos como Foundation Models baseados na arquitetura **Transformer** — conexão direta com [[sources/attention-is-all-you-need]]. O Transformer introduzido por Vaswani et al. (2017) é a base arquitetural de Claude, GPT, Llama e Amazon Titan Text, todos acessíveis via Bedrock.

## Open questions

- Amazon Q Business vs Bedrock Knowledge Bases: onde exatamente traçar a linha entre "produto pronto" e "componente para desenvolvedor" em casos reais?
- SageMaker JumpStart vs Bedrock para fine-tuning de modelos open-source — qual critério de escolha além de "controle vs conveniência"?

## Notable quotes

> "Bedrock KB = componente para desenvolvedores; Q Business = produto pronto."

> "Pipeline típico: Textract (extrai texto e estrutura do PDF) → Comprehend (analisa o texto extraído) → banco de dados estruturado."
