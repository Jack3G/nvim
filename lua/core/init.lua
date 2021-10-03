vim.cmd("filetype plugin indent on")


-- Install paq
local install_path = vim.fn.stdpath('data') .. '/site/pack/paqs/start/paq-nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    vim.fn.system({
        'git', 'clone', '--depth=1',
        'https://github.com/savq/paq-nvim.git',
        install_path,
    })
end


vim.cmd("packadd paq-nvim")
local paq = require("paq-nvim").paq

paq {'savq/paq-nvim', opt = true}


-- dependencies or beeg usefull stuff
paq "kyazdani42/nvim-web-devicons"
paq "sheerun/vim-polyglot"
paq "nvim-lua/popup.nvim"
paq "nvim-lua/plenary.nvim"
paq "equalsraf/neovim-gui-shim"

    -- Status Line and other stuff
paq {"glepnir/galaxyline.nvim", branch = "main"}
paq {"vim-airline/vim-airline", opt = true}
paq "romgrk/barbar.nvim"

paq "mhinz/vim-startify"
--paq "glepnir/dashboard-nvim"

    -- Functional
paq "maxboisvert/vim-simple-complete"
--paq "airblade/vim-gitgutter"
paq "tpope/vim-surround"
paq "psliwka/vim-smoothie"
paq {"lukas-reineke/indent-blankline.nvim"}
paq "tpope/vim-commentary"
paq "junegunn/goyo.vim"
paq "junegunn/vim-slash" --make searching a bit better
paq "junegunn/vim-easy-align"
paq "kyazdani42/nvim-tree.lua"
paq "rafcamlet/nvim-luapad"
paq "neovim/nvim-lspconfig"
paq "sumneko/lua-language-server"
paq "vimwiki/vimwiki"
paq "alec-gibson/nvim-tetris"

    -- Languages
-- Freezes on BufWrite autocmd for formatting
--paq "rust-lang/rust.vim"
paq "vhyrro/neorg"

    -- Looks
paq "vim-airline/vim-airline-themes"
paq {"sonph/onehalf", rtp = "vim" }
paq "morhetz/gruvbox"
paq "phanviet/vim-monokai-pro"
paq "sainnhe/everforest"
paq "norcalli/nvim-colorizer.lua"
paq "drewtempelmeyer/palenight.vim"
paq "joshdick/onedark.vim"
paq "KeitaNakamura/neodark.vim"
paq "mhinz/vim-janah"
paq "aonemd/kuroi.vim"
paq "srcery-colors/srcery-vim"
paq "pineapplegiant/spaceduck"
paq "sunjon/Shade.nvim"

    -- my plugins
paq "Jack3G/widthguide"

require("widthguide").enable()


vim.cmd("syntax on")

vim.cmd("set cpo-=_")
--set backspace=indent,eol,start -- neovim sets this
vim.o.ruler = true
vim.o.number = true
vim.o.showcmd = true
vim.o.incsearch = true
vim.o.hlsearch = true
vim.o.hidden = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.splitright = true
vim.o.termguicolors = true
vim.o.history = 100
vim.o.scrolloff = 3
vim.o.listchars = "tab:>·,trail:·"
vim.o.grepprg = "rg --hidden --vimgrep --smart-case --"
--set guifont = Consolas:h12
if vim.g.neovide then
    vim.o.guifont = "FiraCode Nerd Font Mono:h16"
else
    vim.o.guifont = "FiraCode Nerd Font Mono:h13"
end

vim.wo.wrap = false
vim.wo.relativenumber = true
vim.wo.conceallevel = 2
vim.wo.signcolumn = "number"

vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.autoindent = true
vim.o.spelllang = "en_au"


vim.g["neodark#background"] = "#202020"

vim.cmd("colorscheme tokyonight")
--vim.cmd([[
    --if (has("gui"))
        --colo palenight
    --else
        --colo gruvbox
    --endif
--]])


-- PLUGIN CONFIG

-- colorizer
require("colorizer").setup()

-- neorg
require("neorg").setup {
    -- Tell Neorg what modules to load
    load = {
        -- ["core.defaults"] = {}, -- Load all the default modules
        ["core.neorgcmd"] = {},
        ["core.keybinds"] = {},
        ["core.mode"] = {},
        ["core.norg.qol.todo_items"] = {},
        ["core.norg.esupports"] = {},
        ["core.integrations.treesitter"] = {},

        ["core.norg.concealer"] = {}, -- Allows for use of icons
        -- ["core.norg.dirman"] = {}, -- Manage your directories with Neorg
    },
}

-- airline
-- vim.g["airline_powerline_fonts"] = 1

-- indentline
vim.g["indentLine_color_gui"] = "#606060"
vim.g["indentLine_char"] = "|" --¦¦┊
vim.g["indentLine_fileTypeExclude"] = {"NvimTree", "startify", "help"}
vim.g["indent_blankline_show_first_indent_level"] = false

-- NvimTree
vim.g["nvim_tree_indent_markers"] = 1
vim.g["nvim_tree_icons"] = {
    folder = {
        default = ""
    }
}

-- smoothie
if vim.g.neovide then
    vim.g.smoothie_enabled = false
end

-- galaxyline
require("statusline")

-- lspconfig
require("langserver-config")

-- luapad
vim.g["luapad_preview"] = false

--startify
vim.g.startify_fortune_use_unicode = 1

-- Shade.nvim
require("shade").setup({
    overlay_opacity = 50,
    opacity_step = 1,
    keys = {
        brightness_up    = '<C-Up>',
        brightness_down  = '<C-Down>',
        toggle           = '<Leader><S-s>',
    }
})



---- Bindings
local map = vim.api.nvim_set_keymap

local nore = {noremap = true}
local nore_silent = {noremap = true, silent = true}

vim.g.mapleader = " "
map("n", " ", "", nore) -- if you don't do something in time it doesn't matter
map("x", " ", "", nore)

map("n", "<Leader>fP", ":e ~/.config/nvim/",                     nore)
map("n", "<Leader>fp", ":e ~/.local/share/nvim-data/site/pack/", nore)
map("n", "<Leader>fg", ":e ~/Documents/code/go/src/",            nore)
map("n", "<Leader>b",  ":ls<CR>:b<Space>",                       nore)
map("n", "<Leader>`",  "<C-^>",                                  nore_silent)
map("n", "<Leader>l",  ":luafile ~/.config/nvim/init.lua<CR>",   nore)
map("n", "<Leader>s",  ":set spell!<CR>",                        nore)

---- Plugin bindings
map("n", "<Leader>tt", ":NvimTreeToggle<CR>",    nore_silent)
map("n", "<Leader>tr", ":NvimTreeRefresh<CR>",   nore_silent)

map("n", "<Left>",    ":BufferPrevious<CR>",     nore_silent)
map("n", "<Right>",   ":BufferNext<CR>",         nore_silent)
map("n", "<C-s>",     ":BufferPick<CR>",         nore_silent)
map("n", "<S-Right>", ":BufferMoveNext<CR>",     nore_silent)
map("n", "<S-Left>",  ":BufferMovePrevious<CR>", nore_silent)

-- Start interactive EasyAlign in visual mode (e.g. vipga)
map("x", "ga", "<Plug>(EasyAlign)", {})
-- Start interactive EasyAlign for a motion/text object (e.g. gaip)
map("n", "ga", "<Plug>(EasyAlign)", {})


map("n", "K",    ":lua vim.lsp.buf.hover()<CR>",      nore_silent)
map("n", "<F2>", ":lua vim.lsp.buf.rename()<CR>",     nore_silent)
map("n", "gd",   ":lua vim.lsp.buf.definition()<CR>", nore_silent)

--nnoremap <Tab> >>
--nnoremap <S-Tab> <<
--vnoremap <Tab> >
--vnoremap <S-Tab> <

--nnoremap H ^
--nnoremap L $
--nnoremap K {
--nnoremap J }

-- this makes it so i can scroll through wraped lines
map("n", "j", "gj", nore_silent)
map("n", "k", "gk", nore_silent)

---- Insert mode

-- smash escape
--inoremap jk <Esc>
--inoremap kj <Esc>

map("i", "<C-h>", "<Left>", nore_silent)
map("i", "<C-l>", "<Right>", nore_silent)

---- Window
map("n", "<C-h>", "<C-w>h", nore_silent)
map("n", "<C-j>", "<C-w>j", nore_silent)
map("n", "<C-k>", "<C-w>k", nore_silent)
map("n", "<C-l>", "<C-w>l", nore_silent)

---- Terminal
map("t", "<Esc>", "<C-\\><C-N>", nore_silent)

---- Abreviations
vim.cmd("cnoreabbrev h vert h")
vim.cmd("cnoreabbrev bd BufferClose")




-- functions
--vim.api.nvim_eval([[
--function! DeleteEmptyBuffers()
    --let [i, n; empty] = [1, bufnr('$')]
    --while i <= n
        --if bufexists(i) && bufname(i) == ''
            --call add(empty, i)
        --endif
        --let i += 1
    --endwhile
    --if len(empty) > 0
        --exe 'bdelete' join(empty)
    --endif
--endfunction
--]])

