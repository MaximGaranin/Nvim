return {
  {
    'folke/trouble.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('trouble').setup({
        position = 'bottom',
        height = 10,
        icons = true,
        mode = 'workspace_diagnostics',
        auto_open = false,
        auto_close = false,
      })
    end,
  },
}
