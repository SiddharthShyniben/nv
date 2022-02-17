vim.cmd [[packadd packer.nvim]]

require('packer').startup({
	function (use)
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

		-- ui
		use {
			'kyazdani42/nvim-tree.lua',
			requires = {
				'kyazdani42/nvim-web-devicons', -- optional, for file icon
			},
			config = function() require('nvim-tree').setup {} end
		}
		use {
			'nvim-lualine/lualine.nvim',
			requires = { 'kyazdani42/nvim-web-devicons', opt = true },
			config = function()
				require('lualine').setup({
					options = {
						theme = 'tokyonight'
					}
				})
			end
		}
		use {
			'folke/which-key.nvim',
			config = function()
				require('which-key').setup {
					plugins = {
						spelling = {enabled = true}
					},
					-- TODO: operators for comment
				}
			end
		}

	end,
	config = {
		display = {
			open_fn = function()
				return require('packer.util').float({
					style = 'minimal'
				})
			end
		}
	}
})
