# AI需求翻译官（ai-prompt-translator）

把口语化、想到哪说到哪的需求，翻译成执行型 AI 能一次准确完成的指令。

## 工作流程

```
你说需求（口语、零散都行）
        │
        ▼
第一轮：我理解的需求 → 需要确认的问题（0-5 个，带 ✅ 建议）→ 风险和遗漏
        │
        ▼
你逐条回答，或回复"按建议来"
        │
        ▼
第二轮：最终指令（含验收清单）→ 执行方案（模型/思考强度/分批）→ 原话覆盖核对
        │
        ▼
把最终指令交给执行型 AI（如 Claude Code）去做
```

## 用法一：Claude Code 技能

**只在本仓库使用**：克隆本仓库，在仓库目录里启动 Claude Code，输入：

```
/translate 我想做个记账网页，像小红书一样好看……
```

**在所有项目里使用**：把技能复制到个人目录：

```bash
mkdir -p ~/.claude/skills/translate
cp .claude/skills/translate/SKILL.md ~/.claude/skills/translate/
```

在 Claude Code 里说"保存"，最终指令会写入当前目录的 `requirements/YYYY-MM-DD-<主题>.md`。

## 用法二：通用提示词（claude.ai 或其他 AI）

打开 [`prompts/ai-requirement-translator.md`](prompts/ai-requirement-translator.md)，复制全文，粘贴到：

- claude.ai 项目的「自定义指令」，或
- 任意 AI 对话的第一条消息

## 目录说明

| 路径 | 说明 |
|---|---|
| `.claude/skills/translate/SKILL.md` | Claude Code 技能（规则的主版本） |
| `prompts/ai-requirement-translator.md` | 通用提示词，规则和技能一致，只去掉了 Claude Code 专用部分 |
| `examples/` | 3 个测试样例：口语原话 + 两轮期望要点，用来检查效果 |

修改规则时，请同时更新技能文件和通用提示词，保持两者一致。

## English

AI Prompt Translator turns casual, scattered feature requests into precise instructions that a coding AI can execute correctly in one pass. It works in two rounds: first it restates the request by module, asks up to five multiple-choice clarifying questions (each with a recommended option), and flags risks; after you answer (or reply "go with the recommendations"), it outputs the final instructions with a checklist, an execution plan (model, thinking effort, batching), and a line-by-line coverage check of your original words. Use it as a Claude Code skill (`/translate`) or paste the universal prompt into any AI chat.
