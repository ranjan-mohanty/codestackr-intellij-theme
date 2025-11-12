#!/bin/bash

# Verification script for codeSTACKr IntelliJ Theme
# This script checks if all required files are present and valid

echo "🔍 Verifying codeSTACKr IntelliJ Theme..."
echo ""

# Color codes
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

errors=0
warnings=0

# Function to check if file exists
check_file() {
    if [ -f "$1" ]; then
        echo -e "${GREEN}✓${NC} $1"
    else
        echo -e "${RED}✗${NC} $1 - MISSING"
        ((errors++))
    fi
}

# Function to check if directory exists
check_dir() {
    if [ -d "$1" ]; then
        echo -e "${GREEN}✓${NC} $1/"
    else
        echo -e "${RED}✗${NC} $1/ - MISSING"
        ((errors++))
    fi
}

# Check build files
echo "📦 Build Configuration:"
check_file "build.gradle.kts"
check_file "settings.gradle.kts"
check_file "gradle.properties"
check_file "gradlew"
check_dir "gradle/wrapper"
check_file "gradle/wrapper/gradle-wrapper.properties"
echo ""

# Check plugin files
echo "🔌 Plugin Files:"
check_file "src/main/resources/META-INF/plugin.xml"
echo ""

# Check theme files
echo "🎨 Theme Files:"
check_file "src/main/resources/themes/codestackr-theme.theme.json"
check_file "src/main/resources/themes/codestackr-theme.xml"
check_file "src/main/resources/themes/codestackr-theme-muted.theme.json"
check_file "src/main/resources/themes/codestackr-theme-muted.xml"
echo ""

# Check documentation
echo "📚 Documentation:"
check_file "README.md"
check_file "CHANGELOG.md"
check_file "LICENSE"
check_file "PUBLISHING.md"
check_file "QUICKSTART.md"
echo ""

# Check JSON syntax
echo "🔍 Validating JSON files..."
for file in src/main/resources/themes/*.json; do
    if [ -f "$file" ]; then
        if python3 -m json.tool "$file" > /dev/null 2>&1; then
            echo -e "${GREEN}✓${NC} $file - Valid JSON"
        else
            echo -e "${RED}✗${NC} $file - Invalid JSON"
            ((errors++))
        fi
    fi
done
echo ""

# Check XML syntax (basic check)
echo "🔍 Checking XML files..."
for file in src/main/resources/themes/*.xml; do
    if [ -f "$file" ]; then
        if grep -q "<?xml" "$file" && grep -q "</scheme>" "$file"; then
            echo -e "${GREEN}✓${NC} $file - Valid XML structure"
        else
            echo -e "${YELLOW}⚠${NC} $file - XML structure warning"
            ((warnings++))
        fi
    fi
done
echo ""

# Check if gradlew is executable
if [ -x "gradlew" ]; then
    echo -e "${GREEN}✓${NC} gradlew is executable"
else
    echo -e "${YELLOW}⚠${NC} gradlew is not executable (run: chmod +x gradlew)"
    ((warnings++))
fi
echo ""

# Summary
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
if [ $errors -eq 0 ] && [ $warnings -eq 0 ]; then
    echo -e "${GREEN}✓ All checks passed!${NC}"
    echo ""
    echo "Next steps:"
    echo "  1. Build the plugin: ./gradlew buildPlugin"
    echo "  2. Test locally: ./gradlew runIde"
    echo "  3. Verify plugin: ./gradlew verifyPlugin"
    echo "  4. See PUBLISHING.md for marketplace publication"
    exit 0
elif [ $errors -eq 0 ]; then
    echo -e "${YELLOW}⚠ Verification completed with $warnings warning(s)${NC}"
    echo "You can proceed, but review the warnings above."
    exit 0
else
    echo -e "${RED}✗ Verification failed with $errors error(s) and $warnings warning(s)${NC}"
    echo "Please fix the errors above before proceeding."
    exit 1
fi
