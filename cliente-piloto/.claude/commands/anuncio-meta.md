---
description: Meta Ads via MCP — criar campanha, ler performance em tempo real, sugerir otimizações, ajustar orçamento, extrair relatórios
argument-hint: "<criar|status|otimizar|relatorio|ajustar-orcamento> [opções específicas]"
---

# /anuncio-meta — Gestão Meta Ads via MCP

Args: **$ARGUMENTS**

> Este command opera o MCP `meta-ads` (já declarado em `.claude/settings.json`). Toda interação com a API da Meta passa por aqui. Você lê dados reais da conta — não invente métricas. Antes de criar/ajustar qualquer coisa em produção, **sempre** peça aprovação explícita.

---

## Modo de operação (via AskUserQuestion se não vier em $ARGUMENTS)

Faça **uma** chamada `AskUserQuestion`, header "Modo", opções:

- **Criar campanha nova** — fluxo de planejamento + criação (rascunho)
- **Status / leitura** — performance atual das campanhas ativas
- **Otimizar** — análise + sugestões com base nos dados
- **Relatório** — extração consolidada (semana / mês / período custom)
- **Ajustar orçamento** — mudar budget de campanha/conjunto específico

---

## MODO 1 — Criar campanha nova

### Fase 0 — Contexto

Leia em paralelo:
- `_memoria/empresa.md`, `_memoria/estrategia.md`, `_memoria/preferencias.md`
- `_memoria/preferencias.md § Canais ativos e ferramentas externas` (confirma se Meta Ads está ativo)
- `_memoria/preferencias.md § Voz escrita — referência real` (usar verbatim no copy se houver)
- `identidade/guidelines.md`, `identidade/design-guide.md`
- `dados/historico/` (provas sociais → extensões de copy)
- `marketing/ads/meta/` (campanhas anteriores → o que funcionou)

### Fase 1 — Briefing (`AskUserQuestion` em bloco)

Uma chamada com 4 perguntas:

1. **Objetivo da campanha** — opções: "Leads (Lead Form)", "Conversões (site)", "Mensagens (DM/WA)", "Tráfego", "Alcance/Reconhecimento"
2. **Orçamento diário** — opções: "R$ 20-50", "R$ 50-150", "R$ 150-500", "R$ 500+"
3. **Pixel/CAPI ativo?** — opções: "Sim, configurado", "Pixel sim, CAPI não", "Nem pixel nem CAPI", "Não sei"
4. **Localização do público** — livre (default lê de `_memoria/empresa.md § Localização`)

### Fase 2 — Análise de baseline via MCP

Antes de propor estrutura, leia o estado atual:

```
Use MCP meta-ads:
- list_ad_accounts → confirmar account_id
- list_campaigns(status=ACTIVE) → ver o que já roda
- get_account_insights(date_preset=last_30d) → CPL/CPA históricos
```

Cite na resposta: "Sua conta hoje roda **N campanhas ativas** com CPL médio de R$ X nos últimos 30 dias. Vou propor a nova campanha mirando CPL ≤ R$ Y."

Se não há histórico (conta nova): "Conta sem histórico de conversão. Vou propor orçamento de aprendizado pequeno (R$ 30/dia × 7 dias) antes de escalar."

### Fase 3 — Estrutura proposta (markdown, ainda NÃO cria)

Salve em `marketing/ads/meta/YYYY-MM-DD-<slug>.md`:

```markdown
# Campanha: <nome>

- **Objetivo:** <Leads/Conversões/etc>
- **Orçamento:** R$ XX/dia × N dias = R$ ZZZ
- **Otimização:** <Lead Form / Conversões / Engajamento>
- **Pixel/CAPI:** <status>

## Conjuntos de anúncios (3 padrão)

### 1 — Público frio interesses
- Interesses: <lista de 5-8 do _memoria/empresa.md>
- Idade: <faixa>
- Localização: <do briefing>
- Orçamento: 50% do total

### 2 — Lookalike 1-3% (se houver base ≥1000)
- Source: <pixel:purchase | custom:leads CSV | LTV custom>
- Orçamento: 30% do total

### 3 — Remarketing 30/60/90d
- Source: <pixel:all_visitors | engagement IG>
- Orçamento: 20% do total

## Criativos (3 por conjunto, total 9)

Para cada conjunto, propor:
- **Variação A:** estática 1:1 (reaproveitar último carrossel de marketing/carrosseis/?)
- **Variação B:** vídeo 9:16 15s (roteiro abaixo)
- **Variação C:** carrossel 4:5 (reaproveitar /carrossel ou criar)

## Copy (siga _memoria/preferencias.md)

- **Headline:** <hook curto, máx 40 chars visíveis>
- **Primary text:** <hook + dor + solução + CTA, ~125 chars antes do "Ver mais">
- **Description:** <reforço de prova social ou objeção>
- **CTA button:** <Saiba Mais / Cadastre-se / Falar no WhatsApp / etc>

> Se houver verbatim em `_memoria/preferencias.md § Voz escrita`, USE ELE no hook.

## UTMs
?utm_source=meta&utm_medium=cpc&utm_campaign=<slug>&utm_content={{ad.name}}

## Riscos / categorias especiais
- [ ] Categoria especial aplica? (Crédito/Habitação/Emprego/Política) — pergunte se aplica
- [ ] LGPD: Lead Form com aviso de privacidade?
```

### Fase 4 — Aprovação + criação

`AskUserQuestion` header "Criar agora?":
- "Sim, criar como PAUSADA na conta" — usa MCP `meta-ads` para criar campanha + conjuntos + ads, todos em status PAUSED. Usuário ativa manualmente.
- "Ajustar antes" — qual ajuste
- "Só salvar o plano em markdown" — não toca na conta

Se "Sim", chame em sequência via MCP:
```
create_campaign(...)
create_adset(...) × 3
create_ad(...) × 9
```
Mostre os IDs criados. Confirme que tudo está em `PAUSED`. Avise:
> "Tudo criado em PAUSADA. Revise no Gerenciador antes de ativar. Pra ativar via comando, rode `/anuncio-meta ativar <campaign_id>`."

---

## MODO 2 — Status / leitura

Sem briefing. Lê e mostra.

### Pull via MCP

```
- list_campaigns(status=ACTIVE, last_30d)
- For each: get_campaign_insights(metrics=[spend, impressions, clicks, ctr, cpc, conversions, cost_per_conversion])
```

### Output (formato tabela)

```
Campanhas ativas (últimos 30 dias):

| Campanha          | Gasto    | Leads | CPL   | CTR  | CPC   | Status |
|-------------------|----------|-------|-------|------|-------|--------|
| MCMV-Mooca-Mai    | R$ 1.240 | 38    | R$ 33 | 2.1% | R$ 1.20 | 🟢 OK |
| MCMV-Penha-Mai    | R$ 890   | 12    | R$ 74 | 0.8% | R$ 2.40 | 🔴 CPL alto |
| Geral-Awareness   | R$ 450   | -     | -     | 1.5% | R$ 0.80 | 🟡 sem conversão |

Total: R$ 2.580 gastos | 50 leads | CPL médio R$ 51
```

### Diagnóstico embutido

Marque com 🔴 (problema), 🟡 (atenção), 🟢 (saudável):
- 🔴: CPL > 2× a média | CTR < 0.5% | Conjunto sem entregar há 3+ dias
- 🟡: CPL > média + 50% | gasto > 80% sem ainda gerar lead | criativo único há 14+ dias
- 🟢: CPL ≤ média | CTR ≥ 1% | mix de criativos saudável

### Bifurcação no fim

"Top sugestão agora: <ação opinada baseada no que viu>. Quer (1) abrir essa otimização agora via `/anuncio-meta otimizar`, (2) só registrar o status em `_memoria/estrategia.md`?"

---

## MODO 3 — Otimizar

### Análise via MCP

```
- get_account_insights(date_preset=last_14d, breakdown=age,gender,placement,device)
- get_adset_insights(...) por conjunto ativo
- get_ad_insights(...) por criativo
```

### Identifique padrões

1. **Conjunto com CPL >2× a média**: sugerir pausar ou refazer criativos
2. **Criativo top performer**: sugerir duplicar e testar variação
3. **Criativo zerado** (impressions <500 em 7d): sugerir pausar
4. **Audience overlap**: se conjuntos canibalizam, sugerir consolidar
5. **Idade/gênero com CPL muito menor**: sugerir conjunto dedicado a esse split
6. **Placement com performance ruim**: sugerir excluir (ex: Stories sem conversão)
7. **Fadiga de criativo** (frequência > 4): sugerir refresh

### Output: lista de ações priorizada

```
Otimizações sugeridas (ordem de impacto):

1. [ALTO IMPACTO] Pausar Conjunto "Penha-Frio-Interesses"
   Motivo: CPL R$ 74 vs média R$ 33 (>2× pior). Gastou R$ 890 nos últimos 14d.
   Como: confirme e eu pauso via MCP.

2. [MÉDIO] Duplicar criativo "Carrossel MCMV-Mooca" + variar headline
   Motivo: Top performer (CPL R$ 18). Refresh aumenta longevidade.
   Como: confirme e eu duplico + sugiro 2 headlines novas.

3. [BAIXO] Excluir placement Audience Network
   Motivo: 18% do gasto, 0% das conversões.
   Como: confirme e eu ajusto via MCP.
```

`AskUserQuestion` header "Aplicar?":
- "Sim, aplicar todas" — executa tudo via MCP
- "Aplicar 1, 2, 3..." — selecionar quais (multiSelect)
- "Só salvar como rascunho em marketing/ads/meta/otimizacao-YYYY-MM-DD.md"
- "Discutir antes" — qual item

---

## MODO 4 — Relatório

### Período

`AskUserQuestion` header "Período":
- "Últimos 7 dias"
- "Últimos 30 dias"
- "Este mês"
- "Custom" (livre)

### Pull e estruturação

```
- get_account_insights(date_preset=<período>) → top-level
- get_campaign_insights(...) por campanha
- best_performing_ads(limit=5)
- worst_performing_ads(limit=3)
```

### Salvar relatório em `marketing/ads/meta/relatorios/YYYY-MM-DD-<periodo>.md`

```markdown
# Relatório Meta Ads — <período>

## Sumário executivo (3 linhas)

Investiu R$ X. Gerou Y leads / Z conversões. CPL médio R$ W
(vs período anterior: ±N%).

## Por campanha

| Campanha | Gasto | Resultado | Custo | Tendência |
|---|---|---|---|---|
| ... | R$ X | Y leads | R$ Z/lead | ↑ / → / ↓ |

## Top 5 criativos

1. <ad name> — <métrica chave>
2. ...

## Bottom 3 criativos (pra pausar/refazer)

1. ...

## Recomendações pro próximo período

- ...
```

No chat, mostre o sumário executivo + tabela por campanha + path do relatório completo.

---

## MODO 5 — Ajustar orçamento

`AskUserQuestion` header "Onde":
- "Campanha inteira"
- "Conjunto específico"
- "Pausar tudo temporariamente"
- "Reativar tudo"

Pergunta seguinte (livre): "Qual o novo orçamento diário?" + "Qual o motivo do ajuste? (registra em `_memoria/estrategia.md`)"

Confirma a leitura via MCP (`get_campaign(id)` ou `get_adset(id)`), mostra estado atual + estado proposto, pede aprovação explícita, então aplica via `update_campaign` ou `update_adset`.

Registre em `_memoria/estrategia.md`:
```
> Atualizado em YYYY-MM-DD: ajuste orçamento <campanha/conjunto> de R$ X/dia → R$ Y/dia. Motivo: <texto>.
```

---

## Regras invioláveis

- **NUNCA** crie ou ative algo na conta sem aprovação explícita. Tudo PAUSED no create.
- **NUNCA** invente métrica. Toda métrica vem do MCP. Se MCP falhar, diga "não consegui ler" — não chute.
- LGPD: Lead Form com aviso obrigatório. Categoria especial (crédito/imóveis/emprego/política) pergunta antes.
- Sem promessa de resultado (CPL "garantido", "X leads garantidos").
- Atualizar `_memoria/estrategia.md` em toda mudança de orçamento ou campanha (timestamp + motivo).
- UTMs sempre. Sem UTM = não tem rastreamento = relatório fica mentindo.
- Português do Brasil na conversa. Nomes de campanha podem ser livres (use convenção `<nicho>-<oferta>-<mês>`).
