# My dotfile repo for __tmux, zsh, vim, git__

### Screenshot
![screenshot-vi-tmux](https://raw.githubusercontent.com/ninrod/unix-shell-config/misc/images/screenshot.png)

## INSTALLATION requirements

* a powerline patched font (you can find one [here][powerline-fonts])

## VIM: powerful shell text editor tweaked with plugins

#### VIM Window binds

* `<leader> + v`: creates a new windows in a vertical split
* `<leader> + x`: creates a new windows in a horizontal split
* `<leader> + [h|j|k|l]`: navigates through open windows
* `<leader> + w`: cycle through windows

## TMUX: terminal multiplexer

#### TMUX Window binds

 * `<prefix> + c` - creates a new window
 * `<prefix> + 1` - navigates to window 1 (or 2 to navigate to window 2, etc...)
 * `<prefix> + n` - navigates to the next window
 * `<prefix> + p` - cycles through the last two visited windows
 * `<prefix> + ,` - to rename a window

#### TMUX Panel binds

 * `<prefix> + v` - creates a new shell panel vertically splitting the viewport.
 * `<prefix> + x` - creates a new shell panel horizontally splitting the viewport.
 * `<prefix> + <space>` - cycles through different panel layouts.
 * `<prefix> + <directionalkey>` - navigates to the panel indicated by the directional key.
 * `<prefix> + s` - shows a prompt where you can type the name of the window you want to send the panel to.

#### exiting panels and windows in TMUX

 * `exit` - closes a panel. When the last panel of the window is closed, the window is also closed. 


[powerline-fonts]: <https://github.com/powerline/fonts.git> 
