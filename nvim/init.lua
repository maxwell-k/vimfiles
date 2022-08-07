-- nvim/init.lua
-- Copyright 2022 Keith Maxwell
-- SPDX-License-Identifier: MPL-2.0

-- Basic options
vim.o.hidden = false
vim.o.packpath = "~/.config/nvim"
vim.o.mouse = ""

-- Packages
require("nvim_comment").setup()
require("nvim-surround").setup()

-- Mappings
vim.api.nvim_set_keymap("n", "<Leader>w", "<C-w>", { noremap = true })

-- Language server settings
local venv = { only_local = ".venv/bin" }
local sources = {
	require("null-ls").builtins.formatting.black.with(venv),
	require("null-ls").builtins.formatting.reorder_python_imports,
	require("null-ls").builtins.formatting.stylua,
	require("null-ls").builtins.diagnostics.flake8.with(venv),
}
local augroup = vim.api.nvim_create_augroup("Init", {})
require("null-ls").setup({
	sources = sources,
	-- from https://github.com/jose-elias-alvarez/null-ls.nvim/wiki/Formatting-on-save#sync-formatting
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format({ bufnr = bufnr })
				end,
			})
		end
	end,
})
vim.api.nvim_create_autocmd("DiagnosticChanged", {
	group = augroup,
	callback = function()
		vim.diagnostic.setloclist({ open = false })
	end,
})
