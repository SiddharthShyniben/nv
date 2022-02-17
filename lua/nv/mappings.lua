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
	vimp.nnoremap('<C-l>', '<C-w>l')
	vimp.nnoremap('<C-k>', '<C-w>k')

	vimp.tnoremap('<C-j>', '<C-w>j')
	vimp.tnoremap('<C-h>', '<C-w>h')
	vimp.tnoremap('<C-l>', '<C-w>l')
	vimp.tnoremap('<C-k>', '<C-w>k')

	if options.eliteMode then
		-- ELITE! no ARROOOOOOOOWWWWS!
		vimp.nnoremap('<Up>', ':resize -2<CR>')
		vimp.nnoremap('<Down>', ':resize +2<CR>')
		vimp.nnoremap('<Left>', ':vertical resize -2<CR>')
		vimp.nnoremap('<Right>', ':vertical resize +2<CR>')
	end

	vimp.nnoremap({expr = true}, '<TAB>', 'pumvisible() ? "\\<C-n>" : "\\<TAB>"')
end
