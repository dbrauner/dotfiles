local configs = require 'lspconfig.configs'
local lspconfig = require 'lspconfig'

-- Check if the config is already defined (useful when reloading this file)
if not configs.barium then
    configs.barium = {
        default_config = {
            cmd = { 'barium' };
            filetypes = { 'brazil-config' };
            root_dir = function(fname)
                return lspconfig.util.find_git_ancestor(fname)
            end;
            settings = {};
        };
    }
end
