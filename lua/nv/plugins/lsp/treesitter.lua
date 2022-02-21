require 'nvim-treesitter.configs'.setup {
	ensure_installed = {
		'javascript',
		'lua',
		'html',
		'css',
		'typescript',
		'bash',
		'comment',
		'jsdoc',
		'json',
		'json5',
		'markdown',
		'svelte',
		'vim',
		'yaml',
		'toml'
	},
	highlight = {
		enable = true,
	},
	textobjects = {
		select = {
			enable = true,
			lookahead = true,
			keymaps = {
				['af'] = '@function.outer',
				['if'] = '@function.inner',
				['il'] = '@loop.inner',
				['al'] = '@loop.outer',
				['i?'] = '@conditional.inner',
				['a?'] = '@conditional.outer',
				['ic'] = '@call.inner',
				['ac'] = '@call.outer',
				['ib'] = '@block.inner',
				['ab'] = '@block.outer',
				['ip'] = '@parameter.inner',
				['ap'] = '@parameter.outer'
			}
		},
		swap = {
			enable = true,
			swap_next = {
				['sp'] = '@parameter.inner',
			},
			swap_previous = {
				['Sp'] = '@parameter.inner',
			}
		},
		move = {
			enable = true,
			set_jumps = true,
			goto_next_start = {
				[']m'] = '@function.outer',
				[']]'] = '@class.outer',
			},
			goto_next_end = {
				[']M'] = '@function.outer',
				[']['] = '@class.outer',
			},
			goto_previous_start = {
				['[m'] = '@function.outer',
				['[['] = '@class.outer',
			},
			goto_previous_end = {
				['[M'] = '@function.outer',
				['[]'] = '@class.outer',
			}
		},
		lsp_interop = {
			enable = true,
			border = 'rounded',
			peek_definition_code = {
				['<leader>df'] = '@function.outer',
				['<leader>dF'] = '@class.outer',
			},
		}
	},
	playground = {
		enable = true,
	},
	refactor = {
		highlight_definitions = {
			enable = true,
		},
		highlight_current_scope = {
			enable = true,
		},
		smart_rename = {
			enable = true,
			keymaps = {
				smart_rename = 'grn'
			}
		},
		navigation = {
			enable = true,
			keymaps = {
				goto_definition = '<leader>td',
				list_definitions = '<leader>tl',
				list_definitions_toc = '<leader>tL',
				goto_next_usage = '<leader>tu',
				goto_previous_usage = '<leader>tU',
			}
		}
	}
}

local wk = require 'which-key'
wk.register({
	t = {
		name = 'treesitter',
		d = 'Definition',
		l = 'List definitions',
		L = 'List definitions in TOC',
		u = 'Go to next usage',
		U = 'Go to previous usage'
	}
}, {prefix = '<leader>'})

vim.cmd [[
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
]]
