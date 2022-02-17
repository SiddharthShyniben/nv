local function merge(a, b)
	for k, v in pairs(b) do a[k] = v end
	return a
end

return function(options)
	options = options.mappings

	local function makeMap(mode, overOpt)
		overOpt = overOpt or {}
		return function(lhs, rhs, opt)
			opt = opt or {}
			opt = merge(overOpt, opt)
			vim.api.nvim_set_keymap(mode, lhs, rhs, opt)
		end
	end

	local inoremap = makeMap('i', {noremap = true})
	local tnoremap = makeMap('t', {noremap = true})
	local vnoremap = makeMap('v', {noremap = true})
	local nnoremap = makeMap('n', {noremap = true})

	vim.g.mapleader = options.leader

	inoremap('jk', '<ESC>')
	tnoremap('jk', '<C-\\><C-n>')

	vnoremap('>', '>gv')
	vnoremap('<', '<gv')

	nnoremap('<Esc>', ':nohlsearch<cr>')

	nnoremap('<C-j>', '<C-w>j')
	nnoremap('<C-h>', '<C-w>h')
	nnoremap('<C-l>', '<C-w>l')
	nnoremap('<C-k>', '<C-w>k')

	if options.elite then
		-- ELITE! no ARROOOOOOOOWWWWS!
		inoremap('<Up>', '<esc>:resize +2<CR>i')
		inoremap('<Down>', '<esc>:resize -2<CR>i')
		inoremap('<Left>', '<esc>:vertical resize +2<CR>i')
		inoremap('<Right>', '<esc>:vertical resize -2<CR>i')
	end

	nnoremap('<Up>', ':resize +2<CR>')
	nnoremap('<Down>', ':resize -2<CR>')
	nnoremap('<Left>', ':vertical resize +2<CR>')
	nnoremap('<Right>', ':vertical resize -2<CR>')

	nnoremap('<TAB>', 'pumvisible() ? "\\<C-n>" : "\\<TAB>"', {expr = true})

	for _, mapping in ipairs(options.customMaps) do
		vim.api.nvim_set_keymap(mapping.mode, mapping.lhs, mapping.rhs, mapping.opts)
	end

	local wk = require 'which-key'

	wk.register({
		c = {
			function()
				if vim.fn.line('$') == 1 and vim.fn.getline(1) == '' then
					vim.cmd[[edit ~/.config/nvim/lua/nv/config.lua]]
				else
					vim.cmd[[tabnew ~/.config/nvim/lua/nv/config.lua]]
				end
			end,
			'Edit Nv configuration'
		}
	}, {prefix = '<leader>'})
end
