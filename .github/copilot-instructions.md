# Copilot Instructions for this repository

This is a personal dotfiles repo (zsh, vim, emacs, tmux, git, options) for Unix
systems (Linux/OSX/BSD). It has no build system, test suite, or linter — it is
deployed by symlinking module directories into `$HOME`.

## Install / update commands

- `make install` (or `./install.zsh`) — full install/boot.
- `make update` (or `./install.zsh update`) — update all fetched plugins/deps in place.
- These run `boot/logboot.zsh $1`, which sources `boot/boot.zsh $1` and tees output to
  `boot/log/boot.log`. There is no dry-run mode — running these scripts mutates the
  invoking user's `$HOME` (creates symlinks, overwrites `~/.gitconfig`, clones repos).
  Do not run them casually; if you need to validate a script change, `zsh -n <file>`
  (syntax check) or read through the logic instead of executing it against a real home
  directory unless the user explicitly asks to install/update.

## Big-picture architecture: the boot pipeline

`boot/boot.zsh` runs, in order:
1. `zsh/termcolors.zsh`, `zsh/constants.zsh` — color vars and `*_deps` path constants.
2. `boot/guard.zsh` — sanity-checks required commands exist.
3. `boot/functions.zsh $1` — defines `ningrab`, `verifylink`, `updatelinks`,
   `build_git_url`. **`ningrab` is redefined based on `$1`**: if invoked as
   `update`, it does `git fetch`/`git pull --rebase` on an already-cloned repo;
   otherwise it does a fresh (shallow, or full+checkout if a ref arg is given) clone.
   This dual-mode function is the core of the whole dependency system.
4. `boot/symlinks.zsh` — sources every `**/deploy.zsh` in the repo, then symlinks
   `~/.dotfiles` to the repo root.
5. `~/.options/shell-options.zsh gitmask` then `boot/zsh-deps.zsh`,
   `boot/vim-deps.zsh`, `boot/emacs-deps.zsh`, `boot/other-deps.zsh` — each calls
   `ningrab owner/repo` for every plugin dependency of that tool.
6. `~/.options/shell-options.zsh setup` — user-local hook, sourced last.

## Module convention: `deploy.zsh`

Every top-level module directory (`ag/`, `bash/`, `config/`, `emacs/`, `git/`,
`options/`, `tmux/`, `vim/`, `zsh/`, `idea/`) has a `deploy.zsh` that wires that
module's files into `$HOME`. `boot/symlinks.zsh` auto-discovers and sources all of
them via a glob — **adding a new module only requires dropping a `deploy.zsh` in a
new top-level dir**, no registration elsewhere is needed. Two deploy patterns are used:
- Most modules call `verifylink <target>` (refuses to clobber a real file/dir) then
  `updatelinks <target> <source>` (symlinks, and recursively merges into
  `~/.config` if it exists as a real directory rather than replacing it).
- `git/deploy.zsh` and `idea/deploy.zsh` instead `cp` a file directly (no symlink),
  because they must not track live edits back into the repo, or must reach outside
  Linux (see `idea/deploy.zsh`, which shells out to `powershell.exe` to locate the
  Windows home directory under WSL and copies `.ideavimrc` there).

## Dependency (`*-deps.zsh`) convention

`boot/zsh-deps.zsh`, `boot/vim-deps.zsh`, `boot/emacs-deps.zsh`, `boot/other-deps.zsh`
each `cd` into a `$<tool>_deps` path (from `zsh/constants.zsh`, under
`~/.dotfiles/deps/<tool>`) and list one `ningrab owner/repo [ref]` call per plugin.
To add a new plugin/dependency, add a `ningrab` line to the relevant `*-deps.zsh`
file — this is the only supported "plugin manager" (there is no vim-plug/oh-my-zsh
equivalent; see the "On installing new plugins" section of `readme.org`).

## Environment/options split

`options/` holds per-OS defaults (`arch`, `fedora`, `osx`, `suse`, `ubuntu`, `wsl`
subdirs) and `shell-options.zsh`; `boot/options.zsh` symlinks the chosen `options/`
tree to `~/.options`, and user machine-specific overrides live in
`~/.options/shell-options.zsh` (not tracked in this repo) with `gitmask` and `setup`
hook points sourced by `boot.zsh`.

## Emacs config note

Emacs config is authored as literate org-babel in `emacs/boot.org`; `emacs/init.el`
tangles/loads it. Prefer editing `boot.org`, not generated `.el` output, when
changing Emacs behavior.
