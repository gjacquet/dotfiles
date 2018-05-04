if has('nvim-0.1.5')        " True color in neovim wasn't added until 0.1.5
    set termguicolors
endif

" vim-plug setup
call plug#begin('~/.vim/plugged')

" Autocomplete
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
let g:deoplete#enable_at_startup = 1
Plug 'Shougo/echodoc.vim'
Plug 'ervandew/supertab'

" Golang plugins
Plug 'fatih/vim-go', { 'tag': '*' }
Plug 'nsf/gocode', { 'rtp': 'nvim', 'do': '~/.config/nvim/plugged/gocode/nvim/symlink.sh' }
Plug 'zchee/deoplete-go', { 'do': 'make'}

" TOML
Plug 'cespare/vim-toml'

" Code tags
Plug 'majutsushi/tagbar'

" Tree
Plug 'scrooloose/nerdtree'

" Git
Plug 'tpope/vim-fugitive'

" Status line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Buffer list
Plug 'bling/vim-bufferline'

" Autosave
Plug '907th/vim-auto-save'

" Terraform
Plug 'hashivim/vim-terraform'

" Editor config
Plug 'editorconfig/editorconfig-vim'

" Add plugins to &runtimepath
call plug#end()

nmap <F7>  :NERDTreeToggle<CR>
nmap <C-n> :NERDTreeFocus<CR>
nmap <F8>  :TagbarToggle<CR>
nmap <F9>  :Gstatus<CR>
nmap <F10> :Gblame<CR>

" Make it easer to move from one window to another
no <C-j> <C-w>j "switching to below window
no <C-k> <C-w>k "switching to above window
no <C-l> <C-w>l "switching to right window
no <C-h> <C-w>h "switching to left window

" Airline theme configuration
let g:airline_powerline_fonts = 1
let g:airline_theme='solarized'
let g:airline_solarized_bg='dark'

" Use deoplete.
let g:deoplete#enable_at_startup = 1
" Improve tab completion as in https://gregjs.com/vim/2016/configuring-the-deoplete-asynchronous-keyword-completion-plugin-with-tern-for-vim/
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

set background=dark
hi Pmenu ctermfg=black ctermbg=gray guifg=black guibg=gray
hi PmenuSel ctermfg=black ctermbg=lightgray guifg=black guibg=lightgray

set shiftwidth=4
set tabstop=4

set mouse=a

" Show line numbers
set number

" enable AutoSave on Vim startup
let g:auto_save = 1
