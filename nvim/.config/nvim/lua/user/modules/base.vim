"basic vim config

    syntax enable
    filetype plugin on
    set encoding=UTF-8 nobomb
    set noerrorbells "no sound effects
    set tabstop=4 softtabstop=4 "tabs 4 espaces
    set expandtab "convert tab to espaces
    set shiftwidth=4
    set smartindent "try to indent
    set smarttab "make tabs smart
    set number relativenumber "line relative numbers
    set nu "show current line number
    set noswapfile "no vim swap file
    set nobackup "disable backup
    set nowritebackup "disable backup 2
    set nohlsearch "disable highlight after search
    set hidden "can leave buffer without saving
    set scrolloff=8 "start moving the page when scrolling
    set undodir=~/.local/share/nvim/undodir "local to store undo files
    set undofile "enable undo file
    set incsearch "get results while searching
    set signcolumn=yes "add extra column to the left
    set wildmode=longest,list,full "auto complete file names
    set splitbelow splitright "set split to be below or to the right
    set ignorecase "ignore case when searching
    set backspace=indent,eol,start "allow backspace end of line
    set gdefault "add g flag to search/replace by default
    set clipboard+=unnamedplus "use system clipboard
    set ignorecase "ignore case for searching
    set hlsearch "highlight searches
    set nostartofline "don’t reset cursor to start of line when moving around.
    set showcmd " Show the (partial) command as it’s being typed
    set noeol "don’t add empty newlines at the end of files
    set shortmess=atI "don’t show the intro message when starting Vim

    " Enable per-directory .vimrc files and disable unsafe commands in them
    set exrc
    set secure

"incremental substitution (neovim)
    if has('nvim')
      set inccommand=split
    endif

"Better tabbing
    vnoremap < <gv
    vnoremap > >gv

"Move lines up and down

nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

"Key mapping
    let mapleader = "\<Space>"
    inoremap <C-c> <Esc>
    tnoremap <C-c> <Esc>
    nnoremap <C-c> <Esc>

"Easy caps
    inoremap <c-u> <ESC>viwUi
    nnoremap <c-u> viwU<ESC>

"remove trailing whitespaces when saving file
    autocmd BufWritePre * :%s/\s\+$//e
