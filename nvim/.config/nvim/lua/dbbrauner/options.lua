local options = {
    backup = false,                                  -- creates a backup file
    completeopt = { 'menu', 'menuone', 'noselect' }, -- mostly just for cmp
    expandtab = true,
    fileencoding = "utf-8",                          -- the encoding written to a file
    foldlevel = 99,
    foldmethod = 'indent',
    ignorecase = true, -- ignore case in search patterns
    mouse = 'a',
    nu = true,
    shell = 'zsh',
    syntax = 'on',
    shiftwidth = 4,
    showmode = false, -- we're using airline for the mode
    smartcase = true,
    smartindent = true,
    softtabstop = 4,
    colorcolumn = '120',
    splitbelow = true, -- force all horizontal splits to go below current window
    splitright = true, -- force all vertical splits to go to the right of current window
    swapfile = false,
    tabstop = 4,
    termguicolors = true, -- should get a better range of colors (disable if anything is looking weird)
    undodir = os.getenv("HOME") .. '/undodir',
    undofile = true,      -- uses the undo folder with forever backups
}
set_option(options)

vim.g.mapleader = " "
