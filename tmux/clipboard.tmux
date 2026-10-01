# -*- mode: sh -*-

# copy-mode tweakings
bind Space copy-mode
unbind-key -T copy-mode-vi v
bind-key -T copy-mode-vi 'v' send -X begin-selection
bind-key -T copy-mode-vi 'C-v' send -X rectangle-toggle

# Forward terminal focus changes (and pane/window switches) to programs that
# request them. Emacs uses these events to refresh its Windows clipboard
# snapshot in the background, so pasting does not wait for win32yank.exe.
# Programs that never request focus reporting are unaffected.
set -g focus-events on

# Use Windows CRLF in WSL and tmux's native clipboard integration elsewhere.
if-shell 'test -n "$WSL_DISTRO_NAME"' \
    "bind-key -T copy-mode-vi 'y' send-keys -X copy-pipe-and-cancel 'win32yank.exe -i --crlf'" \
    "bind-key -T copy-mode-vi 'y' send-keys -X copy-selection"
