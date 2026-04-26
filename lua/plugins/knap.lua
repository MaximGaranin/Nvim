return {
  "frabjous/knap",
  lazy = false,
  config = function()
    vim.g.knap_settings = {
      mdoutputext = "pdf",
      mdtopdf = "pandoc -o %outputfile% --pdf-engine=xelatex -V lang=ru -V babel-lang=russian -V mainfont='DejaVu Serif' -V sansfont='DejaVu Sans' -V monofont='DejaVu Sans Mono' -V geometry:margin=2cm",
      mdtopdfviewerlaunch = "zathura %outputfile%",
      mdtopdfviewerrefresh = "none",
      mdtopdfbufferasstdin = true,
    }

    vim.api.nvim_create_autocmd("FileType", {
      pattern = { "markdown", "md" },
      callback = function()
        vim.keymap.set("n", "<leader>kp", function()
          require("knap").toggle_autopreviewing()
        end, { buffer = true, desc = "KNAP: toggle PDF preview" })

        vim.keymap.set("n", "<leader>ke", function()
          require("knap").process_once()
        end, { buffer = true, desc = "KNAP: compile once" })
      end,
    })
  end,
}
