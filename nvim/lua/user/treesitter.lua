local disabled_extensions = {'txt'}

require 'nvim-treesitter.configs'.setup {
  sync_installed = false,
  auto_install = true,
  ignore_install = {},
  highlight = {
    enable = true,
    disable = function(_, buf)
      local name = vim.api.nvim_buf_get_name(buf)
      local ext = vim.api.nvim_call_function('fnamemodify', {name, ':e'})
      for _, disabled_extension in ipairs(disabled_extensions) do
        if ext == disabled_extension then
          return true
        end
      end
    end,
    additional_vim_regex_highliting = true,
    indent = { enable = true, disable = { "yaml" } },
  }
}
