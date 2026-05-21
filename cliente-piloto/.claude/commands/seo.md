---
description: Auditoria SEO on-page + plano de otimização para URLs do cliente
argument-hint: "<url ou caminho da página> [--modo=auditar|otimizar|brief]"
---

# /seo — SEO on-page

Alvo: **$ARGUMENTS**

## Passo a passo

1. **Contexto:** `.agents/product-marketing.md` (foundation — todas as skills SEO do Corey leem isso), `CLAUDE.md` (operacional), `branding/guidelines.md` (tom).

2. **Delegue às skills do `coreyhaines31/marketingskills`:**
   - `seo-audit` — auditoria estrutural completa
   - `schema` — verifica/gera schema.org
   - `site-architecture` — se a análise envolver várias páginas
   - `ai-seo` — otimização para aparecer em ChatGPT/Perplexity (rodar junto sempre)
   - `content-strategy` — se modo `--brief`

2. **Coleta:**
   - Se for URL: use MCP `fetch` para baixar o HTML.
   - Se for arquivo local em `site/`: leia direto.
   - Extraia: `<title>`, meta description, H1-H3, alt de imagens, schema.org, canonical, hreflang, links internos/externos, contagem de palavras.

3. **Auditoria — gere `marketing/conteudo/seo/<slug>-audit.md`:**

   ```
   URL: ...
   Data: AAAA-MM-DD

   ## Quick wins (impacto alto, esforço baixo)
   - [ ] ...

   ## Estrutura
   - Title atual (XX chars): "..."
   - Title sugerido (≤60 chars): "..."
   - Meta description atual (XX chars): "..."
   - Meta description sugerida (≤155 chars): "..."
   - H1 atual: "..."
   - H1 sugerido: "..."

   ## Conteúdo
   - Palavra-chave principal detectada: ...
   - Densidade: X%
   - Intent (informacional/transacional/navegacional): ...
   - Lacunas vs intent: ...

   ## Técnico
   - [ ] canonical correto
   - [ ] schema.org adequado (Product / LocalBusiness / Article)
   - [ ] alt em todas as imagens
   - [ ] links internos relevantes (≥3)
   - [ ] mobile-friendly
   - [ ] Core Web Vitals (pedir ao usuário rodar PageSpeed se não tiver acesso)

   ## Plano priorizado
   1. ...
   2. ...
   3. ...
   ```

4. **Se `--modo=otimizar`:** aplique as mudanças no arquivo de `site/` correspondente e mostre o diff. Não publique.

5. **Se `--modo=brief`:** gere um briefing de conteúdo novo (não auditoria) com outline H2/H3, intent, palavras-chave secundárias, perguntas-PAA, FAQs sugeridas.

6. **Regras:**
   - Não inventar volume de busca — se não tiver dado real, diga "estimativa qualitativa".
   - Manter tom do cliente.
   - Sem black-hat (cloaking, keyword stuffing, links comprados).
