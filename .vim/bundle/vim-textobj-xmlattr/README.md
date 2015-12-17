# vim-textobj-xmlattr

[![Build Status](https://travis-ci.org/whatyouhide/vim-textobj-xmlattr.svg?branch=master)](https://travis-ci.org/whatyouhide/vim-textobj-xmlattr)

![][gif]

This vim plugin provides two text objects: `ax` and `ix`.  
They represent XML/HTML attributes.

It's based on (and **requires**)
[vim-textobj-user](http://github.com/kana/vim-textobj-user).

These attributes will work:

```html
<div class="box" id=footer data-updatable data-content="everything"></div>
```

`ix` works with the inner attribute, with no surrounding whitespace.  `ax` works
like `aw` does: it includes the whitespace **before** the attribute.  I know
that `aw` includes the whitespace *after*/*before* or whatever it finds more
fitty, but XML/HTML attributes always include whitespace before them, while they
do not always include whitespace after:

```xml
<some-tag with-only="one attribute"/>
```

When I `dix`, I want to be left with a valid XML/HTML tag, that's why I didn't
consider leading *and* trailing whitespaces.


## Installation

I'm a recent [vim-plug][vim-plug] convert, and I'm super happy with this plugin
manager. Check out its page, you will be amazed too (Vundle will look way less
appealing!).

``` viml
" vim-plug
Plug 'kana/vim-textobj-user'
Plug 'whatyouhide/vim-textobj-xmlattr'
" NeoBundle
NeoBundle 'kana/vim-textobj-user'
NeoBundle 'whatyouhide/vim-textobj-xmlattr'
" Vundle
Plugin 'kana/vim-textobj-user'
Plugin 'whatyouhide/vim-textobj-xmlattr'
```

Out-of-touch people that still use Pathogen can just clone the repository:
```
git clone https://github.com/whatyouhide/vim-textobj-xmlattr ~/.vim/bundle
```


## Contributing

Fork the repository, commit your changes, and send a Pull Request. I'm more than
happy to get help!


## License

&copy; Andrea Leopardi

[![][wtfpl-logo]][wtfpl]


[vundle]: https://github.com/gmarik/Vundle.vim
[vim-plug]: https://github.com/junegunn/vim-plug
[wtfpl]: http://www.wtfpl.net/
[wtfpl-logo]: http://www.wtfpl.net/wp-content/uploads/2012/12/logo-220x1601.png

[gif]: http://i.imgur.com/Bj1mGR0.gif "vim-textobj-xmlattr in action"
