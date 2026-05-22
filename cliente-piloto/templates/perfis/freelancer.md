# CLAUDE.md — {{NOME_DO_CLIENTE}} (biz-os :: freelancer)

> Pessoa que atende clientes por projeto/contrato. Organiza-se por cliente, não por funil próprio.
> Foco: pipeline previsível, propostas rápidas, entregas consistentes, cobrança em dia.
>
> **Arquivo irmão obrigatório:** [`.agents/product-marketing.md`](.agents/product-marketing.md)
> **Memória estruturada:** [`_memoria/`](_memoria/)

## 1. Quem sou eu

- **Nome (pessoal + comercial):** {{NOME_DO_CLIENTE}}
- **Serviço principal:** [PENDENTE]
- **Tipo de cliente que atendo:** [PENDENTE]
- **Site / portfólio:** [PENDENTE]

## 2. Voz e posicionamento

- **Tom (3 adjetivos):** [PENDENTE]
- **Diferencial real:** [PENDENTE]
- **Palavras que SEMPRE uso:** [PENDENTE]
- **Palavras que NUNCA uso:** [PENDENTE]

> Detalhes longos em `identidade/guidelines.md` + `identidade/design-guide.md`.

## 3. Serviços e pacotes

- [Pacote 1] — [escopo + prazo + investimento]
- [Pacote 2] — [escopo + prazo + investimento]
- [Hora avulsa] — [PENDENTE]

## 4. Provas e diferenciais

- [PENDENTE — clientes anteriores, cases, depoimentos em `dados/historico/`]

## 5. Estrutura de pastas

```
.
├── CLAUDE.md
├── .agents/, .claude/
├── _memoria/              ← estado vivo (empresa, estratégia, preferências, user_role)
├── identidade/            ← minha marca + design system
├── dados/                 ← inputs (transcricoes/, historico/)
├── marketing/             ← captação de novos clientes (carrosseis/, ads/, conteudo/)
├── produtos/              ← descrições dos pacotes
├── leads/                 ← pipeline de novos clientes (gitignored)
├── clientes/              ← um subdir por cliente ativo (criar à mão quando fechar)
├── financeiro/            ← DRE, fluxo, contas a receber
├── site/
└── templates/             ← biblioteca local (perfis, identidade, ferramentas, skills)
```

> Crie `clientes/<nome>/` quando fechar um novo contrato. Cada subdir guarda escopo, deliverables e atas.

## 6. Slash commands úteis para freelancer

| Comando | Quando usar |
|---|---|
| `/abrir` | Início de sessão |
| `/carrossel` | Captação — autoridade no nicho |
| `/seo` | Auditoria de portfólio e clientes |
| `/anuncio-google`, `/anuncio-meta` | Captação paga |
| `/fluxo-caixa` | Recebíveis e parcelas |
| `/salvar` | Lições por projeto em `dados/historico/` |

## 7. Regras invioláveis

- NUNCA enviar proposta sem revisar margem em `financeiro/`.
- NUNCA usar caso de cliente em material público sem permissão.
- Respeitar LGPD em dados de leads.

## 8. Status atual

- **Última atualização:** [DATA]
- **Clientes ativos:** [PENDENTE]
- **Pipeline (em conversa):** [PENDENTE]
- **Pendências:** [PENDENTE]
