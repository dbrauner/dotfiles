require('plugins')
require('lspsetup')
require('keymaps')
require('options')
require('syntax')

vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.formatting_sync()]]


-- what color do you feel like today?
vim.g.catppuccin_flavour = "frappe" -- latte, frappe, macchiato, mocha
vim.cmd [[colorscheme catppuccin]]

local augroup = vim.api.nvim_create_augroup('vimrc-incsearch-highlight', {clear = true })

vim.api.nvim_create_autocmd('CmdlineEnter', {
    pattern = '/,?' ,
    group = augroup,
    command = ':silent set hlsearch'
})
vim.api.nvim_create_autocmd('CmdlineLeave', {
    pattern = '/,?' ,
    group = augroup,
    command = ':silent set nohlsearch'
})

-- airline configuration
-- vim.g['airline_powerline_fonts'] = 1
-- vim.g['airline#extensions#tabline#enabled'] = 1
-- vim.g['airline#extensions#tabline#fnamemod'] = ':t'
require('lualine').setup {
  tabline = {
    lualine_a = {'buffers'},
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {'tabs'},
  },
  }

 -- require'tabline'.setup {
 -- }

-- Enables auto-save when leaving insert. dirty trick but I like 
vim.api.nvim_create_autocmd('InsertLeave', {
    pattern = '*',
    command = "if &readonly==0 && filereadable(bufname('%')) | silent update | endif"
})

