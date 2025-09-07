-- system clipboard shortcuts
vim.keymap.set({"n", "v"}, "<Leader>y", '"+y')
vim.keymap.set({"n", "v"}, "<Leader>yy", '"+yy')
vim.keymap.set({"n", "v"}, "<Leader>p", '"+p')


local function super_escape()
	if vim.v.hlsearch == 1 then
		vim.cmd("nohls")
	elseif vim.bo.filetype == "qf" or vim.bo.filetype == "help" then
		vim.cmd("close")
	elseif vim.bo.filetype == "netrw" then
		vim.cmd("Rex")
	end
end
vim.keymap.set("n", "<Esc>", super_escape, { silent = true })
