---
description: Cria campanha Meta Ads (Facebook + Instagram) via MCP meta-ads
argument-hint: "<produto ou objetivo> [--orcamento=XXX/dia] [--objetivo=leads|vendas|trafego]"
---

# /anuncio-meta — Campanha Meta Ads (FB + IG)

Briefing: **$ARGUMENTS**

## Passo a passo

1. **Contexto:** `CLAUDE.md`, `branding/guidelines.md`, `memory/historico/`.

2. **Pergunte o que faltar:** orçamento diário, objetivo (leads/vendas/tráfego), pixel/CAPI ativo?, URL ou form, localização, idade/gênero do público.

3. **Estrutura em `marketing/ads/meta/YYYY-MM-DD-<slug>.md`:**

   ```
   Campanha: <nome>
   Objetivo: Leads / Vendas / Tráfego / Engajamento
   Orçamento: R$ XX/dia (ABO ou CBO)
   Otimização: Conversões / Lead Form / Mensagens

   Conjuntos de anúncios:
     - <Público 1> (interesses)
     - <Público 2> (lookalike 1% se houver base)
     - <Público 3> (remarketing 30/60/90d)

   Criativos (3 por conjunto):
     - Variação A: imagem estática + título + corpo + CTA
     - Variação B: vídeo curto (roteiro 15s)
     - Variação C: carrossel (reaproveitar /carrossel se existir)

   Copy (siga tom de CLAUDE.md):
     - Hook (1ª linha): ...
     - Corpo (até 125 chars visíveis): ...
     - CTA: ...
   ```

4. **Use o MCP `meta-ads`** (já declarado em `.claude/settings.json`) para:
   - Listar conjuntos de anúncios atuais antes de criar novos (evita duplicidade)
   - Sugerir orçamento com base no histórico de CPL/CPA do ad account
   - **NÃO crie nada de fato** sem o usuário aprovar explicitamente; primeiro mostre o plano em markdown.

5. **Regras invioláveis:**
   - Sem categorias especiais (crédito/imóveis/emprego) mal configuradas — pergunte se aplica.
   - Sem promessa de resultado.
   - LGPD: form de lead com aviso de privacidade obrigatório.

6. **Checklist:**
   - [ ] Pixel + CAPI confirmados?
   - [ ] 3+ criativos por conjunto?
   - [ ] Públicos não se canibalizam?
   - [ ] UTMs preenchidas (`utm_source=meta&utm_campaign=<slug>`)
