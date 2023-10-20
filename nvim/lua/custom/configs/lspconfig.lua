local configs = require("plugins.configs.lspconfig")
local on_attach = configs.on_attach
local capabilities = configs.capabilities

local lspconfig = require "lspconfig"
local servers = { "pylsp" }
local coq = require "coq"
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    coq.lsp_ensure_capabilities(),
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

