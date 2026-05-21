---
description: Sincroniza leads da Google Sheet do cliente para snapshot local em leads/
argument-hint: "[--sheet=<id>] [--aba=<nome>] [--desde=AAAA-MM-DD]"
---

# /lead-sync — Sincronização de leads

Args: **$ARGUMENTS**

## Passo a passo

1. **Resolva a planilha:**
   - Se `--sheet` foi passado, use-o.
   - Senão, leia `CLAUDE.md` seção 6 ou `leads/config.md` procurando o ID padrão.
   - Se nada encontrado, pergunte ao usuário e salve em `leads/config.md`.

2. **Use o MCP `google-sheets`** para ler a aba (default: "Leads").

3. **Normalize colunas:**
   - `nome, telefone, email, origem, interesse, renda_declarada, criado_em, status`
   - Telefone em formato E.164 (+55...)
   - E-mail em minúsculas
   - Data em ISO 8601

4. **Detecte duplicatas** por telefone OU e-mail (case-insensitive). Marque na coluna `duplicata` mas NÃO apague.

5. **Salve dois arquivos:**
   - `leads/snapshot-AAAA-MM-DD.csv` — snapshot completo do dia
   - `leads/novos-AAAA-MM-DD.csv` — só os leads desde o último snapshot existente em `leads/`

6. **Resumo na tela:**
   ```
   Total na planilha: XXX
   Novos desde último snapshot: XX
   Duplicatas detectadas: X
   Top 3 origens: ...
   ```

7. **Regras LGPD:**
   - Arquivos em `leads/` estão no `.gitignore` — confirme antes de qualquer commit.
   - Nunca cole dados de leads em prompts compartilháveis ou em commits.
   - Se o usuário pedir análise, agregue antes (contagens, %) — não exponha linha-a-linha em respostas longas.
