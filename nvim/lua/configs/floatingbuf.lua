--https://github.com/tjdevries/advent-of-nvim/blob/master/nvim/plugin/floaterminal.lua

-- in terminal mode, double escape puts us in normal mode again
vim.keymap.set("t", "<esc><esc>", "<c-\\><c-n>")

local terminal_state = {
    floating = {
        buf = -1,
        win = -1,
    }
}

local buffer_state = {
    floating = {
        buf = -1,
        win = -1,
    }
}

local function create_floating_window(opts)
    opts = opts or {}
    local width = opts.width or math.floor(vim.o.columns * 0.8)
    local height = opts.height or math.floor(vim.o.lines * 0.8)

    -- Calculate the position to center the window
    local col = math.floor((vim.o.columns - width) / 2)
    local row = math.floor((vim.o.lines - height) / 2)

    -- Create a buffer
    local buf = nil
    if vim.api.nvim_buf_is_valid(opts.buf) then
        buf = opts.buf
    else
        buf = vim.api.nvim_create_buf(false, true) -- No file, scratch buffer
    end

    -- Define window configuration
    local win_config = {
        relative = "editor",
        width = width,
        height = height,
        col = col,
        row = row,
        style = "minimal", -- No borders or extra UI elements
        border = "rounded",
    }

    -- Create the floating window
    local win = vim.api.nvim_open_win(buf, true, win_config)

    return { buf = buf, win = win }
end

local toggle_floating_terminal = function()
    if not vim.api.nvim_win_is_valid(terminal_state.floating.win) then
        terminal_state.floating = create_floating_window { buf = terminal_state.floating.buf }
        if vim.bo[terminal_state.floating.buf].buftype ~= "terminal" then
            vim.cmd.terminal()
        end
    else
        vim.api.nvim_win_hide(terminal_state.floating.win)
    end
end

local toggle_floating_buffer = function()
    if not vim.api.nvim_win_is_valid(buffer_state.floating.win) then
        buffer_state.floating = create_floating_window { buf = buffer_state.floating.buf }
    else
        vim.api.nvim_win_hide(buffer_state.floating.win)
    end
end

-- New Commands
vim.api.nvim_create_user_command("FloatingTerminal", toggle_floating_terminal, {})
vim.api.nvim_create_user_command("FloatingBuffer", toggle_floating_buffer, {})

-- Keymappings
vim.keymap.set({ "n", "t" }, "<leader>tt", "<cmd>FloatingTerminal<CR>",
    { desc = "Toggle floating terminal" })

vim.keymap.set({ "n", "t" }, "<leader>tb", "<cmd>FloatingBuffer<CR>",
    { desc = "Toggle floating buffer" })
