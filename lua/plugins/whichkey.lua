local wk = require("which-key")

wk.add({
  -- Find
  { "<leader>f", group = "Find" },
  { "<leader>ff", desc = "Find File" },
  { "<leader>ft", desc = "Find Text" },
  { "<leader>fb", desc = "Find Buffer" },
  { "<leader>fh", desc = "Find Help" },

  -- Git
  { "<leader>g", group = "Git" },
  { "<leader>gb", desc = "Open Branches" },
  { "<leader>gc", desc = "Open Commits" },
  { "<leader>gs", desc = "Open Status" },

  -- Diagnostics
  { "<leader>e", desc = "Open Diagnostic Window" },

  -- LSP
  { "<leader>l", group = "LSP" },
  { "<leader>lD", desc = "Declaration" },
  { "<leader>ld", desc = "Definition" },
  { "<leader>lk", desc = "Hover" },

  -- NvimTree
  { "<leader>t", group = "NvimTree" },
  { "<leader>tt", desc = "Tree Toggle" },
  { "<leader>tf", desc = "Tree Focus" },

  -- TodoList
  { "<leader>n", group = "TodoList" },
  { "<leader>nl", desc = "Open List" },

  -- Terminal
  { "<leader>s", desc = "Open Terminal" },

  -- Ruff
  { "<leader>r", desc = "Ruff" },

  -- Color Schemes
  { "<leader>c", group = "Color Schemes" },
  { "<leader>cs", desc = "Open" },
})
