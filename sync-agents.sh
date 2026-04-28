#!/bin/bash
# =============================================================
# sync-agents.sh — Pura Terapia® Agency
# Concatena todos os agent .md em um único AGENTS.md
# para upload no Claude Project Knowledge
#
# Uso: ./sync-agents.sh
# Pré-requisito: rodar na raiz do repositório GitHub
# =============================================================

set -e

OUTPUT="AGENTS.md"
AGENTS_DIR="agents"
TIMESTAMP=$(date '+%d/%m/%Y %H:%M')

echo "🔄 Iniciando sync dos agents..."

# Cabeçalho
cat > $OUTPUT << EOF
# Pura Terapia® — Agent System (Consolidated)
> Source of truth: GitHub repo. Este arquivo é gerado automaticamente por \`sync-agents.sh\`.
> Última atualização: $TIMESTAMP

---

EOF

# Ordem de concatenação
FILES=(
  "00-INDEX.md"
  "layer-1-strategy/01-social-media-strategist.md"
  "layer-1-strategy/02-trend-researcher.md"
  "layer-1-strategy/03-brand-guardian.md"
  "layer-1-strategy/04-sprint-prioritizer.md"
  "layer-1-strategy/05-agents-orchestrator.md"
  "layer-2-production/06-content-creator.md"
  "layer-2-production/07-visual-storyteller.md"
  "layer-2-production/08-image-prompt-engineer.md"
  "layer-2-production/09-whimsy-injector.md"
  "layer-2-production/10-carousel-growth-engine.md"
  "layer-2-production/11-compliance-reviewer.md"
  "layer-3-distribution/12-instagram-curator.md"
  "layer-3-distribution/13-tiktok-strategist.md"
  "layer-3-distribution/14-seo-specialist.md"
  "layer-3-distribution/15-support-responder.md"
  "layer-4-analytics/16-analytics-reporter.md"
  "layer-4-analytics/17-analise-layer.md"
)

for file in "${FILES[@]}"; do
  FILEPATH="$AGENTS_DIR/$file"
  if [ -f "$FILEPATH" ]; then
    echo "<!-- ========== $file ========== -->" >> $OUTPUT
    echo "" >> $OUTPUT
    cat "$FILEPATH" >> $OUTPUT
    echo "" >> $OUTPUT
    echo "---" >> $OUTPUT
    echo "" >> $OUTPUT
    echo "  ✅ $file"
  else
    echo "  ⚠️  ARQUIVO NÃO ENCONTRADO: $FILEPATH"
  fi
done

SIZE=$(wc -c < $OUTPUT)
LINES=$(wc -l < $OUTPUT)

echo ""
echo "✅ AGENTS.md gerado com sucesso!"
echo "   📄 Tamanho: $(echo "$SIZE / 1024" | bc)KB"
echo "   📝 Linhas: $LINES"
echo ""
echo "👉 Próximo passo: faça upload do AGENTS.md no Claude Project Knowledge"
echo "   claude.ai → seu projeto → Project Knowledge → Add content"
