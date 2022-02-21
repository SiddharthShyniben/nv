local function merge(a, b)
	for k, v in pairs(b) do a[k] = v end
	return a
end

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

vim.g.mapleader = ' '

inoremap('jk', '<ESC>')
tnoremap('jk', '<C-\\><C-n>')

vnoremap('>', '>gv')
vnoremap('<', '<gv')

nnoremap('<Esc>', ':nohlsearch<cr>')

nnoremap('<C-j>', '<C-w>j')
nnoremap('<C-h>', '<C-w>h')
nnoremap('<C-l>', '<C-w>l')
nnoremap('<C-k>', '<C-w>k')

if false then -- ELITE! no ARROOOOOOOOWWWWS!
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

local wk = require 'which-key'

wk.register({
	c = {
		function()

		end,
		'Edit Nv configuration'
	}
}, {prefix = '<leader>'})
