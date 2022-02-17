vim.cmd [[packadd packer.nvim]]

require('packer').startup({
	function (use)
		-- packer :heart: packer
		use {'wbthomason/packer.nvim', event = 'VimEnter'}

		-- fast
		use 'lewis6991/impatient.nvim'

		-- theme
		use {
			'folke/tokyonight.nvim',
			config = function()
				vim.g.tokyonight_style = 'night'
				vim.g.tokyonight_italic_functions = true
				vim.cmd [[colorscheme tokyonight]]
			end,
			event = 'VimEnter'
		}

		-- ui
		use {
			'kyazdani42/nvim-tree.lua',
			requires = {
				'kyazdani42/nvim-web-devicons', -- optional, for file icon
			},
			cmd = 'NvimTree',
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
			end,
			event = 'VimEnter'
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
			end,
			event = 'VimEnter'
		}
		use {'lewis6991/gitsigns.nvim', event = 'VimEnter'}
		-- Lua
		use {
			'folke/zen-mode.nvim',
			on = 'ZenMode',
			config = function()
				require('zen-mode').setup {}
			end
		}
		use {
			'folke/twilight.nvim',
			config = function()
				require('twilight').setup {}
			end,
			on = {'Twillight', 'TwilightEnable'}
		}
	end,
	config = {
		profile = {
			enable = true,
			threshold = 5
		},
		display = {
			open_fn = function()
				return require('packer.util').float({
					style = 'minimal',
					border = 'none'
				})
			end
		}
	}
})
