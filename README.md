# Ninrod's __vim, tmux, zsh__ dotfiles

* Simplicity, speed and power while working inside the shell.

## Using Solarized Dark

![solarized-dark-vi-tmux](https://raw.githubusercontent.com/ninrod/dotfiles/misc/images/update-2016.06.03.png)

## Using PaperColor

![papercolor-vi-tmux](https://raw.githubusercontent.com/ninrod/dotfiles/misc/images/screen.png)

## Important notice 

* These are my personal configuration files, which are in a constant state of change as I develop my environment across several systems. I can't guarantee that these configurations will work for you, at all. So if you encounter problems with them, you're pretty much on your own. (this notice was based on [aaron bieber's dotfiles](https://github.com/aaronbieber/dotfiles))

## Install Instructions

* First off, I strongly recommend using [iTerm2][iterm2_link] on OSx.
* Secondly, this is for unix systems: `GNU/Linux`, `OSx`, etc... It should work on theory on windows, but I've faced a lot of configuration issues and ended up abandoning windows support.
* configure your terminal to use the [papercolor theme](https://github.com/NLKNguyen/papercolor-theme.git) or [solarized dark theme](https://github.com/altercation/solarized.git). There's a `conf` folder within this repo that can help you with that. 
* now get `vim` 7.4+ with [+clipboard](http://vimcasts.org/blog/2013/11/getting-vim-with-clipboard-support) and +python.
* get [tmux](https://github.com/tmux/tmux.git) 1.8+
* get [zsh](https://github.com/zsh-users/zsh.git) 5.1+ and make sure that `/bin/zsh` is valid. (if not: `$ cd /bin && sudo ln -s $(command -v zsh) zsh`)
* `cat /etc/shells` and verify that zsh appears on the list. If not, `sudo vi /etc/shells` and append `/bin/zsh`
* get [python2](http://python.org), python2-pip and `$ sudo pip2 install neovim`
* get [ag][ag_link] (you can `brew install ag` on OSx).
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

### Installed plugins
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
0. [tpope/vim-fugitive][https://github.com/tpope/vim-fugitive.git]: very good git wrapper for vim.
0. [tpope/vim-repeat][vim-repeat_link]: expands usage opportunities for the '.' (dot) repeat command.

### Note about the `<leader>` key

* I've remapped `<space>` to be an alias to the `<leader>` key ([tip I][1] from [sheerun][2])

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
`<prefix> + <space>` | enter copy-mode ([tip VIII][1] from [sheerun][2]).

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

Same as [Vim][vim-license_link].

LINKS
----------

[first commit](https://github.com/ninrod/dotfiles/tree/212d09fb3859ca03d98aefbcd2c03c4e7d43b68e)

[auto-pairs_link]: <https://github.com/jiangmiao/auto-pairs.git>
[supertab_link]: <https://github.com/ervandew/supertab.git>
[targets_link]: <https://github.com/wellle/targets.vim.git>
[closetag_link]: <https://github.com/alvan/vim-closetag.git>
[vim-colors-solarized_link]: <https://github.com/altercation/vim-colors-solarized.git>
[vim-commentary_link]: <https://github.com/tpope/vim-commentary.git>
[vim-easy-align_link]: <https://github.com/junegunn/vim-easy-align.git>
[fzf_link]: <https://github.com/junegunn/fzf.git>
[vim-fugitive_link]: <https://github.com/tpope/vim-fugitive.git>
[vim-repeat_link]: <https://github.com/tpope/vim-repeat.git>
[vim-surround_link]: <https://github.com/tpope/vim-surround.git>
[vim-textobj-entire_link]: <https://github.com/kana/vim-textobj-entire.git>
[vim-textobj-function_link]: <https://github.com/kana/vim-textobj-function.git>
[vim-textobj-function-javascript_link]: <https://github.com/thinca/vim-textobj-function-javascript.git>
[vim-textobj-user_link]: <https://github.com/kana/vim-textobj-user.git>
[vim-textobj-xmlattr_link]: <https://github.com/whatyouhide/vim-textobj-xmlattr.git>
[vis_link]: <https://github.com/sencer/vis.git>
[vim-instant-markdown_link]: <https://github.com/suan/vim-instant-markdown.git>
[vim-polyglot_link]: <https://github.com/sheerun/vim-polyglot.git>
[ag_link]: <https://github.com/ggreer/the_silver_searcher.git>
[iterm2_link]: <https://github.com/gnachman/iTerm2.git>
[vim-visual-start-search_link]: <https://github.com/bronson/vim-visual-star-search.git>
[vim-license_link]: <http://vimdoc.sourceforge.net/htmldoc/uganda.html#license>
[neoman_link]: <https://github.com/nhooyr/neoman.vim.git>
[fzf-vim_link]: <https://github.com/junegunn/fzf.vim.git>

[1]: <https://sheerun.net/2014/03/21/how-to-boost-your-vim-productivity/>
[2]: <https://github.com/sheerun>
