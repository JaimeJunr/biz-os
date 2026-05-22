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
