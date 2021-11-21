# dotfiles

## Installation

### Homebrew
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### Repository
```bash
git clone -b develop https://github.com/klgilbert/dotfiles ~/.dotfiles
cd ~/.dotfiles
```

### Homebrew Formulae and Casks
```bash
brew bundle
```

### RCM
```bash
RCRC=rcrc rcup
```

### ZSH Plugins
```
zplug install
```

### Tmux Plugins
```
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

**Installing plugins**

1. Add new plugin to `~/.tmux.conf` with `set -g @plugin '...'`
2. Press `prefix` + <kbd>I</kbd> (capital i, as in **I**nstall) to fetch the plugin.

**Uninstalling plugins**

1. Remove (or comment out) plugin from the list.
2. Press `prefix` + <kbd>alt</kbd> + <kbd>u</kbd> (lowercase u as in **u**ninstall) to remove the plugin.

### Vim Plugins
```bash
vim +PlugInstall +qa
```
## Customization

### Vim

**Basic customizations**

* Line numbers
* Ruler (line and column numbers)
* No wrap (turn off per-buffer via :set wrap)
* Soft 2-space tabs, and default hard tabs to 2 spaces
* Show trailing whitespace as `.`
* Make searching highlighted, incremental, and case insensitive unless a
  capital letter is used
* Always show a status line
* Allow backspacing over everything (indentations, eol, and start
  characters) in insert mode
* `<C-P>` inserts the directory of the current file into a command
* Automatically resize splits when resizing the Vim window (GUI only)
* `<leader>ew` expands to `:e (directory of current file)/` (open in the
  current buffer)
* `<leader>es` expands to `:sp (directory of current file)/` (open in a
  horizontal split)
* `<leader>ev` expands to `:vsp (directory of current file)/` (open in
  a vertical split)
* `<leader>et` expands to `:tabe (directory of current file)/` (open in
  a new tab)
* `<F4>` toggles paste mode.
* `<leader>fef` formats the entire file
* `<leader>u` converts the entire word to uppercase
* `<leader>l` converts the entire word to lowercase
* `<leader>U` converts the first char of a word to uppercase
* `<leader>L` converts the first char of a word to lowercase
* `<leader>cd` changes the path to the active buffer's file
* `<leader>md` creates the directory of the active buffer's file
  (For example, when editing a new file for which the path does not
  exist.)
* `gw` swaps the current word with the following word
* `<leader>ul` underlines the current line with `=`
* `<leader>tw` toggles wrap
* `<leader>fc` finds the next conflict marker (tested with Git
  conflicted files)
* Remap `<Down>` and `<Up>` to `gj` and `gk` (Wrapped text is not
  considered a single long line of text.)
* `<leader>hs` toggles highlight search
* `<leader>=` adjusts viewports to the same size (`<C-w>=`)

### Plugins

All plugins are maintained using [vim-plug](https://github.com/junegunn/vim-plug/)

1. [Fuzzy Finder](https://github.com/junegunn/fzf.vim)
2. [Git Gutter](http://github.com/airblade/vim-gitgutter)

A Vim plugin which shows a git diff in the 'gutter' (sign column). It
shows whether each line has been added, modified, and where lines have
been removed. You can also stage and revert individual hunks.

3. [Vim Trailing Whitespace](https://github.com/bronson/vim-trailing-whitespace)

This plugin causes all trailing whitespace to be highlighted in red.
To fix the whitespace errors, just call :FixWhitespace.  By default it
operates on the entire file.  Pass a range (or use V to select some lines)
to restrict the portion of the file that gets fixed.

4. [Vim Tmux Navigator](https://github.com/christoomey/vim-tmux-navigator)

This plugin provides the following mappings which allow you to move between Vim panes and tmux splits seamlessly.


5. [SuperTab](http://github.com/ervandew/supertab)

In insert mode, start typing something and hit `<TAB>` to tab-complete
based on the current context.


6. [Ack.vim](https://github.com/mileszs/ack.vim)

Ack.vim uses ack to search inside the current directory for a pattern.
You can learn more about it with :help Ack.

7. [Vim Polyglot](https://github.com/sheerun/vim-polyglot)

A collection of language packs for Vim

8. [Vim Eunuch](https://github.com/tpope/vim-eunuch)

Vim sugar for the UNIX shell commands

9. [Fugitive](http://github.com/tpope/vim-fugitive) (Git Support)

Fugitive adds pervasive git support to git directories in vim. For more
information, use `:help fugitive`

10. [Obsession](https://github.com/tpope/vim-obsession)

Continuously updated session files

11.  [Surround](https://github.com/tpope/vim-surround)

Quoting/parenthesizing made simple

12. [Unimpaired](https://github.com/tpope/vim-unimpaired)