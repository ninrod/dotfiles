mkdir -p ~/.copilot
mkdir -p ~/.agents

verifylink ~/.copilot/skills
verifylink ~/.agents/skills

updatelinks ~/.copilot/skills copilot/skills
updatelinks ~/.agents/skills copilot/skills

verifylink ~/.copilot/settings.json
updatelinks ~/.copilot/settings.json copilot/settings.json

verifylink ~/.copilot/copilot-instructions.md
updatelinks ~/.copilot/copilot-instructions.md copilot/copilot-instructions.md
