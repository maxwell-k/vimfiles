-- nvim/ftplugin/lua.lua
-- Copyright 2022 Keith Maxwell
-- SPDX-License-Identifier: MPL-2.0
vim.bo.shiftwidth = 4
vim.bo.tabstop = 4 -- to match https://github.com/JohnnyMorganz/StyLua#options

require("lspconfig").sumneko_lua.setup({
	settings = { -- To avoid errors when editing neovim configuration files
		Lua = {
			runtime = { version = "LuaJIT" },
			diagnostics = { globals = { "vim", "utf8" } },
			workspace = { library = vim.api.nvim_get_runtime_file("", true) },
		},
	},
})
