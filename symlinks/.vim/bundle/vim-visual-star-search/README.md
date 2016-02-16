## Visual Star Search


### File Search

This plugin allows you to select some text using Vim's visual mode, then hit *
and # to search for it elsewhere in the file.  For example, hit V, select
a strange sequence of characters like "$! $!", and hit star.  You'll find
all other runs of "$! $!" in the file.

By default, when you hit star while making a visual selection, vim extends the
selection to the next word that matches the word under the cursor.


### Recursive Search

If you hit `<leader>*` (`\*` unless you changed the mapleader), vim
recursively vimgreps for the word under the cursor or the visual selection.

If you have already mapped `<leader>*` then visual star search won't override it.
This is useful to set up your own search bindings.  For example, to get
visual-star-search to use Ag instead of vimgrep, add
[these two lines](https://github.com/bronson/dotfiles/blob/a3ab0d6ee8d9e5e7f6e12444753330bab0200b0e/.vimrc#L344-L345)
to your .vimrc.


### History

It was originally derived from
[a post on Scrooloose's Blog](http://got-ravings.blogspot.com/2008/07/vim-pr0n-visual-search-mappings.html).


### Alternatives

* [visualstar](http://github.com/thinca/vim-visualstar)
* [vsearch](http://github.com/godlygeek/vim-files/blob/master/plugin/vsearch.vim)
  -- Godlygeek's file probably came from the same source and is looking great.
* [nelstrom's fork](https://github.com/nelstrom/vim-visual-star-search) made some excellent changes.  As of Oct 2014, they've been incorporated into this script.
