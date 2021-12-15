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
vim.o.spell = true
