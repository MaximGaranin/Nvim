return {
  'neovim/nvim-lspconfig',
  dependencies = {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
  },
  config = function()
    local lspconfig = require('lspconfig')
    
    lspconfig.gopls.setup({
      settings = {
        gopls = {
          analyses = {
            unusedparams = true,
          },
          staticcheck = true,
          gofumpt = true,
          completeUnimported = true,
          usePlaceholders = true,
        },
      },
    })
  end
}
