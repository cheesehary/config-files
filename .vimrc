" => Vundle required settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"set shell=/bin/sh
set nocompatible " be iMproved
filetype off "disable file type detection for loading specific options
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin() "required
Plugin 'VundleVim/Vundle.vim'

    " My Bundles here:
    """"""""""""""""""
    Plugin 'altercation/vim-colors-solarized'
    Plugin 'valloric/youcompleteme'
    Plugin 'bling/vim-airline'
    Plugin 'kien/ctrlp.vim'
    "Plugin 'scrooloose/nerdtree'
    Plugin 'scrooloose/nerdcommenter'
    Plugin 'scrooloose/syntastic'
    Plugin 'tpope/vim-fugitive'
    Plugin 'tpope/vim-surround'
    Plugin 'majutsushi/tagbar'
    Plugin 'raimondi/delimitmate'
    Plugin 'easymotion/vim-easymotion'
    Plugin 'pangloss/vim-javascript'
    Plugin 'mxw/vim-jsx'
    Plugin 'elzr/vim-json'
    Plugin 'othree/html5.vim'
    "Plugin 'nopik/vim-nerdtree-direnter'

call vundle#end() "required
filetype plugin indent on "enable loading plugins and indents based on file type (required for Vundle)


" => General settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader=',' " Map Leader
set mouse=a
set number "enable line numbers
set ignorecase
set hlsearch
set incsearch
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
" This allows buffers to be hidden if you've modified a buffer.
" This is almost a must if you wish to use buffers in this way.
set hidden


" => Appearence options
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on "turn on syntax highlighting
set cursorline "highlight the screen line of the cursor
set ruler "show the line and column number of the cursor position
set t_Co=256
let g:solarized_termcolors=256
set background=dark
colorscheme solarized "select colorscheme
" Status Line {
    set laststatus=2                             " always show statusbar  
"   set statusline=  
"   set statusline+=%-10.3n\                     " buffer number  
"   set statusline+=%f\                          " filename   
"   set statusline+=%h%m%r%w                     " status flags  
"   set statusline+=\[%{strlen(&ft)?&ft:'none'}] " file type  
"   set statusline+=%=                           " right align remainder  
"   set statusline+=0x%-8B                       " character value  
"   set statusline+=%-14(%l,%c%V%)               " line, character  
"   set statusline+=%<%P                         " file position  
"}
let g:netrw_liststyle=3


" => Editing
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set backspace=indent,eol,start "intuitive backspacing in insert mode
"switch between input method
set noimdisable 
autocmd! InsertLeave * set imdisable|set iminsert=0
autocmd! InsertEnter * set noimdisable|set iminsert=0


" => Indenting
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set autoindent "copy indent from current line when starting a new line
set smartindent
set tabstop=4 "number of spaces that a <Tab> in the file counts for
set softtabstop=4 "number of spaces that a <Tab> counts for while performing editing operations
set shiftwidth=4 "number of spaces to use for each step of (auto)indent
set expandtab "use the appropriate number of spaces to insert a <Tab>.
set smarttab "makes a <Tab> in front of a line insert blanks according to 'shiftwidth'


" => Key mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Quick Escape
inoremap kj <Esc>
inoremap KJ <Esc>

" Window switching
map <C-h> <C-w>h
map <C-l> <C-w>l
map <C-j> <C-w>j
map <C-k> <C-w>k

" Pagedown 1/2
nmap <Space> <C-d>
" Pageup 1/2
nmap <S-Space> <C-u>

" Move to the next buffer
nmap L :bnext<CR>
" Move to the previous buffer
nmap H :bprevious<CR>
" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nmap <leader>q :bd<CR>

" Switch between two most recent buffers
nmap <Tab> :b#<CR>

" Explorer Mode
nmap <leader>n :Explore<CR>


" => Plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " EasyMotion
    """"""""""""""""""""""""""""""
    map <Leader> <Plug>(easymotion-prefix)

    " AirLine
    """"""""""""""""""""""""""""""
    " Enable the list of buffers
    let g:airline#extensions#tabline#enabled = 1
    " Show just the filename
    let g:airline#extensions#tabline#fnamemod = ':t'
    let g:airline#extensions#tabline#buffer_nr_show = 1

    " CtrlP
    """"""""""""""""""""""""""""""
    let g:ctrlp_map = '<C-p>'
    let g:ctrlp_show_hidden = 1
    let g:ctrlp_working_path_mode = 'r'
    " Easy bindings for its various modes
    nmap <leader><leader>b :CtrlPBuffer<cr>
    nmap <leader><leader>m :CtrlPMixed<cr>
    nmap <leader><leader>s :CtrlPMRU<cr>
    nmap <leader><leader>f :CtrlP<cr>

    " NERDTree
    """"""""""""""""""""""""""""""
    nmap <C-n> :NERDTreeToggle<CR>
    let NERDTreeIgnore = ['\.class$']
    let NERDTreeQuitOnOpen=1

    " Tagbar
    """"""""""""""""""""""""""""""
    nmap <C-b> :TagbarToggle<CR>
    "autocmd FileType * nested :call tagbar#autoopen(0)

    " DelimitMate
    """"""""""""""""""""""""""""""
    let delimitMate_expand_cr = 1
    let delimitMate_expand_space = 1

    " Javascript
    """"""""""""""""""""""""""""""
    let g:javascript_enable_domhtmlcss = 1

    " Syntastic
    """"""""""""""""""""""""""""""
    set statusline+=%#warningmsg#
    set statusline+=%{SyntasticStatuslineFlag()}
    set statusline+=%*
    let g:syntastic_always_populate_loc_list = 1
    let g:syntastic_auto_loc_list = 1
    let g:syntastic_check_on_open = 1
    let g:syntastic_check_on_wq = 0
    let g:syntastic_javascript_checkers = ['eslint']

    " YouCompleteMe
    """"""""""""""""""""""""""""""
    "let ycm_autoclose_preview_window_after_completion = 1
    set completeopt-=preview
    nmap gd :YcmCompleter GoToDefinition<CR>
    nmap gl :YcmCompleter GoToReferences<CR>
    
    " Jsx
    """"""""""""""""""""""""""""""
    let g:jsx_ext_required = 0 " Allow JSX in normal JS files

    " JsBeautify
    """"""""""""""""""""""""""""""
    nnoremap <leader>ff :%!js-beautify -j -q -B -P -f -<CR>
