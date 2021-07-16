local global = require("config.global")
if global.is_windows then
	-- 静默执行
	vim.api.nvim_command("autocmd InsertLeave * silent! execute '!'.$LOCALAPPDATA.'/nvim/utils/im-select.exe 1033' ")
end 
