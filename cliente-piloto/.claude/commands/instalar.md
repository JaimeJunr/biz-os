---
description: Onboarding completo — popula .agents/product-marketing.md (schema oficial) + CLAUDE.md + branding + financeiro
argument-hint: "[nome-do-cliente opcional]"
---

# /instalar — Onboarding biz-os

Arg: $ARGUMENTS

Objetivo: deixar o projeto pronto para usar **as 40 skills do `coreyhaines31/marketingskills` + as skills oficiais da Anthropic + nossos slash commands**. Para isso, popular dois lugares:

1. **`.agents/product-marketing.md`** — fundamento lido pelas 40 skills (schema fixo, NÃO renomear campos).
2. **`CLAUDE.md` raiz** — camada biz-os (operacional, financeiro, leads, branding visual, comandos).

## Regras do onboarding

- Conduza em **entrevista guiada em blocos**, um por mensagem.
- Confirme e grave incremental ao fim de cada bloco (não acumule até o fim).
- Português do Brasil. Mas os **títulos das seções 1-11 de `.agents/product-marketing.md` ficam em inglês** — as skills do Corey dependem disso.
- Não invente nada. Se falta dado, marca `[PENDENTE]`.

## Bloco 1 — Identidade básica (→ `CLAUDE.md` seção 1)

Pergunte: nome fantasia, CNPJ, nicho, localização, site/redes, decisor.

## Bloco 2 — Product Marketing parte A (→ `.agents/product-marketing.md` seções 1, 2, 4)

Pergunte:
- Descrição em 1 linha e em 2-3 frases
- Categoria (a "prateleira" — como o cliente busca isso)
- Tipo de negócio + modelo de preços
- Tipo de empresa-alvo (porte, setor, estágio)
- Decisor / persona principal
- Use case principal + 2-3 "jobs to be done"
- Dor principal antes de chegar até você
- Por que soluções atuais falham
- Custo dessa dor (tempo, dinheiro, oportunidade)
- Tensão emocional

## Bloco 3 — Concorrência e diferenciação (→ seções 5, 6, 7, 8)

Pergunte:
- 2-3 concorrentes diretos + onde cada um falha
- 1-2 concorrentes indiretos (solução diferente, mesmo problema)
- Top 3 diferenciais reais (não jargão)
- Por que clientes escolhem você (verbatim se possível)
- Top 3 objeções que você mais ouve e como responde
- Anti-persona (quem NÃO é fit)
- Forças de mudança JTBD: Push, Pull, Habit, Anxiety

## Bloco 4 — Linguagem e voz (→ seções 9, 10 + `branding/guidelines.md`)

Pergunte:
- Como o cliente descreve o problema **com as palavras dele** (peça 2-3 frases verbatim)
- Como descreve sua solução verbatim
- 5 palavras que a marca SEMPRE usa, 5 que NUNCA usa
- Glossário de termos do produto
- Tom (3 adjetivos), estilo, personalidade da marca
- Paleta de cores (HEX) e tipografia, se existir

## Bloco 5 — Provas sociais (→ seção 11 + `memory/historico/`)

Pergunte:
- 3-5 métricas/resultados acumulados
- Clientes de destaque (logos)
- 2-3 depoimentos verbatim (cole o texto)
- Temas de valor + evidência de cada

Gravar quantitativos em `memory/historico/numeros.md`, qualitativos em `memory/historico/depoimentos.md`.

## Bloco 6 — Operação biz-os (→ `CLAUDE.md` seções 3, 6, 8)

Pergunte:
- Top 3-5 produtos/serviços com preço/margem/frequência (crie `produtos/<slug>.md` pra cada)
- Canais ativos (IG, Google Ads, Meta Ads, WhatsApp, e-mail)
- Planilha de leads: ID/URL da Google Sheet
- DRE e fluxo de caixa: existe? em qual formato?
- 3 rituais semanais que ele quer automatizar primeiro

## Encerramento

1. Atualize a seção 8 do CLAUDE.md (data + status).
2. Liste os 3 slash commands mais úteis dado o que respondeu (ex: se há campanha rodando → `/anuncio-meta`; se há site → `/seo`; se tem DRE → `/dre`).
3. Lembre que as 40 skills do Corey agora vão ler `.agents/product-marketing.md` automaticamente. Sugira testar com: "rode a skill `seo-audit` na home do site".
4. Peça confirmação para `git add -A && git commit -m "chore: onboarding via /instalar"`.
