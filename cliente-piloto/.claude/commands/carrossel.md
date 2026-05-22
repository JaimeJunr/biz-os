---
description: Carrossel Instagram/LinkedIn on-brand. Força pré-aprovação de copy (texto verbatim do cliente quando possível) ANTES de gerar arte.
argument-hint: "<tema> [--slides=6] [--objetivo=educar|vender|prova-social|autoridade]"
---

# /carrossel — Carrossel on-brand com pré-aprovação de copy

Tema/objetivo: **$ARGUMENTS**

> Regra-mestra: **NUNCA gere arte antes de o copy estar aprovado pelo usuário.** Carrossel onde o texto não funciona não salva com design bonito. A ordem é: contexto → briefing → copy rascunhado → aprovação → arte.

---

## Fase 0 — Carregar contexto (obrigatório, em paralelo)

Leia simultaneamente (tool calls paralelos):

- `_memoria/empresa.md`, `_memoria/preferencias.md`, `_memoria/estrategia.md`
- `_memoria/preferencias.md § Voz escrita — referência real` (frases verbatim do cliente)
- `identidade/guidelines.md` (tom, exemplos SIM/NÃO)
- `identidade/design-guide.md` (paleta, tipografia — só relevante na Fase 3)
- `dados/historico/` (provas sociais, números, depoimentos)
- `.agents/product-marketing.md` (schema do Corey, usado pela skill `social`)
- Último arquivo em `marketing/carrosseis/` como referência de estilo

Se `_memoria/preferencias.md § Voz escrita` estiver vazio, **avise**:
> "Não tenho frases verbatim do cliente registradas. O carrossel vai sair em voz inferida do `guidelines.md`, mas fica menos autêntico. Quer (1) seguir assim, (2) me mandar 2-3 frases recentes do cliente (post IG, áudio de WhatsApp, transcrição) antes de continuar?"

---

## Fase 1 — Briefing (uma chamada `AskUserQuestion`, bloco coeso)

Faça **uma** chamada de `AskUserQuestion` com até 4 perguntas:

1. **Objetivo do carrossel** (opções: "Educar", "Vender", "Prova social", "Autoridade / posicionamento")
2. **Número de slides** (opções: "6", "8", "10")
3. **CTA final** (opções: "DM 'quero saber mais'", "Link na bio", "Comenta abaixo", "Outro — livre")
4. **Tem dado/número específico pra usar?** (livre — se sim, deve estar em `dados/historico/`)

Se o usuário NÃO mandou tema em `$ARGUMENTS`, adicione uma pergunta livre: "Qual tema/ângulo?".

---

## Fase 2 — Rascunho de copy (PRÉ-ARTE, OBRIGATÓRIO)

### 2.1 — Estrutura conforme objetivo

| Objetivo | Slide 1 (capa) | Slides do meio | Penúltimo | CTA |
|---|---|---|---|---|
| Educar | Pergunta provocadora ou dado contraintuitivo | 1 ideia/slide, máx 25 palavras | Síntese ou aplicação prática | CTA suave |
| Vender | Dor ou desejo do cliente | Solução em passos, prova | Quebra de objeção | CTA direto |
| Prova social | Número impressionante OU pergunta "por que clientes me indicam?" | Cases / depoimentos verbatim | Síntese de autoridade | CTA suave |
| Autoridade | "Hoje virei X" / marco / opinião forte | Argumentos / contexto | Síntese | CTA passivo (seguir, salvar) |

### 2.2 — Escrita

Para cada slide, escreva:

```
### Slide N — <tipo: capa / desenvolvimento / penúltimo / CTA>

Texto sobreposto: "<texto curto e direto, máx 12 palavras>"
Subtítulo (opcional): "<complemento de 5-10 palavras>"

Nota de design: <orientação visual — foto, cor, layout, NÃO desenhe ainda>
Fonte/verbatim: <se veio de _memoria/preferencias.md § Voz escrita ou dados/historico/, cole a referência e a frase original>
```

**Quando usar verbatim:**

- Sempre que existir frase do cliente sobre o tema, **use ela em vez de inventar**.
- Marque com `> *Slide N (verbatim de <fonte>):* "..."` abaixo do slide.
- Se não tem verbatim sobre o tema, escreva inferindo do tom de `_memoria/preferencias.md`. Marque `*(inferido)*`.

### 2.3 — Apresentar pro usuário e PERGUNTAR

Mostre o rascunho COMPLETO dos N slides em texto puro (sem nenhum visual ainda). Use `AskUserQuestion`:

> Header: "Copy aprovado?" — opções:
> - **Sim, manda pra arte** — sigo pra Fase 3
> - **Ajustar slide específico** — diga qual e o que mudar
> - **Refazer tudo** — refaço com novo ângulo/tom
> - **Pausar e mandar mais voz** — espera o usuário enviar mais material verbatim

**Não avance pra Fase 3 sem aprovação explícita aqui.**

---

## Fase 3 — Arte (só com copy aprovado)

### 3.1 — Carregar identidade visual

- `identidade/design-guide.md § Paleta` — HEX exatos
- `identidade/design-guide.md § Tipografia` — famílias e pesos (Plus Jakarta Sans / DM Sans / Manrope etc.)
- `identidade/design-guide.md § Grid` — usar 1080×1350 com margem do guide
- `identidade/design-guide.md § O que NÃO fazer` — restrições

Se `design-guide.md` estiver com `[PENDENTE]` em algum campo crítico, pare e avise:
> "Falta <X> no design-guide. Posso (1) gerar com diretriz textual, (2) propor 2-3 opções via `/design` pra você escolher antes."

### 3.2 — Salvar arquivos

Crie a pasta `marketing/carrosseis/YYYY-MM-DD-<slug>/`:

```
marketing/carrosseis/YYYY-MM-DD-<slug>/
├── 00-roteiro.md          ← copy aprovado da Fase 2
├── 01-capa.html           ← HTML+CSS 1080×1350 usando frontend-design
├── 02-slide.html
├── ...
├── NN-cta.html
├── legenda.md             ← legenda do post + 5-8 hashtags + 3 variações de primeiro comentário
└── prompts-imagem.md      ← se algum slide pede imagem gerada por IA, prompts via /prompt-imagem
```

Para cada slide HTML, use a skill `frontend-design`. Respeite a paleta e tipografia do `design-guide.md`. Não invente cores nem fontes fora dele.

### 3.3 — Renderizar preview SVG/PNG

Se possível (frontend-design tem essa capacidade), gere também um `preview.png` ou `<slide>.svg` por slide pra visualização rápida.

---

## Fase 4 — Checklist de qualidade

Antes de marcar como entregue, valide cada item:

- [ ] Tom bate com `_memoria/preferencias.md` (tom + palavras SEMPRE/NUNCA)?
- [ ] Zero número ou depoimento inventado? Todos rastreáveis a `dados/historico/`?
- [ ] CTA único e claro no último slide?
- [ ] Capa funciona como thumb (legível em 200px)?
- [ ] Hashtags do nicho, não genéricas?
- [ ] Frases verbatim foram usadas onde havia disponibilidade?
- [ ] Cores e tipografia 100% rastreáveis ao `design-guide.md`?
- [ ] Nenhum slide ultrapassa 25 palavras de texto sobreposto?

---

## Fase 5 — Entrega + memória

1. Liste o que foi criado:
   ```
   ✓ marketing/carrosseis/YYYY-MM-DD-<slug>/00-roteiro.md
   ✓ marketing/carrosseis/YYYY-MM-DD-<slug>/01-capa.html → NN-cta.html
   ✓ marketing/carrosseis/YYYY-MM-DD-<slug>/legenda.md
   ```

2. Atualize `_memoria/estrategia.md` adicionando esta peça no histórico de iniciativas (com timestamp + objetivo).

3. Se algum trecho do copy veio verbatim do cliente, confirme que a fonte está registrada em `_memoria/preferencias.md § Voz escrita`. Se não estava, adicione agora.

4. Lembre que NADA é publicado sem o decisor (`_memoria/user_role.md § Autonomia`) aprovar.

---

## Regras invioláveis

- **NUNCA arte antes de copy aprovado.** Fase 3 só roda com sinal verde da Fase 2.3.
- Toda pergunta via `AskUserQuestion`. Bloco coeso na Fase 1, decisão única na Fase 2.3.
- Verbatim do cliente > copy gerada. Sempre que houver, use.
- Zero invenção de números, depoimentos, datas. Marque `[PENDENTE]` ou pergunte.
- Português do Brasil em todo o copy (incluindo legenda e hashtags em PT-BR).
- Não publicar. Decisor aprova.
