---
description: Gera prompts de imagem on-brand para Midjourney, Sora/Imagen/nano-banana, DALL-E, Flux/SD ou genérico. Usa identidade/design-guide.md + _memoria/preferencias.md como guard-rails.
argument-hint: "[tema livre opcional — ex: 'lifestyle do produto X na cozinha']"
---

# /prompt-imagem — Gerador de prompts on-brand

Arg: $ARGUMENTS

> Você gera prompts de imagem que respeitam a identidade visual do cliente. Toda decisão (paleta, estilo, mood, composição) deve ser rastreável a `identidade/design-guide.md` ou `_memoria/preferencias.md`. Se algo não estiver definido lá, pergunte — não invente.

---

## Fase 0 — Carregar contexto

Leia (em ordem):

1. `identidade/design-guide.md` — paleta (HEX), tipografia, estilo de imagem, iconografia, "o que NÃO fazer"
2. `_memoria/preferencias.md` — tom da marca, palavras-chave
3. `_memoria/empresa.md` — o que o negócio faz, cliente típico (informa a cena)
4. `identidade/guidelines.md` — direção verbal (informa a legenda/alt text, se pedirem)

Se `identidade/design-guide.md` estiver com muito `[PENDENTE]` (paleta sem HEX, estilo de imagem vazio), avise:

> "O design-guide ainda tem campos pendentes (X, Y). Posso gerar prompt com diretriz textual ('moderno e leve com tons terrosos'), mas o resultado fica menos consistente. Quer (1) preencher o design-guide agora rodando uma mini-entrevista visual, (2) seguir com diretriz textual?"

---

## Fase 1 — Perguntar parâmetros (via AskUserQuestion)

**Bloco único** com 4 perguntas relacionadas (uma chamada `AskUserQuestion`):

### Pergunta 1: Plataforma destino
Header: "Plataforma" — opções:
- **Midjourney v6+** — sintaxe com flags (`--ar`, `--style raw`, `--sref`, `--cref`, `--no`)
- **Sora / Imagen / nano-banana / Gemini Image** — linguagem natural pura, sem flags
- **DALL-E 3 / ChatGPT** — descritivo longo em prosa
- **Flux / SD / Leonardo / Playground** — tags + weights `(palavra:1.2)` + negative prompt

> Se o usuário não souber, deixe ele escolher "Other" e responder livre — você adapta. Se houver dúvida sobre uma plataforma não-listada (Krea, Recraft, Ideogram, Adobe Firefly), trate como genérica + ajuste sintaxe.

### Pergunta 2: Tipo de imagem
Header: "Tipo" — opções:
- **Product shot** — produto isolado, packshot, e-commerce, fundo limpo
- **Lifestyle** — produto em uso, contexto humano, cena ambiente
- **Slide de carrossel** — composição pra carrossel IG/LinkedIn (1080×1350), texto curto no topo
- **Hero / banner** — imagem grande pra topo de landing/site

> "Other" cobre: ícone, ilustração editorial, mockup, fundo abstrato, etc.

### Pergunta 3: Aspect ratio
Header: "Aspect" — opções:
- **1:1** — feed quadrado, perfil, ícone
- **4:5** — feed Instagram vertical, carrossel padrão (1080×1350)
- **9:16** — story, reel, TikTok
- **16:9** — banner, hero de site, YouTube thumbnail

### Pergunta 4: Variações
Header: "Quantas" — opções:
- **1 prompt focado** — uma direção, máxima fidelidade ao brief
- **2 variações** — mesma cena, ângulos/moods diferentes
- **3 variações exploratórias** — diferentes estilos pra A/B test

---

## Fase 2 — Coletar brief específico

Se `$ARGUMENTS` veio com tema (ex: "lifestyle do trio proteção na cozinha"), use como base. Se veio vazio, faça **uma** pergunta livre via `AskUserQuestion` header "Brief":

> "Descreva a cena ou o produto que quer na imagem. Pode ser curto: 'velas acesas em mesa de jantar' / 'closeup do rótulo' / 'mulher segurando o produto na cozinha aberta'."

Se a resposta for vaga e faltar algo crítico (sujeito, ambiente, ação), pergunte UMA vez por o que falta. Não enrole.

---

## Fase 3 — Gerar prompts

Para cada variação solicitada, monte o prompt seguindo a sintaxe da plataforma. Inclua **todos** os elementos abaixo, na ordem certa pra cada plataforma:

| Elemento | Vem de |
|---|---|
| Sujeito + ação | brief do usuário |
| Ambiente / cenário | brief + `_memoria/empresa.md` (contexto do negócio) |
| Iluminação | `design-guide.md §Estilo de imagem` ou padrão pro tipo |
| Paleta dominante | `design-guide.md §Paleta` (HEX) — descreva como cores reais ("warm terracotta, sage green") |
| Estilo de imagem | `design-guide.md §Estilo de imagem` (foto real / ilustração / 3D / mockup) |
| Mood / atmosfera | `_memoria/preferencias.md §Voz` traduzido pra visual ("próximo, calmo, sensorial" → "intimate, soft, tactile") |
| Composição / ângulo | inferir do tipo (product shot = centered eye-level; lifestyle = candid; hero = wide rule-of-thirds) |
| Câmera / lente (se foto) | inferir do tipo (product = macro/50mm; lifestyle = 35mm; hero = 24mm/wide) |
| Negative prompt | `design-guide.md §O que NÃO fazer` |

### Sintaxe por plataforma

**Midjourney v6+:**
```
<sujeito + ação>, <ambiente>, <iluminação>, <paleta em palavras>,
<estilo de imagem>, <mood>, <composição>, <câmera/lente>
--ar <X:Y> --style raw --no <itens do "o que NÃO fazer">
```
Adicione `--sref <url>` se o cliente tem moodboard ou referências em `identidade/refs/` (se a pasta existir).

**Sora / Imagen / nano-banana / Gemini:**
Prosa descritiva natural, 2-4 frases. Sem flags. Termine com a paleta e o mood traduzidos. Aspect ratio vai como parte da descrição ("vertical 4:5 frame") ou no campo separado da plataforma.

**DALL-E 3 / ChatGPT:**
Prosa longa e descritiva, 4-6 frases. Mencione paleta como cores nomeadas + adjetivos. Termine com "in the style of [descrição do estilo], <mood>, <ambiente sensorial>." Aspect ratio no campo separado da plataforma.

**Flux / SD / Leonardo / Playground:**
```
Tags separadas por vírgula, com weights onde relevante:
<sujeito:1.2>, <ambiente>, <iluminação>, <paleta>, <estilo>, <mood>,
<câmera/lente>, <composição>

Negative prompt: <itens do "o que NÃO fazer">, low quality, blurry,
distorted, watermark, text
```

**Genérico / outra plataforma:**
Gere em prosa natural (estilo Sora) + observação curta no fim sobre o que adaptar ("se for Krea, mover a paleta pro `--style`...").

---

## Fase 4 — Salvar e mostrar

1. Salve em `marketing/prompts-imagem/YYYY-MM-DD-<slug>.md`. Crie a pasta se não existir.
2. Estrutura do arquivo:

```markdown
# <Slug do brief>

- **Data:** YYYY-MM-DD
- **Plataforma:** Midjourney v6+ / Sora / DALL-E / Flux / Genérico
- **Tipo:** product / lifestyle / carrossel-slide / hero / outro
- **Aspect:** 1:1 / 4:5 / 9:16 / 16:9
- **Brief original:** <texto que o usuário descreveu>

## Guard-rails aplicados (auditável)

- Paleta: <HEX1, HEX2, HEX3> — `identidade/design-guide.md §Paleta`
- Estilo de imagem: <foto real / ilustração / etc> — `§Estilo de imagem`
- Mood: <adjetivos traduzidos> — `_memoria/preferencias.md §Voz`
- Negative: <itens> — `§O que NÃO fazer`

## Prompts gerados

### Variação 1
```
<prompt aqui>
```

### Variação 2 (se solicitado)
```
<prompt aqui>
```

## Como usar

Cole o prompt na plataforma. Aspect ratio: <X:Y>.
Se o resultado vier <muito X / pouco Y>, ajuste assim: <dica curta>.
```

3. No chat, mostre:
   - Os prompts em blocos de código (pronto pra copiar)
   - Path do arquivo salvo
   - 1-2 dicas de ajuste se o primeiro render não vier ideal

---

## Fase 5 — Iteração (opcional, sob demanda)

Se o usuário voltar depois com "o primeiro saiu meio plástico, refaz mais natural", abra o arquivo salvo, modifique e SOBRESCREVA com um sufixo de versão (`-v2`, `-v3`). Não crie arquivos novos pra cada iteração — mantenha histórico no mesmo arquivo num bloco `## Iterações`.

---

## Regras invioláveis

- Toda decisão visual rastreável ao `design-guide.md` ou `preferencias.md`. Se inventar (porque o guia tá pendente), MARQUE no bloco "Guard-rails aplicados" com `(inferido — pendente no design-guide)`.
- Toda pergunta via `AskUserQuestion`. Bloco único de 4 perguntas na Fase 1, depois UMA pergunta de brief na Fase 2 se necessário.
- Português do Brasil na conversa. Prompts gerados em **inglês** (modelos performam melhor) — exceto se a plataforma for nacional ou o usuário pedir.
- Não rodar nada na plataforma — só GERAR o prompt. A execução é do usuário.
- Não inventar resultados. Não dizer "o prompt vai gerar X" — só "este prompt pede X".
