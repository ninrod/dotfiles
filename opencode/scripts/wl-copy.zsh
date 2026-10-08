#!/usr/bin/env sh

# Wrapper to let opencode copy text through the Windows clipboard.
exec win32yank.exe -i --crlf
