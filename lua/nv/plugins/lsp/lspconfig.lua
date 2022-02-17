return function(options)
	vim.cmd('sign define DiagnosticSignError text=' .. options.signs[1] .. ' texthl=DiagnosticSignError linehl=DiagnosticSignError numhl=DiagnosticSignError')
	vim.cmd('sign define DiagnosticSignWarn text=' .. options.signs[2] .. ' texthl=DiagnosticSignWarn linehl=DiagnosticSignWarn numhl=DiagnosticSignWarn')
	vim.cmd('sign define DiagnosticSignInfo text=' .. options.signs[3] .. ' texthl=DiagnosticSignInfo linehl=DiagnosticSignInfo numhl=DiagnosticSignInfo')
	vim.cmd('sign define DiagnosticSignHint text=' .. options.signs[4] .. ' texthl=DiagnosticSignHint linehl=DiagnosticSignHint numhl=DiagnosticSignHint')

	local function on_attach(_, bufnr)
		local opts = {noremap = true, silent = true}
		-- Enable completion triggered by <c-x><c-o>
		vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

		-- Mappings.
		-- See `:help vim.lsp.*` for documentation on any of the below functions
		vim.api.nvim_buf_set_keymap(bufnr, 'n', options.mappings.declaration, '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
		vim.api.nvim_buf_set_keymap(bufnr, 'n', options.mappings.definition, '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
		vim.api.nvim_buf_set_keymap(bufnr, 'n', options.mappings.hover, '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
		vim.api.nvim_buf_set_keymap(bufnr, 'n', options.mappings.implementation, '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
		vim.api.nvim_buf_set_keymap(bufnr, 'n', options.mappings.signatureHelp, '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
		vim.api.nvim_buf_set_keymap(bufnr, 'n', options.mappings.addWorkspaceFolder, '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
		vim.api.nvim_buf_set_keymap(bufnr, 'n', options.mappings.removeWorkspaceFolder, '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
		vim.api.nvim_buf_set_keymap(bufnr, 'n', options.listWorkspaceFolders, '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
		vim.api.nvim_buf_set_keymap(bufnr, 'n', options.mappings.typeDefinition, '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
		vim.api.nvim_buf_set_keymap(bufnr, 'n', options.mappings.rename, '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
		vim.api.nvim_buf_set_keymap(bufnr, 'n', options.mappings.codeAction, '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
		vim.api.nvim_buf_set_keymap(bufnr, 'n', options.mappings.references, '<cmd>lua vim.lsp.buf.references()<CR>', opts)
		vim.api.nvim_buf_set_keymap(bufnr, 'n', options.mappings.formatting, '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
	end

	local lsp_installer = require 'nvim-lsp-installer'

	local capabilities = vim.lsp.protocol.make_client_capabilities()
	capabilities.textDocument.completion.completionItem.documentationFormat = {'markdown', 'plaintext'}
	capabilities.textDocument.completion.completionItem.snippetSupport = true
	capabilities.textDocument.completion.completionItem.preselectSupport = true
	capabilities.textDocument.completion.completionItem.insertReplaceSupport = true
	capabilities.textDocument.completion.completionItem.labelDetailsSupport = true
	capabilities.textDocument.completion.completionItem.deprecatedSupport = true
	capabilities.textDocument.completion.completionItem.commitCharactersSupport = true
	capabilities.textDocument.completion.completionItem.tagSupport = {valueSet = {1}}
	capabilities.textDocument.completion.completionItem.resolveSupport = {
		properties = {
			'documentation',
			'detail',
			'additionalTextEdits',
		},
	}

	lsp_installer.settings(options.installerConfig)
	vim.diagnostic.config(options.diagnosticConfig)

	lsp_installer.on_server_ready(function(server)
		local mapOpts = {noremap = true, silent = true}
		vim.api.nvim_set_keymap('n', options.mappings.openFloat, '<cmd>lua vim.diagnostic.open_float()<CR>', mapOpts)
		vim.api.nvim_set_keymap('n', options.mappings.gotoPrev, '<cmd>lua vim.diagnostic.goto_prev()<CR>', mapOpts)
		vim.api.nvim_set_keymap('n', options.mappings.gotoNext, '<cmd>lua vim.diagnostic.goto_next()<CR>', mapOpts)
		vim.api.nvim_set_keymap('n', options.mappings.setLocList, '<cmd>lua vim.diagnostic.setloclist()<CR>', mapOpts)

		local opts = {
			on_attach = on_attach,
			capabilities = capabilities
		}

		server:setup(opts)
	end)
end
