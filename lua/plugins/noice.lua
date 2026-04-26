return {
  {
    'folke/noice.nvim',
    event = 'VeryLazy',
    dependencies = {
      'MunifTanjim/nui.nvim',
      'rcarriga/nvim-notify',
    },
    config = function()
      require('noice').setup({
        lsp = {
          override = {
            ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
            ['vim.lsp.util.stylize_markdown'] = true,
            ['cmp.entry.get_documentation'] = true,
          },
          hover     = { enabled = true },
          signature = { enabled = true },
        },
        presets = {
          bottom_search         = false,
          command_palette       = false, -- ← отключаем пресет, используем своё
          long_message_to_split = true,
          inc_rename            = false,
          lsp_doc_border        = true,
        },
        cmdline = {
          enabled = true,
          view    = 'cmdline_popup',
          format  = {
            cmdline     = { pattern = '^:', icon = '❯', icon_hl_group = 'DiagnosticInfo' },
            search_down = { icon = '   ' },
            search_up   = { icon = '   ' },
            filter      = { icon = '  $' },
            lua         = { icon = '  ' },
            help        = { icon = '  ?' },
          },
        },
        views = {
          cmdline_popup = {
            position = { row = -2, col = '50%' }, -- снизу по центру
            size     = { width = 80, height = 'auto' },
            border   = {
              style   = 'rounded',
              padding = { 0, 1 },
            },
          },
          popupmenu = {
            relative = 'editor',
            position = { row = -5, col = '50%' },
            size     = { width = 80, height = 10 },
            border   = {
              style   = 'rounded',
              padding = { 0, 1 },
            },
          },
        },
        messages = { enabled = true },
        notify   = { enabled = true },
      })

      vim.keymap.set('n', '<leader>mn', ':Noice<CR>',        { desc = 'Noice messages' })
      vim.keymap.set('n', '<leader>md', ':NoiceDismiss<CR>', { desc = 'Dismiss notifications' })
    end,
  },
}
