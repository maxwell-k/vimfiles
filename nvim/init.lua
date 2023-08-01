-- nvim/init.lua
-- Copyright 2022 Keith Maxwell
-- SPDX-License-Identifier: MPL-2.0

-- Basic options
vim.o.hidden = false
vim.o.packpath = "~/.config/nvim"
vim.o.mouse = ""
vim.o.shiftwidth = 2
vim.o.softtabstop = vim.o.shiftwidth

-- Packages
require("nvim-surround").setup()

-- Mappings
vim.api.nvim_set_keymap("n", "<Leader>w", "<C-w>", { noremap = true })

-- Language server settings
local file = io.open(vim.fn.stdpath('config').."/unclassifiable-application-modules", "rb")
local modules = {}
if file ~= nil then
	for line in file:lines() do
		table.insert(modules, 1, "--unclassifiable-application-module="..line)
	end
	file:close()
end
local venv = ".venv/bin"
local sources = {
	require("null-ls").builtins.formatting.black.with({
		only_local = venv,
		extra_args = { "--skip-string-normalization" },
	}),
	require("null-ls").builtins.formatting.reorder_python_imports.with({
		extra_args = modules,
	}),
	require("null-ls").builtins.formatting.stylua,
	require("null-ls").builtins.diagnostics.flake8.with({ only_local = venv }),
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
