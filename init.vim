" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

"Auto comentar
Plug 'preservim/nerdcommenter'
"Auto completado de pares
Plug 'jiangmiao/auto-pairs'
"Lightline
Plug 'itchyny/lightline.vim'
"File manager
Plug 'ctrlpvim/ctrlp.vim'
"Todo list searcher
Plug 'mileszs/ack.vim'
"NerdTree
Plug 'preservim/nerdtree'
"Devicons 
Plug 'ryanoasis/vim-devicons'
"NerdTree icons
Plug 'vwxyutarooo/nerdtree-devicons-syntax'
"NerdTree Git Plug
Plug 'Xuyuanp/nerdtree-git-plugin'
"Linter and autocompleter
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Git gutter
Plug 'mhinz/vim-signify'
"Several languages syntax
"Plug 'sheerun/vim-polyglot'
"Auto-close html tags
Plug 'alvan/vim-closetag'
"Flutter indentation
Plug 'tiagofumo/dart-vim-flutter-layout'
"Emmet
Plug 'mattn/emmet-vim'
"Multiple cursors
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
"Dart Syntax
Plug 'dart-lang/dart-vim-plugin'
"Pug syntax
Plug 'digitaltoad/vim-pug'
"JS syntax
Plug 'pangloss/vim-javascript'
"Vue sintax
Plug 'leafOfTree/vim-vue-plugin'
"
""--------- COLORSCHEMES ---------

"Gruvbox colorscheme
Plug 'morhetz/gruvbox'
"OneDark colorscheme
"Plug 'joshdick/onedark.vim'
"Dracula colorscheme
"Plug 'dracula/vim', { 'as': 'dracula' }


" Initialize plugin system
call plug#end()

"-------------Keybindings-----------------
"Setting CTRL + S to save
noremap <silent> <C-S> :update<CR>
vnoremap <silent> <C-S> <C-C>:update<CR>
inoremap <silent> <C-S> <C-O>:update<CR>
"Setting NormalMode
inoremap <silent> <C-j> <Esc>
"Moving lines up and down
nnoremap <silent> . :move -2<CR>
nnoremap <silent> , :move +1<CR>
"Toggle commenting lines
nnoremap <silent> <C-a> :call NERDComment(0, "toggle")<CR>
vnoremap <silent> <C-a> :call NERDComment(0, "toggle")<CR>
"Toggle NerdTree
nnoremap <silent> <F3> :NERDTreeToggle<CR>
"Ctrlp search on Buffer
nnoremap <silent> <C-l> :CtrlPBuffer<CR>
"Searching word under cursor foward
nnoremap <silent> <C-x> *
"Searching word under cursor backwards
nnoremap <silent> <C-z> #
"Command for searching FIXMES
command Fixme Ack! --ignore node_modules/ 'FIXME'
"Command for searching TODOS
command Todo Ack! --ignore node_modules/ 'TODO'
"Set indentation for each language
filetype plugin indent on

"Keyboard shorcut for Flutter
"Por ahora esta con demasiados bugs
"nnoremap <silent> <F5> :FlutterHotReload<CR>
"nnoremap <silent> <F6> :FlutterHotRestart<CR>

"Not to create backup files
set nobackup
set noswapfile
set noundofile

"Enable indentation for each file

"<---------- Pug ----------->

augroup Pug 
    autocmd!
    autocmd FileType pug setlocal tabstop=2 shiftwidth=2 expandtab
augroup END

"<---------- JavaScript ----------->

augroup js 
    autocmd!
    autocmd FileType javascript setlocal tabstop=2 shiftwidth=2 expandtab
augroup END

"<---------- VUE ----------->

augroup vue 
    autocmd!
    autocmd FileType vue setlocal tabstop=2 shiftwidth=2 expandtab
augroup END

"<---------- DART ----------->

augroup dart
    autocmd!
    autocmd FileType dart setlocal tabstop=2 shiftwidth=2 expandtab
augroup END

"<--------- C ----------->

augroup C
    autocmd!
    autocmd FileType c setlocal tabstop=3 shiftwidth=3 expandtab
augroup END

set encoding=UTF-8

"Sets relative line numeration
set number relativenumber
set nu rnu

"CtrlP config for ignoring node_modules folder
let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist)|(\.(swp|ico|git|svn))$'

"ACK configuration for using AG instead of ACK
if executable('ag')
 let g:ackprg = 'ag --vimgrep'
endif

"Enable scss sintax on Vue files
let g:vim_vue_plugin_use_scss = 1

"Change to a Nerd Font
set guifont=DroidSansMono\ Nerd\ Font\ 11

"Nerd Commenter configuration
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1

"CONFIGURACION LIGHTLINE
set laststatus=2
set noshowmode
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }

"Colorschemes config
set termguicolors
syntax on
set background=dark
let g:gruvbox_contrast_dark = 'hard'
colorscheme gruvbox

"INTEGRATED TERMINAL CONFIG

" open new split panes to right and below
set splitright
set splitbelow
" turn terminal to normal mode with escape
tnoremap <Esc> <C-\><C-n>
" start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif
" open terminal on ctrl+n
function! OpenTerminal()
  split term://bash
  resize 10
endfunction
nnoremap <c-n> :call OpenTerminal()<CR>

"Coc config

"To Flutter Wrap Widgets
nmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <silent><leader>ca <Plug>(coc-codelens-action)
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.

if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand'<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
