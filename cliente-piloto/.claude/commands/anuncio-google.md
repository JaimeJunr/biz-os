---
description: Cria estrutura de campanha Google Ads (Search + Performance Max) on-brand
argument-hint: "<produto ou objetivo> [--orcamento=XXX/dia] [--tipo=search|pmax|display]"
---

# /anuncio-google — Campanha Google Ads

Briefing: **$ARGUMENTS**

## Passo a passo

1. **Carregue contexto:**
   - `CLAUDE.md` seções 1-3 (identidade, tom, produtos)
   - `identidade/guidelines.md`
   - `dados/historico/numeros.md` para extensões de prova social

2. **Pergunte o que faltar:**
   - Orçamento diário
   - Localização (cidade/estado/país)
   - URL de destino
   - Conversão principal (lead, venda, ligação)
   - Tipo: Search, Performance Max ou Display

3. **Gere a estrutura completa em `marketing/ads/google/YYYY-MM-DD-<slug>.md`:**

   ```
   Campanha: <nome>
   Tipo: <Search/PMax/Display>
   Orçamento: R$ XX/dia
   Localização: ...
   Idioma: pt-BR
   Lance: Maximizar conversões (sem CPA alvo nas 2 primeiras semanas)

   Grupos de anúncio:
     - <Tema 1>
       Palavras-chave (correspondência ampla + frase + exata):
         - ...
       Negativas:
         - ...
       Anúncios (3 RSAs):
         Títulos (15, até 30 chars cada): ...
         Descrições (4, até 90 chars cada): ...
         URL final: ...
         Caminhos: /produto, /cidade

   Extensões:
     - Sitelinks (4-6)
     - Frases destaque (4-10)
     - Snippets (1-2)
     - Chamada (telefone)
     - Localização (se loja física)
   ```

4. **Regras invioláveis:**
   - Zero claim sem prova em `dados/historico/`.
   - Respeitar políticas do Google Ads (sem superlativos não comprováveis, sem "garantia" em saúde/finanças sem disclaimer).
   - Negativas básicas sempre incluídas: "grátis", "free", "curso", "como fazer" (a menos que o produto seja curso).
   - LGPD: nunca incluir dado pessoal nos criativos.

5. **Saída adicional:**
   - Arquivo `marketing/ads/google/YYYY-MM-DD-<slug>-uploadable.csv` no formato Google Ads Editor (linhas de Campaign / Ad Group / Keyword / Ad).

6. **Checklist final:**
   - [ ] 3 RSAs por grupo, com ao menos 8 títulos
   - [ ] Negativas configuradas
   - [ ] Extensões obrigatórias preenchidas
   - [ ] Conversão definida no GA4/Tag Manager (lembre o usuário se não estiver)
