-- ==========================================================================================
--                      nvim-dap Plugin Configuration
-- ==========================================================================================

local dap = require("dap")
local dapui = require("dapui")
local nvim_dap_virtaul_text = require("nvim-dap-virtual-text")
local dap_python = require("dap-python")
local opts = { noremap = true }

dapui.setup({})
nvim_dap_virtaul_text.setup({
    commented = true, -- Show virtual text alongside comment
})

dap_python.setup("uv")
dap.configurations.python = {
    {
        type = "python",
        request = "launch",
        name = "Launch file",
        program = "${file}",
        console = "integratedTerminal",
    }
}

vim.fn.sign_define("DapBreakpoint", {
    text = "",
    texthl = "DiagnosticSignError",
    linehl = "",
    numhl = "",
})

vim.fn.sign_define("DapBreakpointRejected", {
    text = "", -- or "❌"
    texthl = "DiagnosticSignError",
    linehl = "",
    numhl = "",
})

vim.fn.sign_define("DapStopped", {
    text = "", -- or "→"
    texthl = "DiagnosticSignWarn",
    linehl = "Visual",
    numhl = "DiagnosticSignWarn",
})

-------------------------------------------------
-- Automatically open/close DAP UI
-------------------------------------------------

dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
end


-------------------------------------------------
-- DAP Keymaps
-------------------------------------------------

vim.keymap.set("n", "<Leader>?", function() require("dapui").eval(nil, { enter = true }) end)          -- Eval Variable under Cursor

vim.keymap.set("n", "<F5>", function() require("dap").continue() end, opts)                            -- Continue / Start
vim.keymap.set("n", "<F6>", function() require("dap").step_into() end, opts)                           -- Step Into
vim.keymap.set("n", "<F7>", function() require("dap").step_over() end, opts)                           -- Step Over
vim.keymap.set("n", "<F8>", function() require("dap").step_out() end)
vim.keymap.set("n", "<Leader>b", function() require("dap").toggle_breakpoint() end, opts)              -- Toggle Breakpoint
vim.keymap.set("n", "<Leader>db",
    function() require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: ")) end, opts) -- Log Breakpoint Message
vim.keymap.set("n", "<Leader>dr", function() require("dap").repl.open() end, opts)                     -- Open Repl
vim.keymap.set("n", "<Leader>dl", function() require("dap").run_last() end, opts)                      -- Run Last
vim.keymap.set("n", "<Leader>df",
    function()
        local widgets = require("dap.ui.widgets")
        widgets.centered_float(widgets.frames)
    end, opts) -- Show DAP Frame Widget
vim.keymap.set("n", "<Leader>ds",
    function()
        local widgets = require("dap.ui.widgets")
        widgets.centered_float(widgets.scopes)
    end, opts)                                                                     -- Show DAP Scopes Widget
vim.keymap.set("n", "<Leader>dt", function() require("dap").terminate() end, opts) -- Terminate Dedugging
vim.keymap.set("n", "<Leader>du", function() dapui.toggle() end, opts)             -- Toggle DAP UI
