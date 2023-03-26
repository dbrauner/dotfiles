-- Navigation
vim.api.nvim_set_keymap('n', '<c-P>',
    "<cmd>lua require('fzf-lua').files()<CR>",
    { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<c-G>',
    "<cmd>lua require('fzf-lua').live_grep()<CR>",
    { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<c-B>',
    "<cmd>lua require('fzf-lua').buffers()<CR>",
    { noremap = true, silent = true })

-- split navigations
vim.keymap.set('n', '<C-J>', '<C-W><C-J>')
vim.keymap.set('n', '<C-K>', '<C-W><C-K>')
vim.keymap.set('n', '<C-L>', '<C-W><C-L>')
vim.keymap.set('n', '<C-H>', '<C-W><C-H>')

-- copy the whole line
vim.keymap.set('n', 'Y', 'y$')

-- Keeping it centered
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')
vim.keymap.set('n', 'J', 'mzJ`z')

-- Create some undo breakpoints
vim.keymap.set('n', ',', ',<c-g>u')
vim.keymap.set('n', '.', '.<c-g>u')
vim.keymap.set('n', '!', '!<c-g>u')
vim.keymap.set('n', '?', '?<c-g>u')

-- shortcuts to edit and reload neovim config
vim.keymap.set('n', '<leader>ev', ':e $MYVIMRC<CR>', { silent = true })
vim.keymap.set('n', '<leader>sv', ':luafile $MYVIMRC<CR>', { silent = true })

-- Better copy
vim.cmd([[autocmd TextYankPost * if v:event.operator is 'y' && v:event.regname is '' | execute 'OSCYankReg "' | endif]])

-- Press F5 to auto-insert current timestamp
vim.keymap.set('n', '<F5>', '"=strftime("%T")<CR>', { silent = true })
  -- 1 inoremap <silent> <F5> <C-R>=strftime("%T")<CR>
