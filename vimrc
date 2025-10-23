call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'jlanzarotta/bufexplorer' 
Plug 'scrooloose/nerdtree'
Plug 'preservim/tagbar'
Plug 'jlanzarotta/bufexplorer'
Plug 'arcticicestudio/nord-vim'
Plug 'sainnhe/sonokai'
Plug 'lifepillar/vim-solarized8'
call plug#end()


set encoding=utf-8
set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set incsearch		" Incremental search
set hidden             " Hide buffers when they are abandoned
"set hls
"set nocompatible
"set number
"set hlsearch
"set backspace=indent,eol,start
""folding
"set foldmethod=syntax
"set foldlevel=100
"set foldenable
"set foldcolumn=0
"set foldnestmax=3
"set foldexpr=1

"set ruler
"set cursorline
"set viminfo+=!
"set autoread
"set confirm
"set clipboard+=unnamed "share clipboard with windows
"set noswapfile
"set nobackup
"set bufhidden=hide "当buffer被丢弃的时候隐藏它
"set noerrorbells
"set list "show tab
"set listchars=tab:>\ ,trail:.,eol:$
"set autochdir
"set noexpandtab
"" speed up when syntax on
"set ttyfast
"#set lazyredraw

map ,r :History<CR>
map ,w :set wrap!<CR>
map ,n :set nu!<CR>
map ,s :set cursorline!<CR>:set cursorcolumn!<CR>
map <F5> :NERDTree <CR>
map <F8> <ESC>:TagbarToggle<ENTER>
map <F9> :BufExplorer <CR>
map <F12> :qa <CR>

" --- AIRLINE CONFIGURATION ---
let g:airline_powerline_fonts = 1 
"let g:airline_theme = 'molokai' 
let g:airline_detect_mode = 1
set laststatus=1

if has("autocmd")
"" preview markdown file in chrome. Need chrome with markdown extension
autocmd BufRead,BufNewFile *.{md,mdown,mkd,mkdn,markdown,mdwn} map <Leader>p :!google-chrome-stable %:p &>/dev/null &<CR>
endif

if executable('rg')
  " Use ripgrep for :grep command
  set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case
  
  " Set format to parse rg's output into the Quickfix list
  set grepformat=%f:%l:%c:%m,%f:%l:%m
endif

function! ConnectGtags()
    set cscopeprg=gtags-cscope
    if filereadable('GTAGS')
        cs kill -1
        cs add GTAGS .
    endif
endfunction
autocmd BufEnter *.c,*.h,*.cpp,*.hpp,*.json,*.xml call ConnectGtags()

let mapleader = ','
nnoremap <Leader>h :History<CR>


nnoremap <Leader>gr :cs find s <C-R>=expand("<cword>")<CR><CR>
nnoremap <Leader>gc :cs find c <C-R>=expand("<cword>")<CR><CR>
nnoremap <Leader>gd :cs find g <C-R>=expand("<cword>")<CR><CR>
nnoremap <Leader>gb <C-t>
"nnoremap <Leader>qo :copen<CR>
"nnoremap <Leader>qc :cclose<CR>

nnoremap <Leader>rd :grep! -w <C-R>=expand("<cword>")<CR><CR>:copen<CR>
nnoremap <Leader>rr :grep! <C-R>=expand("<cword>")<CR><CR>:copen<CR>
nnoremap <Leader>rn :cnext<CR>
nnoremap <Leader>rp :cprevious<CR>
nnoremap <Leader>rb <C-t>



" Ensure 256 colors are enabled
set t_Co=256

" Tell Neovim to use the dark color palette
set background=dark

" Enable True Color
"set termguicolors

"colorscheme nord
