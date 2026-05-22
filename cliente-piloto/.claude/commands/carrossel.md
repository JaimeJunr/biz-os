---
description: Gera carrossel para Instagram respeitando tom de voz e identidade visual da marca
argument-hint: "<tema do carrossel> [--slides=8] [--objetivo=educar|vender|prova-social]"
---

# /carrossel — Carrossel de Instagram on-brand

Tema/objetivo passado pelo usuário: **$ARGUMENTS**

## Passo a passo

1. **Carregue contexto obrigatório (nesta ordem):**
   - `.agents/product-marketing.md` — fundamento (audiência, voz, proof points). Schema oficial usado por todas as skills do `coreyhaines31/marketingskills`.
   - `CLAUDE.md` raiz — camada operacional (decisor, regras, status).
   - `identidade/guidelines.md` — paleta, tipografia, exemplos visuais.
   - Último arquivo em `marketing/carrosseis/` como referência de estilo.

2. **Delegue à skill `social`** do plugin `coreyhaines31/marketingskills` para a estrutura do roteiro (ela já está calibrada para Instagram/LinkedIn). Use a skill `copywriting` para refinar os títulos.

3. **Confirme briefing (1 mensagem só, se faltar dado):**
   - Slides (default 8, range 6-10)
   - Objetivo: educar / vender / prova social / autoridade
   - CTA final
   - Algum dado/número específico a usar? (NÃO invente — só use o que estiver em `dados/historico/`)

4. **Estrutura padrão dos slides:**
   - Slide 1: gancho/dor (título grande)
   - Slides 2 a N-2: desenvolvimento (1 ideia por slide, máx 25 palavras)
   - Slide N-1: prova social ou síntese
   - Slide N: CTA claro

4. **Saída em DOIS formatos:**
   - **Markdown** em `marketing/carrosseis/YYYY-MM-DD-<slug>.md` com:
     - Front-matter (tema, objetivo, data, slides)
     - Roteiro slide-a-slide (título + corpo + nota de design)
     - Legenda do post (até 2200 chars) com 5-8 hashtags relevantes
     - 3 variações de primeiro comentário (pin)
   - **HTML/SVG** em `marketing/carrosseis/YYYY-MM-DD-<slug>/` com 1 arquivo por slide (1080x1350), usando a skill `frontend-design` e a paleta de `identidade/guidelines.md`.

5. **Checklist de qualidade antes de entregar:**
   - [ ] Tom de voz bate com `CLAUDE.md` seção 2?
   - [ ] Zero números/depoimentos inventados?
   - [ ] CTA único e claro?
   - [ ] Slide 1 funciona como thumb (legível em 200px)?
   - [ ] Hashtags são do nicho, não genéricas?

6. **Não publique nada.** A regra inviolável é: decisor aprova antes de qualquer post sair.
