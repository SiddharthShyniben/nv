local shouldUpdate = false;

-- git fetch
vim.cmd[[!cd ~/.config.nvim && git fetch origin main]]

-- rev-parse
local moreCommits = tonumber(vim.api.nvim_exec('echo system("cd ~/.config/nvim && git rev-list HEAD...origin/main --count")', true))

if moreCommits > 0 then
	local choice = vim.api.nvim_exec('confirm("New Nv update detected. Install it?", "&Yes\n&no")', true)

	if choice == 1 then
		vim.api.nvim_exec('system("cd ~/.config/nvim && git merge origin/main")', false)
	end
end
