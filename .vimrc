"#############################################################################
" Install / load plugins
"#############################################################################

call plug#begin()

Plug 'airblade/vim-gitgutter'                     " shows a git diff in the gutter (sign column) and stages/reverts hunks
Plug 'vim-airline/vim-airline'                    " more informative status/tabline
Plug 'vim-airline/vim-airline-themes'             " airline styling
Plug 'chrisbra/csv.vim'                           " Filetype plugin for csv files
Plug 'scrooloose/nerdcommenter'                   " quickly (un)comment lines
Plug 'scrooloose/nerdtree'                        " A tree explorer plugin
Plug 'tpope/vim-endwise'                          " wisely add 'end' in ruby, endfunction/endif/more in vim script, etc
Plug 'tpope/vim-surround'                         " makes working w/ quotes, braces,etc. easier
Plug 'lmeijvogel/vim-yaml-helper'                 " navigate yaml files more easily
Plug 'w0rp/ale'                                   " alternative to syntastic
Plug 'junegunn/fzf',                              { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'                           " fuzzy finder
Plug 'rking/ag.vim'                               " search for file contents
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'honza/vim-snippets'

call plug#end()

set nocompatible

set autoread
au CursorHold,CursorHoldI * checktime
set hidden
set laststatus=2                                " Use 2 rows for status line
set number
set expandtab
set listchars=trail:·                           " highlight tabs and trailing whitespace only
set scrolloff=999
set splitright                                  " open new vertical columns on the right
set splitbelow                                  " open new horizontal columns below
set showmatch                                   " show matching braces
set smartcase                                   " turn case sensitive search back on in certain situations
set sw=2 sts=2 ts=2                             " 2 spaces
set noswapfile                                  " do not keep swapfiles
set textwidth=0                                 " Do not break lines
set ttimeoutlen=100                             " Without this entering normal mode takes forever
set wildmenu                                    " Autocomplete filenames
set wildmode=list:longest,full                  " Show completions as list with longest match then full matches
set wildignore+=tags                            " Ignore certain files/folders when globbing
set wildignore+=cscope.out
set wildignore+=tmp/**
set nowrap                                      " Turn off line mapping
set smartindent
set autoindent
set history=50		                              " keep 50 lines of command line history
set ruler		                                    " show the cursor position all the time
set showcmd		                                  " display incomplete commands
set ignorecase                                  " ignore case when searching
set incsearch		                                " do incremental searching

" Switch on highlighting the last used search pattern.
syntax on
colo desert
set hlsearch

filetype on
filetype plugin on
filetype plugin indent on

let mapleader = ","
let maplocalleader = ";"

"#############################################################################
" Plug configuration
"#############################################################################
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#ale#enabled = 1
let g:airline_theme='luna'
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

let NERDSpaceDelims = 1

let ruby_operators=1

" Set this setting in vimrc if you want to fix files automatically on save.
let g:ale_fixers = {
      \  '*': ['remove_trailing_lines', 'trim_whitespace']
      \}
let g:ale_fix_on_save = 1
let g:ale_javascript_prettier_use_local_config = 1

" Jsx syntax highlighting will work on .js files
let g:jsx_ext_required = 0

" fzf
" use control c or g to exit
imap     <c-x><c-l> <plug>(fzf-complete-line)
nnoremap <C-p>      :FZF<CR>
nnoremap <M-x>      :Commands<CR>
nnoremap <leader>t  :Files<cr>
nnoremap <leader>b  :Buffers<cr>
let g:fzf_commands_expect = 'enter'

"#############################################################################
" Keymaps
"#############################################################################

" Gracefully handle holding shift too long after : for common commands
cabbrev W w
cabbrev Q q
cabbrev Wq wq
cabbrev Tabe tabe
cabbrev Tabc tabc

" Don't need to hold down shift for : because I'm lazy
nnoremap ; :
noremap ;; ;
noremap ,. ,

" Unmap q for macrorecording; it's annoying
noremap Q q
noremap q <Nop>

" Map jj to escape
inoremap jj <Esc>

" Make Y consistent with D and C
map Y y$

" File tree browser
map \ :NERDTreeToggle<CR>

" File tree browser showing current file - pipe (shift-backslash)
map \| :NERDTreeFind<CR>

map <leader>cf :let @*=expand('%')

"indent/unindent visual mode selection with tab/shift+tab
vmap <tab> >gv
vmap <s-tab> <gv

noremap <leader>r :b#

" Press Space to turn off highlighting and clear any message already
" displayed.
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>""

" Map ,e and to open files in the same directory as the current file
cnoremap %% <C-R>=expand('%:h').'/'<cr>
map <leader>e :edit %%

" Map ,s to search and replace"
noremap <leader>s :%s/

" Make it easier to switch between windows
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

"Use the system clipboard when copying to the buffer
set clipboard^=unnamed

" Luki's black magic
function! s:toggle_spec()
  let extension = expand("%:e")
  let name = expand("%:t")
  let folder = expand("%:h:t")
  if stridx(name, '_spec') == -1
    return '/' . folder . '/' . substitute(name, '.' . extension, '_spec.' . extension, '')
  else
    return '/' . folder . '/' . substitute(name, '_spec.' . extension, '.' . extension, '')
  endif
endfunction

command! -bang -nargs=? -complete=dir ToggleSpec
    \ call fzf#vim#files('', {'options': '-q"' . s:toggle_spec() .'$ "'})

noremap <leader>p :ToggleSpec<CR>

"#############################################################################
" Autocommands
"#############################################################################

" Ruby autocomplete
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1

" Highlight Ruby files
au BufRead,BufNewFile Gemfile* set filetype=ruby
au BufRead,BufNewFile *_spec.rb set syntax=ruby

" Highlight JSON files as javascript
autocmd BufRead,BufNewFile *.json set filetype=javascript

" Word wrap without line breaks for text files
au BufRead,BufNewFile *.txt,*.md,*.markdown,*.rdoc set wrap linebreak nolist textwidth=0 wrapmargin=0

" Save on exit insert mode
autocmd InsertLeave * write
