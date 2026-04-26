return {
  "lervag/vimtex",
  lazy = false,  -- обязательно, vimtex нельзя лениво загружать
  init = function()
    vim.g.vimtex_view_method = "zathura"       -- PDF viewer
    vim.g.vimtex_compiler_method = "latexmk"   -- компилятор (по умолчанию)
  end,
}
