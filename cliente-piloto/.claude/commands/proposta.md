---
description: Gera proposta comercial estruturada para vender o próprio biz-os como serviço (perfil agência/freelancer). Diagnóstico + implementação + curadoria + extras + estratégia de preço.
argument-hint: "<nome-do-prospect> [--ticket=baixo|medio|alto] [--escopo=enxuto|completo]"
---

# /proposta — Proposta comercial estruturada

Args: **$ARGUMENTS**

> Use este command quando o **operador do biz-os** (você, agência, freelancer) vai vender uma implementação do sistema pra um cliente final. Não é proposta DO cliente PRO cliente dele — é proposta SUA pra fechar o cliente.
>
> Esse comando faz sentido principalmente em perfis **agência** e **freelancer**. Se o perfil for solopreneur ou empresa, avise o usuário e pergunte se quer seguir mesmo assim.

---

## Fase 0 — Verificar perfil

Leia `_memoria/empresa.md` § "Quem é" pra ver o perfil. Se for **solopreneur** ou **empresa**, use `AskUserQuestion`:

> "Esse perfil não costuma vender biz-os como serviço (é mais comum em agência/freelancer). Quer mesmo seguir? Opções:
> - 'Sim, é caso pontual'
> - 'Trocar perfil' (rodar /instalar de novo)
> - 'Cancelar'"

---

## Fase 1 — Briefing do prospect (`AskUserQuestion` em bloco)

**Quem é o prospect?** Faça **uma** chamada com 4 perguntas:

1. **Tipo de negócio do prospect** — opções:
   - "Solopreneur / criador"
   - "Pequeno negócio local (clínica, loja, restaurante)"
   - "PME (empresa com 5-50 funcionários)"
   - "Profissional liberal (advogado, médico, corretor, contador)"

2. **Faturamento estimado mensal** (orienta ticket) — opções:
   - "< R$ 10k"
   - "R$ 10-50k"
   - "R$ 50-200k"
   - "R$ 200k+"

3. **Maior dor declarada pelo prospect** — opções:
   - "Não tem leads / cliente fica esperando indicação"
   - "Tem leads mas não converte / sem follow-up"
   - "Marketing inconsistente / sem voz definida"
   - "Operação caótica / faz tudo manualmente"
   - "Tudo isso junto"

4. **Já houve diagnóstico prévio?** — opções:
   - "Sim, rodei /diagnostico no projeto deles"
   - "Sim, fiz auditoria informal"
   - "Não, ainda em fase de descoberta"

---

## Fase 2 — Coleta de evidências (se aplicável)

### Se já houve diagnóstico:

Pergunte o path do arquivo (default: `_memoria/diagnostico-YYYY-MM-DD.md` mais recente). Leia e extraia:
- Top 3 erros operacionais
- Top 3 oportunidades
- Nota geral

Use isso na Fase 3 como **evidência concreta** ("Você está perdendo R$ X em leads/mês por não ter follow-up — provei abaixo").

### Se não houve diagnóstico:

Use `AskUserQuestion` header "Auditoria rápida":
- "Quero rodar /diagnostico agora antes de gerar proposta (Recomendado)" — abre `/diagnostico`, volta com resultado
- "Sigo com diagnóstico genérico" — proposta usa linguagem mais genérica (menos convincente)

> Recomendação opinada: **rode `/diagnostico` antes**. Proposta com evidência fecha 3-5× mais. Sem evidência, vira lista de features genéricas.

---

## Fase 3 — Definir escopo + preço (opinado)

Com base no tipo de negócio + faturamento + dor + diagnóstico, **proponha** um pacote. Não pergunte ao usuário "quanto cobrar" — proponha e justifique.

### Matriz de pacotes (referência)

| Faturamento mensal | Pacote enxuto | Pacote completo | Pacote premium |
|---|---|---|---|
| < R$ 10k | R$ 1.5-3k (setup + 1 mês) | R$ 3-6k | — |
| R$ 10-50k | R$ 3-6k | R$ 6-12k | R$ 12-20k |
| R$ 50-200k | R$ 6-12k | R$ 12-25k | R$ 25-50k |
| R$ 200k+ | — | R$ 25-50k | R$ 50k+ (custom) |

**Regra de bolso:** ticket ≈ 10-20% do faturamento mensal do prospect (setup one-time) ou 5-10% recorrente.

### Estrutura do pacote (sempre 4 blocos)

```
1. DIAGNÓSTICO completo do negócio
   - Auditoria de marketing/comercial/operação atual
   - Identificação de gaps e prioridades
   - Roadmap de 90 dias

2. IMPLEMENTAÇÃO do biz-os
   - Setup completo da estrutura (memória, identidade, dados)
   - Onboarding em 5 blocos (perfil + entrevista guiada)
   - Adaptação dos templates ao tom do cliente

3. CURADORIA de conteúdo (N peças produzidas)
   - Carrosséis: 4-12 peças
   - Anúncios Meta: rascunhos de campanhas
   - Linktree + Quiz se aplicável
   - Cada peça com aprovação do cliente antes de publicar

4. EXTRAS (variáveis por pacote)
   - CRM básico (planilha estruturada + Apps Script)
   - Google Meu Negócio otimizado
   - Pixel/CAPI configurados
   - Treinamento de 2h pro cliente operar sozinho
```

### Estratégia de preço (sempre incluir)

- **Preço cheio**: R$ XXX em até 3× no cartão
- **À vista (PIX)**: -10-15% (incentivo)
- **Recorrência opcional**: R$ YYY/mês após setup (curadoria contínua + ajustes mensais)

Mostre a proposta de pacote PRO USUÁRIO antes de salvar:

```
Pacote sugerido pro {{NOME_PROSPECT}}:

Tipo: Pequeno negócio local
Faturamento: R$ 30-50k/mês
Pacote escolhido: COMPLETO
Preço:
  - R$ 6.500 em até 3× (R$ 2.166/mês)
  - R$ 5.800 à vista (PIX) — 11% off
  - + R$ 1.200/mês recorrência opcional (curadoria contínua)

Escopo: Diagnóstico (já entregue) + Implementação + Curadoria 8 peças + Extras (CRM básico + GMN + Pixel)
Prazo: 30 dias setup + 60 dias acompanhamento

Confirma esse pacote ou ajusta antes?
```

`AskUserQuestion` header "Pacote aprovado?":
- "Sim, gera proposta"
- "Ajustar preço" — qual valor
- "Ajustar escopo" — o quê adicionar/remover
- "Mudar pacote" — enxuto / completo / premium

---

## Fase 4 — Gerar a proposta (markdown + opcional PDF/docx)

Salve em `vendas/propostas/YYYY-MM-DD-<slug-prospect>.md`. Crie a pasta se não existir.

### Estrutura do arquivo

```markdown
# Proposta — {{NOME_PROSPECT}}

- **Data:** YYYY-MM-DD
- **Validade:** 7 dias (urgência)
- **De:** {{NOME_DO_CLIENTE}} (operador do biz-os)
- **Para:** {{NOME_PROSPECT}} ({{cargo / função}})

---

## 1. O que percebemos no seu negócio

(Se diagnóstico foi feito) Top 3 erros operacionais com evidência:

1. **[Erro ALTA severidade]** — descrição curta + dano estimado em R$/mês
2. ...
3. ...

(Se não houve diagnóstico) Descrição da dor declarada na descoberta + suposição educada do tamanho do dano.

---

## 2. O que propomos

### 2.1 — Diagnóstico
- ✅ (já entregue / a entregar): auditoria estruturada de marketing, comercial e operação
- Entregável: relatório com 10 itens priorizados (erros + oportunidades) + roadmap de 90 dias

### 2.2 — Implementação do biz-os
- ✅ Estrutura completa: memória, identidade verbal/visual, processos
- ✅ Onboarding guiado (5 blocos, entrevista de 1.5h com você)
- ✅ Templates adaptados ao seu negócio (perfil <X>)
- Entregável: sistema rodando em ~14 dias

### 2.3 — Curadoria de conteúdo
- ✅ <N> peças produzidas e revisadas (carrosséis, e-mail, ads)
- ✅ Cada peça com aprovação sua antes de qualquer publicação
- ✅ Identidade visual mantida 100% on-brand
- Entregável: <N> peças prontas pra publicar até <data>

### 2.4 — Extras incluídos
- [✓/×] CRM básico (planilha estruturada + automação Apps Script)
- [✓/×] Google Meu Negócio otimizado
- [✓/×] Pixel + CAPI configurados
- [✓/×] Treinamento de 2h pra você operar o biz-os sozinho

---

## 3. O que você vai sentir mudar

Não vendemos features — vendemos resultado. Os 3 movimentos que mais impactam:

1. **Leads qualificados** chegando com filtro (quiz/form) — corta tempo perdido com curiosos
2. **Conteúdo no ar de forma consistente** — cadência sem você ter que pensar
3. **Decisões com dado** (não no "achismo") — DRE, CPL, conversão visíveis

---

## 4. Investimento

| Opção | Valor | Como |
|---|---|---|
| **À vista (PIX)** | **R$ X.XXX** (–11%) | Pagamento único, início imediato |
| Em até 3× cartão | R$ Y.YYY | Sem juros |
| Recorrência opcional | + R$ Z.ZZZ/mês | Curadoria + ajustes mensais (cancelável a qualquer momento) |

> **Preço incentivado à vista** vale **até <data + 7 dias>**. Depois disso, preço cheio.

---

## 5. Cronograma

| Semana | Entrega |
|---|---|
| 1 | Onboarding completo + diagnóstico entregue |
| 2 | Identidade adaptada + primeiras 2 peças no ar |
| 3 | + 3 peças + linktree/quiz publicado |
| 4 | + 3 peças + ads em produção + treinamento |

---

## 6. O que precisamos de você

Pra arrancar bem, no primeiro encontro:
- [ ] Acesso ao Instagram/redes (login ou autorização via Meta Business)
- [ ] Lista de produtos/serviços com preço/margem
- [ ] 30min de conversa gravada sobre o negócio (entrevista de voz)
- [ ] Logo + manual de marca (se existir)
- [ ] Planilha de leads atual (se existir)

---

## 7. Garantias

- ✅ Não publicamos nada sem sua aprovação — você é o decisor final
- ✅ Você mantém propriedade de tudo (Instagram, conteúdo, leads, sistema)
- ✅ Cancelamento da recorrência a qualquer momento, sem multa
- ✅ Documentação completa entregue (você consegue operar sozinho ou contratar outro)

---

## 8. Próximos passos

Pra aceitar:
1. Responda essa proposta com "Aceito"
2. Pagamento conforme opção escolhida
3. Agendamos o onboarding pra próxima semana

**Tem dúvida?** Manda no WhatsApp <numero> ou responde esse e-mail.

---

*Proposta gerada via biz-os — sistema operacional aberto para PMEs em cima do Claude Code.*
```

### Versão HTML/PDF (opcional)

Se o usuário quiser uma versão visual:

`AskUserQuestion` header "Formato adicional":
- "Só markdown" (default)
- "+ HTML on-brand" (renderiza com identidade visual, exportável pra PDF via browser)
- "+ docx" (Word/Pages-compatible via skill `docx` se instalada)

Se HTML: salve `vendas/propostas/YYYY-MM-DD-<slug>/index.html` com layout estruturado em uma página A4 vertical. Use `identidade/design-guide.md` pra paleta + tipografia.

Se docx: chame skill `docx` do plugin `document-skills`.

---

## Fase 5 — Sumário + memória

```
✓ Criado: vendas/propostas/YYYY-MM-DD-<slug-prospect>.md
✓ (Opcional) Criado: vendas/propostas/YYYY-MM-DD-<slug-prospect>/index.html
✓ Atualizado: _memoria/estrategia.md (+pipeline comercial — {{NOME_PROSPECT}})

Próximos movimentos opinados:

A) Enviar agora — proposta tá pronta. Eu, no teu lugar, mandava hoje
   antes do prospect esfriar. Urgência de 7 dias força resposta.

B) Refinar primeiro — se a evidência do diagnóstico tá fraca, talvez
   valha 1 sessão a mais coletando provas (ex: print do CPL atual,
   conversão do funil) antes de mandar.

Eu, no teu lugar, ia pelo A — proposta esperando vira proposta morta.
Você consegue ajustar via DM se ele questionar.

Qual prefere?
```

---

## Regras invioláveis

- Preço **opinado**, não pergunte "quanto cobrar?" no abstrato. Use a matriz.
- Sempre incluir incentivo à vista (sem incentivo = ninguém escolhe à vista).
- Prazo de validade da proposta sempre 7 dias (urgência ética).
- Garantias sempre presentes (reduz risco percebido do prospect).
- Diagnóstico (com ou sem evidência) sempre primeiro — proposta sem dor descrita vira lista de features.
- Próximos passos numerados e curtos (≤3 itens).
- Português do Brasil. Tom profissional mas não corporativo.
- Não inventar caso/depoimento de outro cliente sem permissão.
- LGPD/contrato: se valor ≥ R$ 10k, sugerir contrato formal anexo (modelo não vem aqui, mas o avise).
