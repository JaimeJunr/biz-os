---
description: Onboarding interativo multi-fase — escolhe perfil, faz entrevista com AskUserQuestion, popula _memoria/, identidade/ e CLAUDE.md
argument-hint: "[nome-do-cliente opcional]"
---

# /instalar — Onboarding biz-os (interativo)

Arg: $ARGUMENTS

> Você é o instalador do biz-os. Conduza este onboarding como uma conversa real, **usando a ferramenta `AskUserQuestion` para cada pergunta** — uma por vez, com opções pré-formuladas quando fizer sentido. Não despeje listas de perguntas em texto. Não acumule respostas — escreva incrementalmente em `_memoria/` ao final de cada bloco.

---

## REGRA-MESTRA: como perguntar

Para **toda** pergunta, use a ferramenta `AskUserQuestion`:

- 2-4 opções pré-formuladas quando houver padrões comuns (perfil, tom, modo de operação, plataformas).
- A opção "Other" aparece automaticamente — o usuário pode escrever resposta livre.
- Use `multiSelect: true` quando faz sentido marcar várias (plataformas ativas, palavras SEMPRE/NUNCA, etc.).
- Use `header` de até 12 chars como rótulo curto (ex: "Perfil", "Tom", "Canais").
- Inclua até 4 perguntas relacionadas no MESMO chamado de `AskUserQuestion` apenas quando elas formam um bloco coeso (ex: tom + pessoa + tempo verbal). Caso contrário, uma chamada por pergunta.

**Nunca** faça perguntas em texto puro do tipo "1. ... 2. ... 3. ...". Sempre via `AskUserQuestion`.

---

## Fase 0 — Sanidade da pasta

1. Rode `basename "$(pwd)"` — confira o nome da pasta atual.
2. Se a pasta for `cliente-piloto`, começar com `biz-os-`, ou ainda parecer genérica:
   - Use `AskUserQuestion` com header "Pasta" e opções:
     - "Renomeio depois" — sigo o onboarding com o nome atual
     - "Vou renomear agora" — abortar pra renomear no Explorer e reabrir
3. Se já existe `_memoria/empresa.md` com conteúdo (não só `[PENDENTE]`), use `AskUserQuestion` header "Já instalado" com opções:
   - "Revisar tudo do zero" — refaz o fluxo completo
   - "Atualizar só uma seção" — pula direto pra escolha de qual
   - "Abortar"

---

## Fase 1 — Perfil

Use `AskUserQuestion` com **uma pergunta**, header "Perfil", opções:

1. **Solopreneur** — uma pessoa só, marca pessoal + negócio misturados
2. **Freelancer** — atende clientes, organiza por projeto/cliente
3. **Agência / consultoria** — equipe pequena entregando pra vários clientes
4. **Empresa estabelecida** — empresa com setores (marketing, comercial, financeiro)

Anote a escolha. **Não copie o template do perfil ainda** — só na Fase 4.

---

## Fase 2 — Entrevista (via AskUserQuestion, blocos coesos)

Cada bloco é UMA chamada de `AskUserQuestion` com até 4 perguntas relacionadas. Após cada bloco, escreva o resultado no arquivo correspondente em `_memoria/` antes de seguir.

### Bloco 2.1 — Identidade básica → `_memoria/empresa.md`

Uma chamada de `AskUserQuestion` com:
- "Nome fantasia da marca/empresa?" (livre)
- "Razão social e CNPJ?" (livre, marcar opcional)
- "Onde atua?" (opções: "Online/nacional", "Local/regional", "Híbrido", multiSelect)
- "Sites ou redes principais?" (livre)

**Grava `_memoria/empresa.md` (parcial) imediatamente.** Mostre `✓ Escrito: _memoria/empresa.md`.

### Bloco 2.2 — Quem opera o biz-os → `_memoria/user_role.md`

Uma chamada com:
- "Sua relação com o negócio?" (opções: "Dono", "Sócio", "Filho/cônjuge do dono", "Gerente contratado", "Agência terceirizada")
- "Nível técnico?" (opções: "Confortável com terminal e código", "Só planilha e ferramentas visuais", "Prefiro tudo no WhatsApp/voz")
- "Tempo por semana pra marketing/operação?" (opções: "<2h", "2-5h", "5-10h", ">10h")
- "Autonomia de decisão?" (opções: "Decido sozinho", "Peço aprovação ao dono", "Só executo")

**Grava `_memoria/user_role.md` imediatamente.**

### Bloco 2.3 — O negócio → completar `_memoria/empresa.md`

Uma chamada com:
- "Em 1 frase, o que o negócio faz?" (livre)
- "Quem é o cliente típico?" (livre — peça uma pessoa real, não persona genérica)
- "Ticket médio?" (opções: "Até R$ 100", "R$ 100-500", "R$ 500-2k", "R$ 2k-10k", "R$ 10k+")
- "Maior gargalo HOJE?" (opções: "Captação de clientes", "Conversão de leads", "Produção/entrega", "Operação interna/processo", "Caixa", multiSelect)

**Completa `_memoria/empresa.md`. Mostre o arquivo final.**

### Bloco 2.4 — Voz e preferências → `_memoria/preferencias.md`

Uma chamada com:
- "Tom da marca em 3 adjetivos?" (livre — sugira exemplos: "próximo, direto, técnico" / "elegante, calmo, sensorial")
- "Como fala com o cliente?" (opções: "Você", "Vocês (1ª plural)", "Impessoal", "Depende do canal")
- "Quais palavras SEMPRE usam?" (livre — peça 3-5)
- "Quais palavras NUNCA usam?" (livre — peça 3-5)

**Grava `_memoria/preferencias.md`.**

### Bloco 2.5 — Estratégia atual → `_memoria/estrategia.md`

Uma chamada com:
- "Foco do próximo trimestre em 1 frase?" (livre)
- "Métrica-norte agora?" (opções: "Receita", "Número de clientes", "MRR/recorrência", "Leads gerados", "Reconhecimento de marca")
- "O que você decidiu NÃO fazer agora?" (livre — anti-foco)
- "Próxima revisão estratégica?" (opções: "Mensal", "Trimestral", "Sem data definida")

**Grava `_memoria/estrategia.md`.**

### Bloco 2.6 — Identidade visual (opcional) → `identidade/design-guide.md`

Uma chamada com:
- "Tem paleta de cores definida?" (opções: "Sim, tenho os HEX", "Não, mas tenho referência visual", "Ainda não pensei")
- Se "Sim" → pergunta livre pra colar os HEX
- Se "Não, mas tenho referência" → pergunta livre pra descrever a sensação ("moderno, leve, terra/verde" etc.)
- "Tem logo?" (opções: "Sim, vou subir em identidade/logos/", "Não, ainda vou criar", "Tenho mas precisa redesenhar")

**Copia `templates/identidade/design-guide.md` → `identidade/design-guide.md` e preenche o que conseguiu. Deixa `[PENDENTE]` no resto.**

### Bloco 2.7 — Canais e ferramentas → `_memoria/preferencias.md` (apêndice)

Uma chamada com:
- "Canais ativos hoje?" (opções: "Instagram", "LinkedIn", "TikTok", "WhatsApp", multiSelect)
- "Ferramentas externas a integrar?" (opções: "Google Sheets (leads)", "Notion", "Meta Ads", "Google Ads", multiSelect)
- "Tem site?" (opções: "Sim, no ar", "Sim, mas precisa redesign", "Não, ainda vou criar")
- "Já tem campanha paga rodando?" (opções: "Sim, Meta", "Sim, Google", "Ambas", "Ainda não")

**Anexa em `_memoria/preferencias.md`.**

---

## Fase 3 — Aplicar o perfil ao CLAUDE.md

1. Leia `templates/perfis/<perfil-escolhido>.md`.
2. Substitua `{{NOME_DO_CLIENTE}}` pelo nome do bloco 2.1.
3. Preencha o que conseguir das seções 1-4, 8 com base no que foi coletado.
4. Sobrescreva `CLAUDE.md` na raiz.
5. Mantenha `[PENDENTE]` no que não foi respondido.

---

## Fase 4 — Schema das 40 skills do Corey → `.agents/product-marketing.md`

Atualize as seções principais com o que coletou (títulos em inglês, conteúdo em português):

- §1 Description — frase do bloco 2.3
- §2 Category + ICP — cliente típico + ticket
- §4 Use case / job-to-be-done — gargalo principal
- §9 Voice — tom + verbatim do cliente (palavras SEMPRE)
- §10 Glossary — palavras SEMPRE/NUNCA

Se faltar info pra §3 (concorrentes), §5-8 (diferenciação, JTBD forces), §11 (provas sociais), **deixe explícito como pendente no roadmap final** — não invente.

---

## Fase 5 — Sumário + Roadmap pós-onboarding (OBRIGATÓRIO)

Este é o passo que mais importa pro usuário. Não pule.

### 5a) Sumário do que foi gravado

Mostre uma tabela curta:

```
✓ CLAUDE.md adaptado ao perfil <X>
✓ _memoria/empresa.md       — identidade + negócio
✓ _memoria/user_role.md     — papel do operador
✓ _memoria/preferencias.md  — voz + canais
✓ _memoria/estrategia.md    — foco do trimestre
✓ identidade/design-guide.md — visual (parcial se faltou paleta)
✓ .agents/product-marketing.md — §1, §2, §4, §9, §10
```

### 5b) Pendências mapeadas (o que ficou em [PENDENTE])

Liste em ordem de prioridade decrescente o que ficou aberto. Para cada item:
- **Onde**: arquivo + seção
- **O que falta**: descrição curta
- **Como resolver**: ação concreta (rodar tal comando, jogar tal arquivo em tal pasta, agendar tal conversa)

Exemplo de saída esperada:

```
Pendências (ordem sugerida):

1. identidade/design-guide.md §Paleta
   Falta: códigos HEX da paleta secundária e neutros.
   Como resolver: defina ou peça pra alguém criar. Posso gerar 3 opções
   com /design "paleta para [tom] da [empresa]".

2. .agents/product-marketing.md §3 Competitors
   Falta: 2-3 concorrentes diretos + onde cada um falha.
   Como resolver: rode `marketing-skills:competitor-profiling` com cada
   concorrente, ou me passe os nomes que eu pesquiso.

3. dados/historico/ (vazio)
   Falta: provas sociais (números, depoimentos verbatim, cases).
   Como resolver: jogue prints de WhatsApp, depoimentos, planilha de
   resultados nesta pasta. /salvar organiza depois.

4. produtos/ (vazio)
   Falta: ficha de cada produto/serviço.
   Como resolver: pra cada produto, crie produtos/<slug>.md com preço,
   margem, frequência, descrição. Ou me passe a lista que eu estruturo.
```

### 5c) Roadmap das próximas fases (NÃO pular)

Apresente como um plano de 3-4 sprints/semanas com base no estágio do cliente. Adapte ao perfil escolhido e ao que foi respondido. Exemplo para um cliente pré-lançamento:

```
Roadmap pós-onboarding (sugerido):

▎ Semana 1 — Completar identidade
   • Definir paleta secundária (/design "paleta secundária")
   • Subir logo em identidade/logos/
   • Rodar marketing-skills:competitor-profiling em 3 concorrentes

▎ Semana 2 — Aquecer canal orgânico
   • /carrossel "tema 1" — primeira peça
   • /carrossel "tema 2", "tema 3" — sequência
   • Coletar interações em dados/historico/

▎ Semana 3 — Construir landing
   • /design "landing pré-lançamento com captura de e-mail"
   • Configurar Sheets de leads + /lead-sync

▎ Semana 4 — Ativar tráfego pago
   • /anuncio-meta "campanha de leads pra landing"
   • Definir orçamento e KPI no _memoria/estrategia.md
```

### 5d) 3 slash commands recomendados AGORA

Com base no estágio + perfil + respostas, recomende **três** comandos para começar HOJE. Para cada um:
- O comando exato
- Por que faz sentido agora
- Qual o output esperado

Exemplo:
```
Pra começar hoje:

1. /carrossel "O que é um ritual?"
   Por quê: vocês têm identidade visual pronta + posicionamento claro,
   falta tração orgânica. Carrossel é o ativo mais barato pra testar
   o messaging do bloco 2.4.
   Output: marketing/carrosseis/YYYY-MM-DD-ritual/ com 8 slides 1080×1350.

2. marketing-skills:competitor-profiling "anebasth.com.br"
   Por quê: você mencionou Anebasth como referência. Precisamos do mapa
   de vocabulário deles antes de criar conteúdo.
   Output: análise estruturada em chat (depois /salvar pra arquivar).

3. /design "moodboard de paleta sensorial pra velas artesanais"
   Por quê: a paleta tá pendente. Em vez de chutar HEX, gerar 3 opções
   visuais e escolher.
   Output: 3 paletas + justificativa em chat.
```

> **Dica de sugestão:** se o cliente vai produzir imagens em ferramenta externa (Midjourney, Sora, nano-banana, DALL-E, Flux), inclua `/prompt-imagem` na lista de 3 commands — ele puxa `identidade/design-guide.md` + `_memoria/preferencias.md` e gera prompts on-brand prontos pra colar. Útil sobretudo na fase de teste de moodboard ou geração de hero/lifestyle pré-foto-shoot.

### 5e) Teste de fumaça

Sugira uma frase exata pra testar que as 40 skills do Corey estão lendo `.agents/product-marketing.md`:

```
Teste pra confirmar que tudo conectou:

▎ "rode marketing-skills:marketing-ideas pra um plano de pré-lançamento
   de 4 semanas pra <nome do cliente>"

Se a resposta citar o ticket médio, o cliente típico e o gargalo que
você descreveu nos blocos 2.1 e 2.3, está tudo conectado corretamente.
```

### 5f) Commit

Use `AskUserQuestion` header "Commit", opções:
- "Sim, commit agora" — roda `git add -A && git commit -m "chore: onboarding via /instalar"`
- "Reviso primeiro" — não commita
- "Não vou versionar este cliente" — não commita

---

## Regras invioláveis do /instalar

- Português do Brasil em toda interação.
- **Toda pergunta via `AskUserQuestion`.** Nunca despejar lista de perguntas em texto.
- Escrita incremental — gravar arquivo ao final de cada bloco da Fase 2, não acumular pro fim.
- `[PENDENTE]` em vez de invenção. Sempre.
- Títulos em inglês no `.agents/product-marketing.md` (skill do Corey depende).
- A Fase 5 (sumário + roadmap + commands + teste) é obrigatória — o onboarding NÃO acabou até ela estar completa.
- `git commit` só com aprovação explícita na 5f.
