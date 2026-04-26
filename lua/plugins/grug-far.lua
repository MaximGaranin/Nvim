return {
  {
    'MagicDuck/grug-far.nvim',
    cmd = 'GrugFar',
    config = function()
      require('grug-far').setup({
        debounceMs = 500,
        maxWorkers = 4,
        -- Используем ripgrep (он у тебя уже есть для telescope)
        engine = 'ripgrep',
      })

      vim.keymap.set('n', '<leader>sr', function()
        require('grug-far').open()
      end, { desc = 'Search and replace (project)' })

      -- Открыть с текущим словом под курсором
      vim.keymap.set('n', '<leader>sw', function()
        require('grug-far').open({ prefills = { search = vim.fn.expand('<cword>') } })
      end, { desc = 'Search word under cursor' })
    end,
  },
}
