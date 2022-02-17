vim.cmd [[packadd packer.nvim]]

require('packer').startup(function (use)
	-- packer :heart: packer
	use 'wbthomason/packer.nvim'

	-- theme
	use {
		'folke/tokyonight.nvim',
		config = function()
			vim.g.tokyonight_style = 'night'
			vim.g.tokyonight_italic_functions = true
			vim.cmd [[colorscheme tokyonight]]
		end
	}

	-- mappings
	use 'svermeulen/vimpeccable'
end)
