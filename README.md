# Config files for __tmux, zsh, vim, git__

### Screenshot
![screenshot-vi-tmux](https://raw.githubusercontent.com/ninrod/unix-shell-config/misc/images/screenshot.png)

## INSTALLATION instructions

* Verify that you have [tmux][tmux_link] >= 1.8
* Verify that you have [zsh][zsh_link] >= 5.0.8
* install [fasd][fasd_link]
* install [fzf][fzf_link]
* install a [powerline patched font][powerline_fonts] on your OS and configure your terminal to use said font.
* configure your terminal to use the [solarized dark theme][solarized_link]
* git clone this repo, change the git user info inside the .gitconfig file within the repo and run the zsh script `.links.zsh` like so:

```sh
git clone https://github.com/ninrod/unix-shell-config.git ~/.unix-shell-config
cd ~/.unix-shell-config
vim .gitconfig #change user info
./.links.zsh
```

* done!

## VIM: Powerful shell text editor. Tweaked with plugins.

### installed plugins
01. [ack.vim][ack.vim_link]: front for ack/ag, search inside files.
02. [auto-pairs][auto-pairs_link]: plugin to complete pairs of brackets and similar stuff.
03. [bufexplorer][bufexplorer_link]: easier vim buffer navigation.
04. [ctrlp.vim][ctlrp_link]: easier vim buffer navigation.
05. [gitv][gitv_link]: gitk for vim.
06. [nerdtree][nerdtree_link]: tree like file navigation.
07. [rainbow][rainbow_link]: nicer round bracket visualization.
08. [supertab][supertab_link]: insert mode completions triggered by <TAB>.
09. [targets.vim][targets_link]: creates various useful textobjects.
10. [ultisnips][ultisnips_link]: snippet engine for vim (needs +python).
11. [vim-airline][airline_link]: lightweight powerline clone written in pure VimL. 
12. [vim-bufkill][bufkill_link]: easier buffer unloading.
13. [vim-closetag][closetag_link]: auto close for html tags.
14. [vim-colors-solarized][vim-colors-solarized_link]: well designed vim colorscheme.
15. [vim-commentary][vim-commentary_link]: automatic commentary wrapping.
16. [vim-easy-align][vim-easy-align_link]: automatic commentary wrapping.

#### VIM Window binds

bind                   | action
-----------------------|------------------------------------------
`<leader> + v`         | creates a new window in a vertical split
`<leader> + x`         | creates a new window in a horizontal split
`<leader> + [h,j,k,l]` | navigates through open windows
`<leader> + w`         | cycle through windows

## TMUX: terminal multiplexer

You interact with tmux escaping commands through a key combo called `prefix`. I've remapped `prefix` to `<control>+<spacebar>`.

#### TMUX Window binds

bind           | action
-------------- | ------------------------------------------------------------
`<prefix> + c` | creates a new window
`<prefix> + 1` | navigates to window 1 (or 2 to navigate to window 2, etc...)
`<prefix> + n` | navigates to the next window
`<prefix> + p` | cycles through the last two visited windows
`<prefix> + ,` | to rename a window

#### TMUX Panel binds

bind                          | action
------------------------------|-----------------------------------------------------------------------------------------
`<prefix> + v`                | creates a new shell panel vertically splitting the viewport.
`<prefix> + x`                | creates a new shell panel horizontally splitting the viewport.
`<prefix> + <space>`          | cycles through different panel layouts.
`<prefix> + <directionalkey>` | navigates to the panel indicated by the directional key.
`<prefix> + s`                | shows a prompt where you can type the name of the window you want to send the panel to.

#### exiting panels and windows in TMUX

bind                           | action
------------------------------ | -----------------------------------------------------------------------------------------
`exit`                         | closes a panel. When the last panel of the window is closed, the window is also closed.


[powerline_fonts]: <https://github.com/powerline/fonts.git> 
[fasd_link]: <https://github.com/clvv/fasd.git>
[tmux_link]: <https://github.com/tmux/tmux.git>
[zsh_link]: <https://github.com/zsh-users/zsh.git>
[solarized_link]: <https://github.com/altercation/solarized.git>

[ack.vim_link]: <https://github.com/mileszs/ack.vim>
[auto-pairs_link]: <https://github.com/jiangmiao/auto-pairs.git>
[bufexplorer_link]: <https://github.com/jlanzarotta/bufexplorer.git>
[ctlrp_link]: <https://github.com/ctrlpvim/ctrlp.vim.git>
[gitv_link]: <https://github.com/ctrlpvim/ctrlp.vim.git>
[nerdtree_link]: <https://github.com/scrooloose/nerdtree.git>
[rainbow_link]: <https://github.com/luochen1990/rainbow.git>
[supertab_link]: <https://github.com/ervandew/supertab.git>
[targets_link]: <https://github.com/wellle/targets.vim.git>
[ultisnips_link]: <https://github.com/SirVer/ultisnips.git>
[airline_link]: <https://github.com/bling/vim-airline.git>
[bufkill_link]: <https://github.com/qpkorr/vim-bufkill.git>
[closetag_link]: <https://github.com/alvan/vim-closetag.git>
[vim-colors-solarized_link]: <https://github.com/altercation/vim-colors-solarized.git>
[vim-commentary_link]: <https://github.com/tpope/vim-commentary.git>
[vim-easy-align_link]: <https://github.com/junegunn/vim-easy-align.git>
[fzf_link]: <https://github.com/junegunn/fzf.git>
