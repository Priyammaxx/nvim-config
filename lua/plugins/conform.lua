-- google style formatting for c/c++ code
return {
  'stevearc/conform.nvim',
  event = 'BufWritePre',   -- Format on save
  cmd = { 'ConformInfo' }, -- Add command for debugging
  keys = {
    {
      '<leader>fm',
      function()
        require('conform').format({ async = true, lsp_fallback = true })
      end,
      mode = { 'n', 'v' },
      desc = 'Format buffer',
    },
  },
  opts = {
    -- Enable formatting on save (recommended)
    format_on_save = {
      timeout_ms = 500,
      lsp_fallback = true, -- Fallback to LSP formatting if no specific formatter is found
    },
    -- Define formatters for filetypes
    formatters_by_ft = {
      c = { 'clang_format' },
      cpp = { 'clang_format' },
      -- Add other languages as needed
      -- lua = { "stylua" },
      -- python = { "isort", "black" },
    },
    -- Configure specific formatters
    formatters = {
      clang_format = {
        -- Pass the --style=Google argument to clang-format
        prepend_args = { '--style={BasedOnStyle: Google, IndentWidth: 4}' },
        -- Alternatively, if you have a .clang-format file in your project,
        -- you can tell clang-format to use it by default with:
        -- prepend_args = { "--style=file" },
        -- clang-format will then automatically look for .clang-format in the current
        -- directory or parent directories.
      },
    },
  },
}
