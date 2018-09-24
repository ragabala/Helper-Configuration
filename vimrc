" Key Bindings
" ============
" What key should 'leader' be mapped to?
let mapleader=","
" Shortcuts.
nmap <F5> :tabprev<CR>
nmap <F6> :tabnew<CR>
nmap <F7> :!ctags -R -o ~/.cache/custom-ctags/tags ~/code<CR>
nmap <F8> :tabnext<CR>
nmap <F9> :NERDTreeToggle<CR>
nmap <F10> :UndotreeToggle<CR>
nmap <F12> :TagbarToggle<CR>
nmap t :set paste<CR>
nmap <C-d> :1,$d<CR>
" Where should vim look for the tags that exuberant ctags generates?
set tags=~/.cache/custom-ctags/tags
" Allows method names such as `has_key?` to be looked up.
set iskeyword+=?
" Disable the arrow keys. hjkl has the same effect.
nnoremap <up> <nop>
nnoremap <right> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>

" Status Indicators
" =================
" Highlight the current row.
set cursorline
" Always show the status line.
set laststatus=2
" Display relative line numbers. For the current line, show absolute position.
set rnu
set number
" Show cursor position in status bar.
set ruler
" Show partial commands.
set showcmd

" Undo History
" ============
" Save the undo history in `undodir`. Make sure to create `undodir`, as it is
" NOT automatically created.
set undofile
set undodir=~/.vim/undo

" Searching
" =========
" Show search results while searching.
set incsearch
" Ignore case when searching, unless a capitalized letter is used.
set ignorecase
set smartcase
" Do not highlight search results.
set nohlsearch

" Folding
" =======
" Should code be folded by default?
set nofoldenable
" How should code be folded? "indent" is the easiest method.
set foldmethod=indent
" When a buffer is read, automatically expand all folds. "*" matches all files
" and "normal" tells vim to execute the following comand in normal mode.
"autocmd BufRead * normal zR

" Line Width
" ==========
" If a line exceeds this width, break it into multiple lines. Do so at a
" whitespace boundary.
set textwidth=80
" Keep current indentation level when starting new line
set autoindent
" If a line exceeds the width of the viewport, don't wrap it.
set nowrap

" Tabbing
" =======
" What is the apparent width of the tab character?
set tabstop=4
" When the tab key is pressed, should it be expanded to spaces?
set expandtab
" How many spaces should be inserted when indenting or retabbing?
set shiftwidth=4
" Round indent to multiple of 'shiftwidth'. Applies to > and < commands.
set shiftround

" File Type
" =========
filetype on
autocmd filetype gitcommit setlocal spell textwidth=72
autocmd filetype python setlocal textwidth=79
autocmd filetype scala setlocal tabstop=2 shiftwidth=2
autocmd filetype yaml setlocal tabstop=2 shiftwidth=2
au BufRead,BufNewFile *.g4 set filetype=antlr4

" Other Settings
" ==============
" Do not emulate vi.
set nocompatible
" Allow user to backspace in insert mode.
set backspace=2
" Buffer between cursor and top+bottom edge of viewport.
set scrolloff=5
" Use syntax highlighting.
syntax enable
color badwolf 

" Display interesting characters, such as trailing whitespace, specially.
set list
set listchars=trail:·,tab:>-,extends:!
execute pathogen#infect()
