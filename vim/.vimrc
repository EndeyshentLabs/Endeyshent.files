set nocp
set nu
set rnu
set ru
set scl=yes
set tgc
set nowritebackup
set noswapfile
set nobackup
set nowrap
set updatetime=300
set timeoutlen=1000
set ttimeoutlen=5
set wildmenu
set encoding=utf-8
set wildmode=longest:full,full
set mouse=a
set cursorline
set splitright
set splitbelow
set ts=4
set sw=4
set et
set clipboard=unnamedplus
set smarttab
set smartcase
set ignorecase
set incsearch
set hlsearch
set guioptions-=T
set guioptions-=m
set guifont=VictorMono\ Nerd\ Font\ 12
set scrolloff=7
set showcmd
set background=dark
set list
set listchars=tab:>\ 
syntax on
filetype indent plugin on
let g:mapleader=" "
let g:maplocalleader=" "
let g:netrw_banner=v:false
let g:netrw_browse_split=4
let g:netrw_altv=v:true
let g:netrw_liststyle=3
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
    silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin("~/.vim/plugged")
    if hostname() == 'endeyshent-320'
        Plug '~/software/Intercept/editor/int'
    endif
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'EndeyshentLabs/vim-airline-256noir'
    Plug 'andreasvc/vim-256noir'
    Plug 'rafi/awesome-vim-colorschemes'

    Plug 'prabirshrestha/async.vim'
    Plug 'dense-analysis/ale'
    Plug 'prabirshrestha/vim-lsp'
    Plug 'mattn/vim-lsp-settings'
    Plug 'rhysd/vim-lsp-ale'
    Plug 'piec/vim-lsp-clangd'
    Plug 'prabirshrestha/asyncomplete.vim'
    Plug 'prabirshrestha/asyncomplete-lsp.vim'

    Plug 'jremmen/vim-ripgrep'

    Plug 'tpope/vim-repeat'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-dispatch'

    Plug 'jiangmiao/auto-pairs'

    Plug 'editorconfig/editorconfig-vim'
call plug#end()

source ~/.vim_lsp

nnoremap <silent> <Leader>h :nohl<CR>
nnoremap <silent> <Leader>, :nohl<CR>
nnoremap <silent> <Esc><Esc> :nohl<CR>
nnoremap <silent> <S-l> <Cmd>tabn<CR>
nnoremap <silent> <S-h> <Cmd>tabp<CR>

set t_Co=256
colorscheme gruvbox
let g:airline#extensions#ale#enabled = 1
let g:ale_completion_enabled=0

if colors_name == '256_noir'
    highlight SignColumn cterm=NONE ctermfg=245 ctermbg=16 gui=NONE guifg=#8a8a8a guibg=#000000
    highlight CursorLineNr ctermfg=196 ctermbg=16 guifg=#ff0000 guibg=#000000
    highlight LineNr ctermfg=255 ctermbg=16 guifg=#eeeeee guibg=#000000
    highlight CursorLine cterm=NONE ctermfg=NONE ctermbg=233 guifg=NONE guibg=#121212
    autocmd InsertEnter * highlight CursorLine cterm=NONE ctermfg=NONE ctermbg=234 guifg=NONE guibg=#1c1c1c
    autocmd InsertLeave * highlight CursorLine cterm=NONE ctermfg=NONE ctermbg=233 guifg=NONE guibg=#121212
endif
