#!/bin/bash
set -e

# Read version from pyproject.toml
CURRENT_VERSION=$(grep -m1 '^version' pyproject.toml | awk -F '"' '{print $2}')
echo "📦 Current version: $CURRENT_VERSION"

# Ask user for version bump
read -p "🔢 Enter new version (or leave blank to skip): " NEW_VERSION

if [[ ! -z "$NEW_VERSION" ]]; then
    echo "🔧 Updating version to $NEW_VERSION in pyproject.toml..."
    sed -i '' "s/^version = \".*\"/version = \"$NEW_VERSION\"/" pyproject.toml
else
    NEW_VERSION=$CURRENT_VERSION
    echo "⏭️ Skipping version update."
fi

# Clean and build
echo "🧹 Cleaning previous builds..."
rm -rf build dist sysmon_sdk.egg-info

echo "⚙️ Building package..."
python -m build

echo "✅ Build complete:"
ls -lh dist/

# Optionally install
read -p "📥 Reinstall locally? (y/n): " reinstall
if [[ $reinstall == "y" ]]; then
    echo "📦 Installing dist/*.whl..."
    pip install dist/*.whl --force-reinstall
fi

# Optionally upload
read -p "🚀 Upload to TestPyPI or PyPI? (test/pypi/skip): " repo
if [[ $repo == "test" ]]; then
    echo "📤 Uploading to TestPyPI..."
    twine upload --repository testpypi dist/*
elif [[ $repo == "pypi" ]]; then
    echo "📤 Uploading to PyPI..."
    twine upload dist/*
else
    echo "🚫 Skipping upload."
fi

# Restore original version if needed
if [[ ! -z "$NEW_VERSION" && "$NEW_VERSION" != "$CURRENT_VERSION" ]]; then
    echo "🔁 Don't forget to commit your version bump:"
    echo "   git commit -am 'Bump version to $NEW_VERSION' && git push"
fi

