return {
  {
    'dense-analysis/ale',
    config = function()
      vim.g.ale_linters = {
        python = { 'mypy' },
        lua = { 'lua_language_server' },
      }
    end,
  },
}
