require('dbbrauner.barium')

local lspconfig = require 'lspconfig'

-- language servers to enable
local servers = { 'lua_ls', 'gopls', 'barium', 'solargraph', 'pyright', 'tsserver' }
-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    -- TODO Do I need this since I have cmp?
    -- vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, bufopts)
    vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
    vim.keymap.set('n', '<leader>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, bufopts)
    vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', 'ga', vim.lsp.buf.code_action, bufopts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
    vim.keymap.set('n', '<leader>f', function() vim.lsp.buf.format({ async = true }) end, bufopts)
end

local lsp_flags = {
    -- This is the default in Nvim 0.7+
    debounce_text_changes = 150,
}

-- -- Add additional capabilities supported by nvim-cmp
-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- -- add snippetSupport
-- capabilities.textDocument.completion.completionItem.snippetSupport = true

-- capabilities = require('cmp_nvim_lsp').default_capabitilities()
-- -- capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

-- The nvim-cmp almost supports LSP's capabilities so You should advertise it to LSP servers..
local capabilities = require('cmp_nvim_lsp').default_capabilities()

for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup {
        on_attach = on_attach,
        lsp_flags = lsp_flags,
        capabilities = capabilities,
    }
end



-- luasnip setup
local luasnip = require 'luasnip'

-- nvim-cmp setup
local cmp = require 'cmp'
cmp.setup {
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<CR>'] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
        },
        ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            else
                fallback()
            end
        end, { 'i', 's' }),
        ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { 'i', 's' }),
    }),
    sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
    },
}

Jdtls_setup = function()
    local root_dir = require('jdtls.setup').find_root({ 'packageInfo' }, 'Config')
    local home = os.getenv('HOME')
    local eclipse_workspace = home .. "/.local/share/eclipse/" .. vim.fn.fnamemodify(root_dir, ':p:h:t')

    local ws_folders_lsp = {}
    local ws_folders_jdtls = {}
    if root_dir then
        local file = io.open(root_dir .. "/.bemol/ws_root_folders", "r");
        if file then
            for line in file:lines() do
                table.insert(ws_folders_lsp, line);
                table.insert(ws_folders_jdtls, string.format("file://%s", line))
            end
            file:close()
        end
    end

    local config = {
        on_attach = on_attach,
        capabilities = capabilities,
        cmd = {
            -- The command that starts the language server
            -- See: https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line
            -- 💀 - done
            '/apollo/env/JavaSE11/jdk-11/bin/java', -- or '/path/to/java11_or_newer/bin/java'
            -- depends on if `java` is in your $PATH env variable and if it points to the right version.

            '-Declipse.application=org.eclipse.jdt.ls.core.id1',
            '-Dosgi.bundles.defaultStartLevel=4',
            '-Declipse.product=org.eclipse.jdt.ls.core.product',
            '-Dlog.protocol=true',
            '-Dlog.level=ALL',
            '-Xms1g',
            '--add-modules=ALL-SYSTEM',
            '--add-opens', 'java.base/java.util=ALL-UNNAMED',
            '--add-opens', 'java.base/java.lang=ALL-UNNAMED',

            -- 💀 - done
            '-jar', '/home/brauned/jdt/plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar',
            -- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^                                       ^^^^^^^^^^^^^^
            -- Must point to the                                                     Change this to
            -- eclipse.jdt.ls installation                                           the actual version


            -- 💀 done
            '-configuration', '/home/brauned/jdt/config_linux',
            -- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^        ^^^^^^
            -- Must point to the                      Change to one of `linux`, `win` or `mac`
            -- eclipse.jdt.ls installation            Depending on your system.


            -- 💀 done
            -- See `data directory configuration` section in the README
            '-data', eclipse_workspace,
        },
        root_dir = root_dir,
        init_options = {
            workspaceFolders = ws_folders_jdtls,
        },
    }

    require('jdtls').start_or_attach(config)

    for _, line in ipairs(ws_folders_lsp) do
        vim.lsp.buf.add_workspace_folder(line)
    end
end

local augroup = vim.api.nvim_create_augroup('lsp', { clear = true })

vim.api.nvim_create_autocmd('FileType', {
    pattern = 'java',
    group = augroup,
    command = 'luado Jdtls_setup()'
})

-- lsputils plugin
vim.lsp.handlers['textDocument/codeAction'] = require 'lsputil.codeAction'.code_action_handler
vim.lsp.handlers['textDocument/references'] = require 'lsputil.locations'.references_handler
vim.lsp.handlers['textDocument/definition'] = require 'lsputil.locations'.definition_handler
vim.lsp.handlers['textDocument/declaration'] = require 'lsputil.locations'.declaration_handler
vim.lsp.handlers['textDocument/typeDefinition'] = require 'lsputil.locations'.typeDefinition_handler
vim.lsp.handlers['textDocument/implementation'] = require 'lsputil.locations'.implementation_handler
vim.lsp.handlers['textDocument/documentSymbol'] = require 'lsputil.symbols'.document_handler
vim.lsp.handlers['workspace/symbol'] = require 'lsputil.symbols'.workspace_handler



local util = require "lspconfig/util"
-- Add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
-- add snippetSupport
capabilities.textDocument.completion.completionItem.snippetSupport = true


lspconfig.gopls.setup {
    on_attach = on_attach,
    lsp_flags = lsp_flags,
    capabilities = capabilities,
    cmd = { "gopls", "serve" },
    filetypes = { "go", "gomod" },
    root_dir = util.root_pattern("go.work", "go.mod", ".git"),
    settings = {
        gopls = {
            experimentalPostfixCompletions = true,
            analyses = {
                unusedparams = true,
                shadow = true,
            },
            staticcheck = true,
        },
    },
}

lspconfig.pyright.setup {
    vim.keymap.set("n", "<leader>or", '<cmd>PyrightOrganizeImports<cr>', { silent = true, buffer = true })
}

function OrgImports(wait_ms)
    local params = vim.lsp.util.make_range_params()
    params.context = { only = { "source.organizeImports" } }
    local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, wait_ms)
    for _, res in pairs(result or {}) do
        for _, r in pairs(res.result or {}) do
            if r.edit then
                vim.lsp.util.apply_workspace_edit(r.edit, "UTF-8")
            else
                vim.lsp.buf.execute_command(r.command)
            end
        end
    end
end

vim.cmd [[
autocmd BufWritePre *.go lua OrgImports(1000)
]]

vim.lsp.set_log_level("debug")


local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(client, bufnr)
    lsp.default_keymaps({ buffer = bufnr })
end)

-- (Optional) Configure lua language server for neovim
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

lsp.setup()