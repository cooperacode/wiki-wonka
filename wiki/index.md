# Index

_14 páginas em 2 fontes, 4 entidades, 6 conceitos. Última atualização: 2026-05-01._

## Sources

- [Attention Is All You Need](sources/attention-is-all-you-need.md) — Vaswani et al. (2017); introduz o Transformer, arquitetura seq2seq baseada exclusivamente em atenção.
- [Flashcards — Dia 01: AI, ML, Deep Learning e Redes Neurais](sources/flashcard-dia-01.md) — Material de estudo AIF-C01; fundamentos de ML, DL, redes neurais, overfitting, pipeline de dados.
- [Flashcards — Dia 02: NLP, Computer Vision, LLMs e Serviços AWS](sources/flashcard-dia-02.md) — Material de estudo AIF-C01; NLP, CV, LLMs, Foundation Models, Bedrock, SageMaker.

## Entities

- [Vaswani et al. (Transformer team)](entities/vaswani-et-al.md) — Oito pesquisadores do Google Brain, Google Research e U. of Toronto; autores do Transformer original.
- [Amazon Bedrock](entities/amazon-bedrock.md) — Serviço serverless AWS para acesso a Foundation Models via API; RAG, Agents, Guardrails.
- [Amazon SageMaker](entities/amazon-sagemaker.md) — Plataforma AWS de ML para treinar, ajustar e deployar modelos; algoritmos built-in, JumpStart.
- [Serviços AWS de NLP](entities/aws-nlp-services.md) — Transcribe, Polly, Translate, Comprehend, Lex — funções e distinções.
- [Serviços AWS de Computer Vision](entities/aws-cv-services.md) — Rekognition, Textract, Lookout for Vision — funções e distinções.

## Concepts

- [Transformer](concepts/transformer.md) — Arquitetura encoder-decoder baseada exclusivamente em atenção e FFN; base de LLMs modernos.
- [Self-Attention](concepts/self-attention.md) — Mecanismo de atenção intra-sequência com O(1) operações sequenciais e O(n²·d) por camada.
- [Multi-Head Attention](concepts/multi-head-attention.md) — Extensão com h projeções paralelas; permite atenção simultânea a múltiplos subespaços.
- [Positional Encoding](concepts/positional-encoding.md) — Encodings sinusoidais somados aos embeddings para suprir invariância posicional da self-attention.
- [Paradigmas de Aprendizado de ML](concepts/learning-paradigms.md) — Supervisionado, não-supervisionado e por reforço; regras de decisão para escolha.
- [Overfitting e Underfitting](concepts/overfitting-underfitting.md) — Diagnóstico e soluções para os dois modos de falha de generalização.
- [Large Language Models (LLMs)](concepts/llm.md) — Modelos multi-tarefa baseados em Transformer; diferenças vs ML tradicional.
- [Foundation Models (FMs)](concepts/foundation-model.md) — Modelos treinados em escala para múltiplas tarefas downstream; LLMs são subconjunto.
- [Processamento de Linguagem Natural (NLP)](concepts/nlp.md) — Domínio de IA para compreender e gerar linguagem; tarefas e serviços AWS.
- [Computer Vision (CV)](concepts/computer-vision.md) — Domínio de IA para interpretar imagens e vídeos; CNNs, serviços AWS.
