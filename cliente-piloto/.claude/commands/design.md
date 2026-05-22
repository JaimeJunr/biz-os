---
description: Orquestra a stack de design (Anthropic Design + Frontend Design + UI UX Pro Max) on-brand
argument-hint: "<o que voce quer> [--modo=critique|criar|a11y|copy|handoff|research]"
---

# /design — Stack de design unificada

Briefing: **$ARGUMENTS**

## Stack disponível

| Modo | Skill primária | Quando usar |
|---|---|---|
| `critique` | `design-critique` (Anthropic Design) | Revisar mockup/screenshot, achar problemas de usabilidade e consistência |
| `criar` | `frontend-design` (Anthropic, 760k+ installs) + `ui-ux-pro-max-skill` (81k+ stars) | Gerar componente, página, landing — código pronto |
| `a11y` | `accessibility-review` (Anthropic Design) | Auditoria WCAG 2.1 AA |
| `copy` | `ux-copy` (Anthropic Design) + `copywriting` (Corey) | Microcopy, erros, empty states, CTAs |
| `handoff` | `design-handoff` (Anthropic Design) | Spec para desenvolvedor (tokens, breakpoints, estados) |
| `research` | `research-synthesis` (Anthropic Design) + `customer-research` (Corey) | Sintetizar entrevistas, tickets, NPS |

## Passo a passo

1. **Contexto obrigatório (nesta ordem):**
   - `.agents/product-marketing.md` — persona, voz, posicionamento
   - `CLAUDE.md` raiz — decisor, regras
   - `identidade/guidelines.md` — paleta, tipografia, voz visual

2. **Roteie pelo `--modo`:**
   - Se não foi passado, infira do briefing e confirme com o usuário em 1 mensagem.
   - Delegue à skill primária do modo. Combine com a secundária quando útil.

3. **Para `--modo=criar`:**
   - Use `ui-ux-pro-max-skill` para escolher o estilo (entre os 67) que casa com `identidade/guidelines.md`.
   - Use `frontend-design` para gerar o código (HTML/React + Tailwind, evita estética AI genérica).
   - Saída em `identidade/components/<slug>/` (HTML + screenshot SVG).

4. **Para `--modo=a11y`:**
   - Rode `accessibility-review` na URL/arquivo.
   - Gere relatório em `identidade/a11y/<slug>-AAAA-MM-DD.md` com:
     - Contrastes que falham (com valor calculado)
     - Targets táteis < 44px
     - Foco visível ausente
     - Alt text faltando
     - Plano de correção priorizado

5. **Para `--modo=copy`:**
   - Microcopy em PT-BR, respeitando seções 9 e 10 de `.agents/product-marketing.md`.
   - Gere variações A/B sempre.

6. **Regras invioláveis:**
   - Nada publicado sem decisor aprovar.
   - Acessibilidade não é opcional — todo componente novo passa por `--modo=a11y` antes de virar handoff.
   - Tom de voz vem de `.agents/product-marketing.md`, não invente.
