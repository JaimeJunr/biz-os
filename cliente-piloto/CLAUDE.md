# CLAUDE.md — Cliente Piloto (biz-os)

> Este arquivo é lido automaticamente pelo Claude Code em toda sessão.
> É o "cérebro persistente" do cliente. Mantenha curto, denso e atualizado.
>
> **Arquivo irmão obrigatório:** [`.agents/product-marketing.md`](.agents/product-marketing.md) — schema oficial v2.0.0 do plugin [`coreyhaines31/marketingskills`](https://github.com/coreyhaines31/marketingskills). Todas as 40 skills de marketing leem esse arquivo primeiro. Mantenha as duas peças sincronizadas: identidade/voz aqui em prosa curta, fundamento estruturado lá.

## 1. Identidade do cliente

- **Nome fantasia:** [PREENCHER]
- **Razão social / CNPJ:** [PREENCHER]
- **Setor / nicho:** [PREENCHER — ex: clínica odontológica, e-commerce de moda, corretora de imóveis]
- **Localização / atuação:** [cidade, estado, online/offline]
- **Site / redes:** [URLs]
- **Responsável (decisor):** [nome, telefone, e-mail]

## 2. Posicionamento e tom de voz

- **Proposta de valor (1 frase):** [PREENCHER]
- **Público-alvo principal:** [persona resumida]
- **Tom de voz:** [ex: próximo, direto, informal, autoridade técnica]
- **Palavras que usamos:** [ex: "conquista", "realização"]
- **Palavras que EVITAMOS:** [ex: "barato", "promoção relâmpago"]
- **Referências de marca:** [marcas que servem de inspiração]

> Detalhes longos vão em `branding/guidelines.md`.

## 3. Produtos / serviços

Lista resumida (detalhes em `produtos/`):

- [Produto 1] — [1 linha]
- [Produto 2] — [1 linha]

## 4. Provas sociais e diferenciais

Resumo (histórico completo em `memory/historico/`):

- [Resultado / depoimento curto]
- [Número que importa, ex: "+120 famílias atendidas em 2025"]

## 5. Estrutura de pastas (mapa rápido)

```
.
├── CLAUDE.md              ← você está aqui
├── .claude/
│   ├── settings.json      ← MCPs e permissões
│   └── skills/            ← skills locais customizadas
├── memory/
│   ├── transcricoes/      ← reuniões transcritas (Whisper, tldv, Otter)
│   └── historico/         ← provas sociais, cases, resultados
├── branding/
│   ├── guidelines.md      ← identidade visual e verbal (longo)
│   └── logos/             ← SVG, PNG, variações
├── marketing/
│   ├── carrosseis/        ← criativos Instagram/LinkedIn
│   ├── ads/               ← campanhas Meta Ads (via MCP)
│   └── conteudo/          ← blog, e-mail, scripts
├── financeiro/            ← DRE, fluxo de caixa (.xlsx)
├── produtos/              ← catálogo, descrições, fichas técnicas
├── leads/                 ← exports Google Sheets, quiz, Linktree
└── site/                  ← código/conteúdo do site
```

## 6. Comandos disponíveis (slash commands)

Definidos em `.claude/commands/`. Digite `/` no Claude Code para listar.

| Comando | O que faz |
|---|---|
| `/instalar` | Onboarding guiado em 5 blocos — popula este CLAUDE.md, branding e memória |
| `/carrossel <tema>` | Gera roteiro + criativos para carrossel Instagram on-brand |
| `/anuncio-google <produto>` | Estrutura campanha Google Ads (Search/PMax) + CSV uploadable |
| `/anuncio-meta <produto>` | Estrutura campanha Meta Ads via MCP `meta-ads` |
| `/seo <url>` | Auditoria SEO on-page + plano priorizado |
| `/design <briefing>` | Orquestra stack de design (critique, criar, a11y, copy, handoff, research) |
| `/lead-sync` | Puxa leads do Google Sheets → snapshot em `leads/` |
| `/dre` | Lê/atualiza DRE em `financeiro/dre.xlsx` |
| `/fluxo-caixa` | Lança/projeta fluxo de caixa |

Cada comando lê este CLAUDE.md no início — mantenha as seções 1-5 atualizadas.

## 7. Regras invioláveis

- NUNCA publicar nada externo (post, ad, e-mail) sem o decisor aprovar.
- NUNCA inventar números ou depoimentos — só usar o que estiver em `memory/historico/`.
- Português do Brasil em toda comunicação externa.
- Respeitar LGPD: dados de leads ficam só em `leads/` e nunca em prompts compartilháveis.

## 8. Status atual (atualizar semanalmente)

- **Última atualização:** [DATA]
- **Última reunião processada:** [arquivo em memory/transcricoes/]
- **Campanhas ativas:** [lista]
- **Pendências:** [lista curta]
