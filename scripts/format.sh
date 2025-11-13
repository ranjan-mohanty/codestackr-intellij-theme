#!/bin/bash

# Format markdown files
echo "🔧 Formatting markdown files..."
echo ""

# Check if prettier is available (best for auto-formatting)
if command -v prettier &> /dev/null; then
    prettier --write "**/*.md" --prose-wrap always --print-width 80
    echo ""
    echo "✓ Markdown files formatted with prettier!"
    
    # Then lint with markdownlint
    if command -v markdownlint &> /dev/null; then
        echo ""
        echo "🔍 Checking markdown style..."
        markdownlint --config .markdownlint.json '**/*.md' --ignore node_modules --ignore build --ignore .gradle || true
    fi
else
    echo "⚠ prettier not found (required for auto-formatting)"
    echo ""
    echo "Install with:"
    echo "  npm install -g prettier"
    echo "  # or"
    echo "  brew install prettier"
    echo ""
    echo "Prettier can automatically wrap long lines and fix formatting."
    echo "markdownlint can only check, not auto-format line lengths."
    exit 1
fi
