let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()

set nocompatible
" List your plugins here
Plug 'preservim/nerdtree'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'itchyny/lightline.vim'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive' 
Plug 'ryanoasis/vim-devicons'
Plug 'tomasiser/vim-code-dark'
Plug 'sheerun/vim-polyglot'
Plug 'davidhalter/jedi-vim'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-commentary'
Plug 'machakann/vim-sandwich'
Plug 'vlime/vlime'
Plug 'christoomey/vim-tmux-navigator'
Plug 'TaDaa/vimade'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'liuchengxu/vim-which-key'
call plug#end()

set encoding=UTF-8
set number
set termguicolors
set noswapfile

" enable filetype plugins and syntax highlighting
filetype plugin indent on
syntax on

let g:coc_disable_startup_warning = 1
colorscheme codedark

highlight Normal guibg=#0B1c2c ctermbg=NONE

let g:coc_disable_startup_warning = 1
let g:coc_default_semantic_highlight_groups = 1
let mapleader = ","
" Start NERDTree. If a file is specified, move the cursor to its window.
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif

" Refresh the current folder when Vim gains focus from another application
autocmd FocusGained * NERDTreeRefreshRoot


" Function to show the paths inside vim 
" If git relative 
" Elif not git then absolute path is used
function! LightlineFilename()
  let path = expand('%:p')

  try
    let root = FugitiveWorkTree()

    " If inside git repo, show path relative to repo root
    if !empty(root) && path[:len(root)-1] ==# root
      return path[len(root)+1:]
    endif
  catch
  endtry

  " Otherwise show absolute path
  return path
endfunction

let g:lightline = {
      \ 'active': {
      \   'left': [
      \     [ 'mode', 'paste' ],
      \     [ 'readonly', 'filename', 'modified' ]
      \   ]
      \ },
      \ 'component_function': {
      \   'filename': 'LightlineFilename',
      \ },
      \ 'colorscheme': 'solarized',
      \ 'background': 'dark',
      \ }


" Navigate previous and next tabs with vim"
nnoremap <C-PageDown> :bnext<CR>
nnoremap <C-PageUp> :bprevious<CR>

set clipboard=unnamed
let NERDTreeShowHidden=1
" To help with case insensitive search 
set ignorecase

" For tmux integration 
let g:vimade = {}
let g:vimade.fadelevel = 0.6
let g:vimade.enablefocusfading = 1
let g:vimade.groupdiff = 1

" Adding dbt support
source $HOME/.vim/config/dbt.vimrc

