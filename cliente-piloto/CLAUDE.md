# CLAUDE.md — Cliente Piloto (biz-os)

> [!IMPORTANT]
> **Primeira sessão neste projeto?** Se `_memoria/empresa.md` ainda estiver com `[PENDENTE]` (não preenchido), rode **`/instalar`** AGORA antes de qualquer outra coisa. O `/instalar` faz a entrevista guiada, escolhe o perfil certo (solopreneur, freelancer, agência ou empresa), e adapta este CLAUDE.md ao negócio.

> Este arquivo é lido automaticamente pelo Claude Code em toda sessão.
> É o "cérebro persistente" do cliente. Mantenha curto, denso e atualizado.
>
> **Memória estruturada irmã:** [`_memoria/MEMORY.md`](_memoria/MEMORY.md) — índice + arquivos planos (empresa, estratégia, preferências, user_role).
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

> Detalhes longos vão em `identidade/guidelines.md`.

## 3. Produtos / serviços

Lista resumida (detalhes em `produtos/`):

- [Produto 1] — [1 linha]
- [Produto 2] — [1 linha]

## 4. Provas sociais e diferenciais

Resumo (histórico completo em `dados/historico/`):

- [Resultado / depoimento curto]
- [Número que importa, ex: "+120 famílias atendidas em 2025"]

## 5. Estrutura de pastas (mapa rápido)

```
.
├── CLAUDE.md              ← você está aqui
├── .agents/               ← schema obrigatório das 40 skills do Corey
├── .claude/
│   ├── settings.json      ← MCPs, plugins pré-declarados, hooks
│   ├── commands/          ← slash commands biz-os
│   └── skills/            ← skills locais customizadas
├── _memoria/              ← memória estruturada (lida sempre que o agente abre)
│   ├── MEMORY.md          ← índice
│   ├── empresa.md         ← quem é, o que faz, contexto
│   ├── estrategia.md      ← foco e metas do trimestre
│   ├── preferencias.md    ← tom de voz, palavras, restrições
│   └── user_role.md       ← quem opera o biz-os
├── identidade/
│   ├── guidelines.md      ← identidade verbal (tom, exemplos SIM/NÃO)
│   ├── design-guide.md    ← identidade visual (paleta, tipografia, grid)
│   └── logos/             ← SVG, PNG, variações
├── dados/                 ← INPUTS do cliente
│   ├── transcricoes/      ← reuniões transcritas (Whisper, tldv, Otter)
│   └── historico/         ← provas sociais, cases, resultados
├── marketing/             ← OUTPUTS gerados
│   ├── carrosseis/        ← criativos Instagram/LinkedIn
│   ├── ads/               ← campanhas Meta Ads (via MCP)
│   └── conteudo/          ← blog, e-mail, scripts
├── produtos/              ← catálogo, descrições, fichas técnicas
├── leads/                 ← exports Google Sheets, quiz, Linktree
├── financeiro/            ← DRE, fluxo de caixa (.xlsx)
├── site/                  ← código/conteúdo do site
└── templates/             ← biblioteca local (perfis, identidade, ferramentas, skills)
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
| `/prompt-imagem <brief>` | Gera prompts on-brand pra Midjourney/Sora/DALL-E/Flux usando `identidade/design-guide.md` |
| `/dre` | Lê/atualiza DRE em `financeiro/dre.xlsx` |
| `/fluxo-caixa` | Lança/projeta fluxo de caixa |

Cada comando lê este CLAUDE.md no início — mantenha as seções 1-5 atualizadas.

## 7. Regras invioláveis

- NUNCA publicar nada externo (post, ad, e-mail) sem o decisor aprovar.
- NUNCA inventar números ou depoimentos — só usar o que estiver em `dados/historico/`.
- Português do Brasil em toda comunicação externa.
- Respeitar LGPD: dados de leads ficam só em `leads/` e nunca em prompts compartilháveis.

## 8. Status atual (atualizar semanalmente)

- **Última atualização:** [DATA]
- **Última reunião processada:** [arquivo em dados/transcricoes/]
- **Campanhas ativas:** [lista]
- **Pendências:** [lista curta]
