local settings = require 'nv.lsp.settings'
local lsp_installer = require 'nvim-lsp-installer'
local highlight = require('nv.lsp.util').highlight
local mappings = require 'nv.lsp.mappings'

local function on_attach(_, bufnr)
	local opts = {noremap = true, silent = true}
	vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

	mappings(bufnr)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

lsp_installer.on_server_ready(function(server)
	local opts = {
		on_attach = on_attach,
		capabilities = capabilities
	}

	if settings[server.name] then
		opts = vim.tbl_deep_extend('force', settings[server.name], opts)
	end

	highlight(client)
	server:setup(opts)
end)

lsp_installer.settings({
	ui = {
		icons = {
			server_installed = '✓',
			server_pending = '➜',
			server_uninstalled = '✗'
		}
	}
})
