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


require "paq" {

    {'savq/paq-nvim', opt = true},

    -- dependencies or beeg usefull stuff --
    "kyazdani42/nvim-web-devicons",
    "sheerun/vim-polyglot",
    "nvim-lua/popup.nvim",
    "nvim-lua/plenary.nvim",
    "equalsraf/neovim-gui-shim",


    -- Status Line and other stuff --
    {"glepnir/galaxyline.nvim", branch = "main"},
    -- {"vim-airline/vim-airline", opt = true},
    "romgrk/barbar.nvim",
    "mhinz/vim-startify",
    -- "glepnir/dashboard-nvim",


    -- Functional --
    "maxboisvert/vim-simple-complete",
    -- "airblade/vim-gitgutter",
    "tpope/vim-surround",
    "psliwka/vim-smoothie",
    "lukas-reineke/indent-blankline.nvim",
    "tpope/vim-commentary",
    "junegunn/goyo.vim",
    "pgdouyon/vim-evanesco",
    "junegunn/vim-easy-align",
    "kyazdani42/nvim-tree.lua",
    "rafcamlet/nvim-luapad",
    "neovim/nvim-lspconfig",
    "sumneko/lua-language-server",
    "vimwiki/vimwiki",
    "alec-gibson/nvim-tetris",
    "nvim-treesitter/nvim-treesitter",
    "easymotion/vim-easymotion",

    -- Languages --
    -- Freezes on BufWrite autocmd for formatting
    -- "rust-lang/rust.vim",
    -- "vhyrro/neorg",
    "ron-rs/ron.vim",
    "quabug/vim-gdscript",

    -- Looks --
    "vim-airline/vim-airline-themes",
    {"sonph/onehalf", rtp = "vim" },
    "morhetz/gruvbox",
    "phanviet/vim-monokai-pro",
    "sainnhe/everforest",
    "norcalli/nvim-colorizer.lua",
    "drewtempelmeyer/palenight.vim",
    "joshdick/onedark.vim",
    "KeitaNakamura/neodark.vim",
    "mhinz/vim-janah",
    "aonemd/kuroi.vim",
    "srcery-colors/srcery-vim",
    "pineapplegiant/spaceduck",
    "sunjon/Shade.nvim",
    "folke/tokyonight.nvim",

    -- my plugins
    "Jack3G/widthguide",
}

require("widthguide").enable()


package.loaded["core.options"] = nil
require("core.options")


vim.g["neodark#background"] = "#202020"

vim.cmd("colorscheme srcery")
--vim.cmd([[
    --if (has("gui"))
        --colo palenight
    --else
        --colo gruvbox
    --endif
--]])


-- PLUGIN CONFIG

vim.g["widthguide_warn_column"] = 65

require("colorizer").setup()

-- require("neorg").setup {
--     -- Tell Neorg what modules to load
--     load = {
--         -- ["core.defaults"] = {}, -- Load all the default modules
--         ["core.neorgcmd"] = {},
--         ["core.keybinds"] = {},
--         ["core.mode"] = {},
--         ["core.norg.qol.todo_items"] = {},
--         ["core.norg.esupports"] = {},
--         ["core.integrations.treesitter"] = {},

--         ["core.norg.concealer"] = {}, -- Allows for use of icons
--         -- ["core.norg.dirman"] = {}, -- Manage your directories with Neorg
--     },
-- }

-- vim.g["airline_powerline_fonts"] = 1

vim.g["indentLine_color_gui"] = "#606060"
vim.g["indentLine_char"] = "|" --¦¦┊
vim.g["indentLine_fileTypeExclude"] = {"NvimTree", "startify", "help"}
vim.g["indent_blankline_show_first_indent_level"] = false

vim.g["nvim_tree_indent_markers"] = 1
vim.g["nvim_tree_icons"] = {
    folder = {
        default = ""
    }
}

if vim.g.neovide then
    vim.g.smoothie_enabled = false
end

require("statusline")

require("langserver-config")

vim.g["luapad_preview"] = false

vim.g.startify_fortune_use_unicode = 1

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
package.loaded["core.bindings"] = nil
require("core.bindings")



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

