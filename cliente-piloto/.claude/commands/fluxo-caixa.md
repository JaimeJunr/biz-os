---
description: Mantém fluxo de caixa em financeiro/fluxo-caixa.xlsx (entradas, saídas, projeção)
argument-hint: "[--lancar] [--projetar=<dias>] [--saldo]"
---

# /fluxo-caixa — Fluxo de Caixa

Args: **$ARGUMENTS**

## Passo a passo

1. **Skill `xlsx`** sobre `financeiro/fluxo-caixa.xlsx`. Estrutura padrão se não existir:
   ```
   Colunas: data, tipo (entrada/saída), categoria, descrição,
            valor, previsto/realizado, conta, saldo_acumulado
   ```

2. **`--lancar`:** entreviste o usuário em rajada curta (data, tipo, categoria, valor, descrição) e grave a linha. Recalcule `saldo_acumulado`.

3. **`--saldo`:** mostre saldo atual por conta + saldo consolidado + posição dos próximos 7/15/30 dias considerando previstos.

4. **`--projetar=<dias>`:** projete N dias para frente usando médias móveis das últimas 4 semanas, separando recorrentes de pontuais. Gere `financeiro/analises/projecao-AAAA-MM-DD.md` com:
   - Saldo projetado dia-a-dia
   - Dias críticos (saldo < 0 ou < reserva mínima)
   - Recomendações (antecipar receita, postergar despesa)

5. **Regras:**
   - Realizado nunca é alterado retroativamente sem confirmação explícita.
   - Previsto pode ser revisado livremente.
   - Sem invenção de receita futura — só recorrências comprovadas em histórico.
