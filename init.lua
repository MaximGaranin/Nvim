vim.g.loaded_perl_provider = 0
vim.opt.termguicolors = true
require('core.plugins')
require('core.mappings')
require('core.colors')
require('core.configs')

vim.filetype.add({ pattern = { [".*%.html"] = "htmldjango" } })
vim.env.PATH = vim.env.PATH .. ':' .. vim.env.HOME .. '/.local/bin'

vim.g.python3_host_prog = (function()
    local venv_names = { "venv", ".venv", "env" }
    for _, name in ipairs(venv_names) do
        local path = vim.fn.getcwd() .. "/" .. name .. "/bin/python"
        if vim.fn.executable(path) == 1 then return path end
    end
    return "python3"
end)()
