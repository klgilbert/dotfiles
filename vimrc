" Disable Vi compatibility.
set nocompatible

" Set the leader early because it's used at the moment mappings are defined.
" Changing mapleader after a mapping is defined has no effect on the mapping.
let mapleader=','

" Remmove the use of arrow keys
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" Make :W the same as :w, which It isn't bound to anything
command! W :w

" Rename current file
function! RenameFile()
  let old_name = expand('%')
  let new_name = input('New file name: ', expand('%'), 'file')
  if new_name != '' && new_name != old_name
    exec ':saveas ' . new_name
    exec ':silent !rm ' . old_name
    redraw!
  endif
endfunction
map <leader>rn :call RenameFile()<CR>

" Remove trailing white space
map ,tws :%s/\s\+$//e <CR>

" ===========================================================================
" AUTOCOMMANDS
" ===========================================================================
" Clear search-highlighting when opening the file
augroup Highlighting
  autocmd!
  autocmd BufReadCmd set nohlsearch
augroup END

" Highlight the current line, only for the buffer with focus
augroup CursorLine
  autocmd!
  autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  autocmd WinLeave * setlocal nocursorline
augroup END

" Without this, the next line copies a bunch of netrw settings like `let
" g:netrw_dirhistmax` to the system clipboard.
" I never use netrw, so disable its history.
let g:netrw_dirhistmax = 0

" Don't let netrw override <C-l> to move between tmux panes
" https://github.com/christoomey/vim-tmux-navigator/issues/189
augroup netrw_mapping
  autocmd!
  autocmd filetype netrw call NetrwMapping()
augroup END

function! NetrwMapping()
  nnoremap <silent> <buffer> <c-l> :TmuxNavigateRight<CR>
endfunction

" ===========================================================================
" MAPPINGS
" ===========================================================================

" Toggle paste mode
nmap <silent> <F4> :set invpaste<CR>:set paste?<CR>
imap <silent> <F4> <ESC>:set invpaste<CR>:set paste?<CR>

" Format the entire file
nnoremap <leader>fef :normal! gg=G``<CR>

" upper/lower word
nmap <leader>u mQviwU`Q
nmap <leader>l mQviwu`Q

" upper/lower first char of word
nmap <leader>U mQgewvU`Q
nmap <leader>L mQgewvu`Q

" cd to the directory containing the file in the buffer
nmap <silent> <leader>cd :lcd %:h<CR>

" Create the directory containing the file in the buffer
nmap <silent> <leader>md :!mkdir -p %:p:h<CR>

" Some helpers to edit mode
" http://vimcasts.org/e/14
nmap <leader>ew :e <C-R>=expand('%:h').'/'<CR>
nmap <leader>es :sp <C-R>=expand('%:h').'/'<CR>
nmap <leader>ev :vsp <C-R>=expand('%:h').'/'<CR>
nmap <leader>et :tabe <C-R>=expand('%:h').'/'<CR>

" Swap two words
nmap <silent> gw :s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<CR>`'

" Underline the current line with '='
nmap <silent> <leader>ul :t.<CR>Vr=

" Set text wrapping toggles
nmap <silent> <leader>tw :set invwrap<CR>:set wrap?<CR>

" Find merge conflict markers
nmap <silent> <leader>fc <ESC>/\v^[<=>]{7}( .*\|$)<CR>

" Map the arrow keys to be based on display lines, not physical lines
map <Down> gj
map <Up> gk

" Toggle hlsearch with <leader>hs
nmap <leader>hs :set hlsearch! hlsearch?<CR>

" Adjust viewports to the same size
map <Leader>= <C-w>=

" Map command-[ and command-] to indenting or outdenting
" while keeping the original selection in visual mode
vmap <A-]> >gv
vmap <A-[> <gv

nmap <A-]> >>
nmap <A-[> <<

omap <A-]> >>
omap <A-[> <<

imap <A-]> <Esc>>>i
imap <A-[> <Esc><<i

" Bubble single lines
nmap <C-Up> [e
nmap <C-Down> ]e
nmap <C-k> [e
nmap <C-j> ]e

" Bubble multiple lines
vmap <C-Up> [egv
vmap <C-Down> ]egv
vmap <C-k> [egv
vmap <C-j> ]egv

" Make shift-insert work like in Xterm
map <S-Insert> <MiddleMouse>
map! <S-Insert> <MiddleMouse>

" Map Control-# to switch tabs
map  <C-0> 0gt
imap <C-0> <Esc>0gt
map  <C-1> 1gt
imap <C-1> <Esc>1gt
map  <C-2> 2gt
imap <C-2> <Esc>2gt
map  <C-3> 3gt
imap <C-3> <Esc>3gt
map  <C-4> 4gt
imap <C-4> <Esc>4gt
map  <C-5> 5gt
imap <C-5> <Esc>5gt
map  <C-6> 6gt
imap <C-6> <Esc>6gt
map  <C-7> 7gt
imap <C-7> <Esc>7gt
map  <C-8> 8gt
imap <C-8> <Esc>8gt
map  <C-9> 9gt
imap <C-9> <Esc>9gt

" Open NERDTree
nnoremap <leader>n :NERDTreeFocus<CR>

" ===========================================================================
" STATUSLINE
" ===========================================================================
" Always display status line
set laststatus=2
" Don't show `-- INSERT --` below the statusbar since it's in the statusbar
set noshowmode

command! LightlineReload call LightlineReload()
function! LightlineReload()
  " Don't run this if Lightline hasn't been installed yet
  if exists('*lightline#init')
    call lightline#init()
    call lightline#colorscheme()
    call lightline#update()
  endif
endfunction

let g:lightline = {}
let g:lightline.component = {}
let g:lightline.component_function = {}
let g:lightline.component_visible_condition = {}
let g:lightline.tabline = {}

let g:lightline.colorscheme = 'darcula'
let g:lightline.active = {}
let g:lightline.active.left = [
      \ ['mode', 'paste'],
      \ ['fugitive', 'readonly', 'myfilename', 'modified']
      \ ]
let g:lightline.active.right = [
      \ [ 'filetype'],
      \ ]
let g:lightline.component.readonly = '%{(&filetype!="help" && &readonly) ? "RO" : ""}'
let g:lightline.component_function.fugitive = 'LightLineGitBranch'
let g:lightline.component_function.myfilename = 'LightLineFilename'
let g:lightline.component_visible_condition.readonly = '(&filetype!="help"&& &readonly)'
let g:lightline.component_visible_condition.fugitive = '(exists("*fugitive#head") && ""!=fugitive#head())'
let g:lightline.tabline.right = [] " Disable the 'X' on the far right

function! LightLineGitBranch()
  let l:max = 25
  if exists("*fugitive#head") && "" != fugitive#head()
    let branch = fugitive#head()
    if len(branch) > l:max
      " Long branch names get truncated
      return branch[0:l:max-3] . '...'
    else
      return branch
    endif
  else
    return ""
  endif
endfunction

function! LightLineFilename()
  let unfollowed_symlink_filename = expand('%:p')
  let filename = resolve(unfollowed_symlink_filename)
  let git_root = fnamemodify(FugitiveExtractGitDir(filename), ':h')

  if expand('%:t') == ''
    return '[No Name]'
  elseif git_root != '' && git_root != '.'
    let path = substitute(filename, git_root . '/', '', '')
    " Check if the git root is in another directory, like a dotfile in ~/.vimrc
    " that's really in ~/dotfiles/vimrc
    if FugitivePath(filename) !=# unfollowed_symlink_filename
      return path . ' @ ' . git_root
    else
      return path
    endif
  else
    return filename
  endif
endfunction

" ===========================================================================
" PLUGINS
" ===========================================================================
" vim-plug: https://github.com/junegunn/vim-plug

call plug#begin('~/.vim/bundle')

Plug 'pangloss/vim-javascript'
Plug 'christoomey/vim-tmux-runner'
Plug 'christoomey/vim-tmux-navigator'
Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdtree'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-commentary'
Plug 'itchyny/lightline.vim'
Plug 'dracula/vim', { 'as': 'dracula' }

call plug#end()

" ===========================================================================
" PLUGIN OPTIONS
" ===========================================================================

" -----------------
" FZF
" -----------------
" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" An action can be a reference to a function that processes selected lines
function! s:build_quickfix_list(lines)
  call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
  copen
  cc
endfunction

let g:fzf_action = {
  \ 'ctrl-q': function('s:build_quickfix_list'),
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" Default fzf layout
" - Popup window (center of the screen)
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }

" - Popup window (center of the current window)
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6, 'relative': v:true } }

" - Popup window (anchored to the bottom of the current window)
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6, 'relative': v:true, 'yoffset': 1.0 } }

" - down / up / left / right
let g:fzf_layout = { 'down': '40%' }

" - Window using a Vim command
let g:fzf_layout = { 'window': 'enew' }
let g:fzf_layout = { 'window': '-tabnew' }
let g:fzf_layout = { 'window': '10new' }

" Customize fzf colors to match your color scheme
" - fzf#wrap translates this to a set of `--color` options
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" Enable per-command history
" - History files will be stored in the specified directory
" - When set, CTRL-N and CTRL-P will be bound to 'next-history' and
"   'previous-history' instead of 'down' and 'up'.
let g:fzf_history_dir = '~/.local/share/fzf-history'