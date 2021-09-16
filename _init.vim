set nocompatible
filetype plugin indent on


call plug#begin(stdpath('data') . "/plugged")

Plug 'kyazdani42/nvim-web-devicons'
Plug 'sheerun/vim-polyglot'

    " Status Line
"Plug 'glepnir/galaxyline.nvim' , {'branch': 'main'}
Plug 'vim-airline/vim-airline'
"Plug 'bling/vim-bufferline'
Plug 'romgrk/barbar.nvim'

    " Functional
Plug 'maxboisvert/vim-simple-complete'
Plug 'airblade/vim-gitgutter'
Plug 'mhinz/vim-startify'
Plug 'tpope/vim-surround'
Plug 'psliwka/vim-smoothie'
"Plug 'onsails/lspkind-nvim'
"Plug 'Yggdroot/indentLine' " Apparently I don't need this anymore?
Plug 'lukas-reineke/indent-blankline.nvim', {'branch': 'lua'}
Plug 'preservim/nerdcommenter'
Plug 'hrsh7th/nvim-compe' "completion
Plug 'junegunn/goyo.vim'
Plug 'junegunn/vim-slash' "make searching a bit better
Plug 'junegunn/vim-easy-align'
Plug 'ctrlpvim/ctrlp.vim', { 'on': 'CtrlP' }
Plug 'kyazdani42/nvim-tree.lua', { 'on': 'NvimTreeToggle' }
Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }

    " Languages
" Freezes on BufWrite autocmd for formatting
"Plug 'rust-lang/rust.vim'

    " Looks
Plug 'vim-airline/vim-airline-themes'
Plug 'sonph/onehalf', { 'rtp': 'vim' }
Plug 'morhetz/gruvbox'
Plug 'phanviet/vim-monokai-pro'
Plug 'sainnhe/everforest'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'joshdick/onedark.vim'
Plug 'KeitaNakamura/neodark.vim'

call plug#end()

syntax on
set backspace=indent,eol,start
set ruler
set number
set relativenumber
set showcmd
set incsearch
set hlsearch
set expandtab
set hidden
set ignorecase
set smartcase
set splitright
set autoindent
set termguicolors
setglobal nowrap

set tabstop=4
set shiftwidth=4
set history=100
set scrolloff=3
set listchars=tab:>·,trail:·
"set guifont=Consolas:h12
set guifont=Fira\ Code:h12

let g:neodark#background = '#202020'

colorscheme gruvbox "everforest neodark CandyPaper darkZ


" PLUGIN OPTIONS

luafile ~/.config/nvim/luaoptions.lua

"airline
let g:airline#extensions#tabline#enabled = 0
let g:airline_powerline_fonts = 1

" indentline
let g:indentLine_color_gui = '#606060'
let g:indentLine_char = '¦' "¦┊

let g:indent_blankline_show_trailing_blankline_indent = v:false

"the other bufferline
"let g:bufferline_active_buffer_left = ''
"let g:bufferline_active_buffer_right = ''
"let g:bufferline_modified = '*'
"let g:bufferline_show_bufnr = 0

"let g:bufferline_echo = 0
"autocmd VimEnter *
"\ let &statusline='%{bufferline#refresh_status()}'
  "\ .bufferline#get_status_string()




""" Bindings
let mapleader=' '
nnoremap <Leader>fP       :e C:/Users/jack.baines/.config/nvim/
nnoremap <Leader>fg       :e C:/Users/jack.baines/Documents/code/go/src/
nnoremap <Leader>d        :exe DeleteEmptyBuffers()<CR>
nnoremap <Leader>b        :ls<CR>:b<Space>
nnoremap <Leader>`        <C-^>
nnoremap <Leader>c        :source ~/.config/nvim/init.vim<CR>

""" Plugin bindings
nnoremap <Leader>t :NvimTreeToggle<CR>

nnoremap <silent> <Left>    :BufferPrevious<CR>
nnoremap <silent> <Right>   :BufferNext<CR>
nnoremap <silent> <C-s>     :BufferPick<CR>
nnoremap <silent> <S-Right> :BufferMoveNext<CR>
nnoremap <silent> <S-Left>  :BufferMovePrevious<CR>

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)


"nnoremap <Tab> >>
"nnoremap <S-Tab> <<
"vnoremap <Tab> >
"vnoremap <S-Tab> <

"nnoremap H ^
"nnoremap L $
"nnoremap K {
"nnoremap J }

" this makes it so i can scroll through wraped lines
nnoremap j gj
nnoremap k gk

""" Insert mode

" smash escape
"inoremap jk <Esc>
"inoremap kj <Esc>

inoremap <C-h> <Left>
inoremap <C-l> <Right>

""" Window
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

""" Abreviations
cnoreabbrev h vert h
cnoreabbrev bd BufferClose




" functions
function! DeleteEmptyBuffers()
    let [i, n; empty] = [1, bufnr('$')]
    while i <= n
        if bufexists(i) && bufname(i) == ''
            call add(empty, i)
        endif
        let i += 1
    endwhile
    if len(empty) > 0
        exe 'bdelete' join(empty)
    endif
endfunction

