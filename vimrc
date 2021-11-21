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

" ============================================================================
" STATUSLINE
" ===========================================================================
" always display status line
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
    " that's really in ~/code/personal/dotfiles/vimrc
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