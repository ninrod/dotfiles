Introduction
------------

The textobj-underscore plugin provides two new text-objects which are
triggered by `a_` and `i_` respectively. You can use them when you have to
deal with the following type of words:

- foo\_bar\_baz

Now, suppose you have to change bar to qux (\* for cursor position). You can
do the following:

`foo_b*ar_bar` and type `ci_` to get `foo_*_bar`. Or you can type `da_` to get
`foobar`

Installation
------------

I strongly recommend installing [pathogen.vim](https://github.com/tpope/vim-pathogen).

    cd ~/.vim/bundle
    git clone git://github.com/lucapette/vim-ruby-doc.git

Or you can unzip it in your `~/.vim` directory. The plugin depends on the awesome
[vim-textobj-user](https://github.com/kana/vim-textobj-user) by
[kana](https://github.com/kana). So you need to install it in order to use
this plugin.

Contributors
------------

- [kana](https://github.com/kana)
  Use `normal!` instead of `normal` to avoid unexpected remapping.

Copyright
---------

Copyright (c) Luca Pette. Distributed under the same terms as Vim itself.
