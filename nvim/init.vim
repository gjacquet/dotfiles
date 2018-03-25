if has('nvim-0.1.5')        " True color in neovim wasn't added until 0.1.5
    set termguicolors
endif

" vim-plug setup
call plug#begin('~/.vim/plugged')

" Autocomplete
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/echodoc.vim'
Plug 'ervandew/supertab'

" Golang plugins
Plug 'fatih/vim-go', { 'tag': '*' }
Plug 'nsf/gocode', { 'rtp': 'nvim', 'do': '~/.config/nvim/plugged/gocode/nvim/symlink.sh' }
Plug 'zchee/deoplete-go', { 'do': 'make'}

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

" Terraform
Plug 'hashivim/vim-terraform'

" Editor config
Plug 'editorconfig/editorconfig-vim'

" Add plugins to &runtimepath
call plug#end()

nmap <F7>  :NERDTreeToggle<CR>
nmap <F8>  :TagbarToggle<CR>
nmap <F9>  :Gstatus<CR>
nmap <F10> :Gblame<CR>

" Used patched powerline fonts
let g:airline_powerline_fonts = 1

" Use deoplete.
let g:deoplete#enable_at_startup = 1

set background=dark
set shiftwidth=4
set tabstop=4

set mouse=a
