local M = {}

function M:highlight(client)
	if client.resolved_capabilities.document_highlight then
		vim.api.nvim_exec([[
			augroup lsp_doc_highlight
				autocmd! * <buffer>
				autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
				autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
			augroup END
		]], false)
	end
end

return M
