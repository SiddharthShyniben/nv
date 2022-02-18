return function(options)
	require('nv.plugins.lsp.lspconfig')(options.lsp)
	require('nv.plugins.lsp.cmp')(options.cmp)
end
