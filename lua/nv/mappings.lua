return function(options)
	options = options or {}
	local vimp = require 'vimp'

	vim.g.mapleader = options.leader or ' '

	vimp.inoremap('jk', '<ESC>')
	vimp.tnoremap('jk', '<C-\\><C-n>')

	vimp.vnoremap('>', '>gv')
	vimp.vnoremap('<', '<gv')

	vimp.nnoremap('<Esc>', ':nohlsearch<cr>')

	vimp.nnoremap('<C-j>', '<C-w>j')
	vimp.nnoremap('<C-h>', '<C-w>h')
	vimp.nnoremap({'override'}, '<C-l>', '<C-w>l')
	vimp.nnoremap('<C-k>', '<C-w>k')

	if options.elite then
		-- ELITE! no ARROOOOOOOOWWWWS!
		vimp.inoremap('<Up>', ':resize -2<CR>')
		vimp.inoremap('<Down>', ':resize +2<CR>')
		vimp.inoremap('<Left>', ':vertical resize -2<CR>')
		vimp.inoremap('<Right>', ':vertical resize +2<CR>')

		vimp.nnoremap('<Up>', ':resize -2<CR>')
		vimp.nnoremap('<Down>', ':resize +2<CR>')
		vimp.nnoremap('<Left>', ':vertical resize -2<CR>')
		vimp.nnoremap('<Right>', ':vertical resize +2<CR>')
	end

	vimp.nnoremap({expr = true}, '<TAB>', 'pumvisible() ? "\\<C-n>" : "\\<TAB>"')

	-- fast config
	vimp.nnoremap({'expr'}, '<leader>c', function()
		if vim.fn.line('$') == 1 and getline(1) == '' then
			vim.cmd[[edit ~/.nv]]
		else
			vim.cmd[[tabnew ~/.nv]]
		end
	end)
end
