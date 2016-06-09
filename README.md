# Ninrod's __vim, tmux, zsh__ dotfiles

* Simplicity, speed and power while working inside the shell.

## Using Solarized Dark

![solarized-dark-vi-tmux](https://raw.githubusercontent.com/ninrod/dotfiles/misc/images/update-2016.06.03.png)

## Using PaperColor

![papercolor-vi-tmux](https://raw.githubusercontent.com/ninrod/dotfiles/misc/images/screen.png)

## Important notice 

* These are my personal configuration files, which are in a constant state of change as I develop my environment across several systems. I can't guarantee that these configurations will work for you, at all. So if you encounter problems with them, you're pretty much on your own. (this notice was based on [aaron bieber's dotfiles](https://github.com/aaronbieber/dotfiles))

## Install Instructions

* First off, I strongly recommend using [iTerm2](https://github.com/gnachman/iTerm2.git) on OSx.
* Secondly, this is for unix systems: `GNU/Linux`, `OSx`, etc... It should work on theory on windows, but I've faced a lot of configuration issues and ended up abandoning windows support.
* configure your terminal to use the [papercolor theme](https://github.com/NLKNguyen/papercolor-theme.git) or [solarized dark theme](https://github.com/altercation/solarized.git). There's a `conf` folder within this repo that can help you with that. 
* now get `vim` 7.4+ with [+clipboard](http://vimcasts.org/blog/2013/11/getting-vim-with-clipboard-support) and +python.
* get [tmux](https://github.com/tmux/tmux.git) 1.8+
* get [zsh](https://github.com/zsh-users/zsh.git) 5.1+ and make sure that `/bin/zsh` is valid. (if not: `$ cd /bin && sudo ln -s $(command -v zsh) zsh`)
* `cat /etc/shells` and verify that zsh appears on the list. If not, `sudo vi /etc/shells` and append `/bin/zsh`
* get [python2](http://python.org), python2-pip and `$ sudo pip2 install neovim`
* get [ag](https://github.com/ggreer/the_silver_searcher.git) (you can `brew install ag` on OSx).
* clone [zplug](https://github.com/zplug/zplug.git) to `~/.zplug`
* clone [fzf](https://github.com/junegunn/fzf.git) to `~/.fzf`
* if you're on OSx, brew install these:
  * `brew install coreutils` (mainly because `BSD` `ls` `CLICOLOR` sucks).
  * `brew install reattach-to-user-namespace` (Mainly because of the `open` utility. [more info here](https://github.com/ChrisJohnsen/tmux-MacOSX-pasteboard.git)).
  * `brew install nvim`
  * `brew install diff-so-fancy`

* __Kind Remark__: for the moment (until I change the script to back it up for you), I'll overwrite your `~/.gitconfig` file, so if you have something important in it, now would be the perfect moment to back it up.

* now open your shell and write this:

```sh
# clone repo
$ git clone https://github.com/ninrod/dotfiles.git ~/.dotfiles

# run install script 
# basically the script does this:
# - mounts symlinks on your home folder;
# - creates ~/.options/shell-options.conf file, if not existent
# - overwrites your .gitconfig (so back it up if you have something important)
# - install/updates vim plugins
$ ~/.dotfiles/install.zsh

# change git/github user info
$ vim ~/.options/shell-options.conf

# reload zsh
$ exec zsh
```

* note: the alias `v` is mapped to `nvim`. ([neovim](https://neovim.io/) is a fork of vim. It's my main editor.)

* That's it, your're all set.


## Bonus: Changing themes

* To change Themes you have to alter `dot/tmux.conf`, `dot/vimrc`, `dot/zshrc` (for prompt theme) and your terminal theme.
* there's a `conf` folder that can help you with that.
* I've also provided a [solarized-theme](https://github.com/ninrod/dotfiles/releases/tag/solarized-theme) tag and a [papercolor-theme](https://github.com/ninrod/dotfiles/releases/tag/papercolor-theme) as example setups.

## VIM: Powerful shell text editor. Tweaked with plugins.

### Used plugins
0. [altercation/vim-colors-solarized](https://github.com/altercation/vim-colors-solarized.git): well designed vim colorscheme.
0. [alvan/vim-closetag](https://github.com/alvan/vim-closetag.git): auto close for html tags.
0. [bronson/vim-visual-start-search_link](https://github.com/bronson/vim-visual-star-search.git): use `*` in visual selections too.
0. [chaoren/vim-wordmotion](https://github.com/chaoren/vim-wordmotion.git): move easily between camel words an whatnot.
0. [ervandew/supertab](https://github.com/ervandew/supertab.git): insert mode completions triggered by `<TAB>`.
0. [itchyny/lightline.vim](https://github.com/itchyny/lightline.vim.git): very clean vim status bar.
0. [jiangmiao/auto-pairs](https://github.com/jiangmiao/auto-pairs.git): plugin to complete pairs of brackets and similar stuff.
0. [junegunn/fzf.vim](https://github.com/junegunn/fzf.vim.git): fuzzy finder.
0. [junegunn/vim-easy-align](https://github.com/junegunn/vim-easy-align.git): very good text alignment tool.
0. [kana/vim-textobj-entire](https://github.com/kana/vim-textobj-entire.git): `e` obj. for selecting the entire file.
0. [kana/vim-textobj-function](https://github.com/kana/vim-textobj-function.git): `f` obj. for selecting functions.
0. [kana/vim-textobj-user](https://github.com/kana/vim-textobj-user.git): base text-obj library.
0. [nelstrom/vim-markdown-folding](https://github.com/nelstrom/vim-markdown-folding.git): adds folding syntax for markdown.
0. [nhooyr/neoman.vim](https://github.com/nhooyr/neoman.vim.git): read man pages faster than superman.
0. [ninrod/ninscratch-vim](https://github.com/ninrod/ninscratch-vim.git): my very simple scratch plugin
0. [ninrod/vis](https://github.com/ninrod/vis.git): my mirror of dr. chipps `vis` plugin.
0. [sheerun/vim-polyglot](https://github.com/sheerun/vim-polyglot.git): syntax highlight for various filetypes.
0. [terryma/vim-multiple-cursors](https://github.com/terryma/vim-multiple-cursors.git): sublime text like multiple cursors.
0. [tommcdo/vim-exchange](https://github.com/tommcdo/vim-exchange.git): easily swap regions of text.
0. [thinca/vim-textobj-function-javascript](https://github.com/thinca/vim-textobj-function-javascript.git): expands `f` obj. to include javascript functions.
0. [tpope/vim-commentary](https://github.com/tpope/vim-commentary.git): automatic commentary wrapping.
0. [tpope/vim-fugitive](https://github.com/tpope/vim-fugitive.git): useful git wrapper for vim.
0. [tpope/vim-repeat](https://github.com/tpope/vim-repeat.git): expands usage opportunities for the `.` command.
0. [tpope/vim-surround](https://github.com/tpope/vim-surround.git): easily add surroundings to words. 
0. [wellle/targets.vim](https://github.com/wellle/targets.vim.git): more targets for you to work with.
0. [whatyouhide/vim-textobj-xmlattr](https://github.com/whatyouhide/vim-textobj-xmlattr.git): `x` obj. to work with xml/html tags.

### Note about the `<leader>` key

* I've remapped `<space>` to be an alias to the `<leader>` key.

### Custom binds and tips

* for binds, my vimrc file is authoritative.
* top free `g + char` rebindable binds: `gh`,`gf`,`gl`,`gp`,`gr`,`gs`,`gx`,`gy`,`gz`.
* `K`: word lookup does not seem to be of much use.
* `&`: repeat last substitute. rarely useful.

## TMUX: the terminal multiplexer

You interact with tmux escaping commands through a key combo called `prefix`. I've remapped `prefix` to `<control>+<spacebar>`.

### copy-mode | history | scroll mode

bind                 | action
-------------------- | -----------------------------------------------------------
`<prefix> + <space>` | enter copy-mode

### Window binds

bind           | action
-------------- | ------------------------------------------------------------
`<prefix> + c` | creates a new window
`<prefix> + 1` | navigates to window 1 (or 2 to navigate to window 2, etc...)
`<prefix> + n` | navigates to the next window
`<prefix> + p` | cycles through the last two visited windows
`<prefix> + ,` | to rename a window

### Panel binds

bind                          | action
----------------------------- | ----------------------------------------------------------------------------------------
`<prefix> + v`                | creates a new shell panel vertically splitting the viewport.
`<prefix> + x`                | creates a new shell panel horizontally splitting the viewport.
`<prefix> + r`                | cycles through different panel layouts.
`<prefix> + <arrowkey>`       | navigates to the panel indicated by the arrow key.
`<prefix> + s`                | shows a prompt where you can type the name of the window you want to send the panel to.

### exiting panels and windows

bind                           | action
------------------------------ | -----------------------------------------------------------------------------------------
`exit`                         | closes a panel. When the last panel of the window is closed, the window is also closed.

LICENSE
-----------

Same as [Vim](http://vimdoc.sourceforge.net/htmldoc/uganda.html#license).

LINKS
----------

[first commit](https://github.com/ninrod/dotfiles/tree/212d09fb3859ca03d98aefbcd2c03c4e7d43b68e)
