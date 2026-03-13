# dotfiles

Personal shell environment, evolved over 12+ years across Ubuntu, macOS, bash, and zsh.

## Installation

```sh
git clone git@github.com:garrow/dotfiles.git ~/.dotfiles
cd ~/.dotfiles

./setup.sh            # Shell configs & symlinks only
./setup.sh install    # Also install apps via Homebrew / apt
./setup.sh menu       # Interactive picker
```

Setup symlinks configs into `$HOME` — the repo is the live source of truth, edits take effect immediately.

---

## How it's built

If you're designing your own dotfiles, these are the structural ideas that have held up over time.

### Plugin loader with auto-discovery

Everything is a small `.sh` file in a `core/` or `plugins/` directory. The bootstrap loader ([`bootstrap.sh`](bootstrap.sh)) walks these directories and sources every `*.sh` file alphabetically:

```
shared/core/aliases.sh        # Cross-shell basics
shared/core/functions.sh
shared/plugins/git.sh          # One tool = one file
shared/plugins/spotify.sh
zsh/core/paths.sh              # Shell-specific overrides
zsh/plugins/starship.sh
```

To add a capability, drop in a file. To remove one, delete it or rename to `.disabled`. Load order is controlled by filename prefixes (`00_homebrew.sh` before `01_shim_nvm.sh`).

### Shared core, shell-specific edges

The `shared/` directory holds everything that works in both bash and zsh — aliases, functions, and plugins. Shell-specific code lives in `bash/` or `zsh/`. The loader in [`zsh/zshrc-actual`](zsh/zshrc-actual) sources shared first, then zsh-specific:

```
shared/core → zsh/core → shared/plugins → zsh/plugins
```

### Three configuration layers

1. **This repo** — the base, version-controlled config
2. **`~/.extras.rc.sh`** — device-local overrides (directory bookmarks, machine-specific paths). Not committed.
3. **`~/work/dotfiles/init.rc.sh`** — employer-specific config in a separate repo, loaded last via git `[include]`

### Lazy-loading shims for slow tools

Tools like nvm, sdkman, conda, and pyenv are expensive to initialize. The `01_shim_*.sh` files define lightweight wrapper functions that defer loading until first use. A built-in debug mode (`DEBUG_DOTFILES`) shows per-plugin timing with a braille spinner progress indicator during startup.

### Platform detection

[`bootstrap.sh`](bootstrap.sh) exports `DOTFILES_DISTRO` and provides `is_macos` / `is_debian` helpers that gate platform-specific behavior throughout the config.

---

## What's in it

Things you might want to steal or adapt.

### Git workflow ([`shared/plugins/git.sh`](shared/plugins/git.sh))

The most substantial plugin. Highlights:

| Alias | Command | What it does |
|-------|---------|-------------|
| `g` | `git` | |
| `gs` | `git status` | |
| `gap` | `git add --patch` | Stage hunks interactively |
| `grp` | `git reset --patch` | Unstage hunks interactively |
| `gcp` | `git checkout --patch` | Discard hunks interactively |
| `gd` / `gds` | `git diff` / `git diff --staged` | |
| `gr` | `git log` (10 recent) | Compact colored log |
| `com` | Checkout main/master | Auto-detects the default branch |
| `cob` / `cow` / `cor` | Branch menus | All / unmerged / remote-only branches |
| `gup` | Pull + auto-prune | Cleans up merged branches |
| `gpushnew` | Push + set upstream | For new branches |
| `gbc` | Changed files on branch | Files changed since diverging from main |
| `gcm` | Commit with editor | Pre-fills a comment line, opens `$EDITOR` |

### Short aliases ([`shared/core/aliases.sh`](shared/core/aliases.sh))

Single-key commands for daily use, plus typo recovery:

```
v=vim  l=ls  o=open  p=python  k=ag  af=ripgrep-file-search
cd..='cd ..'  xx='cd ..'  qq=l  chmox='chmod +x'
```

### Directory bookmarks ([`shared/plugins/diralias.sh`](shared/plugins/diralias.sh))

`favdir` registers named `cd` aliases. Run it with no args in any directory to interactively save a bookmark to `~/.extras.rc.sh`:

```sh
favdir code ~/projects/code    # In your rc files
favdir                         # Interactive: saves current dir
favdirs                        # List all bookmarks
dir                            # Pick a bookmark from a menu
```

### Fuzzy cd ([`shared/plugins/fuzzycd.sh`](shared/plugins/fuzzycd.sh))

Wraps `cd` with fzf-powered history matching. Type a partial directory name and it finds the best match from your visit history.

### Editor routing ([`shared/plugins/edit.sh`](shared/plugins/edit.sh))

`edit` opens the current directory (or files) in whatever `$EDITOR` is set to. Paired with `to_editor` which pipes `only_files` into the editor — useful for chaining with git commands.

### Spotify control ([`shared/plugins/spotify.sh`](shared/plugins/spotify.sh))

`m` opens an interactive Spotify menu. `mp` play/pause, `mn` next, `mprev` previous — all show the current track.

### Homebrew bundles ([`install/homebrew/`](install/homebrew/))

Dependencies split by purpose for selective installation:

- `command-line.Brewfile` — CLI tools (ripgrep, fzf, starship, gum, etc.)
- `gui-apps.Brewfile` — Desktop apps (Firefox, MacVim, 1Password, etc.)
- `mac-app-store.Brewfile` — App Store apps

### Vim config ([`config/vim/`](config/vim/))

Plugins managed as git submodules under `config/vim/bundle/`. Includes Pathogen, lightline, surround, vim-rails, ctrlp, and markdown support. Leader-key dark/light mode toggle.

---

## Structure

```
.
├── bootstrap.sh                 # Loader core: dependency tracking, debug mode
├── setup.sh                     # Installer: symlinks, brew bundles, platform setup
├── Makefile                     # Thin wrapper around setup.sh
├── shared/
│   ├── core/                    # Cross-shell aliases, functions
│   └── plugins/                 # One file per tool (git, ruby, spotify, etc.)
├── zsh/
│   ├── .zshenv                  # Entry point, sets ZDOTDIR
│   ├── zshrc-actual             # Main config, drives the plugin loader
│   ├── core/                    # Zsh-specific core (paths, prompt, iterm2)
│   └── plugins/                 # Zsh-specific plugins
├── bash/
│   ├── bootstrap.rc.sh          # Bash entry point
│   ├── core/                    # Bash-specific core
│   └── plugins/                 # Bash-specific plugins
├── config/
│   ├── git/                     # gitconfig, global gitignore
│   ├── vim/                     # vimrc, gvimrc, plugins as submodules
│   ├── starship.toml
│   └── direnvrc
├── install/
│   ├── homebrew/                # Brewfiles (CLI, GUI, App Store)
│   ├── macos_install.sh
│   └── debian_install.sh
├── bin/                         # Standalone scripts added to PATH
└── scratch.rc.sh                # Scratchpad for trying new things
```
