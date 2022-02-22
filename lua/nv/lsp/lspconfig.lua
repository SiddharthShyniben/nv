local signs = {
	{name = 'DiagnosticSignError', text = '✗'},
	{name = 'DiagnosticSignWarning', text = ''},
	{name = 'DiagnosticSignInfo', text = 'כֿ'},
	{name = 'DiagnosticSignHint', text = ''},
}

vim.diagnostic.config({
	virtual_text = false,
	signs = true,
	update_in_insert = true,
	underline = true,
	severity_sort = true,
	float = {
		focusable = false,
		style = 'minimal',
		border = 'rounded',
		source = 'always',
		header = '',
		prefix = ''
	}
})

vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, {border = 'rounded'})
vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, {border = 'rounded'})

for _, sign in ipairs(signs) do
	vim.fn.sign_define(sign.name, {text = sign.text, texthl = sign.name, numhl = sign.name})
end
