local M = {}
M.packadd_if_exists = function(plugin)
    local plugin_prefix = vim.fn.stdpath('data')..'/site/pack/packer/opt/'
    local plugin_path = plugin_prefix..plugin..'/'

    local ok, err, code = os.rename(plugin_path, plugin_path)

    if ok then
        vim.cmd('packadd '..plugin)
    else
        print(ok, err, code)
        return false
    end

    return true
end

return M