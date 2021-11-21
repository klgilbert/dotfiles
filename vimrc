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
map <leader>n :call RenameFile()<cr>

" Remove trailing white space
map ,tws :%s/\s\+$//e <CR>

" ===========================================================================
" PLUGINS
" ===========================================================================
" vim-plug: https://github.com/junegunn/vim-plug

call plug#begin('~/.vim/bundle')

Plug 'pangloss/vim-javascript'

Plug 'tpope/vim-projectionist'

Plug 'christoomey/vim-tmux-runner'
Plug 'christoomey/vim-tmux-navigator'

Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'

Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'

Plug 'itchyny/lightline.vim'

Plug 'tpope/vim-markdown'

call plug#end()