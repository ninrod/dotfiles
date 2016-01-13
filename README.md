# My dotfile repo for __tmux, zsh, vim, git__

### Screenshot
![screenshot-vi-tmux](https://raw.githubusercontent.com/ninrod/unix-shell-config/misc/images/screenshot.png)

## TMUX: terminal multiplexer

You interact with tmux escaping commands through a key combo called `prefix`. I've remapped `prefix` to `<control>+<spacebar>`.

#### Window binds

 * `<prefix> + c` - creates a new window
 * `<prefix> + 1` - navigates to window 1 (or 2 to navigate to window 2, etc...)
 * `<prefix> + n` - navigates to the next window
 * `<prefix> + p` - cycles through the last two visited windows
 * `<prefix> + ,` - to rename a window

#### Panel binds

 * `<prefix> + v` - creates a new shell panel vertically splitting the viewport.
 * `<prefix> + x` - creates a new shell panel horizontally splitting the viewport.
 * `<prefix> + <space>` - cycles through different panel layouts.
 * `<prefix> + <directionalkey>` - navigates to the panel indicated by the directional key.
 * `<prefix> + s` - shows a prompt where you can type the name of the window you want to send the panel to.

#### exiting panels and windows

 * `exit` - closes a panel. When the last panel of the window is closed, the window is also closed. 

