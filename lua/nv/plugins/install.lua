vim.cmd [[packadd packer.nvim]]

require('packer').startup({
	function (use)
		-- packer :heart: packer
		use {'wbthomason/packer.nvim'}

		-- theme
		use {
			'folke/tokyonight.nvim',
			config = function()
				vim.g.tokyonight_style = 'night'
				vim.cmd [[colorscheme tokyonight]]
			end,
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
		}
		use {'lewis6991/gitsigns.nvim',
			config = function()
				require('gitsigns').setup {
					on_attach = function(bufnr)
						local gs = package.loaded.gitsigns

						local function map(mode, l, r, opts)
							opts = opts or {}
							opts.buffer = bufnr
							vim.keymap.set(mode, l, r, opts)
						end

						-- Navigation
						map('n', ']c', "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'", {expr=true})
						map('n', '[c', "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'", {expr=true})

						-- Actions
						map({'n', 'v'}, '<leader>hs', ':Gitsigns stage_hunk<CR>')
						map({'n', 'v'}, '<leader>hr', ':Gitsigns reset_hunk<CR>')
						map('n', '<leader>hS', gs.stage_buffer)
						map('n', '<leader>hu', gs.undo_stage_hunk)
						map('n', '<leader>hR', gs.reset_buffer)
						map('n', '<leader>hp', gs.preview_hunk)
						map('n', '<leader>hb', function() gs.blame_line{full=true} end)
						map('n', '<leader>tb', gs.toggle_current_line_blame)
						map('n', '<leader>hd', gs.diffthis)
						map('n', '<leader>hD', function() gs.diffthis('~') end)
						map('n', '<leader>td', gs.toggle_deleted)

						-- Text object
						map({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
					end
				}
			end
		}
		use {'lukas-reineke/indent-blankline.nvim', config = function()
			require("indent_blankline").setup {
				show_current_context = true,
			}
			vim.cmd [[highlight IndentBlanklineChar guifg=#414868]]
		end}
		use {
			'nvim-telescope/telescope.nvim',
			requires = {{'nvim-lua/plenary.nvim'}}
		}

		-- editing
		use {'tpope/vim-surround'} -- once you start using this, you cant live without it
		use {'tpope/vim-surround'}
		use {'tpope/vim-commentary'}
		use {'tpope/vim-ragtag'}
		use {'tpope/vim-repeat'}
		use {'tpope/vim-unimpaired'}
		use {'tpope/vim-vinegar'}
		use {'tpope/vim-endwise'}
		use 'tpope/vim-fugitive'
		use {'windwp/nvim-autopairs'}

		-- smortness
		use {'neovim/nvim-lspconfig'}
		use {'williamboman/nvim-lsp-installer'}
		use {'hrsh7th/cmp-nvim-lsp'}
		use {'hrsh7th/cmp-buffer'}
		use {'hrsh7th/cmp-path'}
		use {'hrsh7th/cmp-cmdline'}
		use {'hrsh7th/nvim-cmp'}

		-- snips
		use {'L3MON4D3/LuaSnip'}
		use {'saadparwaiz1/cmp_luasnip'}

		-- misc
		use {'jiangmiao/auto-pairs'}
		use {'github/copilot.vim'}
		use {'yuttie/comfortable-motion.vim'}
		use {'mattn/emmet-vim'}
		use {'wakatime/vim-wakatime'}
		use {'christoomey/vim-tmux-navigator'}

		
		-- treesitter
		use {
			'nvim-treesitter/nvim-treesitter',
			run = ':TSUpdate'
		}
		use {'nvim-treesitter/nvim-treesitter-textobjects'}
		use {'nvim-treesitter/nvim-treesitter-refactor'}
		use {'nvim-treesitter/nvim-treesitter-angular'}
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
