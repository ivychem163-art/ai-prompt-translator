#!/usr/bin/env bash
# 把 .claude/skills/translate 打包成 dist/translate.zip，用于上传到 claude.ai
set -euo pipefail
cd "$(dirname "$0")/.."
rm -f dist/translate.zip
mkdir -p dist
(cd .claude/skills && zip -qrX ../../dist/translate.zip translate)
echo "已生成 dist/translate.zip"
