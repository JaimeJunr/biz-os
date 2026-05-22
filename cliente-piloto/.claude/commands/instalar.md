---
description: Onboarding interativo multi-fase — escolhe perfil, faz entrevista, popula _memoria/, identidade/ e CLAUDE.md
argument-hint: "[nome-do-cliente opcional]"
---

# /instalar — Onboarding biz-os (interativo)

Arg: $ARGUMENTS

> Você é o instalador do biz-os. Conduza este onboarding como uma conversa real: uma pergunta por mensagem, anote, confirme, avance. Não dispare tudo de uma vez.

---

## Fase 0 — Sanidade da pasta

1. Rode `basename "$(pwd)"` — confira o nome da pasta atual.
2. Se a pasta for `cliente-piloto` ou começar com `biz-os-` (template default do `bin/setup.sh`), avise:
   > "A pasta ainda tá com nome genérico (`<nome-atual>`). O ideal é que tenha o nome do negócio. Você pode fechar isso aqui, renomear a pasta no Explorer e abrir de novo — ou seguimos com esse nome mesmo? (1) renomeio depois (2) seguir."
3. Se ele escolher renomear depois, anote no fim para lembrar dele.
4. Confira se já existe `_memoria/empresa.md` com conteúdo (não só esqueleto). Se sim, pergunte:
   > "Já tem empresa.md preenchido. Quer (1) revisar/atualizar tudo, (2) atualizar só uma seção, (3) abortar?"

---

## Fase 1 — Perfil

Mostre as opções e peça uma:

> Pra adaptar o sistema certinho ao seu jeito de trabalhar, qual destes mais combina com o seu negócio hoje?
>
> 1. **Solopreneur / criador solo** — uma pessoa só, mistura marca pessoal + negócio
> 2. **Freelancer** — atende clientes, organiza por projeto/cliente
> 3. **Agência / consultoria** — equipe pequena entregando pra vários clientes
> 4. **Empresa estabelecida** — empresa com setores (marketing, comercial, financeiro)
>
> Me responde com o número ou o nome.

Anote a escolha. Não copie o template ainda — só no fim.

---

## Fase 2 — Entrevista (uma pergunta por vez, não em bloco)

Faça cada pergunta isoladamente. Espere resposta. Anote em memória de trabalho. Só passe pra próxima quando tiver resposta clara.

### 2.1 — Identidade

1. Como você se chama, ou como você quer que sua marca se chame? (nome da empresa, ou seu nome se for marca pessoal)
2. (Se diferente da pessoa) Razão social e CNPJ?
3. Onde você atua? (cidade/estado, online/offline)
4. Tem site ou redes principais? Cola os links.

Grave conforme avança em `_memoria/empresa.md`.

### 2.2 — Quem é você no negócio

5. Você é dono, sócio, gerente, filho/cônjuge do dono, ou está terceirizando? (vai pra `_memoria/user_role.md`)
6. Qual seu nível técnico — confortável com terminal, planilha, ou prefere coisas mais visuais?
7. Quanto tempo por semana você consegue dedicar a marketing/operação?

### 2.3 — O negócio em si

8. Em 1 frase, o que o negócio faz?
9. Quem é o cliente típico? (descreva uma pessoa real se conseguir)
10. Quanto é o ticket médio? (faixa serve)
11. Qual o maior gargalo HOJE? (o que está te impedindo de crescer ou de relaxar)

### 2.4 — Voz e preferências

12. Descreve o tom da marca em 3 adjetivos.
13. Tem 3-5 palavras que você SEMPRE usa? E 3-5 que você NUNCA usaria? (vai pra `_memoria/preferencias.md`)
14. Tem alguma marca que serve de referência de voz? (não precisa imitar — só ajuda a calibrar)

### 2.5 — Estratégia atual

15. Qual o foco do próximo trimestre? Em 1 frase.
16. Qual a métrica que importa mais agora? (receita, n° de clientes, MRR, leads, etc.)
17. Tem algo que você decidiu NÃO fazer agora? (anti-foco — ajuda a focar)

### 2.6 — Identidade visual (opcional, pode ficar pendente)

18. Tem paleta de cores definida? Se sim, manda os HEX. Se não, descreve a sensação que quer transmitir (ex: "moderno, leve, masculino, com terra/verde").
19. Tem logo? Se sim, vai pra `identidade/logos/` depois. Se não, anote pendência.

---

## Fase 3 — Escrever na memória

Para cada arquivo, escreva conteúdo conciso e factual com base nas respostas. Não invente.

1. `_memoria/empresa.md` — perguntas 1-4, 8-11.
2. `_memoria/user_role.md` — perguntas 5-7.
3. `_memoria/preferencias.md` — perguntas 12-14.
4. `_memoria/estrategia.md` — perguntas 15-17.
5. `identidade/design-guide.md` — pergunta 18. Se faltar info, deixe `[PENDENTE]` nos HEX e anote a "sensação" descrita pelo usuário em um bloco `## Direção (texto livre)` no topo.
6. `identidade/guidelines.md` — atualizar Verbal com perguntas 12-14.

Mostre cada arquivo gravado em uma linha curta:

```
✓ Escrito: _memoria/empresa.md
✓ Escrito: _memoria/user_role.md
…
```

---

## Fase 4 — Aplicar o perfil ao CLAUDE.md

1. Leia `templates/perfis/<perfil-escolhido>.md`.
2. Substitua `{{NOME_DO_CLIENTE}}` pelo nome fantasia respondido na pergunta 1.
3. Preencha o que conseguir das outras seções com base na entrevista (não invente).
4. Sobrescreva `CLAUDE.md` na raiz.
5. Mantenha o que estiver em `[PENDENTE]` para o usuário completar à mão depois.

---

## Fase 5 — Schema das 40 skills (.agents/product-marketing.md)

O plugin `coreyhaines31/marketingskills` exige `.agents/product-marketing.md` no schema v2.0.0. Atualize as seções principais com o que coletou:

- Seção 1: descrição
- Seção 2: categoria + ICP
- Seção 4: use case principal + dor
- Seção 9: voz (verbatim do cliente)
- Seção 10: glossário (palavras SEMPRE/NUNCA)

Os títulos das seções continuam em **inglês** (as 40 skills do Corey dependem disso). O conteúdo vai em português.

---

## Fase 6 — Encerramento

Mostre um sumário curto:

```
✓ Perfil aplicado: <Solopreneur|Freelancer|Agência|Empresa>
✓ Memória: _memoria/{empresa,estrategia,preferencias,user_role}.md
✓ Identidade: identidade/{guidelines,design-guide}.md
✓ Schema 40 skills: .agents/product-marketing.md
✓ CLAUDE.md adaptado ao perfil <X>
```

Depois liste os 3-4 próximos passos prováveis com base no que respondeu:

- Se há site → sugira `/seo`
- Se quer publicar → sugira `/carrossel`
- Se tem campanha rodando → sugira `/anuncio-meta`
- Se está organizando recebíveis → sugira `/fluxo-caixa`
- Se mencionou transcrições/reuniões → lembre que pode jogar arquivos em `dados/transcricoes/`

Pergunte se quer commitar agora: `git add -A && git commit -m "chore: onboarding via /instalar"`.

---

## Regras invioláveis do /instalar

- Português do Brasil em toda conversa com o usuário.
- Uma pergunta por mensagem. Não despeje formulários.
- Confirmar e gravar incrementalmente — não acumule respostas pra escrever no final.
- Se faltar dado, gravar `[PENDENTE]`. Nunca inventar.
- Títulos das seções do `.agents/product-marketing.md` ficam em inglês (skill do Corey).
- Não rodar `git commit` sem perguntar.
