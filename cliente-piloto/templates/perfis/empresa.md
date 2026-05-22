# CLAUDE.md — {{NOME_DO_CLIENTE}} (biz-os :: empresa estabelecida)

> PME com setores definidos (marketing, comercial, financeiro, operações). Tem processos, tem ERP, tem time.
> Foco: orquestrar marketing/leads/financeiro num único lugar; reduzir retrabalho entre áreas.
>
> **Arquivo irmão obrigatório:** [`.agents/product-marketing.md`](.agents/product-marketing.md)
> **Memória estruturada:** [`_memoria/`](_memoria/)

## 1. A empresa

- **Nome fantasia:** {{NOME_DO_CLIENTE}}
- **Razão social / CNPJ:** [PENDENTE]
- **Setor / nicho:** [PENDENTE]
- **Localização / unidades:** [PENDENTE]
- **Site / canais:** [PENDENTE]
- **Decisor (quem aprova):** [PENDENTE]

## 2. Voz e posicionamento

- **Tom (3 adjetivos):** [PENDENTE]
- **Proposta de valor (1 frase):** [PENDENTE]
- **Diferenciais (top 3):** [PENDENTE]
- **Palavras SEMPRE/NUNCA:** [PENDENTE]

> Detalhes longos em `identidade/guidelines.md` + `identidade/design-guide.md`.

## 3. Linhas de produto/serviço

- [Linha 1] — [resumo + margem média]
- [Linha 2] — [resumo + margem média]

> Fichas detalhadas em `produtos/<slug>.md`.

## 4. Provas e diferenciais

- [PENDENTE — números acumulados, cases, depoimentos em `dados/historico/`]

## 5. Estrutura de pastas

```
.
├── CLAUDE.md
├── .agents/, .claude/
├── _memoria/              ← estado vivo da empresa
├── identidade/            ← brand book + design system + logos
├── dados/                 ← inputs (transcricoes/, historico/, pesquisas/)
├── marketing/             ← outputs do marketing (carrosseis/, ads/, conteudo/)
├── produtos/              ← catálogo, fichas técnicas, scripts de venda
├── leads/                 ← CRM exports + snapshots (gitignored)
├── financeiro/            ← DRE, fluxo de caixa, conciliação
├── operacoes/             ← rituais, procedimentos, SLAs internos
├── site/                  ← código/conteúdo do site institucional
└── templates/             ← biblioteca interna
```

## 6. Slash commands úteis para empresa

| Comando | Quando usar |
|---|---|
| `/abrir` | Início de sessão — diz em qual área vai operar (marketing, comercial, financeiro) |
| `/carrossel`, `/anuncio-meta`, `/anuncio-google` | Marketing |
| `/lead-sync` | Sync com Sheets/CRM |
| `/dre`, `/fluxo-caixa` | Financeiro |
| `/seo` | Auditoria do site institucional |
| `/salvar` | Registrar decisões e padrões em `_memoria/` ou `dados/historico/` |

## 7. Regras invioláveis

- NUNCA publicar sem o decisor aprovar.
- NUNCA misturar dados de áreas: marketing não vê custo, financeiro não edita criativo.
- LGPD: leads em `leads/`, dados sensíveis nunca em prompts compartilháveis.
- Português do Brasil em toda comunicação externa.

## 8. Status atual

- **Última atualização:** [DATA]
- **Campanhas ativas:** [PENDENTE]
- **Metas do trimestre:** [PENDENTE]
- **Pendências críticas:** [PENDENTE]
