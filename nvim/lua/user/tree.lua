require 'nvim-tree'.setup {
  view = {
    mappings = {
      list = {
        { key = 'l', action = 'edit_no_picker' },
        { key = 't', action = 'tabnew' },
        { key = 'v', action = 'vsplit' },
        { key = 's', action = 'split' },
        { key = '.', action = 'split' },
      }
    }
  },
  filters = {
    custom = {
      '^.git$'
    }
  },
  diagnostics = {
    enable = true,
  },
  update_focused_file = {
    enable = true,
  }
}
