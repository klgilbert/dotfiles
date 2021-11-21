# dotfiles

## Installation

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```
```bash
git clone -b develop https://github.com/klgilbert/dotfiles ~/.dotfiles
```
```bash
cd ~/.dotfiles
```
```bash
brew bundle
```
```bash
RCRC=rcrc rcup
```
```
zplug install
```
```
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```
**Installing plugins**

1. Add new plugin to `~/.tmux.conf` with `set -g @plugin '...'`
2. Press `prefix` + <kbd>I</kbd> (capital i, as in **I**nstall) to fetch the plugin.

You're good to go! The plugin was cloned to `~/.tmux/plugins/` dir and sourced.

**Uninstalling plugins**

1. Remove (or comment out) plugin from the list.
2. Press `prefix` + <kbd>alt</kbd> + <kbd>u</kbd> (lowercase u as in **u**ninstall) to remove the plugin.

All the plugins are installed to `~/.tmux/plugins/` so alternatively you can
find plugin directory there and remove it.

```bash
vim +PlugInstall +qa
```

## Vim

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

#### [Fuzzy Finder](https://github.com/junegunn/fzf.vim)

A Vim wrapper around [fzf](https://github.com/junegunn/fzf)

#### [Git Gutter](http://github.com/airblade/vim-gitgutter)

A Vim plugin which shows a git diff in the 'gutter' (sign column). It
shows whether each line has been added, modified, and where lines have
been removed. You can also stage and revert individual hunks.

#### [Vim Trailing Whitespace](https://github.com/bronson/vim-trailing-whitespace)

This plugin causes all trailing whitespace to be highlighted in red.

To fix the whitespace errors, just call :FixWhitespace.  By default it
operates on the entire file.  Pass a range (or use V to select some lines)
to restrict the portion of the file that gets fixed.

#### [Vim Tmux Navigator](https://github.com/christoomey/vim-tmux-navigator)

This plugin provides the following mappings which allow you to move between Vim panes and tmux splits seamlessly.

* `<ctrl-h>` => Left
* `<ctrl-j>` => Down
* `<ctrl-k>` => Up
* `<ctrl-l>` => Right
* `<ctrl-\>` => Previous split

#### [JSON](https://github.com/elzr/vim-json)

Better JSON and JSONP with distinct highlighting for keywords versus
values, strings colored differently from numbers and booleans and double
quotes concealed (disable with `let g:vim_json_syntax_conceal = 0` in
`~/.vimrc.after`, folding of {...} and [...] blocks (enable with
`:setlocal foldmethod=syntax`, and JSON-specific warnings highlighted in
red.

#### [SuperTab](http://github.com/ervandew/supertab)

In insert mode, start typing something and hit `<TAB>` to tab-complete
based on the current context.

#### [UltiSnips](https://github.com/SirVer/ultisnips)

#### [Vim Highlighted Yank](https://github.com/machakann/vim-highlightedyank)

Makes yanks obvious.

#### [Tagbar](https://github.com/majutsushi/tagbar)

Tagbar is a vim plugin for browsing the tags of source code files.

 **Customizations**: binds `<Leader>rt` to toggle Tagbar.

#### [Ack.vim](https://github.com/mileszs/ack.vim)

Ack.vim uses ack to search inside the current directory for a pattern.
You can learn more about it with :help Ack.

#### [Vim Polyglot](https://github.com/sheerun/vim-polyglot)

A collection of language packs for Vim

#### [Vim Multiple Cursors](https://github.com/terryma/vim-multiple-cursors)

Out of the box, all you need to know is a single key `Ctrl-n`. Pressing the key
in Normal mode highlights the current word under the cursor in Visual mode and
places a virtual cursor at the end of it. Pressing it again finds the next
occurrence and places another virtual cursor at the end of the visual selection.
If you select multiple lines in Visual mode, pressing the key puts a virtual
cursor at every line and leaves you in Normal mode.

More at [QuickStart](https://github.com/terryma/vim-multiple-cursors/blob/master/README.md#quick-start)

#### [Vim Eunuch](https://github.com/tpope/vim-eunuch)

Vim sugar for the UNIX shell commands

#### [Fugitive](http://github.com/tpope/vim-fugitive) (Git Support)

Fugitive adds pervasive git support to git directories in vim. For more
information, use `:help fugitive`

Use `:Gstatus` to view `git status` and type `-` on any file to stage or
unstage it. Type `p` on a file to enter `git add -p` and stage specific
hunks in the file.

Use `:Gdiff` on an open file to see what changes have been made to that
file

#### [Obsession](https://github.com/tpope/vim-obsession)

Continuously updated session files

#### [Surround](https://github.com/tpope/vim-surround)

Quoting/parenthesizing made simple

#### [Unimpaired](https://github.com/tpope/vim-unimpaired)

This plugin provides a lot of useful mappings, here's a brief example of
what it does provide:

* `[b` to go to the previous buffer
* `]b` to go to the next buffer
* `[n` to go to the previous SCM conflict marker
* `]n` to go to the next SCM conflict marker

Please check [`:help
unimpaired`](https://github.com/tpope/vim-unimpaired/blob/master/doc/unimpaired.txt)
for a complete list

#### [Nova Vim](https://github.com/trevordmiller/nova-vim)
Nova color scheme plugin for Vim