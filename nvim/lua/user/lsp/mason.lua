local servers = {
  "cssls",
  "cssmodules_ls",
  -- "emmet_ls",
  "html",
  "jdtls",
  "jsonls",
  "solc",
  "tailwindcss",
  "svelte",
  "lua_ls",
  "pylsp",
  "pyright",
  "intelephense",
  -- "emmet_ls",
  -- "solidity_ls",
  -- "sumneko_lua",
  "rust_analyzer",
  "tflint",
  "terraformls",
  "tsserver",
  "yamlls",
  "bashls",
  "clangd",
  "taplo",
  "zk@v0.10.1",
  "lemminx"
}

local settings = {
  ui = {
    border = "rounded",
    icons = {
      package_installed = "◍",
      package_pending = "◍",
      package_uninstalled = "◍",
    },
  },
  log_level = vim.log.levels.INFO,
  max_concurrent_installers = 4,
}

require'mason'.setup(settings)
require'mason-lspconfig'.setup {
  ensure_installed = servers,
  automatic_installation = true,
}

local lspconfig = require'lspconfig'

local opts = {
  on_attach = require("user.lsp.handlers").on_attach,
  capabilities = require("user.lsp.handlers").capabilities,
}

lspconfig.sourcekit.setup({
  -- cmd = {
  --   "xcrun",
  --   "sourcekit-lsp",
  --   "-Xswiftc",
  --   "-sdk",
  --   "-Xswiftc",
  --   "/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator.sdk",
  --   "-Xswiftc",
  --   "-target",
  --   "-Xswiftc",
  --   "x86_64-apple-ios15.4-simulator",
  -- },
  on_attach = require("user.lsp.handlers").on_attach,
  capabilities = require("user.lsp.handlers").capabilities,
})

for _, server in pairs(servers) do
  local opts = {
    on_attach = require("user.lsp.handlers").on_attach,
    capabilities = require("user.lsp.handlers").capabilities,
  }

  server = vim.split(server, "@")[1]

  if server == "jsonls" then
    local jsonls_opts = require "user.lsp.settings.jsonls"
    opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
  end

  if server == "yamlls" then
    local yamlls_opts = require "user.lsp.settings.yamlls"
    opts = vim.tbl_deep_extend("force", yamlls_opts, opts)
  end

  if server == "sumneko_lua" then
    -- local l_status_ok, lua_dev = pcall(require, "lua-dev")
    -- if not l_status_ok then
    --   return
    -- end
    -- local sumneko_opts = require "lsp.settings.sumneko_lua"
    -- opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
    -- opts = vim.tbl_deep_extend("force", require("lua-dev").setup(), opts)
    local luadev = require'neodev'.setup {
      --   -- add any options here, or leave empty to use the default settings
      -- lspconfig = opts,
      lspconfig = {
        on_attach = opts.on_attach,
        capabilities = opts.capabilities,
        --   -- settings = opts.settings,
      },
    }
    lspconfig.sumneko_lua.setup(luadev)
    goto continue
  end

  if server == "tsserver" then
    local tsserver_opts = require "user.lsp.settings.tsserver"
    opts = vim.tbl_deep_extend("force", tsserver_opts, opts)
  end

  if server == "pyright" then
    local pyright_opts = require "user.lsp.settings.pyright"
    opts = vim.tbl_deep_extend("force", pyright_opts, opts)
  end

  if server == "solc" then
    local solc_opts = require "user.lsp.settings.solc"
    opts = vim.tbl_deep_extend("force", solc_opts, opts)
  end

  -- if server == "emmet_ls" then
  --   local emmet_ls_opts = require "user.lsp.settings.emmet_ls"
  --   opts = vim.tbl_deep_extend("force", emmet_ls_opts, opts)
  -- end

  if server == "zk" then
    local zk_opts = require "user.lsp.settings.zk"
    opts = vim.tbl_deep_extend("force", zk_opts, opts)
  end

  if server == "jdtls" then
    goto continue
  end

  if server == "rust_analyzer" then
    -- local rust_opts = require "user.lsp.settings.rust"
    -- opts = vim.tbl_deep_extend("force", rust_opts, opts)
    local rust_tools = require "rust-tools"
    rust_tools.setup({server = opts})
    goto continue
  end

  lspconfig[server].setup(opts)
  ::continue::
end
