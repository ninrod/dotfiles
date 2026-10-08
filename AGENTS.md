# Dotfiles agent notes

## Language

talk to me in english unsless asked to do otherwise. Write documentation, tests and code using the english language and no diacritics.

## Install and verification

- No repo-wide build, tests, linter, or CI. Check a changed Zsh file with `zsh -n path/to/file.zsh` (syntax only).
- `make`/`make install` runs `./install.zsh`; `make update` runs `./install.zsh update`. Neither is a verification command: they mutate `$HOME`, fetch dependencies, and log to `boot/log/boot.log`. Do not run unless asked to install/update.
- `options/deploy.zsh` **removes even a real `~/.options` directory** and links either a sibling `options/` directory (if present) or this repo's `options/`. `git/deploy.zsh` overwrites `~/.gitconfig`; `idea/deploy.zsh` requires WSL and copies `.ideavimrc` into the Windows home.

## Wiring and edit targets

- `boot/symlinks.zsh` sources the recursive `./**/deploy.zsh` glob (including `emacs/systemd/deploy.zsh`). Deployments normally use `verifylink`/`updatelinks`: real targets are rejected, except an existing real `~/.config`, whose contents are merged with links. `copilot/deploy.zsh` links `copilot/skills` into both `~/.copilot/skills` and `~/.agents/skills`.
- `boot/boot.zsh` deploys links, sources `~/.options/shell-options.zsh gitmask`, fetches `boot/{zsh,vim,emacs,other}-deps.zsh`, then sources `~/.options/shell-options.zsh setup`. Add boot-fetched plugins via `ningrab owner/repo [ref]` in the relevant deps file; install clones, update fetches/pulls existing clones into ignored `deps/`.
- Vim's boot-fetched plugins are separate from Neovim: `config/nvim` links to `nvim/`, whose `lazy-setup.lua` bootstraps lazy.nvim and loads all `nvim/plugins/*.lua` specs. Neovim uses `nvim/lazy-lock.json` and `nvim/snippets/` (not Emacs snippets).
- Edit Emacs behavior in `emacs/boot.org`, not ignored/tangled `emacs/boot.el`; `emacs/init.el` loads the Org file and requires a local ELPA mirror under `deps/emacs/`. `make -C emacs` regenerates the thin mirror from installed packages; it is not a test.
- Emacs runs in daemon mode. User connects to it through emacsclient using the `e` alias.
