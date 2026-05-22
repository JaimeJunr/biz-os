# CLAUDE.md — {{NOME_DO_CLIENTE}} (biz-os :: freelancer)

> Pessoa que atende clientes por projeto/contrato. Organiza-se por cliente, não por funil próprio.
> Foco: pipeline previsível, propostas rápidas, entregas consistentes, cobrança em dia.
>
> **Arquivo irmão obrigatório:** [`.agents/product-marketing.md`](.agents/product-marketing.md)
> **Memória estruturada:** [`_memoria/`](_memoria/)

## 1. Quem sou eu

- **Nome (pessoal + comercial):** {{NOME_DO_CLIENTE}}
- **Serviço principal:** [PENDENTE]
- **Tipo de cliente que atendo:** [PENDENTE]
- **Site / portfólio:** [PENDENTE]

## 2. Voz e posicionamento

- **Tom (3 adjetivos):** [PENDENTE]
- **Diferencial real:** [PENDENTE]
- **Palavras que SEMPRE uso:** [PENDENTE]
- **Palavras que NUNCA uso:** [PENDENTE]

> Detalhes longos em `identidade/guidelines.md` + `identidade/design-guide.md`.

## 3. Serviços e pacotes

- [Pacote 1] — [escopo + prazo + investimento]
- [Pacote 2] — [escopo + prazo + investimento]
- [Hora avulsa] — [PENDENTE]

## 4. Provas e diferenciais

- [PENDENTE — clientes anteriores, cases, depoimentos em `dados/historico/`]

## 5. Estrutura de pastas

```
.
├── CLAUDE.md
├── .agents/, .claude/
├── _memoria/              ← estado vivo (empresa, estratégia, preferências, user_role)
├── identidade/            ← minha marca + design system
├── dados/                 ← inputs (transcricoes/, historico/)
├── marketing/             ← captação de novos clientes (carrosseis/, ads/, conteudo/)
├── produtos/              ← descrições dos pacotes
├── leads/                 ← pipeline de novos clientes (gitignored)
├── clientes/              ← um subdir por cliente ativo (criar à mão quando fechar)
├── financeiro/            ← DRE, fluxo, contas a receber
├── site/
└── templates/             ← biblioteca local (perfis, identidade, ferramentas, skills)
```

> Crie `clientes/<nome>/` quando fechar um novo contrato. Cada subdir guarda escopo, deliverables e atas.

## 6. Slash commands úteis para freelancer

| Comando | Quando usar |
|---|---|
| `/abrir` | Início de sessão |
| `/carrossel` | Captação — autoridade no nicho |
| `/seo` | Auditoria de portfólio e clientes |
| `/anuncio-google`, `/anuncio-meta` | Captação paga |
| `/fluxo-caixa` | Recebíveis e parcelas |
| `/salvar` | Lições por projeto em `dados/historico/` |

## 7. Regras invioláveis

- NUNCA enviar proposta sem revisar margem em `financeiro/`.
- NUNCA usar caso de cliente em material público sem permissão.
- Respeitar LGPD em dados de leads.

## 8. Status atual

- **Última atualização:** [DATA]
- **Clientes ativos:** [PENDENTE]
- **Pipeline (em conversa):** [PENDENTE]
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
