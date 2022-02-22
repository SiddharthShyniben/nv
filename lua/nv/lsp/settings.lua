return {
	sumneko_lua = {
		settings = {
			Lua = {
				diagnostics = {
					globals = {'vim'}
				},
				workspace = {
					library = {
						[vim.fn.expand('$VIMRUNTIME/lua')] = true,
						[vim.fn.stdpath('config') .. lua] = true,
					}
				}
			}
		}
	},
	jsonls = {
		settings = {
			json = {
				schemas = require('schemastore').json.schemas()
			}
		}
	}
}
