-- This file can be loaded by calling `lua require('plugins')` from your init.vim
-- vim.fn.setenv("MACOSX_DEPLOYMENT_TARGET", "10.15")


-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

local packer = require('packer')
local util = require 'packer.util'

packer.init({
    package_root = util.join_paths(vim.fn.stdpath('data'), 'site', 'pack'),
    luarocks = {
        python_cmd = 'python3'
    }
})

return packer.startup(function(use, use_rocks)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use 'neovim/nvim-lspconfig' -- Configurations for Nvim LSP

    use {
        'RishabhRD/nvim-lsputils', -- lsputils
        requires = { 'RishabhRD/popfix' }
    }

    use 'mfussenegger/nvim-jdtls'

    use 'hrsh7th/nvim-cmp'     -- Autocompletion plugin
    use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'

    use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
    use 'L3MON4D3/LuaSnip'         -- Snippets plugin

    -- Because tpope is semi-god
    use 'tpope/vim-fugitive'
    use 'tpope/vim-commentary'
    use 'tpope/vim-sensible'

    use 'vimwiki/vimwiki'

    use { 'junegunn/fzf', run = './install --bin', }
    use { 'ibhagwan/fzf-lua',
        -- optional for icon support
        requires = { 'kyazdani42/nvim-web-devicons' }
    }

    -- use 'vim-airline/vim-airline'
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }
    use 'kdheepak/tabline.nvim'

    -- Lazy loading:
    -- Load on specific commands
    use { 'tpope/vim-dispatch', opt = true, cmd = { 'Dispatch', 'Make', 'Focus', 'Start' } }

    -- Load on an autocommand event
    use { 'andymass/vim-matchup', event = 'VimEnter' }

    -- Load on a combination of conditions: specific filetypes or commands
    -- Also run code after load (see the "config" key)
    use {
        'w0rp/ale',
        ft = { 'sh', 'zsh', 'bash', 'c', 'cpp', 'cmake', 'html', 'markdown', 'racket', 'vim', 'tex' },
        cmd = 'ALEEnable',
        config = 'vim.cmd[[ALEEnable]]'
    }

    -- Plugins can have dependencies on other plugins
    use {
        'haorenW1025/completion-nvim',
        opt = true,
        requires = { { 'hrsh7th/vim-vsnip', opt = true }, { 'hrsh7th/vim-vsnip-integ', opt = true } }
    }

    -- You can specify rocks in isolation
    use_rocks 'penlight'
    use_rocks { 'lua-resty-http', 'lpeg' }

    -- Post-install/update hook with neovim command
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

    -- Use dependency and run lua function after load
    use {
        'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' },
        config = function() require('gitsigns').setup() end
    }

    -- You can alias plugin names
    use { 'dracula/vim', as = 'dracula' }
    use { "catppuccin/nvim", as = "catppuccin" }


    -- colorschemes
    use { 'sainnhe/everforest' }
    use { 'nlknguyen/papercolor-theme' }
    use { 'morhetz/gruvbox' }
    use { 'connorholyday/vim-snazzy' }

    -- tree
    use { 'preservim/nerdtree',
        requires = { 'Xuyuanp/nerdtree-git-plugin',
            'johnstef99/vim-nerdtree-syntax-highlight',
            'ryanoasis/vim-devicons' }
    }

    -- Brazil Config
    -- use { '/apollo/env/envImprovement/vim/amazon/brazil-config' }

    -- Diff
    use 'will133/vim-dirdiff'

    -- dashboard
    use { 'goolord/alpha-nvim',
        requires = { 'kyazdani42/nvim-web-devicons' }
    }

    use { 'ojroques/vim-oscyank', branch = 'main' }

    use({
        "jackMort/ChatGPT.nvim",
        config = function()
            require("chatgpt").setup()
        end,
        requires = {
            "MunifTanjim/nui.nvim",
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope.nvim"
        }
    })

    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },
            {
                'williamboman/mason.nvim',
                run = function() pcall(vim.cmd, 'MasonUpdate') end
            },
            { 'williamboman/mason-lspconfig.nvim' },

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'saadparwaiz1/cmp_luasnip' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-nvim-lua' },

            -- Snippets
            { 'L3MON4D3/LuaSnip' },
            { 'rafamadriz/friendly-snippets' },
        }
    }

    -- use({
    --     "aserowy/tmux.nvim",
    --     config = function() return require("tmux").setup() end
    -- })
    use { 'christoomey/vim-tmux-navigator' }
    use { 'xiyaowong/transparent.nvim' }
end)
