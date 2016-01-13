# My dotfile repo for __tmux, zsh, vim, git__

### Screenshot
![screenshot-vi-tmux](https://raw.githubusercontent.com/ninrod/unix-shell-config/misc/images/screenshot.png)

## INSTALLATION instructions

* Verify that you have [tmux][tmux_link] >= 1.8
* Verify that you have [zsh][zsh_link] >= 5.0.8
* install [fasd][fasd_link]
* install a [powerline patched font][powerline_fonts] on your OS and configure your terminal to use said font.
* configure your terminal to use the [solarized dark theme][solarized_link]
* git clone this repo and run the zsh script `.links.zsh`. Like so:

```sh
git clone https://github.com/ninrod/unix-shell-config.git ~/.unix-shell-config
cd ~/.unix-shell-config
./.links.zsh
```
* done!

## VIM: powerful shell text editor tweaked with plugins

### installed plugins
* [auto-pairs][auto-pairs_link]: plugin to complete pairs of brackets and similar stuff

#### VIM Window binds

bind                  | action
-------------         | -------------
`<leader> + v`        | creates a new windows in a vertical split
`<leader> + x`        | creates a new windows in a horizontal split
`<leader> + [h|j|k|l]`| navigates through open windows
`<leader> + w`        | cycle through windows

## TMUX: terminal multiplexer

You interact with tmux escaping commands through a key combo called `prefix`. I've remapped `prefix` to `<control>+<spacebar>`.

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


[powerline_fonts]: <https://github.com/powerline/fonts.git> 
[fasd_link]: <https://github.com/clvv/fasd.git>
[tmux_link]: <https://github.com/tmux/tmux.git>
[zsh_link]: <https://github.com/zsh-users/zsh.git>
[solarized_link]: <https://github.com/altercation/solarized.git>

[auto-pairs_link]: <https://github.com/jiangmiao/auto-pairs.git>
