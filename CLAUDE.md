# CLAUDE.md — biz-os (meta-projeto)

> Este arquivo orienta quem está **trabalhando NO biz-os** (manutenção, evolução do template, contribuição). NÃO confunda com o `cliente-piloto/CLAUDE.md`, que é o template que vai copiado pra cada cliente novo.

## O que é o biz-os

Sistema operacional aberto para PMEs em cima do Claude Code: marketing, design, financeiro, leads e operação digital — 100% open-source, montado com peças oficiais da Anthropic + plugins populares da comunidade.

**Filosofia:** um cliente = uma pasta. Toda memória, identidade, marketing, financeiro e leads vivem dentro da pasta. O `CLAUDE.md` raiz da pasta-cliente é o cérebro persistente.

## Arquitetura (4 camadas)

1. **Base de marketing** — plugin `coreyhaines31/marketingskills` (40 skills, lê `.agents/product-marketing.md` v2.0.0)
2. **Stack de design** — Anthropic Design + `frontend-design` + `ui-ux-pro-max-skill`
3. **Camada Anthropic oficial** — `anthropics/skills` (document-skills, brand-guidelines, skill-creator, mcp-builder) + MCPs (filesystem, memory, fetch, git)
4. **Camada biz-os (este repo)** — template + slash commands + bin/setup.sh + estrutura de pastas em PT-BR

## Estrutura do repo

```
biz-os/
├── CLAUDE.md              ← você está aqui (meta)
├── README.md              ← apresentação pública do projeto
├── LICENSE
├── bin/
│   └── setup.sh           ← bootstrap de novo cliente
└── cliente-piloto/        ← TEMPLATE que vai copiado para cada cliente
    ├── CLAUDE.md          ← cérebro persistente do cliente
    ├── .agents/           ← schema das 40 skills (NÃO renomear)
    ├── .claude/
    │   ├── settings.json  ← MCPs, plugins pré-declarados, hooks
    │   └── commands/      ← 14 slash commands biz-os
    ├── _memoria/          ← memória estruturada do agente
    ├── identidade/        ← guidelines verbal + design-guide
    ├── dados/             ← inputs (transcricoes, historico, refs)
    ├── marketing/         ← outputs gerados
    ├── produtos/, leads/, financeiro/, site/, vendas/
    └── templates/         ← biblioteca local
        ├── perfis/        ← 4 CLAUDE.md por perfil + _comportamento.md
        ├── identidade/
        ├── ferramentas/
        └── skills/
```

## Como o sistema é usado (fluxo do usuário final)

```
1. bin/setup.sh <nome-cliente>   → cria ~/Documents/biz-os-<nome>/
2. cd && claude                  → plugins auto-instalam via settings.json
3. /instalar                     → entrevista multi-fase + perfil + memória
4. /diagnostico                  → análise + roadmap revisado
5. /carrossel, /quiz, /anuncio-meta, etc → produção contínua
```

## Convenções de evolução do template

### Quando editar `cliente-piloto/`

Esse diretório é o **template puro**. Tudo que vai aqui propaga pra todo cliente novo via `bin/setup.sh`. Pense duas vezes antes de adicionar arquivo — minimalismo é virtude.

- **Slash command novo** → `cliente-piloto/.claude/commands/<nome>.md`
- **Comportamento do agente** → `cliente-piloto/templates/perfis/_comportamento.md` (snippet único concatenado nos 4 perfis)
- **Skill local** → `cliente-piloto/.claude/skills/<nome>/SKILL.md` (não temos hoje, mas suportado)
- **Mudança em todos os 4 perfis** → editar `_comportamento.md` + propagar nos 4 (ou usar script de propagação)

### Convenções de slash commands

Todo `.md` em `cliente-piloto/.claude/commands/` deve:

1. **Frontmatter** com `description` e `argument-hint`.
2. **Português do Brasil** em toda interação.
3. **`AskUserQuestion` para todas as perguntas** — nunca despeje lista numerada em texto. Bloco coeso de até 4 perguntas por chamada.
4. **Carregar contexto em paralelo** (tool calls simultâneos) na Fase 0.
5. **Fases numeradas** quando o command é multi-step.
6. **Bifurcação opinada** no fim — "A vs B, eu ia pelo X porque..." em vez de "o que quer fazer?".
7. **Atualizar `_memoria/`** quando relevante, listar no fim "✓ Atualizado: ...".
8. **Não inventar dados** — `[PENDENTE]` em vez de inferência.
9. **Sem `git commit` sem aprovação explícita.**

### Convenções de perfis (`templates/perfis/`)

Os 4 perfis (solopreneur, freelancer, agencia, empresa) têm CLAUDE.md adaptado mas **mesma seção final de comportamento** (vinda de `_comportamento.md`). Quando mudar `_comportamento.md`:

```bash
# Propagar nos 4 perfis (substitui o bloco antigo)
SNIPPET=$(cat cliente-piloto/templates/perfis/_comportamento.md)
# (ou editar à mão se a mudança for pontual)
```

### Convenções de commit

- Mensagens em **português**, primeira linha < 70 chars, imperativo.
- Corpo explica o **porquê**, não o que (diff já mostra).
- Co-Authored-By Claude no rodapé quando aplicável.
- Nunca commitar `cliente-piloto/leads/*.csv` (gitignored, mas duplo cuidado).
- Nunca commitar `.claude/settings.local.json` (não versionado).
- **Nome de cliente real não pode aparecer** em commit, README, ou qualquer arquivo versionado. Usar `<nome-do-cliente>` como placeholder.

## Onde está cada coisa importante

| Componente | Path |
|---|---|
| Bootstrap | `bin/setup.sh` |
| Template do cliente | `cliente-piloto/` |
| Slash commands (14 atuais) | `cliente-piloto/.claude/commands/*.md` |
| Plugins pré-declarados | `cliente-piloto/.claude/settings.json` (extraKnownMarketplaces + enabledPlugins) |
| Hook SessionStart | `cliente-piloto/.claude/settings.json` (hooks.SessionStart) |
| Comportamento contínuo | `cliente-piloto/templates/perfis/_comportamento.md` |
| Convenções de pastas do cliente | `cliente-piloto/dados/README.md`, `cliente-piloto/templates/README.md` |
| Schema das 40 skills | `cliente-piloto/.agents/product-marketing.md` |

## Slash commands biz-os (resumo)

| Command | O que faz |
|---|---|
| `/instalar` | Onboarding multi-fase com `AskUserQuestion` + roadmap obrigatório |
| `/diagnostico` | Análise empresarial 0-3 por dimensão + top 5 erros + top 5 oportunidades |
| `/carrossel` | Pré-aprovação de copy verbatim antes de gerar arte |
| `/prompt-imagem` | Prompts on-brand pra Midjourney/Sora/DALL-E/Flux |
| `/design` | Stack de design (critique, criar, a11y, UX writing, handoff, research) |
| `/seo` | Auditoria SEO on-page |
| `/anuncio-meta` | 5 modos via MCP (criar/status/otimizar/relatório/ajustar) |
| `/anuncio-google` | Estrutura Google Ads + CSV uploadable |
| `/linktree` | Linktree estático on-brand |
| `/quiz` | Quiz de qualificação com tier matrix |
| `/lead-sync` | Sync Google Sheets → snapshot local |
| `/dre`, `/fluxo-caixa` | Financeiro |
| `/proposta` | Proposta comercial estruturada (agência/freelancer) |

## Gaps conhecidos (próximos a atacar)

- `/abrir` — atalho de carregar memória no início de sessão (estilo MazyOS)
- `/site-audit <url>` — análise de site existente (prospecção ou cliente)
- CRM mais estruturado (Apps Script + Sheet padronizada)
- Comandos pra Google Meu Negócio
- Skill local de "voz writer" — gerador de copy estritamente baseado em `_memoria/preferencias.md § Voz escrita`

## Cuidados especiais

- **Não vazar nome de cliente** em commits/PRs públicos. Histórico já foi limpo uma vez (force-push em `8d64380` → `e6e0660`) por causa de "gatuna" ter vazado.
- **Verificar `.claude/settings.local.json`** antes de qualquer alteração — pode ter permissões que mencionam nome de cliente real.
- **Mudanças no template propagam pra todo cliente novo** — diff revisado antes de mergear.

## Como rodar localmente

```bash
# Testar o setup com um cliente fake
bin/setup.sh _teste
ls /home/jaime/Documents/biz-os-_teste

# Verificar JSON do settings
python3 -c "import json; json.load(open('cliente-piloto/.claude/settings.json'))"

# Buscar referências antigas (memory/ ou branding/ não devem mais existir)
grep -rn -E "(memory/|branding/)" --include="*.md" --include="*.json" .
```

## Referências externas

- Claude Code: https://github.com/anthropics/claude-code
- Skills oficiais: https://github.com/anthropics/skills
- Plugins oficiais: https://github.com/anthropics/claude-plugins-official
- MazyOS (concorrente / referência): repo do Vagner Mazzeo
- Schema das 40 skills: `coreyhaines31/marketingskills`
