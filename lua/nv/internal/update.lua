local shouldUpdate = false;

-- git fetch
vim.cmd[[silent !cd ~/.config/nvim && git fetch origin main]]

-- rev-parse
local moreCommits = tonumber(vim.fn.system("cd ~/.config/nvim && git rev-list HEAD...origin/main --count"))

if moreCommits > 0 then
	local choice = vim.fn.confirm("New Nv update detected. Install it?", "&Yes\n&no")
	print(choice)

	if choice == 0 then
		-- vim.fn.system("cd ~/.config/nvim && git merge origin/main")
	end
end
