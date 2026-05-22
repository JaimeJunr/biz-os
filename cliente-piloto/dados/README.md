# dados/

Inputs brutos do cliente — material que o biz-os **lê e referencia**, não que ele gera.

## Convenções de organização

A pasta `dados/` aceita qualquer estrutura, mas siga estas convenções para que o agente encontre as coisas:

```
dados/
├── transcricoes/                       ← reuniões, áudios, entrevistas transcritos
│   └── YYYY-MM-DD-<tipo>-<duracao>.md   (ex: 2026-05-12-vanessa-30min.md)
├── historico/                          ← provas sociais consolidadas
│   ├── numeros.md                       (métricas, ranking, awards)
│   ├── depoimentos.md                   (citações verbatim de clientes)
│   └── cases/                           (1 case por arquivo se for longo)
├── referencias-visuais.md              ← registro do que o cliente compartilhou (prints, fotos)
├── refs/                               ← os binários das referências visuais
│   ├── moodboard-2026-05.jpg
│   └── inspiracao-paleta.png
└── <subprojeto>/                       ← um subdir por "ativo grande" relacionado
    ├── README.md                        (contexto do subprojeto)
    └── <arquivos>
```

## Subprojetos: quando criar uma pasta dedicada?

Crie `dados/<slug-do-subprojeto>/` quando aparecer um "ativo" recorrente que precisa de espaço próprio:

- **Cliente externo / projeto da agência** (perfil agência ou freelancer): `dados/clientes/<nome>/` ou `dados/projetos/<slug>/`
- **Empreendimento imobiliário** (perfil corretora): `dados/empreendimentos/<slug>/` com folder.pdf, plantas, fotos
- **Linha de produto específica**: `dados/produtos-<linha>/` com fotos do shooting, manuais
- **Marca parceira / fornecedor**: `dados/marca-<nome>/` (manual de marca, logos, restrições)
- **Pesquisa concorrente**: `dados/concorrentes/<nome>/` com prints, análises, scraping

### Padrão de cada subprojeto

Cada subdir deve ter um `README.md` curto no início explicando:
- Quem é / o que é
- Status (ativo / arquivado / em prospecção)
- Por que está aqui (link com objetivo no `_memoria/estrategia.md` se aplicável)
- Apontadores para os arquivos relevantes

Exemplo de `dados/empreendimentos/mooca/README.md`:
```markdown
# Mooca (Vivaz)

- **Status:** ativo, lançamento maio/2026
- **Tipo:** 1 e 2 dorms, ticket R$ 209k+
- **Destaque:** 3 min da futura estação Gabriela Mistral
- **Materiais:**
  - `folder.pdf` — folder oficial da Vivaz
  - `plantas.pdf` — plantas dos apartamentos
  - `fotos/` — perspectivas e fachada
```

## O que NÃO vai em dados/

- **Outputs gerados pelo biz-os** (carrosséis, ads, copy) → `marketing/`
- **Memória estruturada do agente** (empresa, estratégia, preferências) → `_memoria/`
- **Identidade visual/verbal definida** (paleta aprovada, guidelines) → `identidade/`
- **Catálogo de produtos com preço/margem** (ficha técnica formal) → `produtos/`
- **Leads e CRM** → `leads/`

## Como o agente usa isso

O snippet de comportamento contínuo (no `CLAUDE.md` raiz) instrui o Claude a:

1. **Salvar referências visuais** em `dados/referencias-visuais.md` (texto) + `dados/refs/` ou subdir específico (binário).
2. **Criar subdir** quando perceber que um ativo merece organização própria (ex: 3+ arquivos relacionados, projeto recorrente).
3. **Atualizar README do subdir** quando novo material chegar.

## .gitignore

Arquivos pesados (mp4, mp3, wav grandes) estão gitignorados em `transcricoes/`. Para outros binários (PDFs, fotos), considere adicionar regras se virarem grandes:

```
dados/refs/*.jpg
dados/refs/*.png
!dados/refs/.gitkeep
```
