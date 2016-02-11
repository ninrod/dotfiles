NIN-VI-MODE
=======

This plugin increases `vi-like` zsh functionality.

* Press `ESC` to enter `normal` mode.

Navigating History
-------

* `/`: Search backward in history
* `n`: Repeat the last `/`

Mode indicators
---------------

* Just use a theme that defines normal mode indication for `bindkey -v`. I recommend [powerlevel9k][3].


Vim edition: for when things get hairy
-------------------------------------

* I've bound `gs` to fire up `vim` so you can edit your command with full powers.


Movement and insertion
-----------------------

* Just use the normal `vim` binds. `$` goes to the end of the line and so on and so forth.
* Besides that, use `/` to search backward in history and `n` to repeat the last `/`.

Copy and paste on OSx.
----------------------

I've integrated vi-like copy and paste using `pbcopy` and `pbpaste` based on [this][2] tip.

Credits
-------

Based on the `vi-mode` plugin that ships with [oh-my-zsh][1].

[1]: <https://github.com/robbyrussell/oh-my-zsh>
[2]: <http://zshwiki.org/home/zle/vi-mode>
[3]: <https://github.com/bhilburn/powerlevel9k.git>
