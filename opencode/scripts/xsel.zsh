#!/usr/bin/env sh

# Wrapper to let opencode use the Windows clipboard through xsel.
is_paste=0

for arg in "$@"; do
    case "$arg" in
        -o*|--output|-[!-]*o*)
            is_paste=1
            ;;
    esac
done

if [ "$is_paste" -eq 1 ]; then
    exec win32yank.exe -o --lf
else
    exec win32yank.exe -i --crlf
fi
