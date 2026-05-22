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

Copia o template e configura o cliente. Plugins/marketplaces são **pré-declarados** em `.claude/settings.json` (campos `extraKnownMarketplaces` + `enabledPlugins`), então o Claude Code prompta a instalação na primeira sessão — sem cola-cola de `/plugin install`.

### 3. Setup manual (raro — só se quiser instalar fora do auto-prompt)

Dentro de uma sessão do Claude Code, um comando por linha:

```
/plugin marketplace add coreyhaines31/marketingskills
/plugin install marketing-skills@marketingskills

/plugin marketplace add anthropics/skills
/plugin install document-skills@anthropic-agent-skills
/plugin install brand-guidelines@anthropic-agent-skills
/plugin install skill-creator@anthropic-agent-skills
/plugin install mcp-builder@anthropic-agent-skills
/plugin install frontend-design@anthropic-agent-skills

/plugin marketplace add anthropics/claude-plugins-official
/plugin install design@claude-plugins-official

/plugin marketplace add nextlevelbuilder/ui-ux-pro-max-skill
/plugin install ui-ux-pro-max@ui-ux-pro-max-skill

/plugin marketplace add OpenClaudia/openclaudia-skills
/plugin marketplace add BrianRWagner/ai-marketing-claude-code-skills
```

> Atenção: o Claude Code interpreta slash commands linha por linha. Não cole o bloco inteiro de uma vez — a segunda linha vira argumento da primeira.

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
| `/instalar` | Onboarding interativo: escolhe perfil (solopreneur/freelancer/agência/empresa), entrevista guiada, popula `_memoria/` e adapta `CLAUDE.md` |
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
bin/setup.sh <nome-do-cliente>
cd ~/Documents/biz-os-<nome-do-cliente>
claude
# dentro do Claude Code:
/instalar    # escolhe perfil + entrevista + adapta CLAUDE.md
```

## Estrutura de um cliente

```
.
├── CLAUDE.md           ← cérebro persistente, adaptado ao perfil
├── .agents/            ← schema das 40 skills do Corey
├── .claude/            ← settings, hooks, slash commands
├── _memoria/           ← memória estruturada (empresa, estratégia, preferências, user_role)
├── identidade/         ← guidelines verbal + design-guide visual + logos
├── dados/              ← inputs (transcricoes/, historico/)
├── marketing/          ← outputs gerados (carrosseis/, ads/, conteudo/)
├── produtos/           ← catálogo, fichas técnicas
├── leads/              ← pipeline (gitignored)
├── financeiro/         ← DRE, fluxo de caixa
├── site/               ← código/conteúdo do site
└── templates/          ← biblioteca local (perfis, identidade, ferramentas, skills)
```

Detalhes em `cliente-piloto/CLAUDE.md` seção 5.

## Referências externas

- Claude Code: https://github.com/anthropics/claude-code
- Skills oficiais: https://github.com/anthropics/skills
- MCP servers oficiais: https://github.com/modelcontextprotocol/servers
- Plugins oficiais: https://github.com/anthropics/claude-plugins-official
- Cookbooks: https://github.com/anthropics/claude-cookbooks
