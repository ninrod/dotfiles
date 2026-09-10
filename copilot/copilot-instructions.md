# GitHub Copilot Instructions

## 1. Language, String & Encoding Rules
- **English Only in Code:** ALWAYS write all source code, variable/function names, type definitions, docstrings, and inline comments strictly in English.
- **UTF-8 Safety:** Never use Portuguese, special accented characters (e.g., ç, á, ã), or non-ASCII characters inside code files, comments, or variable names to prevent potential UTF-8 and cross-platform encoding issues.
- **Natural Language vs Code:** Use Portuguese ONLY when responding to the user directly in the chat interface. Everything saved to disk or generated in code files MUST be in English.

## 2. Code Quality & Architecture
- Prioritize clean, readable, and maintainable code following SOLID principles.
- Avoid introducing unnecessary dependencies or overly complex abstractions.
- Ensure proper error handling, explicit types, and clean resource management.
- Write self-documenting code with clear naming conventions before adding comments.

## 3. Formatting & Output
- Keep inline comments concise, accurate, and written exclusively in English.
- Do not add conversational fluff or extraneous markdown wrappers inside code snippets meant for replacement/editing.
