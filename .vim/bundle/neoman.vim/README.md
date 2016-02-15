# neoman

Read manpages faster than superman!

![neoman in action](https://media.giphy.com/media/xT0BKrEeXPeKVMgb84/giphy.gif)

##ATTENTION
I just renamed the command to `:Nman`, if you were using it before, just edit any mappings or the functions in your `.zshrc`/`.bashrc`.

## Features
- Manpage autocompletion
- Open in a split/vsplit/tabe or current window
- Open from inside a neovim terminal!
- Jump to manpages in specific sections through the manpage links
- Aware of modern manpages, e.g. sections are not just 1-8 anymore

## Install
Any plugin manager should work fine.

```vim
Plug 'nhooyr/neoman.vim' "vim-plug
```

## Usage
### Command
The command is as follows:

```vim
Nman[!] [{sect}] {page}[({sect})]
```

Several ways to use it, probably easier to explain with a few examples.

```vim
Nman printf
Nman 3 printf
Nman printf(3)
```

Nman without any arguments will use `<cword>` as the page.

See `g:neoman_current_window` under settings for an explanation of the bang.

## Mappings
`<c-]>` or `K` to jump to a manpage under the cursor.  
`<c-t>` to jump back to the previous man page.
'q' to quit

You can also set the following in your `init.vim`/`.vimrc` and use `K` to jump to manpages globally for the word under the cursor.

```vim
set keywordprg=:Nman
```

### Splits
Want to split/vsplit/tabe? Pretty simple.

```vim
:vsplit | Nman! 3 printf
```

You can very easily make that a custom command or mapping.

### Command line integration

#### Neovim
You will need [nvr](https://github.com/mhinz/neovim-remote) for the super cool neovim terminal integration. If you do not want it, just use the vim version and obviously change the command to `nvim`.

Add the following functions to your `.zshrc`/`.bashrc`

```zsh
function _nman {
	local l=$#
	local page=(${@:1:$l-1})
	if [[ -z "$page" ]]; then
		echo "What manual page do you want?"
		return
	fi
	local tmp=$IFS
	IFS=$'\n' out=($(command man -w ${page[@]} 2>&1))
	local code=$?
	IFS=$tmp
	if [[ ${#out[@]} > 1 ]]; then
		echo "Too many manpages"
		return
	elif [[ $code != 0 ]]; then
		echo "No manual entry for ${page[*]}"
		return
	fi
	if [[ -z $NVIM_LISTEN_ADDRESS ]]; then
		command nvim -c "${@: -1} ${page[*]}"
	else
		nvr --remote-send "<c-n>" -c "${@: -1} ${page[*]}"
	fi
}
function nman {
	_nman "$@" 'Nman'
}
function nman! {
	_nman "$@" 'Nman!'
}
```

#### Vim
```zsh
function nman {
	if [[ -z $* ]]; then
		echo "What manual page do you want?"
		return
	fi
	local tmp=$IFS
	IFS=$'\n' out=($(command man -w $* 2>&1))
	local code=$?
	IFS=$tmp
	if [[ ${#out[@]} > 1 ]]; then
		echo "Too many manpages"
		return
	elif [[ $code != 0 ]]; then
		echo "No manual entry for $*"
		return
	fi
	vim -c "Nman $*"
}
```

#### Autocomplete
##### zsh
```zsh
compdef nman="man"

#if using the neovim version, add this as well
compdef nman!="man"
```

##### bash
```bash
complete -o default -o nospace -F _man nman

#if using the neovim version, add this as well
complete -o default -o nospace -F _man nman!
```

Use `nman`/`nman!` to open the manpages. `nman!` works the same way as `:Neovim!`.

I've really only tested this with zsh, if you have any problems with bash, please open a issue!

### Settings
`g:neoman_current_window`  
If set, open the manpage in the current window, else attempt to find the currently open neoman window and use that. You can also use the bang on `:Nman` to alternate between the two behaviors.

By default, it is not set


## Contributing

I'm very open to new ideas, new features, anything really ;) . Open up an issue, send me a PR, or email.

TODO:
-----
- [ ] Improve behavior of jumps (invalid jumps?)
- [ ] Use matchstr instead of substitute
- [ ] Vim docs
- [ ] More mappings
