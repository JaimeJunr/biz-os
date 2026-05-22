# Design Guide — {{NOME_DO_CLIENTE}}

> Direção visual da marca. Aplicado a carrosséis, ads, site, apresentações.
>
> **Como usar este template:** os campos abaixo trazem **candidatas testáveis** (não placeholders vagos). Escolha entre elas, substitua os HEX/nomes pelos definitivos, e mantenha o histórico de decisões com `**Status:** aprovado em YYYY-MM-DD`.

## Direção (texto livre)

> Sensação que a marca quer transmitir. Preencha em 1-2 frases antes de escolher cores/fontes. Ex: "moderno, leve, masculino, com terra/verde" / "elegante, calmo, sensorial, vintage editorial".

[PENDENTE]

---

## Paleta

> Defina 4-6 cores: 1 primária, 1 secundária, 2 neutros, 1 acento (opcional), 1 erro/alerta (opcional).

- **Primária:** `#______` — uso em CTAs, blocos de destaque
- **Secundária:** `#______` — apoio, fundo de seção
- **Neutro escuro:** `#______` — texto principal, contraste
- **Neutro claro:** `#______` — fundo, espaços vazios
- **Acento (opcional):** `#______` — highlights pontuais
- **Erro / alerta:** `#______`
- **Sucesso:** `#______`

### Candidatas de partida (apague o que não usar)

Use estas combos como ponto de partida pra discussão — não como verdade. Cada uma resolve um mood específico.

- **Quente terroso** (artesanal, acolhedor): `#8B4513` + `#D2B48C` + `#3E2723` + `#FAF0E6`
- **Neutro elegante** (luxo discreto): `#1A1A1A` + `#C9A961` + `#404040` + `#FAFAFA`
- **Verde calmo** (saúde, bem-estar): `#2D5A4E` + `#A8C8B0` + `#1B2D2A` + `#F5F1E8`
- **Rosa sóbrio** (feminino sem infantil): `#C97B89` ou `#E5879F` + `#F4E4E1` + `#2D1B1F` + `#FFFFFF`
- **Azul tecnológico** (B2B, saas): `#1E40AF` + `#60A5FA` + `#0F172A` + `#F8FAFC`
- **Preto e branco puro** (editorial, máximo contraste): `#000000` + `#FFFFFF` + `#666666` + `#F5F5F5`

---

## Tipografia

> Use até 2 famílias. Hierarquia clara: título tem peso e tamanho bem maiores que corpo.

- **Título:** [família] [peso] [tamanho base]
- **Corpo:** [família] [peso] [tamanho base]
- **Captions / legendas:** [família] [peso]
- **Mono (código / números destacados):** [família]

### Candidatas testáveis por tom

| Tom | Família(s) | Pesos | Onde brilha |
|---|---|---|---|
| Humanizada moderna | **Plus Jakarta Sans, DM Sans, Manrope** | 400 corpo / 600-700 título | Carrosséis solopreneur, SaaS humanizado |
| Editorial clássico | **Playfair Display + Inter** | 700 título serifa / 400 corpo sans | Marcas de luxo, consultoria sênior |
| Geometric minimalista | **Geist, Inter, Söhne** | 400/500/700 | B2B tech, fintech |
| Sans-serif quente | **Recoleta, Sentinel, Söhne Breit** | 400/600 | Branding artesanal, food, lifestyle |
| Mono editorial | **JetBrains Mono, IBM Plex Mono** | 400/700 | Tech-forward, dev tools, dados |
| Display + neutro | **Boldonse + Inter** ou **Aboreto + DM Sans** | display título / neutro corpo | Eventos, branding marcante |

> Evite combos saturados: nunca duas serifas, nunca duas displays. Sempre 1 com personalidade + 1 neutra.

---

## Espaçamento e grid

- **Unidade base:** 4px ou 8px (escolha uma e mantenha)
- **Grid de carrossel IG:** 1080 × 1350, margem 80px
- **Grid de stories/reels:** 1080 × 1920, área segura 1080 × 1420 (legenda na inferior)
- **Grid de hero/site:** depende — defina ao construir o site

---

## Iconografia

- **Estilo:** [outline / preenchido / duotone / monoline]
- **Biblioteca:** [Lucide / Phosphor / Tabler / Heroicons / custom]
- **Tamanho padrão:** 24px (apps), 32px (cards), 16px (inline texto)

### Candidatas

- **Lucide** — outline limpo, gratuita, pareia bem com Plus Jakarta / Inter
- **Phosphor** — 6 estilos (thin/light/regular/bold/fill/duotone), muito versátil
- **Tabler** — outline 1.5px, mais técnico
- **Heroicons** — outline + solid, Tailwind-friendly

---

## Estilo de imagem

- **Fotografia:** [real (lifestyle) / stock proibido / produto isolado / não usa]
- **Ilustração:** [flat / 3D / line-art / nenhuma]
- **Tratamento:** [filtro warm / cool / B&W / sem tratamento]
- **Composição preferida:** [centered / regra-dos-terços / negative space dominante]

### Direção comum por nicho (referência)

- **Artesanal / food / cosmético:** lifestyle quente, mão humana visível, luz natural lateral
- **B2B / tech:** abstrato geométrico, screenshots de produto, sem pessoas ou pessoas muito leves
- **Coaching / serviço:** retratos do profissional, ambiente reconhecível, expressão direta
- **E-commerce:** packshot fundo branco + lifestyle complementar

---

## Logo

Quando aprovado, registre aqui:

```markdown
### 1 | Wordmark — **<NomeMarca>** (logo principal)

- **Arquivo:** `identidade/logo.png` (versão preta principal)
- **Status:** [PENDENTE / aprovado em YYYY-MM-DD]
- **Texto:** "<exatamente como aparece>"
- **Tipografia:** <família + peso usado>
- **Cores:** <versões disponíveis: preta, branca pra fundo escuro, rosa pra destaque>
- **Detalhe identitário:** <ponto da letra "i" substituído por coração, traço swash, etc.>

### Variantes

- `identidade/logo.png` — versão preta principal (usa em marfim, rosa, branco)
- `identidade/logo-branca.png` — versão branca pra fundo escuro
- `identidade/logo-<cor>.png` — versão de destaque

### Regras de uso

- Sempre sobre fundo neutro (marfim, branco, preto).
- Nunca sobre fundo texturizado ou foto sem proteção.
- Espaçamento mínimo: altura do logo em todos os lados.
- Tamanho mínimo: 24px de altura em digital.
```

---

## O que NÃO fazer (negative direction)

- [PENDENTE — liste 5-10 coisas que destroem a marca]

### Sugestões comuns pra começar

- Gradientes pastel saturados (a menos que a marca peça)
- Tipografia manuscrita romântica (Allura, Pacifico, Dancing Script) — exceto em casos específicos
- Combo de duas serifas ou duas displays
- Stock photos genéricas com pessoas sorrindo no escritório
- Ícones com estilos misturados (outline + filled na mesma tela)
- Texto sobre foto sem overlay/contraste suficiente
- Carrossel com mais de 25 palavras por slide
- Cores fora da paleta — mesmo "só pra esse caso"

---

## Histórico de decisões

> Sempre que aprovar algo, anote aqui em ordem cronológica. Não sobrescreva — adiciona linha nova.

- [YYYY-MM-DD] [decisão] — [fonte/contexto]
