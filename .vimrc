set nocompatible             " Force to use ViM
filetype off                 " required

set number                   " Show line numbers
set expandtab                " Tabs always insert spaces
set autoindent               " Automatic indentation
set shiftwidth=2             " Sets indentation as 2 spaces
set tabstop=2                " Makes a tab count for every 2 spaces
set backspace=2              " Use standard backspace behavior
set scrolloff=5              " Always shows at least 5 lines above and below the cursor
set sw=2                     " Sets shift width
set sts=2                    " Makes spaces 'feel like' tabs
set hlsearch                 " Highlights search results

set encoding=utf-8           " Force UTF-8 encoding
set fileformat=unix          " Force file format to UNIX
set path=$PWD/**             " Set path to include child directories

" Highlight line 81
" highlight ColorColumn ctermbg=Blue
" set colorcolumn=81

" Remove trailing whitespace
autocmd BufWritePre * :%s/\s\+$//e

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" NERDTree plugin
Plugin 'scrooloose/nerdtree'

" Collection of language packages
Plugin 'sheerun/vim-polyglot'

" Shows inline git diff
Plugin 'airblade/vim-gitgutter'

" Runs linters and compiler in background
Plugin 'neomake/neomake'

" Phoenix plugins
Plugin 'c-brenn/phoenix.vim'
Plugin 'tpope/vim-projectionist'

" Tab completions for Elixir
Plugin 'slashmili/alchemist.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required

" NERDTree shows hidden files
let NERDTreeShowHidden=1
" NERDTree ignore .swp files
let NERDTreeIgnore = ['\.swp$']
" Automatically opens NERDTree and focus on file.
autocmd vimenter * NERDTree | wincmd p
" Closes vim when NERDTree is the only tab open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Auto refreshes NERDTree
autocmd CursorHold,CursorHoldI * call NERDTreeFocus() | call g:NERDTree.ForCurrentTab().getRoot().refresh() | call g:NERDTree.ForCurrentTab().render() | wincmd w

" Runs Neomake on background
autocmd! BufWritePost * Neomake

" Alchemist configuration
let g:alchemist_tag_disable = 1

filetype plugin indent on    " Enable ViM to detect file types
syntax on                    " Enable syntax highlighting

