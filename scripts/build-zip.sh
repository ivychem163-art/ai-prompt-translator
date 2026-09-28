#!/usr/bin/env bash
# 以 .claude/skills/translate/SKILL.md 为主版本：
# 1. 重新生成通用提示词 prompts/ai-requirement-translator.md
# 2. 打包 dist/translate.zip，用于上传到 claude.ai
set -euo pipefail
cd "$(dirname "$0")/.."
skill=.claude/skills/translate/SKILL.md

{
  echo '> 用法：复制全文，粘贴到 claude.ai 项目的「自定义指令」，或任意 AI 对话的开头。'
  echo
  # 去掉 frontmatter，并截掉 Claude Code 专用的「保存最终指令」一节
  awk 'NR==1&&/^---$/{f=1;next} f&&/^---$/{f=0;skip=1;next} f{next} skip&&/^$/{skip=0;next} /^## 保存最终指令/{exit} {skip=0;print}' "$skill"
  cat <<'MD'
## 保存最终指令

- 默认只在对话里输出。
- 用户说"保存"时，把最终指令、执行方案、原话覆盖核对整体放进一个 markdown 代码块，方便用户复制。
MD
} > prompts/ai-requirement-translator.md
echo "已生成 prompts/ai-requirement-translator.md"

rm -f dist/translate.zip
mkdir -p dist
(cd .claude/skills && zip -qrX ../../dist/translate.zip translate)
echo "已生成 dist/translate.zip"
