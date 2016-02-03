# Config files for __tmux, zsh, vim, git__

### Screenshot
![screenshot-vi-tmux](https://raw.githubusercontent.com/ninrod/unix-shell-config/misc/images/screenshot.png)

## INSTALLATION instructions

* get [tmux][tmux_link] 1.8+
* get [zsh][zsh_link] 5.0.8+
* get [python][python_link] 2.7+
* get [fasd][fasd_link].
* make sure you vim 7.4+ with [+clipboard][vim_clipboard_link] and +python.
* if you're on OSX, you need to `brew install` [reattach-to-user-namespace][reattach_link].
* install a [powerline patched font][powerline_fonts] on your OS and configure your terminal to use said font.
  I recommend [Source code Pro][saucecode_link], 14pt, for a 13" display.
* git clone this repo.

```sh
git clone https://github.com/ninrod/unix-shell-config.git ~/.unix-shell-config
```

* if you are not on OSx (e.g. GNU/Linux), you need to edit .tmux.conf like so:

```sh
cd ~/.unix-shell-config
vim .tmux.conf

#comment this line
set -g default-command "reattach-to-user-namespace -l /usr/local/bin/zsh"

#change OSx pbcopy for xclip or an equivalent linux command
bind -t vi-copy y copy-pipe 'pbcopy'
```

* configure your terminal to use the [solarized theme][solarized_link].
* change the git user info inside the .gitconfig file within the repo and run the zsh script `.links.zsh` like so:

```sh
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
08. [supertab][supertab_link]: insert mode completions triggered by <TAB>.
09. [targets.vim][targets_link]: creates various useful textobjects.
10. [ultisnips][ultisnips_link]: snippet engine for vim (needs +python).
11. [vim-airline][airline_link]: lightweight powerline clone written in pure VimL.
12. [vim-bufkill][bufkill_link]: easier buffer unloading.
13. [vim-closetag][closetag_link]: auto close for html tags.
14. [vim-colors-solarized][vim-colors-solarized_link]: well designed vim colorscheme.
15. [vim-commentary][vim-commentary_link]: automatic commentary wrapping.
16. [vim-easy-align][vim-easy-align_link]: very good text alignment tool.
17. [vim-endwise][vim-endwise_link]: automatic insert mode if/for/case completions for some languages.
18. [vim-exchange][vim-exchange_link]: easily swap of two regions of text.
19. [vim-fugitive][vim-fugitive_link]: very good git wrapper for vim.
20. [vim-numbertoggle][vim-numbertoggle_link]: eases the use of relative line numbers.
21. [vim-repeat][vim-repeat_link]: expands usage opportunities for the '.' (dot) repeat command.
22. [vim-signature][vim-signature_link]: adds visual notation for vim marks.
23. [vim-signify][vim-signify_link]: signs to indicate added, modified and removed lines of files under a VCS.
24. [vim-snippets][vim-snippets_link]: snippets for various programming languages.
25. [vim-surround][vim-surround_link]: easily add/change surrounding {},'',(), <htmltags>, etc...
26. [vim-textobj-entire][vim-textobj-entire_link]: adds textobjs `ie` and `ae` for selecting the entire buffer.
27. [vim-textobj-function][vim-textobj-function_link]: adds textobjs `if` and `af` for selecting a function body.
28. [vim-textobj-function-javascript][vim-textobj-function-javascript_link]: expands [vim-textobj-function][vim-textobj-function_link] adding javascript functions.
29. [vim-textobj-underscore][vim-textobj-underscore_link]: adds `a_` and `i_` text objects for manipulating words between underscores.
30. [vim-textobj-user][vim-textobj-user_link]: base library for other text objects.
31. [vim-textobj-xmlattr][vim-textobj-xmlattr_link]: adds `ax` and `ix` text objects for manipulating xml attributes of tags.
32. [vim-unimpaired][vim-unimpaired_link]: adds various `[ + bind` and `] + bind` useful bindings.
33. [vis][vis_link]: within visual selection search and replace. (block or linewise)
34. [ZoomWin][ZoomWin_link]: makes a vim window go temporarilly fullscreen.

#### VIM: note about the `<leader>` key

* I've remapped `<space>` to be an alias to the `<leader>` key.

#### VIM: function keys
bind    |action
--------|-------------------------------------------
`<F2>`  |toggle nerdtree file explorer
`<F4>`  |kill the current buffer
`<F5>`  |:windo diffthis
`<F9>`  | toggles showing relative line numbers.
`<F11>` |source ~/.vimrc
`<F12>` |open ~/.vimrc

#### VIM: misc binds

bind                           | action
------------------------------ | ------------------------------------------
`gp`                           | `:Gpush`
`gs`                           | open scratch buffer
`Z`                            | alias for ZZ. exits saving file
`Q`                            | alias for ZQ. exits without saving file
`U`                            | toggle zoom in and zoom out of a window
`+`                            | `:Gstatus`
`<leader> + -`                 | `:noh` turns off highlighted search terms.
`<leader> + d`                 | custom pagedown. alias for `LztM`.
`<leader> + u`                 | custom pageup. alias for `HzbM`.
`<leader> + f`                 | `:CtrlP`. fuzzy file finder
`<leader> + r`                 | `:CtrlPMRU`. Most recent used file finder.
`<leader> + /`                 | `:noh`
`<ENTER>`                      | `:w` (writes buffer)
`<ENTER>` (visual)             | `:EasyAlign`
`<BACKSPACE>`                  | buffer explorer
`{`, `}`                       | navigate vim help files. `}` jumps to term. `{` jumps back.
`ir`, `ar` (visual and normal) | alias for `i[` and `a[`
`(`, `)` (visual and normal)   | alias for `"0p`,`"0P`. Easier access to the 'yank' register
`Y` (visual and normal)        | alias for `"0d`. cut and fill yank register. (register `"0`)

#### VIM: window manipulation

bind                   | action
-----------------------|------------------------------------------
`<leader> + v`         | creates a new window in a vertical split
`<leader> + x`         | creates a new window in a horizontal split
`<leader> + w`         | cycle through windows
`<leader> + [h,j,k,l]` | navigates through open windows
`<leader> + [H,J,K,L]` | moves the window to the right, left, etc...
`<leader> + [arrowkey]`| resizes the window

#### VIM: potentially useful binds

bind        | action
------------|-------------------------
`s`         | equivalent to `cl`.
`S`         | equivalent to `cc`.
`K`         | word lookup does not seem to be of much use.
`g + char`  | free binds: `gh`,`gf`,`gl`,`gp`,`gr`,`gs`,`gx`,`gy`,`gz`.
`-`         | equivalent to `k0`.
`&`         | repeat last substitute. rarely useful.

## TMUX: the terminal multiplexer

You interact with tmux escaping commands through a key combo called `prefix`. I've remapped `prefix` to `<control>+<spacebar>`.

#### TMUX copy-mode | history | scroll mode

bind                 | action
-------------------- | -----------------------------------------------------------
`<prefix> + <space>` | enter copy-mode ([tip VIII][sheerun_tip_link] from [sheerun][sheerun_link]).

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
----------------------------- | ----------------------------------------------------------------------------------------
`<prefix> + v`                | creates a new shell panel vertically splitting the viewport.
`<prefix> + x`                | creates a new shell panel horizontally splitting the viewport.
`<prefix> + <space>`          | cycles through different panel layouts.
`<prefix> + <arrowkey>` | navigates to the panel indicated by the arrow key.
`<prefix> + s`                | shows a prompt where you can type the name of the window you want to send the panel to.

#### exiting panels and windows in TMUX

bind                           | action
------------------------------ | -----------------------------------------------------------------------------------------
`exit`                         | closes a panel. When the last panel of the window is closed, the window is also closed.


[vim_clipboard_link]: <http://vimcasts.org/blog/2013/11/getting-vim-with-clipboard-support>
[papercolor_link]: <https://github.com/NLKNguyen/papercolor-theme.git>
[powerline_fonts]: <https://github.com/powerline/fonts.git>
[fasd_link]: <https://github.com/clvv/fasd.git>
[tmux_link]: <https://github.com/tmux/tmux.git>
[zsh_link]: <https://github.com/zsh-users/zsh.git>
[solarized_link]: <https://github.com/altercation/solarized.git>
[saucecode_link]: <https://github.com/powerline/fonts/raw/master/SourceCodePro/Sauce%20Code%20Powerline%20Regular.otf>
[reattach_link]: <https://github.com/ChrisJohnsen/tmux-MacOSX-pasteboard.git>
[ruby_link]: <https://github.com/ruby/ruby.git>
[python_link]: <http://python.org>
[sheerun_tip_link]: <https://sheerun.net/2014/03/21/how-to-boost-your-vim-productivity/>
[sheerun_link]: <https://github.com/sheerun>


[ack.vim_link]: <https://github.com/mileszs/ack.vim>
[auto-pairs_link]: <https://github.com/jiangmiao/auto-pairs.git>
[bufexplorer_link]: <https://github.com/jlanzarotta/bufexplorer.git>
[ctlrp_link]: <https://github.com/ctrlpvim/ctrlp.vim.git>
[gitv_link]: <https://github.com/ctrlpvim/ctrlp.vim.git>
[nerdtree_link]: <https://github.com/scrooloose/nerdtree.git>
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
[vim-repeat_link]: <https://github.com/tpope/vim-repeat.git>
[vim-signature_link]: <https://github.com/kshenoy/vim-signature.git>
[vim-signify_link]: <https://github.com/mhinz/vim-signify.git>
[vim-snippets_link]: <https://github.com/honza/vim-snippets.git>
[vim-surround_link]: <https://github.com/tpope/vim-surround.git>
[vim-textobj-entire_link]: <https://github.com/kana/vim-textobj-entire.git>
[vim-textobj-function_link]: <https://github.com/kana/vim-textobj-function.git>
[vim-textobj-function-javascript_link]: <https://github.com/thinca/vim-textobj-function-javascript.git>
[vim-textobj-underscore_link]: <https://github.com/lucapette/vim-textobj-underscore.git>
[vim-textobj-user_link]: <https://github.com/kana/vim-textobj-user.git>
[vim-textobj-xmlattr_link]: <https://github.com/whatyouhide/vim-textobj-xmlattr.git>
[vim-unimpaired_link]: <https://github.com/tpope/vim-unimpaired.git>
[vis_link]: <https://github.com/sencer/vis.git>
[ZoomWin_link]: <https://github.com/regedarek/ZoomWin.git>
