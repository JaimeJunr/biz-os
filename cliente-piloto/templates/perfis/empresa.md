# CLAUDE.md — {{NOME_DO_CLIENTE}} (biz-os :: empresa estabelecida)

> PME com setores definidos (marketing, comercial, financeiro, operações). Tem processos, tem ERP, tem time.
> Foco: orquestrar marketing/leads/financeiro num único lugar; reduzir retrabalho entre áreas.
>
> **Arquivo irmão obrigatório:** [`.agents/product-marketing.md`](.agents/product-marketing.md)
> **Memória estruturada:** [`_memoria/`](_memoria/)

## 1. A empresa

- **Nome fantasia:** {{NOME_DO_CLIENTE}}
- **Razão social / CNPJ:** [PENDENTE]
- **Setor / nicho:** [PENDENTE]
- **Localização / unidades:** [PENDENTE]
- **Site / canais:** [PENDENTE]
- **Decisor (quem aprova):** [PENDENTE]

## 2. Voz e posicionamento

- **Tom (3 adjetivos):** [PENDENTE]
- **Proposta de valor (1 frase):** [PENDENTE]
- **Diferenciais (top 3):** [PENDENTE]
- **Palavras SEMPRE/NUNCA:** [PENDENTE]

> Detalhes longos em `identidade/guidelines.md` + `identidade/design-guide.md`.

## 3. Linhas de produto/serviço

- [Linha 1] — [resumo + margem média]
- [Linha 2] — [resumo + margem média]

> Fichas detalhadas em `produtos/<slug>.md`.

## 4. Provas e diferenciais

- [PENDENTE — números acumulados, cases, depoimentos em `dados/historico/`]

## 5. Estrutura de pastas

```
.
├── CLAUDE.md
├── .agents/, .claude/
├── _memoria/              ← estado vivo da empresa
├── identidade/            ← brand book + design system + logos
├── dados/                 ← inputs (transcricoes/, historico/, pesquisas/)
├── marketing/             ← outputs do marketing (carrosseis/, ads/, conteudo/)
├── produtos/              ← catálogo, fichas técnicas, scripts de venda
├── leads/                 ← CRM exports + snapshots (gitignored)
├── financeiro/            ← DRE, fluxo de caixa, conciliação
├── operacoes/             ← rituais, procedimentos, SLAs internos
├── site/                  ← código/conteúdo do site institucional
└── templates/             ← biblioteca interna
```

## 6. Slash commands úteis para empresa

| Comando | Quando usar |
|---|---|
| `/abrir` | Início de sessão — diz em qual área vai operar (marketing, comercial, financeiro) |
| `/carrossel`, `/anuncio-meta`, `/anuncio-google` | Marketing |
| `/lead-sync` | Sync com Sheets/CRM |
| `/dre`, `/fluxo-caixa` | Financeiro |
| `/seo` | Auditoria do site institucional |
| `/salvar` | Registrar decisões e padrões em `_memoria/` ou `dados/historico/` |

## 7. Regras invioláveis

- NUNCA publicar sem o decisor aprovar.
- NUNCA misturar dados de áreas: marketing não vê custo, financeiro não edita criativo.
- LGPD: leads em `leads/`, dados sensíveis nunca em prompts compartilháveis.
- Português do Brasil em toda comunicação externa.

## 8. Status atual

- **Última atualização:** [DATA]
- **Campanhas ativas:** [PENDENTE]
- **Metas do trimestre:** [PENDENTE]
- **Pendências críticas:** [PENDENTE]

---

<!-- ============================================================
     SNIPPET: comportamento contínuo do agente
     Concatenado no fim do CLAUDE.md pelo /instalar (Fase 3 passo 6).
     Idêntico entre os 4 perfis — manutenção neste arquivo único.
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
- Se é referência visual (print, foto, moodboard), salve o registro em `dados/referencias-visuais.md` com data + descrição. O arquivo binário vai em `dados/refs/` ou subdir específico (`dados/empreendimentos/<nome>/`, `dados/clientes/<nome>/`, `dados/concorrentes/<nome>/` etc.) — crie a pasta se não existir, seguindo as convenções de `dados/README.md`. Quando um subprojeto acumula 3+ arquivos relacionados, crie um `README.md` curto no subdir explicando o contexto.
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
