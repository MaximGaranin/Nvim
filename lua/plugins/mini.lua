return {
  {
    'echasnovski/mini.nvim',
    config = function()
      require('mini.move').setup()
      require('mini.pairs').setup()
    end,
  },
}
