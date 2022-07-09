vim.opt.tabstop=4
vim.opt.softtabstop=4
vim.opt.shiftwidth=4
vim.opt.expandtab=true
vim.opt.smartindent=true
vim.opt.nu=true
vim.opt.smartcase=true
vim.opt.swapfile=false
vim.opt.backup=false
vim.opt.undodir=os.getenv( "HOME" ) .. '/undodir'
vim.opt.undofile=true -- uses the undo folder with forever backups
vim.opt.foldmethod='indent'
vim.opt.foldlevel=99
vim.opt.showmode=false -- we're using airline for the mode
vim.opt.termguicolors=true -- should get a better range of colors (disable if anything is looking weird)
vim.opt.mouse='a'
vim.opt.completeopt = {'menu', 'menuone', 'noselect'}

