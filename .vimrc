call plug#begin('~/.vim/plugged')

" Plugin for GitHub "
Plug 'tpope/vim-fugitive'
" File Tree "
Plug 'scrooloose/nerdtree'
"PEP 8 checking "
Plug 'nvie/vim-flake8'
" Help with indenting python files "
Plug 'vim-scripts/indentpython.vim'
"Folding plugin "
Plug 'tmhedberg/SimpylFold'
" Git plugin not hosted on GitHub "
Plug 'git://git.wincent.com/command-t.git'
" Autocomplete "
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Syntax checking "
Plug 'vim-syntastic/syntastic'
" Go language support for Vim "
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
" Javascript language support for Vim "
Plug 'pangloss/vim-javascript'
" Typescript language support for Vim "
Plug 'leafgarland/typescript-vim'
" React support for Vim "
Plug 'maxmellon/vim-jsx-pretty'
" React snippets"
Plug 'mlaursen/vim-react-snippets'

call plug#end()

syntax enable
" set tabs to 4 spaces "
set ts=4
set sw=4
" indent when moving to the next line while writing code"
set autoindent
" expand tabs into spaces "
set expandtab
" show the matching part of the pair of parentheses "
set showmatch
" enable all python syntax highlighting features "
let python_highlight_all=1

" Enable folding "
" set foldmethod=indent
set foldlevel=99
"see docstrings for folded code"
let g:SimpylFold_docstring_preview=1

"enable backspace to delete"
set backspace=indent,eol,start

highlight CocErrorSign ctermfg=Black ctermbg=Blue guifg=#ff0000

" PEP 8 indention "
au BufNewFile,BufRead *.py;
    \ set tabstop=4
    \ set softtabstop=4
    \ set shiftwidth=4
    \ set textwidth=79
    \ set expandtab
    \ set autoindent
    \ set fileformat=unix

" HTML indention "
au BufNewFile,BufRead *.js,*.html 
    \ set filetype 
    \ tabstop=2 
    \ softtabstop=2 
    \ shiftwidth=2

" Set what BadWhiteSpace is "
highlight BadWhitespace ctermbg=red guibg=darkred
" Flag whitespace "
au BufRead,BufNewFile *.py match BadWhitespace /\s\+$/

"Make code look pretty"
let python_highlight_all=1
syntax on

"Syntastic settings"
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

let g:syntastic_python_checkers = ['flake8']

let g:syntastic_html_checkers = ['tidy']
let g:syntastic_html_tidy_exec = 'tidy5'

let g:syntastic_javascript_checkers=['eslint']

"Set numbers"
set nu

set hidden

" Some servers have issues with backup files "
set nobackup
set nowritebackup

" Give more space for displaying messages "
set cmdheight=2

" Having longer update time leads to noticeable delays and poor user '
" experience "
" set updatetime=300

" Don't pass messages to |ins-completion-menu| "
set shortmess+=c

" Use tab for trigger completetion with characters ahead and navigate. "
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by "
" other plugin before putting this into your config "
"inoremap <silent><expr> <TAB>
"      \ pumvisible() ? "\<C-n>" :
"      \ <SID>check_back_space() ? "\<TAB>" :
"      \ coc#refresh()
"inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>""
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
inoremap <silent><expr> <C-x><C-z> coc#pum#visible() ? coc#pum#stop() : "\<C-x>\<C-z>"
inoremap <silent><expr> <TAB>
        \ coc#pum#visible() ? coc#pum#next(1):
        \ <SID>check_back_space() ? "\<Tab>" :
        \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
inoremap <silent><expr> <c-space> coc#refresh()


function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion "
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
" if exists('*complete_info')
"  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
"else
"  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
"endif

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

let g:coc_global_extensions = ['coc-tsserver']

" Set colors for some Coc Highlighting"
hi Pmenu ctermfg=black ctermbg=blue
hi CocErrorFloat ctermfg=black ctermbg=red
hi CocErrorHighlight ctermfg=black ctermbg=red
hi CocWarningSign ctermfg=black
hi CocSearch ctermfg=12 guifg=#18A3FF
hi CocMenuSel ctermbg=109 guibg=#13354A

let g:vim_jsx_pretty_colorful_config=1

set hlsearch
