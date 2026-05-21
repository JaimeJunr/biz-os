---
description: Lê/atualiza DRE em financeiro/dre.xlsx usando a skill xlsx oficial
argument-hint: "[--mes=AAAA-MM] [--importar=<caminho.csv>] [--analise]"
---

# /dre — DRE (Demonstrativo de Resultados)

Args: **$ARGUMENTS**

## Passo a passo

1. **Use a skill `xlsx`** (oficial Anthropic) para abrir `financeiro/dre.xlsx`.
   - Se não existir, crie do zero com estrutura padrão:
     ```
     Linhas: Receita Bruta, (-) Deduções, Receita Líquida,
             (-) CMV, Lucro Bruto,
             (-) Despesas Operacionais (Marketing, Pessoal, Adm),
             EBITDA, (-) D&A, (-) Financeiras, (-) Impostos, Lucro Líquido
     Colunas: Jan, Fev, ..., Dez, Total Ano
     ```

2. **Se `--importar=`:**
   - Leia o CSV de lançamentos (colunas esperadas: data, categoria, valor, descrição).
   - Agrupe por categoria DRE × mês e some.
   - Mostre prévia antes de gravar.

3. **Se `--mes=`:** mostre só a coluna daquele mês + Total Ano até o momento.

4. **Se `--analise`:** gere `financeiro/analises/dre-AAAA-MM.md`:
   - Margem bruta, margem operacional, margem líquida
   - Variação MoM e YoY (se houver dados)
   - Top 3 categorias que mais cresceram/caíram
   - 2-3 perguntas para o decisor

5. **Regras:**
   - Nunca arredondar para "embelezar" — use os valores reais.
   - Se faltar dado para um mês, deixe vazio (não estime).
   - Não publique nem envie para terceiros.
