-- Отключить Perl provider
vim.g.loaded_perl_provider = 0
vim.opt.termguicolors = true
-- Basic
require('core.plugins')
require('core.mappings')
require('core.colors')
require('core.configs')

-- Plugins
require('plugins.nvim-tree')
require('plugins.treesitter')
require('plugins.lsp')
require('plugins.cmp')
require('plugins.mason')
require('plugins.telescope')
require('plugins.dashboard')
require('plugins.lualine')
require('plugins.cellular')
require('plugins.comment')
require('plugins.bufferline')
require('plugins.todo')
require('plugins.trouble')
require('plugins.toggleterm')
require('plugins.whichkey')
require('plugins.mini')

-- В init.lua или в отдельном файле
vim.filetype.add({
  pattern = {
    [".*%.html"] = "htmldjango",
  },
})


-- Добавьте ~/.local/bin в PATH для Neovim
vim.env.PATH = vim.env.PATH .. ':' .. vim.env.HOME .. '/.local/bin'

-- init.lua — автоматически подхватывает venv из папки проекта
vim.g.python3_host_prog = (function()
    local venv_names = { "venv", ".venv", "env" }
    for _, name in ipairs(venv_names) do
        local path = vim.fn.getcwd() .. "/" .. name .. "/bin/python"
        if vim.fn.executable(path) == 1 then
            return path
        end
    end
    return "python3"
end)()
