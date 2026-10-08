#!/usr/bin/env sh

# wrapper to trick opencode to use win32yank
# Flag to control if this is a paste operation
is_paste=0

for arg in "$@"; do
    case "$arg" in
        -o|-out)
            is_paste=1
            ;;
    esac
done

if [ "$is_paste" -eq 1 ]; then
    exec win32yank.exe -o --lf
else
    exec win32yank.exe -i --crlf
fi
