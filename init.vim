" Plugins will be downloaded under the specified directory. >"
call plug#begin('~/.vim/plugged')

" Declare the list of plugins.
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'shougo/unite.vim'
Plug 'shougo/vimfiler.vim'
Plug 'ap/vim-css-color'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'junegunn/fzf'
Plug 'ycm-core/YouCompleteMe'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'vim-airline/vim-airline-themes'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

" Gruvbox

let g:gruvbox_improved_strings = 1
let g:gruvbox_improved_warnings = 1

set completeopt-=preview

" YCM
let g:ycm_clangd_binary_path = "/usr/bin/clangd"
let g:ycm_confirm_extra_conf = 0
let g:ycm_add_preview_to_completeopt = 0

" path to directory where library can be found
let g:clang_library_path='/usr/lib/llvm-3.8/lib'
" or path directly to the library file
let g:clang_library_path='/usr/lib64/libclang.so.3.8'

colorscheme gruvbox

" Airline

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.maxlinenr = '㏑'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = 'Ɇ'
let g:airline_symbols.whitespace = 'Ξ'

let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.maxlinenr = ''

let g:airline_powerline_fonts = 1

" Airline Theme
let g:airline_theme='deus'

" Startup

call vimfiler#custom#profile('default', 'context', {
	\ 'safe': 0,
	\ 'explorer': 1,
	\ 'split': 1,
	\ 'direction': 'rightbelow',
	\ 'project:': 1,
	\ 'no_quit': 1,
	\ 'status': 1,
	\ 'toggle': 1,
	\ 'auto_expand': 1,
	\ 'winwidth': 30,
	\ })

let g:vimfiler_tree_leaf_icon = ' '
let g:vimfiler_tree_opened_icon = '▾'
let g:vimfiler_tree_closed_icon = '▸'
let g:vimfiler_file_icon = '-'
let g:vimfiler_marked_file_icon = '*'

autocmd VimEnter * VimFiler

inoremap " ""<left>
inoremap ( ()<left>
inoremap { {}<left>
inoremap ' ''<left>
inoremap [ []<left>

set shiftwidth=2
set number

nnoremap <A-l> :bnext<CR>
nnoremap <A-h> :bprevious<CR>

nnoremap <A-j> :+5<CR>
nnoremap <A-k> :-5<CR>

nnoremap <A-S-j> :+10<CR>
nnoremap <A-S-k> :-10<CR>

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

cnoreabbrev <expr> W ((getcmdtype() is# ':' && getcmdline() is# 'W')?('w'):('W'))
cnoreabbrev <expr> Q ((getcmdtype() is# ':' && getcmdline() is# 'Q')?('q'):('Q'))

map <C-K> :py3f ~/.config/nvim/clang-format.py<cr>
imap <C-K> <c-o>:py3f ~/.config/nvim/clang-format.py<cr>
