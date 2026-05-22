---
description: Gera linktree on-brand (HTML + lista de links) para bio do Instagram/TikTok/LinkedIn. Integra com /quiz quando há captura de leads.
argument-hint: "[--canal=instagram|tiktok|linkedin] [--objetivo=leads|vendas|conteudo]"
---

# /linktree — Linktree on-brand

Args: **$ARGUMENTS**

> Gera uma página simples e rápida pra colocar no link da bio. **Não usa o serviço linktr.ee** — gera HTML estático que pode hospedar em GitHub Pages, Vercel, Cloudflare Pages, ou subir como arquivo no site do cliente. Mais controle, sem assinatura, on-brand.

---

## Fase 0 — Contexto

Leia em paralelo:
- `_memoria/empresa.md`, `_memoria/preferencias.md` § Canais ativos
- `identidade/guidelines.md`, `identidade/design-guide.md` (paleta + tipografia)
- `_memoria/estrategia.md` (foco do trimestre define qual link vai primeiro)
- `marketing/conteudo/` (algum lead magnet pra oferecer?)

---

## Fase 1 — Briefing (`AskUserQuestion` em bloco)

Uma chamada com 4 perguntas:

1. **Objetivo principal** — opções:
   - "Capturar leads (form ou quiz)"
   - "Vender direto (catálogo, WhatsApp)"
   - "Distribuir conteúdo (blog, vídeo, e-book)"
   - "Tudo (3-5 links variados)"

2. **Tem lead magnet pronto?** — opções:
   - "Sim, e-book/PDF" (qual?)
   - "Sim, mini-curso/série de e-mails"
   - "Sim, quiz de qualificação"
   - "Não, sigo só com links diretos"

3. **Quantos links no total?** — opções: "3", "5", "7", "10+"

4. **Canal principal de venda** — opções: "WhatsApp", "DM Instagram", "Site/landing", "Telefone", multiSelect

---

## Fase 2 — Estrutura de links (proposta opinada)

Com base no objetivo + lead magnet, proponha a ORDEM ÓTIMA dos links. Não pergunte ao usuário — proponha e justifique.

### Ordem padrão (objetivo = leads)

1. **Lead magnet / quiz** (no topo — maior conversão)
2. **Oferta principal** (ex: agendamento, catálogo)
3. **Prova social** (cases, depoimentos — link pra reels ou página)
4. **Conteúdo recente** (último post/vídeo de destaque)
5. **WhatsApp direto** (no rodapé — opção rápida)

### Ordem padrão (objetivo = vendas)

1. **Catálogo / loja**
2. **WhatsApp direto**
3. **Promoção atual** (se houver)
4. **Avaliações / depoimentos**
5. **Sobre / quem somos**

### Ordem padrão (objetivo = conteúdo)

1. **Newsletter / inscrever-se**
2. **Conteúdo recente em destaque**
3. **Conteúdo top-of-funnel** (artigo introdutório)
4. **YouTube / podcast** (se houver)
5. **WhatsApp**

Adapte ao briefing. Mostre a estrutura proposta antes de gerar o HTML:

```
Proposta de ordem dos links:

1. 🎯 Quiz: "Qual imóvel combina com você?" → /quiz (gera agora se aceitar)
2. 📅 Agendamento de visita guiada → wa.me/55119XXXX
3. 🏠 Empreendimentos disponíveis → site/empreendimentos
4. ⭐ O que clientes dizem → instagram.com/p/<id-destacado>
5. 💬 Falar comigo agora → wa.me/55119XXXX

Confirma essa ordem?
```

`AskUserQuestion` header "Confirma?":
- "Sim, gera"
- "Trocar ordem" — qual mudar
- "Adicionar/remover link" — qual

---

## Fase 3 — Gerar HTML on-brand

Use a skill `frontend-design` (do plugin Anthropic) pra criar HTML estático com:

### Estrutura mínima

```html
<!DOCTYPE html>
<html lang="pt-BR">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>{{NOME_DO_CLIENTE}} — Links</title>
  <meta name="description" content="<da preferencias.md ou empresa.md>">
  <style>
    /* Variáveis do design-guide.md */
    :root {
      --primary: <hex da paleta>;
      --secondary: <hex>;
      --bg: <hex>;
      --text: <hex>;
      --font-display: '<da tipografia>';
      --font-body: '<da tipografia>';
    }
    /* Reset + estilo on-brand */
    /* Mobile-first (320px-768px é o uso principal de bio) */
  </style>
</head>
<body>
  <main class="container">
    <header>
      <img src="../identidade/logos/logo-principal.png" alt="..." class="logo">
      <h1>{{NOME_DO_CLIENTE}}</h1>
      <p class="bio">{{Bio curta do empresa.md}}</p>
    </header>
    <nav class="links">
      <!-- Cada link como botão grande, on-brand, com ícone -->
      <a href="<URL>" class="link link--primary">
        <span class="link__icon">🎯</span>
        <span class="link__text">
          <strong>Quiz: Qual imóvel combina com você?</strong>
          <small>Descubra em 2 minutos</small>
        </span>
      </a>
      <!-- ... mais links -->
    </nav>
    <footer>
      <p>© <span id="year"></span> {{NOME_DO_CLIENTE}}</p>
    </footer>
  </main>
  <script>document.getElementById('year').textContent = new Date().getFullYear();</script>
</body>
</html>
```

### Constraints visuais (do design-guide.md)

- Paleta primária para botão principal (o do lead magnet/quiz)
- Paleta secundária ou neutro para botões secundários
- Tipografia: título display, corpo neutro (igual ao design-guide)
- Mobile-first: botões grandes (min height 64px), espaçamento generoso, sem hover-only
- WCAG AA: contraste de texto ≥ 4.5:1 em todos os botões
- Sem JS pesado (página tem que ser instantânea)
- Ícones: emoji nativo (universal) ou SVG inline (não bibliotecas)

### Output

Salve em `site/linktree/index.html` (cria a pasta se não existir).

Se o cliente ainda não tem domínio, sugira no fim:
```
Hospedagem rápida (escolha uma):
1. GitHub Pages — gratuito, URL tipo <user>.github.io/linktree
2. Vercel — gratuito, deploy via "vercel" no terminal, URL <projeto>.vercel.app
3. Cloudflare Pages — gratuito, mais rápido pro Brasil

Quer que eu prepare o deploy em alguma delas? (próximo comando).
```

---

## Fase 4 — Integração com /quiz

Se o objetivo escolhido foi "Capturar leads" E lead magnet escolhido foi "quiz", **chame `/quiz`** automaticamente após o linktree.

Adicione no linktree.html um link para `quiz/index.html` (que o `/quiz` vai gerar).

Mostre na resposta:
```
✓ Criado: site/linktree/index.html
→ Próximo passo: rode /quiz pra gerar o formulário de qualificação que o link "Quiz" aponta.
```

---

## Fase 5 — Sumário + memória

```
✓ Criado: site/linktree/index.html
✓ Atualizado: _memoria/estrategia.md (+iniciativa "Linktree no ar — YYYY-MM-DD")
```

Bifurcação opinada:
```
Próximo passo natural:

**A)** Gerar o quiz que liga no botão principal — 1 sessão, leva 20min, captura leads de cara.

**B)** Hospedar o linktree primeiro (Vercel/GitHub Pages) pra ver no ar — 10min, mas sem captura ainda.

Eu, no teu lugar, ia pelo A — o linktree sem o quiz é só uma página, sem o ativo de conversão você só joga gente sem qualificar. Qual prefere?
```

---

## Regras invioláveis

- HTML estático puro, sem dependências externas (CDN proibido — performance e privacidade).
- Tudo do `identidade/design-guide.md`. Zero cor/fonte fora.
- Bio do header vem de `_memoria/empresa.md`, não inventa.
- Mobile-first: 100% dos usuários virão de bio do IG no celular.
- WCAG AA — contraste ≥ 4.5:1 em todos os textos.
- LGPD: se há form/quiz no linktree, link sempre passa por `/quiz` (que cuida da privacidade).
