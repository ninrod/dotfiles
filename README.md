# Ninrod's __vim, tmux, zsh__ dotfiles

## Using Solarized Dark

![solarized-dark-vi-tmux](https://raw.githubusercontent.com/ninrod/dotfiles/misc/images/terminal.png)

## Using PaperColor

![papercolor-vi-tmux](https://raw.githubusercontent.com/ninrod/dotfiles/misc/images/screen.png)

## Important notice 

* These are my personal configuration files, which are in a constant state of change as I develop my environment across several systems. I can't guarantee that these configurations will work for you, at all. So if you encounter problems with them, you're pretty much on your own. (this notice was based on [aaron bieber's dotfiles][3])

## Install Instructions

* get `vim` 7.4+ with [+clipboard][vim_clipboard_link] and +python.
* get [tmux][tmux_link] 1.8+
* get [zsh][zsh_link] 5.1+ and make sure that `/usr/local/bin/zsh points to it`.
* get [python][python_link] 2.7+
* get [ag][ag_link] (you can `brew install ag` on OSx).
* get [fzf][fzf_link].
* if you're on OSx, brew install these:
  * `brew install coreutils` (mainly because `BSD` `ls` `CLICOLOR` sucks).
  * `brew install reattach-to-user-namespace` (Mainly because of the `open` utility. [more info here][reattach_link]).
  * `brew install nvim`
  * `brew install diff-so-fancy`
* I strongly recommend using [iTerm2][iterm2_link] on OSx.
* this is for unix systems: `GNU/Linux`, `OSx`, etc... It should work on theory on windows, but I've faced a lot of configuration issues and ended up abandoning windows support.
* git clone this repo.

```sh
$ git clone https://github.com/ninrod/dotfiles.git ~/.dotfiles
```

* if you are not on OSx, you need to edit .tmux.conf like so:

```sh
$ vim -u NONE ~/.dotfiles/dot/.tmux.conf

# change this line
# switch OSx pbcopy for xclip or an equivalent GNU/Linux command (xsel, etc...)
bind -t vi-copy y copy-pipe 'pbcopy'
```

* configure your terminal to use the [papercolor theme][papercolor_link] or [solarized dark theme][solarized_link]. There's a `conf` folder within this repo that can help you with that. 
* change the git user info inside the .gitconfig file within the repo and run the zsh script `install.zsh` like so:

```sh
# change user info
$ vim -u NONE ~/.dotfiles/dot/.gitconfig

# run install script (basically just mounts symlinks on your home folder)
$ ~/.dotfiles/install.zsh

# reload zsh
$ exec zsh
```

* fire up vim and run `:PlugInstall`
* That's it, your're all set.


## Bonus: Changing themes

* To change Themes you have to alter `.tmux.conf`, `.vimrc`, `.zshrc` (for prompt theme) and your terminal theme.
* there's a `conf` folder that can help you with that.
* I've also provided a [solarized-theme][1] tag and a [papercolor-theme][2] as example setups.

## VIM: Powerful shell text editor. Tweaked with plugins.

### installed plugins
0. [altercation/vim-colors-solarized][vim-colors-solarized_link]: well designed vim colorscheme.
0. [alvan/vim-closetag][closetag_link]: auto close for html tags.
0. [bkad/CamelCaseMotion][camel_link]: motion through camelcase style words.
0. [ervandew/supertab][supertab_link]: insert mode completions triggered by <TAB>.
0. [jiangmiao/auto-pairs][auto-pairs_link]: plugin to complete pairs of brackets and similar stuff.
0. [junegunn/fzf.vim][fzf-vim_link]: fuzzy finder.
0. [junegunn/vim-easy-align][vim-easy-align_link]: very good text alignment tool.
0. [kshenoy/vim-signature][vim-signature_link]: adds visual notation for vim marks.
0. [mhinz/vim-signify][vim-signify_link]: signs to indicate added, modified and removed lines of files under a VCS.
0. [nhooyr/neoman.vim][neoman_link]: readman pages faster than superman.
0. [tpope/vim-commentary][vim-commentary_link]: automatic commentary wrapping.
0. [tpope/vim-fugitive][vim-fugitive_link]: very good git wrapper for vim.
0. [tpope/vim-repeat][vim-repeat_link]: expands usage opportunities for the '.' (dot) repeat command.

#### VIM: note about the `<leader>` key

* I've remapped `<space>` to be an alias to the `<leader>` key ([tip I][sheerun_tip_link] from [sheerun][sheerun_link])

#### VIM: custom `<leader>` binds

bind                    | action
------------------------| ------------------------------------------
`<leader> + v`          | creates a new window in a vertical split
`<leader> + x`          | creates a new window in a horizontal split
`<leader> + d`          | custom pagedown. alias for `LztM`.
`<leader> + u`          | custom pageup. alias for `HzbM`.
`<leader> + f`          | `:Files`. (fzf)
`<leader> + r`          | `:History`. (fzf)
`<leader> + b`          | `:Buffers`. (fzf)
`<leader> + g`          | `:GitFiles`. (fzf)
`<leader> + [h,j,k,l]`  | navigates through open windows
`<leader> + [H,J,K,L]`  | moves the window to the right, left, etc...
`<leader> + [arrowkey]` | resizes the window

#### VIM: custom misc binds

bind                           | action
-----------------------        | ------------------------------------------
`;`                            | `:` (normal and visual)
`'`                            | `"` (normal and visual)
`,`                            | `;`
`:`                            | `,`
`-`                            | `:noh`
`gp`                           | `:Gpush`
`gs`                           | open scratch buffer
`Z`                            | alias for ZZ. exits saving file
`Q`                            | alias for ZQ. exits without saving file
`<BS>`                         | `:Gstatus`
`w, b, e, ge`                  | these normal movement keys had their motion behaviour expanded to work with [camel words][camel_link].
`<ENTER>`                      | `:w` (writes buffer)
`<ENTER>` (visual)             | `:EasyAlign`
`{`, `}`                       | navigate vim help files. `}` jumps to term. `{` jumps back.
`ir`, `ar` (visual and normal) | alias for `i[` and `a[`

#### VIM: custom function keys
bind    |action
--------|-------------------------------------------
`<F2>`  |toggle nerdtree file explorer
`<F4>`  |kill the current buffer
`<F5>`  |:windo diffthis
`<F9>`  | toggles showing relative line numbers.
`<F11>` |source ~/.vimrc
`<F12>` |open ~/.vimrc

#### VIM: text objects (expanded set with plugins)
textobject   | action
-----------  | ---------
`<leader>iw` | inside section of camelcase word
`a`          | function arguments
`f`          | functions
`_`          | underscore surrounded words
`e`          | entire file
`x`          | html tag attribute
`r`          | square brackets `[]`

#### VIM: potentially useful binds (not currently in use)
bind        | action
------------|-------------------------
`s`         | equivalent to `cl`.
`S`         | equivalent to `cc`.
`U`         | A special kind of undo. very confusing, never really used that. (`:h U`)
`-`         | equivalent to `k0`.
`g + char`  | top free binds: `gh`,`gf`,`gl`,`gp`,`gr`,`gs`,`gx`,`gy`,`gz`.
`K`         | word lookup does not seem to be of much use.
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
`<prefix> + r`                | cycles through different panel layouts.
`<prefix> + <arrowkey>`       | navigates to the panel indicated by the arrow key.
`<prefix> + s`                | shows a prompt where you can type the name of the window you want to send the panel to.

#### exiting panels and windows in TMUX

bind                           | action
------------------------------ | -----------------------------------------------------------------------------------------
`exit`                         | closes a panel. When the last panel of the window is closed, the window is also closed.

LICENSE
-----------

Same as [Vim][vim-license_link].

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
[indentLine_link]: <https://github.com/Yggdroot/indentLine.git>
[nerdtree_link]: <https://github.com/scrooloose/nerdtree.git>
[supertab_link]: <https://github.com/ervandew/supertab.git>
[targets_link]: <https://github.com/wellle/targets.vim.git>
[ultisnips_link]: <https://github.com/SirVer/ultisnips.git>
[airline_link]: <https://github.com/bling/vim-airline.git>
[bufkill_link]: <https://github.com/qpkorr/vim-bufkill.git>
[vim-characterize_link]: <https://github.com/tpope/vim-characterize.git>
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
[vim-instant-markdown_link]: <https://github.com/suan/vim-instant-markdown.git>
[vim-json_link]: <https://github.com/elzr/vim-json.git>
[vim-polyglot_link]: <https://github.com/sheerun/vim-polyglot.git>
[vim-rsi_link]: <https://github.com/tpope/vim-rsi.git>
[vitality_link]: <https://github.com/sjl/vitality.vim.git>
[papercolor_link]: <https://github.com/NLKNguyen/papercolor-theme.git>
[ag_link]: <https://github.com/ggreer/the_silver_searcher.git>
[iterm2_link]: <https://github.com/gnachman/iTerm2.git>
[vim-visual-start-search_link]: <https://github.com/bronson/vim-visual-star-search.git>
[camel_link]: <https://github.com/bkad/CamelCaseMotion.git>
[vim-license_link]: <http://vimdoc.sourceforge.net/htmldoc/uganda.html#license>
[vim-sleuth_link]: <https://github.com/tpope/vim-sleuth.git>
[neoman_link]: <https://github.com/nhooyr/neoman.vim.git>
[fzf-vim_link]: <https://github.com/junegunn/fzf.vim.git>

[1]: <https://github.com/ninrod/dotfiles/releases/tag/solarized-theme>
[2]: <https://github.com/ninrod/dotfiles/releases/tag/papercolor-theme>
[3]: <https://github.com/aaronbieber/dotfiles>
