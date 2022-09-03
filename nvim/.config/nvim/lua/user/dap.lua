local dap_status_ok, dap = pcall(require, "dap")
if not dap_status_ok then
	return
end

vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "DiagnosticSignError", linehl = "", numhl = "" })

dap.adapters.python = {
	type = "executable",
	command = "/home/castares/.conda/envs/debugpy/bin/python",
	args = { "-m", "debugpy.adapter" },
}

dap.configurations.python = {
	{
		-- The first three options are required by nvim-dap
		type = "python", -- the type here established the link to the adapter definition: `dap.adapters.python`
		request = "launch",
		name = "Launch file",

		-- Options below are for debugpy, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for supported options

		program = "${file}", -- This configuration will launch the current file if used.
		pythonPath = function()
			-- debugpy supports launching an application with a different interpreter then the one used to launch debugpy itself.
			-- The code below looks for a `venv` or `.venv` folder in the current directly and uses the python within.
			-- You could adapt this - to for example use the `VIRTUAL_ENV` environment variable.
			local virtual_env = os.getenv("VIRTUAL_ENV")
			local venv_path = string.format("%s/bin/python", virtual_env)
			print(venv_path)
			local conda_prefix = os.getenv("CONDA_PREFIX")
			local conda_path = string.format("%s/bin/python", conda_prefix)

			local cwd = vim.fn.getcwd()
			if vim.fn.executable(cwd .. "/venv/bin/python") == 1 then
				return cwd .. "/venv/bin/python"
			elseif vim.fn.executable(cwd .. "/.venv/bin/python") == 1 then
				return cwd .. "/.venv/bin/python"
			elseif vim.fn.executable(venv_path) == 1 then
				return venv_path
			elseif vim.fn.executable(conda_path) == 1 then
				return conda_path
			else
				return "/usr/bin/python3"
			end
		end,
	},
}

-- local dap_ui_status_ok, dapui = pcall(require, "dapui")
-- if not dap_ui_status_ok then
-- 	return
-- end
--
-- dapui.setup({
-- 	layouts = {
-- 		{
-- 			elements = {
-- 				"scopes",
-- 				"breakpoints",
-- 				"stacks",
-- 				"watches",
-- 			},
-- 			size = 40,
-- 			position = "left",
-- 		},
-- 		{
-- 			elements = {
-- 				"repl",
-- 				"console",
-- 			},
-- 			size = 10,
-- 			position = "bottom",
-- 		},
-- 	},
-- })
--
-- dap.listeners.after.event_initialized["dapui_config"] = function()
-- 	dapui.open()
-- end
--
-- dap.listeners.before.event_terminated["dapui_config"] = function()
-- 	dapui.close()
-- end
--
-- dap.listeners.before.event_exited["dapui_config"] = function()
-- 	dapui.close()
-- end
