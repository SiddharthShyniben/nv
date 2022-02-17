--[[ -- too slow
vim.cmd('silent !cd ~/.config/nvim && git fetch origin main')

local moreCommits = tonumber(vim.fn.system("cd ~/.config/nvim && git rev-list HEAD...origin/main --count"))

if moreCommits > 0 then
	print(moreCommits .. " commits behind");
	local choice = vim.fn.confirm("New Nv update detected. Install it?", "&Yes\n&no")
	if choice == 1 then
		vim.fn.system("cd ~/.config/nvim && git merge origin/main")
		print('Done.')
	end
end
--]]

local vimp = require 'vimp'

vimp.map_command('NvUpdate', function()
	vim.fn.system("cd ~/.config/nvim && git pull origin main")
end)
