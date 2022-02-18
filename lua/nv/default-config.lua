local defaultConfig = {
	-- config related to keymaps
	mappings = {
		leader = ' ', -- map leader
		elite = false, -- changes arrow key mappings for insert mode
		whichkey = true, -- whether to use whichkey plugin
		customMaps = { -- array of objects
			-- sample:
			-- {mode = 'i', lhs = '<Up>', rhs = ':resize +2<cr>', opts = {noremap = true, silent = true}}
		}
	},

	-- set more options
	options = {
		-- 'modeline',
		-- 'noautoread'
	},

	-- config related to plugins
	plugins = {
		-- Add plugins you want to disable here
		disable = {
			-- 'which-key.nvim', 'zen-mode.nvim'
		},
		-- add extra plugins you want to add here
		include = {
			-- 'ms-jpq/coq_nvim', '/path/to/plugin', {'plugin', ...more complex conf}
		}
	},

	-- config related to lsp
	lsp = {
		-- signs
		signs = {'', '', '', ''},
		-- options passed to lsp-installer.nvim
		installerConfig = {
			ui = {
				icons = {
					server_installed = '✓',
					server_pending = '➜',
					server_uninstalled = '✗'
				}
			}
		},
		-- diagnostic config
		diagnosticConfig = {
			virtual_text = {
				format = function (diagnostic)
					local signs = {'', '', '', ''}
					return string.format(
						'%s %s (%s)',
						signs[diagnostic.severity],
						diagnostic.message,
						diagnostic.source
					)
				end
			}
		},
		-- mappings when an lsp is active
		mappings = {
			declaration = 'gD',
			definition = 'gd',
			hover = 'K',
			implementation = 'gi',
			signature = '<C-k>',
			addWorkspaceFolder = '<leader>wa',
			removeWorkspaceFolder = '<leader>wr',
			listWorkspaceFolders = '<leader>wl',
			typeDefinition = '<leader>D',
			rename = '<leader>rn',
			codeAction = '<leader>ca',
			references = 'gr',
			formatting = '<leader>f',
			openFloat = '<leader>e',
			gotoPrev = '[d',
			gotoNext = ']d',
			setLocList = '<leader>q'
		}
	}
}

return defaultConfig
