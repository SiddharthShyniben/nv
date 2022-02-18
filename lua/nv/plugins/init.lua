return function(options)
	require('nv.plugins.install')(options.plugins)
	require('nv.plugins.lsp')(options)
end
