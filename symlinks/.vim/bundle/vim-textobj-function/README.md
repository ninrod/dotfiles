# vim-textobj-function

[![Build Status](https://travis-ci.org/kana/vim-textobj-function.png)](https://travis-ci.org/kana/vim-textobj-function)




vim-textobj-function is a Vim plugin to **text objects for functions**.  You can
directly target a function (`af`) or the code inside a function (`if`).
For example,

* `daf` to <strong>D</strong>elete <strong>A</strong> <strong>F</strong>unction, and
* `vif` to <strong>V</strong>isually select the code <strong>I</strong>nside a <strong>F</strong>unction.

You can also use `aF` to target a function with leading or trailing blank
lines like `ap`, or use `iF` to target just a function like `ip`.
For example,

- `yaF` to <strong>Y</strong>ank <strong>A</strong> <strong>F</strong>unction with leading or trailing blank lines, and
- `viF` to visually select a function without leading or trailing blank lines.

The syntax of a "function" is varied for each language.  So that you have to
tell the syntax of a function to vim-textobj-function before editing.  By
default, the following languages are supported:

* C language
* Java
* Vim script
  (including [vim-vspec](https://github.com/kana/vim-vspec)-specific syntax)

To support new languages, see:

* [The reference manual](https://github.com/kana/vim-textobj-function/blob/master/doc/textobj-function.txt)
* [The implementation for currently supported languages](https://github.com/kana/vim-textobj-function/tree/master/after/ftplugin)




<!-- vim: set expandtab shiftwidth=4 softtabstop=4 textwidth=78 : -->
