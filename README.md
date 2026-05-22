# biz-os

Sistema operacional aberto para pequenas e médias empresas em cima do Claude Code: marketing, design, financeiro, leads e operação digital — 100% open-source, montado com peças oficiais da Anthropic e os plugins mais populares da comunidade.

## Arquitetura

Quatro camadas open-source empilhadas:

1. **Base de marketing — [`coreyhaines31/marketingskills`](https://github.com/coreyhaines31/marketingskills)** (40 skills, plugin oficial Claude Code). Toda skill lê primeiro o arquivo canônico `.agents/product-marketing.md` (schema v2.0.0 em 11 seções).
2. **Stack de design** — três peças combinadas:
   - **[Anthropic Design plugin](https://claude.com/plugins/design)** (oficial verificado): critique, UX writing, accessibility (WCAG 2.1 AA), research synthesis, dev handoff.
   - **[Frontend Design](https://github.com/anthropics/skills)** (Anthropic, 760k+ installs): código de UI polido, sem estética AI genérica.
   - **[ui-ux-pro-max-skill](https://github.com/nextlevelbuilder/ui-ux-pro-max-skill)** (81k+ stars): 161 reasoning rules + 67 UI styles para múltiplas plataformas.
3. **Camada Anthropic oficial** — [`anthropics/skills`](https://github.com/anthropics/skills) (document-skills, brand-guidelines, skill-creator, mcp-builder, doc-coauthoring, internal-comms) + MCPs oficiais do [`modelcontextprotocol/servers`](https://github.com/modelcontextprotocol/servers) (filesystem, memory, fetch, git).
4. **Camada biz-os (este repo)** — o que falta: CLAUDE.md operacional em PT-BR, financeiro (`/dre`, `/fluxo-caixa`), leads (`/lead-sync`), branding visual, e slash commands que orquestram as camadas 1, 2 e 3.

## Filosofia

Um cliente = uma pasta. Toda a memória, identidade, marketing, financeiro e leads vivem
dentro dessa pasta. O `CLAUDE.md` raiz é o cérebro persistente que o Claude Code lê em
toda sessão.

## Instalação rápida

### 1. Claude Code

```bash
# https://docs.claude.com/en/docs/claude-code/overview
npm install -g @anthropic-ai/claude-code
# ou via instalador oficial
```

### 2. Setup automatizado (recomendado)

```bash
# nome puro → cria ~/Documents/biz-os-<nome> a partir do template
bin/setup.sh <nome-do-cliente>

# template in-repo
bin/setup.sh cliente-piloto

# caminho explícito (contém "/", "." ou "~")
bin/setup.sh ./clientes/foo
bin/setup.sh ~/projetos/foo

# override do diretório base
BIZ_OS_CLIENTS_DIR=/srv/clientes bin/setup.sh <nome-do-cliente>
```

Imprime os comandos de plugin na ordem correta. Cole dentro da sessão do Claude Code.

### 3. Setup manual — base de marketing PRIMEIRO

A ordem importa: o plugin do Corey é a base, instale antes dos outros.

```
# BASE — 40 skills, le .agents/product-marketing.md
/plugin marketplace add coreyhaines31/marketingskills
/plugin install marketing-skills@marketingskills

# Camada Anthropic oficial
/plugin marketplace add anthropics/skills
/plugin install document-skills@anthropic-agent-skills
/plugin install brand-guidelines@anthropic-agent-skills
/plugin install skill-creator@anthropic-agent-skills
/plugin install mcp-builder@anthropic-agent-skills

# DESIGN STACK
# Anthropic Design (oficial verificado)
/plugin marketplace add anthropics/claude-plugins-official
/plugin install design@claude-plugins-official
# Frontend Design (760k+ installs)
/plugin install frontend-design@anthropic-agent-skills
# UI UX Pro Max (81k+ stars)
/plugin marketplace add nextlevelbuilder/ui-ux-pro-max-skill
/plugin install ui-ux-pro-max@ui-ux-pro-max-skill

# Complementares
/plugin marketplace add OpenClaudia/openclaudia-skills
/plugin marketplace add BrianRWagner/ai-marketing-claude-code-skills
```

### 4. MCPs

Os MCPs já estão pré-declarados em `cliente-piloto/.claude/settings.json`.
Você só precisa ter `npx` (Node) e `uvx` (Python/uv) instalados, e exportar tokens:

```bash
mkdir -p ~/.config/biz-os
cat > ~/.config/biz-os/.env <<'EOF'
NOTION_TOKEN=secret_xxx
META_ACCESS_TOKEN=EAAxxx
META_AD_ACCOUNT_ID=act_xxx
EOF
```

## Slash commands prontos

Dentro de qualquer pasta de cliente, digite `/` no Claude Code:

| Comando | Função |
|---|---|
| `/instalar` | Onboarding em 5 blocos (identidade, tom, produtos, provas, operação) |
| `/carrossel` | Carrossel Instagram on-brand (markdown + SVG) |
| `/anuncio-google` | Campanha Google Ads + CSV uploadable |
| `/anuncio-meta` | Campanha Meta Ads via MCP `meta-ads` |
| `/seo` | Auditoria SEO on-page + plano |
| `/design` | Stack de design: critique, criar UI, a11y WCAG, UX writing, handoff, research |
| `/lead-sync` | Sync Google Sheets → `leads/snapshot.csv` |
| `/dre` | DRE em xlsx |
| `/fluxo-caixa` | Fluxo de caixa + projeção |

## Como criar um novo cliente

```bash
cp -r cliente-piloto clientes/nome-do-cliente
cd clientes/nome-do-cliente
# preencha o CLAUDE.md e branding/guidelines.md
claude
```

## Estrutura de um cliente

Ver `cliente-piloto/CLAUDE.md` seção 5.

## Referências externas

- Claude Code: https://github.com/anthropics/claude-code
- Skills oficiais: https://github.com/anthropics/skills
- MCP servers oficiais: https://github.com/modelcontextprotocol/servers
- Plugins oficiais: https://github.com/anthropics/claude-plugins-official
- Cookbooks: https://github.com/anthropics/claude-cookbooks
