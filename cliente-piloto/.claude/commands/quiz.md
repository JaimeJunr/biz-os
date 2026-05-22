---
description: Gera quiz de qualificação de leads on-brand (HTML + JS estático). Salva respostas em Google Sheet via webhook ou WhatsApp via wa.me.
argument-hint: "[--objetivo=qualificar|segmentar|interativo] [--perguntas=3|5|7]"
---

# /quiz — Quiz de qualificação de leads

Args: **$ARGUMENTS**

> Quiz curto que qualifica o lead ANTES de ele chegar no WhatsApp. Filtra unfit, segmenta por intenção, captura dados. Frontend estático (sem backend pesado), envio via webhook (Google Sheets/Notion/Formspree) ou redirect direto pra wa.me com mensagem personalizada.

---

## Fase 0 — Contexto

Leia em paralelo:
- `_memoria/empresa.md` (cliente típico, ticket médio, gargalo)
- `_memoria/preferencias.md` (tom de voz pro copy do quiz)
- `_memoria/estrategia.md` (foco do trimestre — define o que qualificar)
- `identidade/design-guide.md` (paleta + tipografia)
- `leads/config.md` se existir (Sheet ID destino, formato)

Se o cliente é **agência/freelancer**, lembre que o quiz também serve pra qualificar **leads de novos clientes da agência**, não só do cliente final.

---

## Fase 1 — Briefing (`AskUserQuestion` em bloco)

Uma chamada com 4 perguntas:

1. **Objetivo do quiz** — opções:
   - "Qualificar (filtrar quem é fit)"
   - "Segmentar (descobrir qual produto/serviço encaixa)"
   - "Interativo (engajamento, lead magnet em forma de quiz)"

2. **Número de perguntas** — opções: "3 (rápido, alta conversão)", "5 (padrão)", "7+ (qualificação profunda)"

3. **Para onde envia a resposta** — opções:
   - "WhatsApp (wa.me com mensagem pré-formatada)"
   - "Google Sheet (via webhook)"
   - "Ambos (redirect pra WA + grava na Sheet)"
   - "E-mail (Formspree/EmailJS)"

4. **Quem é o fit ideal?** — livre. Aceita resposta tipo "renda 3-8k, intenção de compra em 6 meses, não tem imóvel ainda". Usado pra montar lógica de qualificação.

---

## Fase 2 — Desenhar as perguntas (opinado)

Com base no objetivo + fit ideal, **proponha** as perguntas. Não pergunte ao usuário uma por uma — proponha o conjunto.

### Princípios

- **Pergunta 1 = bait**: pergunta leve, fácil de responder, gera engajamento ("Qual seu objetivo? Sair do aluguel / Investir / Trocar de imóvel")
- **Perguntas do meio = qualificação real**: renda, prazo, situação (perguntas que filtram unfit)
- **Pergunta final = micro-compromisso**: nome + telefone (com aviso LGPD curto)

### Tipos de pergunta

Misture: múltipla escolha (rápido), slider (renda, prazo), aberta (objetivo). Não use só múltipla — fica robótico.

### Exemplo (corretora MCMV)

```
1. Qual seu objetivo com esse imóvel? [múltipla]
   ○ Sair do aluguel
   ○ Comprar o primeiro imóvel
   ○ Investir (alugar depois)
   ○ Trocar de imóvel

2. Em quanto tempo você quer fechar? [múltipla]
   ○ Nos próximos 30 dias
   ○ 1-3 meses
   ○ 3-6 meses
   ○ Mais de 6 meses (só olhando)

3. Qual sua renda familiar mensal aproximada? [slider]
   R$ 1.500 ──●────── R$ 12.000+

4. Você já tem aprovação ou pré-análise de financiamento? [múltipla]
   ○ Sim, aprovado
   ○ Em análise
   ○ Não, preciso ajuda nisso
   ○ Não preciso (pago à vista)

5. Como posso te chamar? [campos]
   Nome: ______
   WhatsApp: ______
   ☐ Aceito receber WhatsApp com sugestões de imóveis (LGPD)
```

Mostre as perguntas pro usuário antes de gerar HTML:

`AskUserQuestion` header "Aprova as perguntas?":
- "Sim, gera"
- "Ajustar pergunta específica" — qual e como
- "Refazer com novo ângulo" — qual mudança

---

## Fase 3 — Lógica de qualificação

Para cada combinação de respostas, defina **tier de fit**:

```
TIER A — Quente (sai do aluguel + fecha em 30-90d + renda compatível + financiamento ok)
  → Redirect direto pra WhatsApp com mensagem: "Oi! Vi sua resposta. Tenho 3 unidades que encaixam exatamente no seu perfil. Posso te chamar agora?"

TIER B — Morno (intenção média, renda ok, financiamento pendente)
  → Redirect pra WhatsApp: "Oi! Recebi seu interesse. Quero te mandar 2 opções pra olhar com calma. Pode ser?"

TIER C — Frio (intenção longe, "só olhando")
  → Página de "obrigado" + ofertar lead magnet (e-book "5 erros do primeiro imóvel") + tag na Sheet pra remarketing

TIER X — Unfit (renda fora, sem intenção real)
  → Página de "obrigado" cordial, sem follow-up imediato. Não desperdiça o WhatsApp.
```

Mostre a tier matrix pro usuário antes de codar. Aprovar via `AskUserQuestion`.

---

## Fase 4 — Gerar HTML/JS

Use skill `frontend-design`. Single page, vanilla JS (sem React/Vue — quiz tem que ser instantâneo e funcionar em qualquer celular).

### Estrutura

```html
<!DOCTYPE html>
<html lang="pt-BR">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>{{NOME_DO_CLIENTE}} — Quiz</title>
  <style>/* on-brand do design-guide.md */</style>
</head>
<body>
  <main class="quiz" data-step="1" data-total="5">
    <header>
      <div class="progress"><div class="progress__bar" style="width: 20%"></div></div>
      <p class="step-label">Pergunta 1 de 5</p>
    </header>

    <section class="question" data-step="1">
      <h2>...</h2>
      <div class="options">...</div>
      <button class="next">Próxima</button>
    </section>

    <!-- ... mais sections, uma por pergunta -->

    <section class="result" data-tier="">
      <!-- Preenchido por JS no fim -->
    </section>
  </main>

  <script>
    // Estado: { respostas: [...], tier: null }
    // Em cada next: salva resposta, avança step, atualiza progress
    // No último: calcula tier (função pura) e redireciona ou mostra resultado
    // LGPD: form de contato com checkbox obrigatório
    // Envio: fetch(WEBHOOK_URL, ...) + wa.me com mensagem montada do tier
  </script>
</body>
</html>
```

### Constraints visuais

- Mobile-first absoluto (smartphone vertical é 99% do tráfego)
- Botões grandes (min 56px altura, fácil tocar)
- Animação de transição entre perguntas (slide horizontal, 200ms)
- Barra de progresso visível sempre
- Sem campos opcionais escondidos — uma coisa por tela

### Constraints técnicas

- Vanilla JS, sem framework
- Sem CDN — tudo inline
- LGPD: checkbox obrigatório de aceite, link pra política de privacidade (gera placeholder se não houver)
- Validação client-side: telefone E.164, e-mail
- Mensagem do WhatsApp via wa.me URL-encoded
- Webhook configurável via constante no topo do JS

### Backend mínimo (se "Google Sheet" foi escolhido)

Opção mais simples: usar **Apps Script Web App** com endpoint público. Gere o snippet:

```javascript
// Cole esse code.gs no Google Apps Script do projeto Sheet
function doPost(e) {
  const sheet = SpreadsheetApp.getActiveSheet();
  const data = JSON.parse(e.postData.contents);
  sheet.appendRow([new Date(), data.nome, data.telefone, data.tier,
                   JSON.stringify(data.respostas)]);
  return ContentService.createTextOutput(JSON.stringify({ok: true}));
}
```

Salve esse snippet em `site/quiz/apps-script.gs` com instruções de deploy.

### Output

Salve em:
- `site/quiz/index.html`
- `site/quiz/apps-script.gs` (se Google Sheet)
- `site/quiz/README.md` com instruções de deploy + configuração do WEBHOOK_URL

Atualize o `site/linktree/index.html` pra apontar o botão principal pra `quiz/`.

---

## Fase 5 — Sumário + memória

```
✓ Criado: site/quiz/index.html (5 perguntas, 4 tiers, redirect WhatsApp + Sheet)
✓ Criado: site/quiz/apps-script.gs (instruções em README.md)
✓ Atualizado: site/linktree/index.html (botão "Quiz" agora aponta pra quiz/)
✓ Atualizado: _memoria/estrategia.md (+iniciativa "Quiz de qualificação no ar — YYYY-MM-DD")
✓ Atualizado: leads/config.md (+webhook URL placeholder)
```

### Próximos passos opinados

```
Pra ativar o quiz de verdade:

1. Crie uma Google Sheet com colunas: timestamp, nome, telefone, tier, respostas_json
2. Apps Script → cole site/quiz/apps-script.gs → Deploy → Web app → Anyone → copie URL
3. Edite site/quiz/index.html linha X: const WEBHOOK_URL = "<URL do passo 2>"
4. Hospede em Vercel/GitHub Pages/Cloudflare Pages
5. Coloque o link curto no linktree e na bio do IG

Tempo total: ~30min. Quer que eu rode os passos 1-3 agora se você me passar o ID da Sheet?
```

---

## Regras invioláveis

- LGPD: aviso de privacidade obrigatório + checkbox de aceite. Sem isso o quiz é ilegal.
- Tudo on-brand do `identidade/design-guide.md`. Zero cor/fonte fora.
- Mobile-first. Testar mentalmente em 320px de largura antes de "entregar".
- Tier matrix tem que ser opinada — sem tier "neutro" / "talvez". Cada resposta cai em A/B/C/X.
- Mensagem do WhatsApp por tier é personalizada — sem usar a mesma frase pra todo mundo.
- Webhook recebe **dados estruturados** (JSON), nunca texto livre. Pra que análise depois seja viável.
- Nunca pedir dado que você não vai usar (não pede CPF se não vai analisar crédito).
