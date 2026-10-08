#!/usr/bin/env sh

# Wrapper to let opencode paste text from the Windows clipboard.
exec win32yank.exe -o --lf
