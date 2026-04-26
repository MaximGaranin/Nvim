return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      require('lspconfig').djlsp.setup({
        cmd = { "djlsp" },
        filetypes = { "html", "htmldjango" },
        init_options = {
          djlsp = {
            django_settings_module = "myproject.settings",
          }
        },
        root_dir = require('lspconfig.util').root_pattern("manage.py", ".git"),
      })
    end,
  }
}
