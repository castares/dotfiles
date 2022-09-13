local dap_status_ok, dap = pcall(require, "dap")
if not dap_status_ok then
	return
end

vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "DiagnosticSignError", linehl = "", numhl = "" })
vim.fn.sign_define("DapBreakpointRejected", { text = "🟦", texthl = "", linehl = "", numhl = "" })
vim.fn.sign_define("DapStopped", { text = "⭐️", texthl = "", linehl = "", numhl = "" })

local home = os.getenv("HOME")

require("dap-python").setup(home .. "/.conda/envs/debugpy/bin/python")

local dap_ui_status_ok, dapui = pcall(require, "dapui")
if not dap_ui_status_ok then
	return
end

dapui.setup({
	layouts = {
		{
			elements = {
				"scopes",
				"breakpoints",
				"console",
			},
			size = 50,
			position = "right",
		},
		{
			elements = {
				"repl",
			},
			size = 20,
			position = "bottom",
		},
	},
})

dap.listeners.after.event_initialized["dapui_config"] = function()
	dapui.open()
end

dap.listeners.before.event_terminated["dapui_config"] = function()
	dapui.close()
end

dap.listeners.before.event_exited["dapui_config"] = function()
	dapui.close()
end
