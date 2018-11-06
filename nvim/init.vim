if has('nvim-0.1.5')        " True color in neovim wasn't added until 0.1.5
    set termguicolors
endif

" vim-plug setup
call plug#begin('~/.local/share/nvim/plugged')

" Autocomplete
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/echodoc.vim'

" Golang plugins
Plug 'fatih/vim-go', { 'tag': '*', 'do': ':GoInstallBinaries' }
Plug 'mdempsky/gocode', { 'rtp': 'nvim', 'do': '~/.config/nvim/plugged/gocode/nvim/symlink.sh' }
Plug 'zchee/deoplete-go', { 'do': 'make'}

" TOML
Plug 'cespare/vim-toml'

" YAML
Plug '~/workspace/vim-yaml'

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
Plug 'tpope/vim-obsession'

" Terraform
Plug 'hashivim/vim-terraform'

" Editor config
Plug 'editorconfig/editorconfig-vim'

" Shell
Plug 'Shougo/deol.nvim'
Plug 'zchee/deoplete-zsh'

" Add plugins to &runtimepath
call plug#end()

let mapleader = ","

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
if !exists('g:deoplete#omni#input_patterns')
  let g:deoplete#omni#input_patterns = {}
endif
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" Improve tab completion as in https://gregjs.com/vim/2016/configuring-the-deoplete-asynchronous-keyword-completion-plugin-with-tern-for-vim/
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

if filereadable(expand("~/.config/nvim/color.nvim"))
  exe 'source' "~/.config/nvim/color.nvim"
endif

set shiftwidth=4
set tabstop=4

set mouse=a

" Show line numbers
set number

" enable AutoSave on Vim startup
let g:auto_save = 1

" Golang plugin configuration
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>

autocmd FileType go nmap <leader>r  <Plug>(go-run)

" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction
autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>

autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)
let g:go_fmt_command = "goimports"
let g:go_metalinter_autosave = 1
autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')
autocmd FileType go nmap <Leader>i <Plug>(go-info)
let g:go_auto_type_info = 1
let g:go_auto_sameids = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
" TODO: Figure how to load only current repo
" let g:go_guru_scope = ["github.com/credify/...", "github.com/gjacquet/..."]

" Terraform plugin configuration
let g:terraform_align=1
let g:terraform_fmt_on_save=1
