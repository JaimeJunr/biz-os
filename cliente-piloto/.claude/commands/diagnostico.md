---
description: Diagnóstico empresarial estruturado — lê tudo que existe e produz lista priorizada de erros operacionais, gaps e oportunidades. Roda após /instalar e periodicamente.
argument-hint: "[--escopo=tudo|marketing|comercial|operacao|financeiro] [--profundidade=rapido|completo]"
---

# /diagnostico — Análise empresarial estruturada

Args: **$ARGUMENTS**

> Você é um diagnóstico opinado. Em vez de listar tudo "ok / não ok" neutro, **priorize** o que dói mais agora e o que dá mais alavancagem. O output é uma lista acionável de no máximo 10 itens — mais que isso vira ruído.

---

## Fase 0 — Confirmar escopo (via AskUserQuestion)

Faça **uma** chamada de `AskUserQuestion` com 2 perguntas:

1. **Escopo** — opções:
   - "Tudo (visão 360°)" — varre todas as áreas
   - "Só marketing" — voz, identidade, conteúdo, ads
   - "Só comercial" — leads, pipeline, conversão
   - "Só operação" — processos, ferramentas, rotinas
   - "Só financeiro" — DRE, fluxo, margem

2. **Profundidade** — opções:
   - "Rápido" — top 5 problemas em 5min de leitura, sem análises externas
   - "Completo" — top 10 problemas + benchmarking contra concorrentes + auditoria de site se houver

Se vier por `$ARGUMENTS` (`--escopo=...`), pule a Fase 0.

---

## Fase 1 — Carregar contexto (tool calls paralelos)

Leia simultaneamente:

- `_memoria/empresa.md`, `_memoria/estrategia.md`, `_memoria/preferencias.md`, `_memoria/user_role.md`
- `identidade/guidelines.md`, `identidade/design-guide.md`
- `.agents/product-marketing.md` (estado do schema do Corey)
- `dados/historico/` (provas sociais existentes)
- `marketing/` (peças produzidas — vê o que existe e o que falta)
- `produtos/` (catálogo descrito)
- `leads/config.md` se existir (CRM ativo?)
- `financeiro/` (DRE, fluxo)
- Último `marketing/carrosseis/` e `marketing/ads/meta/` (ritmo de produção)
- `site/` (site existe? está vivo?)

Liste o que **não existe** ou está em `[PENDENTE]` — isso já é meio diagnóstico.

### Se escopo = "Completo", também rode:

- Se há site: análise rápida via web fetch (status code, título, meta description, links quebrados nos 5 primeiros internal links)
- Se `_memoria/empresa.md` tem concorrentes nomeados: web fetch deles, pegar título do site + primeiro H1, comparar messaging
- Se há campanhas Meta declaradas: use o MCP `meta-ads` pra pegar CPL/CPA dos últimos 30d

---

## Fase 2 — Análise por dimensão

Avalie cada dimensão na escala **0-3** (não use 0-10 ou 0-5 — força priorização):

| Dimensão | 0 = não existe | 1 = existe mas frágil | 2 = funcional | 3 = forte |
|---|---|---|---|---|
| **Identidade verbal** (`_memoria/preferencias.md`, `identidade/guidelines.md`) | Voz não definida | Definida mas vaga | Definida + verbatim do cliente | Forte + verbatim + glossário |
| **Identidade visual** (`identidade/design-guide.md`) | Sem paleta/tipo | Definida mas não aplicada | Aplicada em algumas peças | Aplicada consistentemente |
| **Schema 40 skills** (`.agents/product-marketing.md`) | Maioria pendente | §1-2 ok | §1-4, 9-11 ok | Schema completo |
| **Provas sociais** (`dados/historico/`) | Zero | 1-2 itens | 3-5 itens variados | 5+ com depoimentos verbatim |
| **Conteúdo orgânico** (`marketing/carrosseis/`, `marketing/conteudo/`) | Zero peça | 1-3 peças soltas | Cadência irregular | Cadência consistente |
| **Tráfego pago** (`marketing/ads/`) | Não roda | Roda sem otimização | Roda com leitura básica | Otimizado + ABM/lookalike |
| **Lead capture** (linktree, formulário, quiz) | Sem captura | Forma básica | Form com qualificação | Quiz + segmentação |
| **CRM / follow-up** (`leads/`) | Sem CRM | Planilha caótica | Planilha estruturada | CRM com automação |
| **Site / landing** (`site/`) | Sem site | Existe mas quebrado | Funcional | Otimizado pra conversão |
| **Financeiro** (`financeiro/`) | Sem DRE | DRE manual mensal | DRE + fluxo de caixa | DRE + fluxo + projeção |
| **Operação / rotinas** (transcrições, padrões) | Tudo na cabeça | Anotações soltas | Processos documentados | Rotinas + automações |

Adapte a lista ao perfil (`_memoria/empresa.md`):
- **Solopreneur**: pula CRM, foca lead capture + conteúdo
- **Freelancer**: adiciona "pipeline de novos clientes" e "margem por projeto"
- **Agência**: adiciona "padronização entre clientes" e "margem por cliente"
- **Empresa**: avalia cada dimensão sem corte

---

## Fase 3 — Identificar erros operacionais (não só gaps)

Além de notas 0-3, busque **erros ativos** — coisas que estão **causando dano agora**:

### Sinais comuns de erro (cheque cada um):

1. **Inconsistência de voz**: voz em `_memoria/preferencias.md` ≠ voz em peças recentes (`marketing/`)
2. **Cor/fonte fora do guide**: peça usando cor não declarada em `identidade/design-guide.md`
3. **Métricas inventadas**: peça citando número que não está em `dados/historico/`
4. **Promessa sem prova**: copy ambicioso sem case que sustente
5. **CTA múltiplo na mesma peça**: carrossel ou ad com 2+ CTAs concorrentes
6. **Hashtag genérica**: peças com `#instagood`, `#love`, `#viral` sem nicho
7. **UTM ausente**: peças linkando sem `?utm_source=...&utm_campaign=...`
8. **Cadência irregular**: gap >30 dias entre peças
9. **Lead frio sem follow-up**: leads em `leads/` sem coluna de status ou último contato
10. **DRE sem revisão recente**: financeiro/dre.xlsx sem update no mês corrente
11. **Decisão aprovada sendo violada**: design-guide com `**Status:** aprovado` sendo ignorado em peça recente

Para cada erro encontrado: **arquivo + linha + descrição curta**.

---

## Fase 4 — Output (saída opinada)

Estrutura obrigatória no chat:

### 4.1 — Sumário em 1 parágrafo

3-4 linhas dizendo onde está o negócio agora, qual a dimensão mais fraca, qual a mais forte, e qual a próxima alavanca.

### 4.2 — Tabela de notas

```
| Dimensão                      | Nota | Estado |
|-------------------------------|------|--------|
| Identidade verbal             | 2/3  | Funcional, falta verbatim |
| Identidade visual             | 1/3  | Paleta definida, pouco aplicada |
| Schema 40 skills              | 1/3  | §1-2 ok, §3-8 pendentes |
| Provas sociais                | 0/3  | Zero em dados/historico/ |
...
```

### 4.3 — Top 5 erros operacionais

Apenas os que estão **causando dano agora**. Para cada um:

```
1. [Severidade ALTA] Lead frio sem follow-up
   Onde: leads/snapshot-2026-04-XX.csv linhas X-Y
   Dano: ~30 leads abandonados nos últimos 60 dias
   Como resolver: rodar /lead-sync e adicionar coluna status + último_contato
```

Severidade: ALTA / MÉDIA / BAIXA. Use ALTA com parcimônia (1-2 itens).

### 4.4 — Top 5 oportunidades

Não são erros — são alavancas que ainda não foram puxadas. Priorize pelo **maior ganho com menor esforço**:

```
1. [Esforço BAIXO, Ganho ALTO] Quiz de qualificação no linktree
   Por quê: cliente típico (renda 2-5k) está sendo perdido por ausência de filtro
   Como começar: /quiz "qualificação inicial cliente MCMV"
   Tempo estimado: 2 sessões de 30min
```

### 4.5 — Roadmap proposto (3-4 sprints)

Igual à Fase 5c do `/instalar`, mas **revisado** com base no diagnóstico:

```
▎ Sprint 1 (próxima semana) — Tapar os 2 erros ALTA severidade
   • [item 1 do top 5 erros]
   • [item 2 do top 5 erros]

▎ Sprint 2 — Puxar as 2 alavancas mais baratas
   • [item 1 do top 5 oportunidades]
   • [item 2 do top 5 oportunidades]

▎ Sprint 3-4 — Trabalho de fundação
   • [oportunidades médio-prazo]
   • [refazer schema 40 skills se §3-8 pendentes]
```

### 4.6 — Bifurcação opinada (próximo movimento)

Use o padrão do `_comportamento.md` § Bifurcação opinada:

```
**A)** Tapar erros primeiro (defensivo) — 1 semana, livra o cliente de estar perdendo dinheiro/leads agora.

**B)** Puxar alavanca de oportunidade (ofensivo) — 2 semanas, primeiro resultado visível mas leva mais tempo pra impacto.

**Eu, no teu lugar, ia pelo [A ou B]** — porquê em 1-2 frases.

Qual prefere?
```

---

## Fase 5 — Atualizar memória

1. Salve o diagnóstico em `_memoria/diagnostico-YYYY-MM-DD.md` (versionado por data — diagnóstico vira histórico, útil pra comparar evolução).
2. Atualize `_memoria/estrategia.md` adicionando a seção:
   ```
   ## Diagnóstico mais recente
   - **Data:** YYYY-MM-DD
   - **Nota geral:** X/33 (soma das dimensões / total possível)
   - **Movimento escolhido:** A ou B
   - **Próxima revisão:** YYYY-MM-DD (sugestão: +60 dias)
   ```
3. Liste no final da resposta:
   ```
   ✓ Criado: _memoria/diagnostico-YYYY-MM-DD.md
   ✓ Atualizado: _memoria/estrategia.md (+seção Diagnóstico mais recente)
   ```

---

## Regras invioláveis

- Priorize ferozmente. Mais de 10 itens no top = você falhou em priorizar.
- Severidade ALTA com parcimônia (1-2). Tudo ALTA = nada é ALTA.
- Notas baseadas em **evidência de arquivo**, não impressão. Cite o arquivo na resposta.
- Bifurcação opinada obrigatória no fim. Não "qual prefere?" em aberto.
- Diagnóstico fica versionado por data — não sobrescreva o anterior.
- Português do Brasil.
