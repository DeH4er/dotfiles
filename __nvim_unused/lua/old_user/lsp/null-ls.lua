require 'null-ls'.setup {
  sources = {
    require 'null-ls'.builtins.formatting.prettier,
    require 'none-ls.diagnostics.eslint_d',
    require 'null-ls'.builtins.formatting.swiftformat.with {
      extra_args = { "--indent", "2", "--maxwidth", "80" }
    },
    require 'null-ls'.builtins.formatting.swiftlint,
  }
}
