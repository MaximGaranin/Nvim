return {
  {
    'stevearc/conform.nvim',
    event = { 'BufWritePre' },
    cmd = { 'ConformInfo' },
    config = function()
      require('conform').setup({
        formatters_by_ft = {
          python     = { 'isort', 'black' },
          lua        = { 'stylua' },
          go         = { 'gofmt', 'goimports' },
          javascript = { 'prettier' },
          typescript = { 'prettier' },
          html       = { 'prettier' },
          css        = { 'prettier' },
          json       = { 'prettier' },
          yaml       = { 'prettier' },
          markdown   = { 'prettier' },
        },
        -- Автоформат при сохранении
        format_on_save = {
          timeout_ms = 2000,
          lsp_fallback = true,
        },
      })

      -- Ручной форматтинг
      vim.keymap.set({ 'n', 'v' }, '<leader>cf', function()
        require('conform').format({ async = true, lsp_fallback = true })
      end, { desc = 'Format file' })
    end,
  },
}
