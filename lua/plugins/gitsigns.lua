return {
  {
    'lewis6991/gitsigns.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
      require('gitsigns').setup({
        signs = {
          add          = { text = '▎' },
          change       = { text = '▎' },
          delete       = { text = '' },
          topdelete    = { text = '' },
          changedelete = { text = '▎' },
          untracked    = { text = '▎' },
        },
        current_line_blame = true,
        current_line_blame_opts = {
          delay = 300,
          virt_text_pos = 'eol',
        },
        on_attach = function(bufnr)
          local gs = package.loaded.gitsigns
          local map = function(mode, l, r, desc)
            vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
          end

          -- Навигация по hunk'ам
          map('n', ']h', gs.next_hunk,        'Next hunk')
          map('n', '[h', gs.prev_hunk,        'Prev hunk')

          -- Действия
          map('n', '<leader>hs', gs.stage_hunk,          'Stage hunk')
          map('n', '<leader>hr', gs.reset_hunk,          'Reset hunk')
          map('n', '<leader>hS', gs.stage_buffer,        'Stage buffer')
          map('n', '<leader>hR', gs.reset_buffer,        'Reset buffer')
          map('n', '<leader>hp', gs.preview_hunk,        'Preview hunk')
          map('n', '<leader>hb', gs.blame_line,          'Blame line')
          map('n', '<leader>hd', gs.diffthis,            'Diff this')
          map('n', '<leader>hB', function() gs.blame_line({ full = true }) end, 'Blame line full')
        end,
      })
    end,
  },
}
