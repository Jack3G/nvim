-- langserver-config.lua


-- sumneko/lua-language-server

-- local system_name
-- if vim.fn.has("mac") == 1 then
-- 	system_name = "macOS"
-- elseif vim.fn.has("unix") == 1 then
-- 	system_name = "Linux"
-- elseif vim.fn.has('win32') == 1 then
-- 	system_name = "Windows"
-- else
-- 	print("Unsupported system for sumneko")
-- end

-- local sumneko_root_path = "~/Programs/langservers/lua-language-server"
-- local sumneko_binary = sumneko_root_path.."/bin/"..system_name.."/lua-language-server"

-- require("lspconfig").sumneko_lua.setup({
-- 	cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"};
-- 	settings = {
-- 		Lua = {
-- 			runtime = {
-- 				version = 'LuaJIT',
-- 				path = vim.split(package.path, ';'),
-- 			},
-- 			diagnostics = {
-- 				globals = {'vim'},
-- 			},
-- 			workspace = {
-- 				-- Make the server aware of Neovim runtime files
-- 				library = {
-- 					[vim.fn.expand('$VIMRUNTIME/lua')] = true,
-- 					[vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
-- 				},
-- 			},
-- 			telemetry = {
-- 				enable = false,
-- 			},
-- 		},
-- 	},
-- })


-- Rust language server

-- require("lspconfig").rls.setup({
-- 	settings = {
-- 		rust = {
-- 		}
-- 	}
-- })

