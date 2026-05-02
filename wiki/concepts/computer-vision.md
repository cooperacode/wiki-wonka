---
title: "Computer Vision (CV)"
slug: computer-vision
type: concept
tags: [computer-vision, cnn, imagem, aws-services, deep-learning]
related_sources: [sources/flashcard-dia-01, sources/flashcard-dia-02]
related_entities: [entities/aws-cv-services]
related_concepts: [concepts/llm, concepts/foundation-model]
---

## Definition

Computer Vision é o domínio da IA que capacita sistemas a interpretar informações visuais — imagens e vídeos — extraindo significado semântico como objetos, rostos, texto, anomalias e relações espaciais.

## How it works

CV moderno é baseado em Redes Neurais Convolucionais (CNNs), que extraem hierarquias de padrões visuais camada a camada: bordas → formas simples → partes → objetos completos. Essa extração automática de features é o que diferencia DL de ML tradicional para dados de imagem.

Para dados de imagem em escala (centenas de milhares+), CNNs ou Vision Transformers (ViT) são preferíveis a algoritmos de ML tradicional (Random Forest, XGBoost), que exigiriam feature engineering manual de textura, bordas e forma.

Serviços AWS para CV:

| Serviço | Função |
|---|---|
| Amazon Rekognition | Detecção de objetos, rostos, cenas, texto em imagens naturais; moderação de conteúdo; PPE |
| Amazon Textract | OCR avançado + extração estruturada de formulários e tabelas em documentos |
| Amazon Lookout for Vision | Detecção de anomalias visuais industriais (controle de qualidade em manufatura) |

Regra de decisão: Rekognition = imagens gerais; Textract = documentos estruturados com campos e tabelas.

## Evidence and claims

[[sources/flashcard-dia-01]] afirma que para 500.000 imagens de raio-X rotuladas, CNN (via Rekognition ou SageMaker) é a escolha correta — não Random Forest, que exigiria feature engineering manual de cada imagem.

[[sources/flashcard-dia-02]] detalha a distinção Rekognition vs Textract: "Textract vai além do OCR: entende formulários (chave-valor) e tabelas."

## Connections

- [[entities/aws-cv-services]] — serviços AWS gerenciados para Computer Vision
- [[concepts/foundation-model]] — modelos multimodais (texto+imagem) expandem CV para geração de imagens

## Open questions

- Vision Transformers (ViT) vs CNNs: qual o estado atual para tarefas de detecção em produção?
- Amazon Lookout for Vision vs fine-tuning de modelos customizados no SageMaker para CV industrial — critério de escolha?
