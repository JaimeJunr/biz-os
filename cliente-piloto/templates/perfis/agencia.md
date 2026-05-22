# CLAUDE.md — {{NOME_DO_CLIENTE}} (biz-os :: agência / consultoria)

> Equipe pequena (2-15 pessoas) entregando para vários clientes. Tem processos, tem time, tem operação.
> Foco: padronização de entregáveis, escala sem perder qualidade, gestão de margem por cliente.
>
> **Arquivo irmão obrigatório:** [`.agents/product-marketing.md`](.agents/product-marketing.md)
> **Memória estruturada:** [`_memoria/`](_memoria/)

## 1. A agência

- **Nome:** {{NOME_DO_CLIENTE}}
- **CNPJ:** [PENDENTE]
- **Tamanho do time:** [PENDENTE]
- **Site / cases:** [PENDENTE]

## 2. Voz e posicionamento

- **Tom (3 adjetivos):** [PENDENTE]
- **Vertical / especialidade:** [PENDENTE]
- **Diferencial real:** [PENDENTE]
- **Palavras que SEMPRE/NUNCA usamos:** [PENDENTE]

> Detalhes longos em `identidade/guidelines.md` + `identidade/design-guide.md`.

## 3. Serviços oferecidos

- [Serviço 1 / squad] — [escopo + ticket médio]
- [Serviço 2] — [escopo + ticket médio]
- [Retainer mensal] — [PENDENTE]

## 4. Provas e diferenciais

- [PENDENTE — cases por vertical em `dados/historico/`]

## 5. Estrutura de pastas

```
.
├── CLAUDE.md
├── .agents/, .claude/
├── _memoria/              ← estado vivo da agência
├── identidade/            ← marca da agência + design system
├── dados/                 ← inputs (transcricoes/, historico/)
├── marketing/             ← marketing da própria agência (carrosseis/, ads/, conteudo/)
├── produtos/              ← descrições dos serviços/squads
├── leads/                 ← pipeline comercial (gitignored)
├── clientes/              ← subdir por cliente ativo, cada um com seu próprio CLAUDE.md
├── financeiro/            ← DRE consolidado + por cliente
├── site/
└── templates/             ← biblioteca interna (perfis, identidade, ferramentas, skills)
```

> Cada `clientes/<slug>/` é mini-biz-os com seu próprio CLAUDE.md, _memoria/, identidade/, dados/.

## 6. Slash commands úteis para agência

| Comando | Quando usar |
|---|---|
| `/abrir` | Início de sessão — define em qual cliente vai trabalhar |
| `/carrossel` | Para clientes (sempre escolher subdir do cliente) |
| `/anuncio-google`, `/anuncio-meta` | Campanhas (por cliente) |
| `/seo` | Auditorias mensais |
| `/dre`, `/fluxo-caixa` | Margem por cliente + consolidado |
| `/lead-sync` | Pipeline comercial |
| `/salvar` | Padrões e aprendizados pra biblioteca interna |

## 7. Regras invioláveis

- Cliente A nunca vê dado de Cliente B (acesso só ao próprio subdir).
- Toda peça revisada por humano antes de publicar.
- NDA respeitado: caso de cliente só vira material público com autorização.
- LGPD: leads em `leads/`, jamais em prompts compartilhados.

## 8. Status atual

- **Última atualização:** [DATA]
- **Clientes ativos:** [PENDENTE]
- **MRR / receita do mês:** [PENDENTE]
- **Pendências:** [PENDENTE]

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
