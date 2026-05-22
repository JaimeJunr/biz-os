#!/usr/bin/env bash
# Bootstrap do biz-os.
# Instala plugins/skills oficiais e da comunidade num projeto-cliente.
# Uso:   bin/setup.sh [diretorio-do-cliente]
# Default: ./cliente-piloto

set -euo pipefail

PROJECT_DIR="${1:-cliente-piloto}"
TEMPLATE_DIR="cliente-piloto"

if [ ! -f "$PROJECT_DIR/CLAUDE.md" ]; then
  if [ "$PROJECT_DIR" = "$TEMPLATE_DIR" ]; then
    echo "❌ template $TEMPLATE_DIR/CLAUDE.md não encontrado. Rode a partir da raiz do biz-os."
    exit 1
  fi
  if [ ! -d "$TEMPLATE_DIR" ]; then
    echo "❌ template $TEMPLATE_DIR/ não encontrado. Rode a partir da raiz do biz-os."
    exit 1
  fi
  if [ -e "$PROJECT_DIR" ]; then
    echo "❌ $PROJECT_DIR já existe mas não tem CLAUDE.md. Remova ou escolha outro nome."
    exit 1
  fi
  echo "📁 $PROJECT_DIR não existe — copiando do template $TEMPLATE_DIR/..."
  cp -r "$TEMPLATE_DIR" "$PROJECT_DIR"
  echo "✅ $PROJECT_DIR criado."
  echo ""
fi

cat <<'EOF'
══════════════════════════════════════════════════════════════
biz-os :: setup
══════════════════════════════════════════════════════════════

Este script NÃO instala plugins sozinho — o Claude Code precisa
estar rodando para isso. Ele só imprime os comandos que você
precisa colar dentro de uma sessão do Claude Code.

Abra o Claude Code dentro do projeto:

    cd PROJECT_DIR && claude

E cole os comandos abaixo, na ordem:

══════════════════════════════════════════════════════════════
EOF

sed -i.bak "s|PROJECT_DIR|$PROJECT_DIR|g" /dev/stdout 2>/dev/null || true

cat <<EOF

# 1) Plugin BASE — 40 skills de marketing do Corey Haines
/plugin marketplace add coreyhaines31/marketingskills
/plugin install marketing-skills@marketingskills

# 2) Skills oficiais da Anthropic (documentos + branding + skill tooling)
/plugin marketplace add anthropics/skills
/plugin install document-skills@anthropic-agent-skills
/plugin install brand-guidelines@anthropic-agent-skills
/plugin install skill-creator@anthropic-agent-skills
/plugin install mcp-builder@anthropic-agent-skills

# 3) DESIGN STACK
# 3a) Anthropic Design (oficial verificado) — critique, UX writing, a11y, research, dev handoff
/plugin marketplace add anthropics/claude-plugins-official
/plugin install design@claude-plugins-official

# 3b) Frontend Design (Anthropic oficial, 760k+ installs) — codigo polido sem estetica AI generica
/plugin install frontend-design@anthropic-agent-skills

# 3c) UI UX Pro Max (81k+ stars no GitHub) — 161 reasoning rules + 67 UI styles
/plugin marketplace add nextlevelbuilder/ui-ux-pro-max-skill
/plugin install ui-ux-pro-max@ui-ux-pro-max-skill

# 4) Skills complementares da comunidade
/plugin marketplace add OpenClaudia/openclaudia-skills
/plugin marketplace add BrianRWagner/ai-marketing-claude-code-skills

# 5) Onboarding do cliente (popula .agents/product-marketing.md + CLAUDE.md)
/instalar

EOF

echo "══════════════════════════════════════════════════════════════"
echo "Tokens dos MCPs externos devem estar em ~/.config/biz-os/.env"
echo "Ver: $PROJECT_DIR/.claude/settings.json"
echo "══════════════════════════════════════════════════════════════"
