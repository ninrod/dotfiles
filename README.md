# Ninrod's __zsh, vim, tmux and git__ dotfiles

* Simplicity, speed and power while working inside the shell.

## Screenshots

### With [gruvbox](https://github.com/morhetz/gruvbox) (default)

![gruvbox-config](https://github.com/ninrod/dotfiles/raw/misc/images/shot-2016-06-16-gruvbox.png)

### With [jellybeans](https://github.com/nanotech/jellybeans.vim)

![jellybeans-config](https://github.com/ninrod/dotfiles/raw/misc/images/shot-2016-06-15-jellybeans.png)

### With [molokai](https://github.com/tomasr/molokai)

![molokai-config](https://github.com/ninrod/dotfiles/raw/misc/images/molokai.png)

## Important notice 

* These are my personal configuration files, which are in a constant state of change as I develop my environment across several systems. I can't guarantee that these configurations will work for you, at all. So if you encounter problems with them, you're pretty much on your own. (this notice was based on [aaron bieber's dotfiles](https://github.com/aaronbieber/dotfiles))

## Install Instructions

* First off, I strongly recommend using [iTerm2](https://github.com/gnachman/iTerm2.git) on OSx.
* Secondly, this is for unix systems: `GNU/Linux`, `OSx`, etc... It should work on theory on windows, but I've faced a lot of configuration issues and ended up abandoning windows support.
* configure your terminal to use the [gruvbox theme](https://github.com/morhetz/gruvbox). There's a `conf` folder within this repo that can help you with that. 
* now get `vim` 7.4+ with [+clipboard](http://vimcasts.org/blog/2013/11/getting-vim-with-clipboard-support) and +python.
* get [tmux](https://github.com/tmux/tmux.git) 2.2+
* get [zsh](https://github.com/zsh-users/zsh.git) 5.2+ and make sure that `/bin/zsh` is valid. (if not: `$ cd /bin && sudo ln -s $(command -v zsh) zsh`)
* `cat /etc/shells` and verify that zsh appears on the list. If not, `sudo vi /etc/shells` and append `/bin/zsh`
* get [python2](http://python.org), python2-pip and `$ sudo pip install neovim`
* get [ag](https://github.com/ggreer/the_silver_searcher.git) (you can `brew install ag` on OSx).
* if you're on OSx, brew install these:
  * `brew install coreutils` (mainly because `BSD` `ls` `CLICOLOR` sucks).
  * `brew install reattach-to-user-namespace` (Mainly because of the `open` utility. [more info here](https://github.com/ChrisJohnsen/tmux-MacOSX-pasteboard.git)).
  * `brew install nvim`
  * `brew install diff-so-fancy`

* __Kind remark__: for the moment (until I change the script to back it up for you), I'll overwrite your `~/.gitconfig` file, so if you have something important in it, now would be the perfect moment to back it up.

* now open your shell and write this:

```sh
# clone dotfiles repo
$ git clone https://github.com/ninrod/dotfiles.git ~/.dotfiles

# run install script 
# basically the script does this:
# - mounts symlinks on your home folder;
# - creates ~/.options/shell-options.conf file, if not existent
# - overwrites your .gitconfig (so back it up if you have something important)
# - install/updates vim plugins
# - install fzf and zplug
$ ~/.dotfiles/install.zsh

# change git/github user info
$ vim ~/.options/shell-options.conf

# reload zsh
$ exec zsh
```

* note: the alias `v` is mapped to `nvim`. ([neovim](https://neovim.io/) is a fork of vim. It's my main editor.)

* That's it, your're all set.

## VIM: Powerful shell text editor. Tweaked with plugins.

### Custom binds and plugins

* To check out what binds and plugins I use in this config, my [vimrc](https://github.com/ninrod/dotfiles/blob/master/dot/vimrc) file is authoritative.

* That said, it is worth noting that I've remapped `<space>` to be an alias to the `<leader>` key.

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

[GNU General Public License v3](https://www.gnu.org/licenses/gpl-3.0.en.html)

LINKS
----------

[first commit](https://github.com/ninrod/dotfiles/tree/212d09fb3859ca03d98aefbcd2c03c4e7d43b68e)
