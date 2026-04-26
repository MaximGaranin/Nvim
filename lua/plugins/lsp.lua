return {
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
    },
    config = function()
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      -- Pyright (Python)
      vim.lsp.config('pyright', {
        cmd = { 'pyright-langserver', '--stdio' },
        root_markers = { 'pyproject.toml', 'setup.py', '.git' },
        capabilities = capabilities,
        settings = {
          pyright = {
            disableOrganizeImports = true,
          },
          python = {
            analysis = {
              ignore = { '*' },
            },
          },
        },
      })

      -- Django LSP
      vim.lsp.config('djlsp', {
        cmd = { 'djlsp' },  -- ~/.local/bin уже в PATH из init.lua
        root_markers = { 'manage.py', '.git' },
        filetypes = { 'htmldjango', 'html', 'django' },
        capabilities = capabilities,
      })

      -- Assembly (asm-lsp)
      vim.lsp.config('asm_lsp', {
        cmd = { 'asm-lsp' },
        root_markers = { '.asm-lsp.toml', '.git', 'Makefile' },
        filetypes = { 'asm', 'masm', 'nasm' },
        capabilities = capabilities,
      })

      -- TypeScript/JavaScript
      vim.lsp.config('ts_ls', {
        cmd = { 'typescript-language-server', '--stdio' },
        root_markers = { 'package.json', 'tsconfig.json', '.git' },
        capabilities = capabilities,
      })

      -- Rust
      vim.lsp.config('rust_analyzer', {
        cmd = { 'rust-analyzer' },
        root_markers = { 'Cargo.toml', '.git' },
        capabilities = capabilities,
        settings = {
          ['rust-analyzer'] = {},
        },
      })

      -- Ruff (Python linter/formatter)
      vim.lsp.config('ruff', {
        cmd = { 'ruff', 'server' },
        root_markers = { 'pyproject.toml', 'setup.py', '.git' },
        capabilities = capabilities,
        init_options = {
          settings = {
            args = {
              "--select=E,F,UP,N,I,ASYNC,S,PTH",
              "--line-length=79",
              "--respect-gitignore",
              "--target-version=py311",
            },
          },
        },
      })

      -- Go
      vim.lsp.config('gopls', {
        cmd = { 'gopls' },
        root_markers = { 'go.mod', 'go.work', '.git' },
        capabilities = capabilities,
        settings = {
          gopls = {
            analyses = { unusedparams = true },
            staticcheck = true,
            gofumpt = true,
            completeUnimported = true,
            usePlaceholders = true,
          },
        },
      })

      -- Включить все серверы
      vim.lsp.enable({ 'pyright', 'ts_ls', 'rust_analyzer', 'ruff', 'asm_lsp', 'djlsp', 'gopls' })

      -- Глобальные диагностические маппинги
      vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
      vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
      vim.keymap.set('n', ']d', vim.diagnostic.goto_next)

      -- LSP маппинги при подключении к буферу
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('UserLspConfig', {}),
        callback = function(ev)
          vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
          local opts = { buffer = ev.buf }
          vim.keymap.set('n', 'lD', vim.lsp.buf.declaration, opts)
          vim.keymap.set('n', 'ld', vim.lsp.buf.definition, opts)
          vim.keymap.set('n', 'lk', vim.lsp.buf.hover, opts)
          vim.keymap.set('n', 'li', vim.lsp.buf.implementation, opts)
          vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
          vim.keymap.set({ 'n', 'v' }, '<space>r', vim.lsp.buf.code_action, opts)
          vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
          vim.keymap.set('n', '<space>f', function()
            vim.lsp.buf.format({ async = true })
          end, opts)
        end,
      })

      -- Автоматическая организация импортов Go при сохранении
      vim.api.nvim_create_autocmd('BufWritePre', {
        pattern = '*.go',
        callback = function()
          local params = vim.lsp.util.make_range_params()
          params.context = { only = { "source.organizeImports" } }
          local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, 1000)
          for _, res in pairs(result or {}) do
            for _, r in pairs(res.result or {}) do
              if r.edit then
                vim.lsp.util.apply_workspace_edit(r.edit, "utf-8")
              end
            end
          end
        end,
      })

    end,
  },
}
