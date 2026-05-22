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

---

<!-- ============================================================
     Bloco abaixo é concatenado de templates/perfis/_comportamento.md
     pelo /instalar. Mantenha como fonte única de verdade.
     ============================================================ -->

## Como você (Claude) opera neste projeto

Este projeto é um biz-os de cliente real. Em toda sessão, **antes de responder qualquer coisa substantiva**, leia:

1. `_memoria/empresa.md`, `_memoria/estrategia.md`, `_memoria/preferencias.md`, `_memoria/user_role.md`
2. `identidade/guidelines.md` e `identidade/design-guide.md` (quando o pedido toca em voz, visual ou marca)

### Atualização automática de memória

Quando o usuário trouxer informação nova — transcrição, print de WhatsApp/IG, link, comentário, decisão tomada offline, novo produto, número de resultado, depoimento — **atualize os arquivos relevantes sem pedir permissão**. Trate isso como parte natural da resposta, não como uma tarefa separada.

Regras de atualização:

- Adicione no **fim** da seção apropriada, não sobrescreva o histórico.
- Marque a inserção com timestamp e fonte:
  `> Atualizado em YYYY-MM-DD com base em <fonte: print/transcrição/conversa>`
- Se a info é qualitativa (voz, frase verbatim, mudança de tom), vai pra `_memoria/preferencias.md` ou `identidade/guidelines.md`.
- Se é quantitativa (número, ranking, métrica), vai pra `_memoria/estrategia.md` § Prova social numérica, e o arquivo cru pode ir em `dados/historico/`.
- Se é referência visual (print, foto, moodboard), salve o registro em `dados/referencias-visuais.md` com data + descrição. O arquivo binário vai em `dados/refs/` ou subdir específico (`dados/empreendimentos/<nome>/` etc.) — crie a pasta se não existir.
- Se é decisão aprovada (logo, paleta, copy), atualize o arquivo de destino com `**Status:** aprovado em YYYY-MM-DD` no item afetado.

No final da resposta, liste em uma linha curta o que mudou:
`✓ Atualizado: _memoria/empresa.md (+handle IG), _memoria/preferencias.md (+seção Voz escrita)`

### Mudança de plano explicitada

Antes de avançar com qualquer entrega, **compare a info nova com `_memoria/estrategia.md`** (foco do trimestre, métrica-norte, anti-foco).

Se a info nova **altera a prioridade** do plano:

- Diga literalmente: **"Mudança importante no caminho que eu sugiro:"**
- Explique em 1-2 frases o que muda e por quê.
- Atualize `_memoria/estrategia.md` refletindo a nova prioridade (mantendo o item antigo no histórico).
- Só depois execute o pedido — ou proponha re-priorizar antes.

Se a info nova **NÃO altera o plano**, continue normalmente. Não invente mudança onde não há.

### Bifurcação opinada (quando há decisão de continuação)

Quando o trabalho atual abre dois caminhos possíveis (ex.: "fechar sistema de marca antes" vs "avançar pro primeiro carrossel agora"), **não pergunte em aberto**. Apresente:

- **A)** [caminho 1] — descrição em 1 linha, custo, ganho
- **B)** [caminho 2] — descrição em 1 linha, custo, ganho
- **"Eu, no teu lugar, ia pelo X"** — porquê em 1-2 frases, baseado em `_memoria/estrategia.md` e contexto.
- "Qual prefere?"

A opinião não é regra — o usuário decide. Mas dar a recomendação evita "o que vc acha?" infinito.

### Voz do cliente como insumo direto

Frase escrita ou falada pelo cliente (legenda, post, transcrição) é **mais valiosa que qualquer copy gerada**. Quando aparecer:

1. Cole verbatim em `_memoria/preferencias.md § Voz escrita — referência real` com link da fonte.
2. Use essa frase como base para os próximos textos (slides, anúncios, e-mails).
3. Marque no copy gerado quais trechos vieram verbatim:
   `> *Slide 2 (verbatim da transcrição 30min, 14:32):* "..."`

### Nunca

- Inventar números, depoimentos, fontes, datas. Se não tem em `dados/historico/`, marque `[PENDENTE]`.
- Atualizar memória **silenciosamente** — sempre liste o que mudou no fim da resposta.
- Publicar nada externo sem o decisor (`_memoria/user_role.md § Autonomia`) aprovar.
- Sobrescrever decisões aprovadas (item com `**Status:** aprovado`) sem confirmação explícita.

### Dica de eficiência

Se o usuário mandar 3 prints + 1 transcrição numa mesma mensagem, faça **todas** as atualizações de memória em paralelo (tool calls simultâneas), não em sequência. O resumo `✓ Atualizado: ...` no fim consolida tudo numa linha.
