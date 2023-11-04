local config = require("plugins.configs.lspconfig")

local on_attach = config.on_attach
local capabilities = config.capabilities

local lspconfig = require("lspconfig")
local coq = require "coq"
lspconfig.pyright.setup(coq.lsp_ensure_capabilities({ on_attach = on_attach, capabilities = capabilities, filetypes = {"python"}, }))
