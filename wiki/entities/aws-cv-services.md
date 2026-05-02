---
title: "Serviços AWS de Computer Vision"
slug: aws-cv-services
type: entity
subtype: product
tags: [aws, computer-vision, rekognition, textract, lookout-for-vision]
related_sources: [sources/flashcard-dia-02]
related_concepts: [concepts/computer-vision]
---

## Descrição

Conjunto de serviços gerenciados da AWS para tarefas de Computer Vision. A distinção entre Rekognition e Textract é ponto frequente de exame — ambos analisam imagens, mas para fins completamente diferentes.

## Serviços

### Amazon Rekognition
**Análise de imagens e vídeos gerais**. Não requer treinamento — modelo pré-treinado pela AWS:
- Detecção e reconhecimento de rostos (identidade, emoção, atributos)
- Detecção de objetos, cenas e atividades
- Texto em imagens naturais (placas, faixas)
- Moderação de conteúdo (violência, nudez)
- Reconhecimento de celebridades
- Detecção de PPE (equipamentos de proteção individual)
- Análise de vídeo em tempo real ou batch

Casos: segurança física, moderação de conteúdo, contagem de pessoas, compliance de segurança.

### Amazon Textract
**OCR avançado + extração estruturada de documentos**. Va além do OCR simples — entende a *estrutura* do documento:
- Pares chave-valor em formulários (ex: "Nome: João Silva")
- Tabelas com linhas e colunas
- Assinaturas
- Documentos de identidade (passaporte, CNH)

Casos: digitalização de faturas, contratos, formulários médicos, dados fiscais, documentos de RH.

### Amazon Lookout for Vision
**Detecção de anomalias visuais industriais**. Treinado com imagens de produtos conformes para detectar defeitos (arranhões, rachaduras, peças faltantes) em linha de produção. Casos: controle de qualidade em manufatura.

## Regra de diferenciação Rekognition vs Textract

| | Rekognition | Textract |
|---|---|---|
| Tipo de imagem | Fotos naturais, vídeos | Documentos escaneados / PDFs |
| O que detecta | Objetos, rostos, cenas | Texto estruturado, formulários, tabelas |
| Feature engineering | Nenhum | Nenhum |
| Caso típico | Moderação, segurança | Digitalização de documentos |

## Evidence and claims

[[sources/flashcard-dia-02]]: para 100.000 faturas em PDF → Textract (não Rekognition nem Comprehend). Pipeline: Textract extrai texto/estrutura → Comprehend analisa conteúdo → banco estruturado.
