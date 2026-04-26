vim.g.mapleader = " "

-- Quit
vim.keymap.set('n', '<C-q>', '<cmd>:q<CR>')

-- Copy all text
vim.keymap.set('n', '<C-a>', '<cmd>%y+<CR>')

-- Saving a file via Ctrl+S
vim.keymap.set('i', '<C-s>', '<cmd>:w<CR>')
vim.keymap.set('n', '<C-s>', '<cmd>:w<CR>')

-- NvimTree
vim.keymap.set('n', '<leader>tt', ':NvimTreeToggle<CR>')
vim.keymap.set('n', '<leader>tf', ':NvimTreeFocus<CR>')

-- BufferLine
vim.keymap.set('n','<Tab>', ':BufferLineCycleNext<CR>')
vim.keymap.set('n','<S-Tab>', ':BufferLineCyclePrev<CR>')
vim.keymap.set('n', '<C-l>', ':BufferLineCloseOthers<CR>')

-- TodoList
vim.keymap.set('n', '<leader>nl', ':TodoTelescope<CR>')

-- ToggleTerm
vim.keymap.set('n', '<leader>s', ':ToggleTerm direction=float<CR>')

-- Telescope
local builtin = require('telescope.builtin')

-- Find
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Find files' })
vim.keymap.set('n', '<leader>fr', builtin.oldfiles, { desc = 'Open recently' })
vim.keymap.set('n', '<leader>fw', builtin.live_grep, { desc = 'Find text' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Find buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Find help' })

-- Git
vim.keymap.set('n', '<leader>gb', builtin.git_branches, { desc = 'Git branches' })
vim.keymap.set('n', '<leader>gc', builtin.git_commits, { desc = 'Git commits' })
vim.keymap.set('n', '<leader>gs', builtin.git_status, { desc = 'Git status' })

-- LSP
vim.keymap.set('n', '<leader>ld', vim.lsp.buf.definition, { desc = 'Go to definition' })
vim.keymap.set('n', '<leader>lD', vim.lsp.buf.declaration, { desc = 'Go to declaration' })
vim.keymap.set('n', '<leader>lk', vim.lsp.buf.hover, { desc = 'Hover documentation' })

-- Diagnostics
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic' })

-- Color Schemes
vim.keymap.set('n', '<leader>cs', builtin.colorscheme, { desc = 'Choose colorscheme' })

-- Knap (Markdown → PDF live preview)
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "markdown" },
  callback = function()
    vim.keymap.set("n", "<leader>kp", function()
      require("knap").toggle_autopreviewing()
    end, { buffer = true, desc = "Knap: toggle PDF preview" })

    vim.keymap.set("n", "<leader>ke", function()
      require("knap").process_once()
    end, { buffer = true, desc = "Knap: compile once" })
  end,
})
