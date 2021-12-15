local map = vim.api.nvim_set_keymap

local nore = {noremap = true}
local nore_silent = {noremap = true, silent = true}

vim.g.mapleader = " "
map("n", " ", "", nore) -- if you don't do something in time it doesn't matter
map("x", " ", "", nore)

map("n", "<Leader>fP", ":e ~/.config/nvim/lua/core/",            nore)
map("n", "<Leader>fp", ":e ~/.local/share/nvim-data/site/pack/", nore)
map("n", "<Leader>b",  ":ls<CR>:b<Space>",                       nore)
map("n", "<Leader>`",  "<C-^>",                                  nore_silent)
map("n", "<Leader>l",  ":luafile ~/.config/nvim/init.lua<CR>",   nore)
map("n", "<Leader>s",  ":set spell!<CR>",                        nore)

---- Plugin bindings
map("n", "<Leader>tt", ":NvimTreeToggle<CR>",       nore_silent)
map("n", "<Leader>tr", ":NvimTreeRefresh<CR>",      nore_silent)
map("n", "<Leader>ff", ":Telescope find_files<CR>", nore)

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
