set nocp
set nu
set rnu
set ru
set scl=yes
set tgc
set nowritebackup
set noswapfile
set nobackup
set updatetime=300
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
" set clipboard=unnamedplus    " Change?
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

call plug#begin("~/.vim/plugged")
if hostname() == 'endeyshent-320'
    Plug '~/software/Intercept/editor/int'
endif
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'EndeyshentLabs/vim-airline-256noir'
Plug 'andreasvc/vim-256noir'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'dense-analysis/ale'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'rhysd/vim-lsp-ale'
Plug 'jremmen/vim-ripgrep'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-dispatch'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'andreypopp/asyncomplete-ale.vim'
Plug 'vimsence/vimsence'
Plug 'editorconfig/editorconfig-vim'
call plug#end()

nnoremap <silent> gd <plug>(lsp-definition)
nnoremap <silent> gs <plug>(lsp-document-symbol-search)
nnoremap <silent> gS <plug>(lsp-workspace-symbol-search)
nnoremap <silent> gr <plug>(lsp-references)
nnoremap <silent> gi <plug>(lsp-implementation)
nnoremap <silent> gt <plug>(lsp-type-definition)
nnoremap <silent> <leader>rn <plug>(lsp-rename)
nnoremap <silent> [g <plug>(lsp-previous-diagnostic)
nnoremap <silent> ]g <plug>(lsp-next-diagnostic)
nnoremap <silent> K <plug>(lsp-hover)
nnoremap <silent> <expr><c-f> lsp#scroll(+4)
nnoremap <silent> <expr><c-b> lsp#scroll(-4)

inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"

nnoremap <silent> <Leader>h :nohl<CR>
nnoremap <silent> <Leader>, :nohl<CR>

set t_Co=256
colo 256_noir
let g:airline#extensions#ale#enabled = 1
let g:ale_completion_enabled=1

highlight SignColumn cterm=NONE ctermfg=245 ctermbg=16 gui=NONE guifg=#8a8a8a guibg=#000000
highlight CursorLineNr ctermfg=196 ctermbg=16 guifg=#ff0000 guibg=#000000
highlight LineNr ctermfg=255 ctermbg=16 guifg=#eeeeee guibg=#000000
highlight CursorLine cterm=NONE ctermfg=NONE ctermbg=233 guifg=NONE guibg=#121212
autocmd InsertEnter * highlight CursorLine cterm=NONE ctermfg=NONE ctermbg=234 guifg=NONE guibg=#1c1c1c
autocmd InsertLeave * highlight CursorLine cterm=NONE ctermfg=NONE ctermbg=233 guifg=NONE guibg=#121212
