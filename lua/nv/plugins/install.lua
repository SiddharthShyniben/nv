return function(options)
	vim.cmd [[packadd packer.nvim]]

	local function contains(table, element)
		for _, value in pairs(table) do
			if value == element then
				return true
			end
		end
		return false
	end

	require('packer').startup({
		function (use)
			-- packer :heart: packer
			use {'wbthomason/packer.nvim', event = 'VimEnter', disable = contains(options.disable, 'packer.nvim')}

			-- fast
			use {'lewis6991/impatient.nvim', disable = contains(options.disable, 'impatient.nvim')}

			-- theme
			use {
				'folke/tokyonight.nvim',
				config = function()
					vim.g.tokyonight_style = 'night'
					vim.g.tokyonight_italic_functions = true
					vim.cmd [[colorscheme tokyonight]]
				end,
				event = 'VimEnter',
				disable = contains(options.disable, 'tokyonight.nvim')
			}

			-- ui
			use {
				'kyazdani42/nvim-tree.lua',
				requires = {
					'kyazdani42/nvim-web-devicons', -- optional, for file icon
				},
				cmd = 'NvimTree',
				config = function() require('nvim-tree').setup {} end,
				disable = contains(options.disable, 'nvim-tree.lua')
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
				disable = contains(options.disable, 'lualine.nvim')
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
				disable = contains(options.disable, 'which-key.nvim')
			}
			use {'lewis6991/gitsigns.nvim', event = 'VimEnter', disable = contains(options.disable, 'gitsigns.nvim')}
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
				disable = contains(options.disable, 'zen-mode.nvim')
			}
			use {
				'folke/twilight.nvim',
				config = function()
					require('twilight').setup {}
				end,
				on = {'Twilight', 'TwilightEnable'},
				disable = contains(options.disable, 'twilight.nvim')
			}
			use {'tpope/vim-fugitive', disable = contains(options.disable, 'vim-fugitive')}

			-- editing
			use {'tpope/vim-surround', disable = contains(options.disable, 'vim-surround')} -- once you start using this, you cant live without it
			use {'windwp/nvim-autopairs', disable = contains(options.disable, 'nvim-autopairs')}

			-- smortness
			use {'neovim/nvim-lspconfig', disable = contains(options.disable, 'nvim-lspconfig')}
			use {'williamboman/nvim-lsp-installer', disable = contains(options.disable, 'nvim-lsp-installer')}
			use 'hrsh7th/cmp-nvim-lsp'
			use 'hrsh7th/cmp-buffer'
			use 'hrsh7th/cmp-path'
			use 'hrsh7th/cmp-cmdline'
			use 'hrsh7th/nvim-cmp'

			-- snips
			use 'L3MON4D3/LuaSnip'
			use 'saadparwaiz1/cmp_luasnip'

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
end
