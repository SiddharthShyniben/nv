local cmp = require 'cmp'

local kindIcons = {
	Class = " ",
	Color = " ",
	Constant = "ﲀ ",
	Constructor = " ",
	Enum = "練",
	EnumMember = " ",
	Event = " ",
	Field = " ",
	File = "",
	Folder = " ",
	Function = " ",
	Interface = "ﰮ ",
	Keyword = " ",
	Method = " ",
	Module = " ",
	Operator = "",
	Property = " ",
	Reference = " ",
	Snippet = " ",
	Struct = " ",
	Text = " ",
	TypeParameter = " ",
	Unit = "塞",
	Value = " ",
	Variable = " ",
}

cmp.setup {
	fields = {'kind', 'abbr', 'menu'},
	format = function(entry, vimItem)
		vimItem.kind = string.format('%s', kindIcons[vimItem.kind])
		vimItem.menu = ({
			nvim_lsp = '[LSP]',
			luasnip = '[Snippet]',
			buffer = '[Buffer]',
			path = '[Path]',
		})[entry.source.name] or ''
		return vimItem
	end,
	snippet = {
		expand = function(args)
			require('luasnip').lsp_expand(args.body)
		end
	},
	confirm_opts = {
		behaviour = cmp.ConfirmBehavior.replace,
		select = false
	},
	documentation = {
		border = {'╭', '─', '╮', '│', '╯', '─', '╰', '│'},
	},
	mapping = {
		['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), {'i', 'c'}),
		['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), {'i', 'c'}),
		['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), {'i', 'c'}),
		['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
		['<C-e>'] = cmp.mapping({
			i = cmp.mapping.abort(),
			c = cmp.mapping.close(),
		}),
		['<CR>'] = cmp.mapping.confirm({select = true}), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
	},
	sources = cmp.config.sources({
		{name = 'nvim_lsp'},
		{name = 'luasnip'},
		{name = 'buffer'},
		{name = 'nvim_lua'}
	})
}

cmp.setup.filetype('gitcommit', {
	sources = cmp.config.sources({
		{name = 'buffer'},
	})
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
	sources = {
		{name = 'buffer'}
	}
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
	sources = cmp.config.sources({
		{name = 'path'},
		{name = 'cmdline'}
	})
})
