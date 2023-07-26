local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

-- General Settings
local general = augroup("General Settings", { clear = true })

autocmd('CmdlineEnter', {
    pattern = '/,?',
    group = general,
    command = ':silent set hlsearch'
})
autocmd('CmdlineLeave', {
    pattern = '/,?',
    group = general,
    command = ':silent set nohlsearch'
})

autocmd("TermOpen", {
    callback = function()
        vim.opt_local.relativenumber = false
        vim.opt_local.number = false
        vim.cmd "startinsert!"
    end,
    group = general,
    desc = "Terminal Options",
})

autocmd("TextYankPost", {
    callback = function()
        require("vim.highlight").on_yank { higroup = "YankHighlight", timeout = 200 }
    end,
    group = general,
    desc = "Highlight when yanking",
})

autocmd("BufEnter", {
    callback = function()
        vim.opt.formatoptions:remove { "c", "r", "o" }
    end,
    group = general,
    desc = "Disable New Line Comment",
})

autocmd("FileType", {
    pattern = { "c", "cpp", "py", "java", "cs" },
    callback = function()
        vim.bo.shiftwidth = 4
    end,
    group = general,
    desc = "Set shiftwidth to 4 in these filetypes",
})

autocmd({ "BufWinLeave", "BufLeave", "InsertLeave", "InsertEnter", "FocusLost" }, {
    callback = function()
        vim.cmd "silent! w"
    end,
    group = general,
    desc = "Auto Save when leaving/entering insert mode, buffer or window",
})

autocmd("BufWritePost", {
    pattern = "*.lua",
    callback = function()
        vim.cmd "source <afile>"
    end,
    group = general,
    desc = "Automatically source vim/lua file whenever you save it",
})
