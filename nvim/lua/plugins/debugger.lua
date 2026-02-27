return {
    {
        -- https://github.com/mfussenegger/nvim-dap
        "mfussenegger/nvim-dap",
        dependencies = {
            "mfussenegger/nvim-dap-python",
            "rcarriga/nvim-dap-ui",
            "nvim-neotest/nvim-nio",
        },
        config = function()
            local dap = require("dap")
            local dapui = require("dapui")
            local dap_python = require("dap-python")

            ---- load venv interpreter in the root project directory
            local function project_python()
                local cwd = vim.fn.getcwd()
                local venv = os.getenv("VIRTUAL_ENV") or os.getenv("CONDA_PREFIX")

                if venv and vim.fn.executable(venv .. "/bin/python") == 1 then
                    return venv .. "/bin/python"
                end

                if vim.fn.executable(cwd .. "/.venv/bin/python") == 1 then
                    return cwd .. "/.venv/bin/python"
                end

                if vim.fn.executable(cwd .. "/venv/bin/python") == 1 then
                    return cwd .. "/venv/bin/python"
                end

                return vim.fn.exepath("python3")
            end

            ---- make breakpoints visible
            vim.opt.signcolumn = "yes:2"
            vim.fn.sign_define("DapBreakpoint", {
                text = "●",
                texthl = "DiagnosticSignError",
                linehl = "DapBreakpointLine",
                numhl = "DapBreakpointNum",
            })

            vim.fn.sign_define("DapBreakpointCondition", {
                text = "◆",
                texthl = "DiagnosticSignWarn",
                linehl = "DapBreakpointLine",
                numhl = "DapBreakpointNum",
            })

            vim.fn.sign_define("DapStopped", {
                text = "▶",
                texthl = "DiagnosticSignInfo",
                linehl = "DapStoppedLine",
                numhl = "DapStoppedNum",
            })

            vim.api.nvim_set_hl(0, "DapBreakpointLine", { bg = "#3a1f24" })
            vim.api.nvim_set_hl(0, "DapBreakpointNum", { fg = "#ff6b6b", bold = true })
            vim.api.nvim_set_hl(0, "DapStoppedLine", { bg = "#1f2f3a" })
            vim.api.nvim_set_hl(0, "DapStoppedNum", { fg = "#4fc3f7", bold = true })

            --dap_python.setup('~/.local/share/nvim/mason/packages/debugpy/venv/bin/python')
            --dap_python.setup('/usr/local/bin/python3')
            dap_python.setup('/Library/Frameworks/Python.framework/Versions/3.10/bin/python3')

            -- override configurations if you want
            dap.configurations.python = {
                {
                    --type = 'debugpy',
                    type = 'python',
                    request = 'launch',
                    name = "Launch file",
                    program = "${file}",
                    pythonPath = project_python,
                },
            }


            --dapui.setup()
            dap.listeners.after.event_initialized["dapui_config"] = function()
                dapui.open()
            end
            dap.listeners.before.event_terminate["dapui_config"] = function()
                dapui.close()
            end
            dap.listeners.before.event_exited["dapui_config"] = function()
                dapui.close()
            end
            dapui.setup()

            --vim.keymap.set("n", "<leader>db", ":DapToggleBreakpoint<CR>", {})
            --vim.keymap.set("n", "<leader>dn", dap.new, {})
            vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, {})
            vim.keymap.set("n", "<leader>dc", dap.continue, {})
            vim.keymap.set("n", "<leader>dC", dap.disconnect, {})
            vim.keymap.set("n", "<leader>do", dap.step_over, {})
            vim.keymap.set("n", "<leader>di", dap.step_into, {})
            vim.keymap.set("n", "<leader>dO", dap.step_out, {})
            vim.keymap.set("n", "<leader>dt", dapui.toggle, {})
        end

        ---- make dap breakpoints visible


    },
    {
        "mfussenegger/nvim-dap-python",
        ft = "python",
        dependencies = {
            "mfussenegger/nvim-dap",
            "rcarriga/nvim-dap-ui",
        },



        --config = function(_, opts)
        ----local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
        ----require("dap-python").setup(path)
        --end
    },
    {
        "rcarriga/nvim-dap-ui",
        dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
        config = function()
            ---- PYTHON
            --dap.adapters.python = function(cb, config)
            --if config.request == 'attach' then
            -----@diagnostic disable-next-line: undefined-field
            --local port = (config.connect or config).port
            -----@diagnostic disable-next-line: undefined-field
            --local host = (config.connect or config).host or '127.0.0.1'
            --cb({
            --type = 'server',
            --port = assert(port, '`connect.port` is required for a python `attach` configuration'),
            --host = host,
            --options = {
            --source_filetype = 'python',
            --},
            --})
            --else
            --cb({
            --type = 'executable',
            --command = 'path/to/virtualenvs/debugpy/bin/python',
            --args = { '-m', 'debugpy.adapter' },
            --options = {
            --source_filetype = 'python',
            --},
            --})
            --end
            --end
            --dap.configurations.python = {
            --{
            ---- The first three options are required by nvim-dap
            --type = 'python', -- the type here established the link to the adapter definition: `dap.adapters.python`
            --request = 'launch',
            --name = "Launch file",

            ---- Options below are for debugpy, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for supported options

            --program = "${file}", -- This configuration will launch the current file if used.
            --pythonPath = function()
            ---- debugpy supports launching an application with a different interpreter then the one used to launch debugpy itself.
            ---- The code below looks for a `venv` or `.venv` folder in the current directly and uses the python within.
            ---- You could adapt this - to for example use the `VIRTUAL_ENV` environment variable.
            --local cwd = vim.fn.getcwd()
            --if vim.fn.executable(cwd .. '/venv/bin/python') == 1 then
            --return cwd .. '/venv/bin/python'
            --elseif vim.fn.executable(cwd .. '/.venv/bin/python') == 1 then
            --return cwd .. '/.venv/bin/python'
            --else
            --return '/usr/bin/python'
            --end
            --end,
            --},
            --}
        end
    }

}
