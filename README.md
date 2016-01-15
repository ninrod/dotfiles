# Config files for __tmux, zsh, vim, git__

### Screenshot
![screenshot-vi-tmux](https://raw.githubusercontent.com/ninrod/unix-shell-config/misc/images/screenshot.png)

## INSTALLATION instructions

* Verify that you have [tmux][tmux_link] >= 1.8.
* Verify that you have [zsh][zsh_link] >= 5.0.8.
* install [fasd][fasd_link].
* install [fzf][fzf_link].
* if you're on OSX, you need to `brew install` [reattach-to-user-namespace][reattach_link].
* if you're on Linux, you need to comment the following line on `.tmux.conf`.

```sh
set -g default-command "reattach-to-user-namespace -l /usr/local/bin/zsh"
```

* install a [powerline patched font][powerline_fonts] on your OS and configure your terminal to use said font. 
I recommend [Sauce Code Powerline Regular (Source code Pro)][saucecode_link].
* configure your terminal to use the [solarized dark theme][solarized_link].
* git clone this repo, change the git user info inside the .gitconfig file within the repo and run the zsh script `.links.zsh` like so:

```sh
git clone https://github.com/ninrod/unix-shell-config.git ~/.unix-shell-config
cd ~/.unix-shell-config
vim .gitconfig #change user info
./.links.zsh
```

* That's it, your're all set.

## VIM: Powerful shell text editor. Tweaked with plugins.

### installed plugins
01. [ack.vim][ack.vim_link]: front for ack/ag, search inside files.
02. [auto-pairs][auto-pairs_link]: plugin to complete pairs of brackets and similar stuff.
03. [bufexplorer][bufexplorer_link]: easier vim buffer navigation.
04. [ctrlp.vim][ctlrp_link]: easier vim buffer navigation.
05. [gitv][gitv_link]: gitk for vim.
06. [nerdtree][nerdtree_link]: tree like file navigation.
07. [nerdtree-tabs][nerdtree-tabs_link]: 'toggle' behaviour for nerdtree.
08. [rainbow][rainbow_link]: nicer round bracket visualization.
09. [supertab][supertab_link]: insert mode completions triggered by <TAB>.
10. [targets.vim][targets_link]: creates various useful textobjects.
11. [ultisnips][ultisnips_link]: snippet engine for vim (needs +python).
12. [vim-airline][airline_link]: lightweight powerline clone written in pure VimL. 
13. [vim-bufkill][bufkill_link]: easier buffer unloading.
14. [vim-closetag][closetag_link]: auto close for html tags.
15. [vim-colors-solarized][vim-colors-solarized_link]: well designed vim colorscheme.
16. [vim-commentary][vim-commentary_link]: automatic commentary wrapping.
17. [vim-easy-align][vim-easy-align_link]: automatic commentary wrapping.
18. [vim-endwise][vim-endwise_link]: automatic insert mode if/for/case completions for some languages.
19. [vim-exchange][vim-exchange_link]: easily swap of two regions of text.
20. [vim-fugitive][vim-fugitive_link]: very good git wrapper for vim.
21. [vim-fugitive][vim-fugitive_link]: very good git wrapper for vim.
22. [vim-numbertoggle][vim-numbertoggle_link]: eases the use of relative line numbers.
23. [vim-polyglot][vim-polyglot_link]: big syntax highlighting language pack.
24. [vim-repeat][vim-repeat_link]: expands usage opportunities for the '.' (dot) repeat command.
25. [vim-signature][vim-signature_link]: expands usage opportunities for the '.' (dot) repeat command.
26. [vim-signify][vim-signify_link]: signs to indicate added, modified and removed lines of files under a VCS.
27. [vim-snippets][vim-snippets_link]: snippets for various programming languages.
28. [vim-surround][vim-surround_link]: easily add/change surrounding {},'',(), <htmltags>, etc...

#### VIM Window binds

bind                   | action
-----------------------|------------------------------------------
`<leader> + v`         | creates a new window in a vertical split
`<leader> + x`         | creates a new window in a horizontal split
`<leader> + [h,j,k,l]` | navigates through open windows
`<leader> + w`         | cycle through windows

## TMUX: the terminal multiplexer

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
[saucecode_link]: <https://github.com/powerline/fonts/raw/master/SourceCodePro/Sauce%20Code%20Powerline%20Regular.otf>

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
[vim-endwise_link]: <https://github.com/tpope/vim-endwise.git>
[vim-exchange_link]: <https://github.com/tommcdo/vim-exchange.git>
[vim-fugitive_link]: <https://github.com/tpope/vim-fugitive.git>
[nerdtree-tabs_link]: <https://github.com/jistr/vim-nerdtree-tabs.git>
[vim-numbertoggle_link]: <https://github.com/jeffkreeftmeijer/vim-numbertoggle.git>
[vim-polyglot_link]: <https://github.com/sheerun/vim-polyglot.git>
[vim-repeat_link]: <https://github.com/tpope/vim-repeat.git>
[vim-signature_link]: <https://github.com/kshenoy/vim-signature.git>
[vim-signify_link]: <https://github.com/mhinz/vim-signify.git>
[vim-snippets_link]: <https://github.com/honza/vim-snippets.git>
[vim-surround_link]: <https://github.com/tpope/vim-surround.git>
[reattach_link]: <https://github.com/ChrisJohnsen/tmux-MacOSX-pasteboard.git>
