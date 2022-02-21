vim.cmd [[packadd packer.nvim]]

require('packer').startup({
	function (use)
		-- packer :heart: packer
		use {'wbthomason/packer.nvim', event = 'VimEnter'}

		-- fast
		use {'lewis6991/impatient.nvim'}

		-- theme
		use {
			'folke/tokyonight.nvim',
			config = function()
				vim.g.tokyonight_style = 'night'
				vim.g.tokyonight_italic_functions = true
				vim.cmd [[colorscheme tokyonight]]
			end,
			event = 'VimEnter',
		}

		-- ui
		use {
			'kyazdani42/nvim-tree.lua',
			requires = {
				'kyazdani42/nvim-web-devicons', -- optional, for file icon
			},
			cmd = 'NvimTree',
			config = function() require('nvim-tree').setup {} end,
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
			event = 'VimEnter',
		}
		use {
			'folke/which-key.nvim',
			config = function()
				require('which-key').setup {
					plugins = {
						spelling = {enabled = true}
					}
				}
			end,
			event = 'VimEnter',
		}
		use {'lewis6991/gitsigns.nvim', event = 'VimEnter'}
		use {
			'folke/zen-mode.nvim',
			on = 'ZenMode',
			config = function()
				require('zen-mode').setup {
					window = {
						options = {
							signcolumn = 'no',
							number = false,
							relativenumber = false,
							cursorline = false,
							list = false,
							foldcolumn = 0
						}
					}
				}
			end,
		}
		use {
			'folke/twilight.nvim',
			config = function()
				require('twilight').setup {}
			end,
			on = {'Twilight', 'TwilightEnable'},
		}
		use {'tpope/vim-fugitive'}

		-- editing
		use {'tpope/vim-surround'} -- once you start using this, you cant live without it
		use {'windwp/nvim-autopairs'}

		-- smortness
		use {'neovim/nvim-lspconfig'}
		use {'williamboman/nvim-lsp-installer'}
		use 'hrsh7th/cmp-nvim-lsp'
		use 'hrsh7th/cmp-buffer'
		use 'hrsh7th/cmp-path'
		use 'hrsh7th/cmp-cmdline'
		use 'hrsh7th/nvim-cmp'

		-- snips
		use 'L3MON4D3/LuaSnip'
		use 'saadparwaiz1/cmp_luasnip'

		-- misc
		use 'github/copilot.vim'

		for _, plugin in pairs(options.include) do
			use(plugin)
		end
	end,
	config = {
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
