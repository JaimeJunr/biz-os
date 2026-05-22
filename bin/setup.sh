#!/usr/bin/env bash
# Bootstrap do biz-os.
# Instala plugins/skills oficiais e da comunidade num projeto-cliente.
#
# Uso:
#   bin/setup.sh                  # roda contra o template cliente-piloto/ (in-repo)
#   bin/setup.sh <nome>           # cria/usa ~/Documents/biz-os-<nome> (fora do repo)
#   bin/setup.sh <caminho/com/->  # caminho explícito (relativo ou absoluto)
#
# Override do diretório base dos clientes:
#   BIZ_OS_CLIENTS_DIR=/outro/lugar bin/setup.sh <nome-do-cliente>

set -euo pipefail

ARG="${1:-cliente-piloto}"
TEMPLATE_DIR="cliente-piloto"
CLIENTS_BASE="${BIZ_OS_CLIENTS_DIR:-$HOME/Documents}"

# Resolve PROJECT_DIR:
# - "cliente-piloto" → template in-repo
# - contém "/" ou começa com "." ou "~" → caminho explícito
# - caso contrário → $CLIENTS_BASE/biz-os-<nome>
if [ "$ARG" = "$TEMPLATE_DIR" ]; then
  PROJECT_DIR="$TEMPLATE_DIR"
elif [[ "$ARG" == */* || "$ARG" == .* || "$ARG" == "~"* ]]; then
  PROJECT_DIR="${ARG/#\~/$HOME}"
else
  PROJECT_DIR="$CLIENTS_BASE/biz-os-$ARG"
fi

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
  mkdir -p "$(dirname "$PROJECT_DIR")"
  cp -r "$TEMPLATE_DIR" "$PROJECT_DIR"
  echo "✅ $PROJECT_DIR criado."
  echo ""
fi

cat <<EOF
══════════════════════════════════════════════════════════════
biz-os :: setup
══════════════════════════════════════════════════════════════

Marketplaces e plugins já estão pré-declarados em:
  $PROJECT_DIR/.claude/settings.json
(campos extraKnownMarketplaces + enabledPlugins)

Abra o Claude Code dentro do projeto:

    cd "$PROJECT_DIR" && claude

Na primeira sessão, o Claude Code vai promptar para instalar os
marketplaces declarados. Aceite — ele baixa e ativa tudo de uma
vez, sem precisar colar /plugin install manualmente.

Depois, rode dentro do Claude Code:

    /instalar     # onboarding em 5 blocos do cliente

══════════════════════════════════════════════════════════════
Tokens dos MCPs externos devem estar em ~/.config/biz-os/.env
══════════════════════════════════════════════════════════════
EOF
