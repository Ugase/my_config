local plugins = {
  {
  "neovim/nvim-lspconfig",

   dependencies = {
     "jose-elias-alvarez/null-ls.nvim",
     config = function()
       require "custom.configs.null-ls"
     end,
   },

   config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
   end,
  },

  {
  "okuuva/auto-save.nvim",
  cmd = "ASToggle", -- optional for lazy loading on command
  event = { "InsertLeave", "TextChanged" }, -- optional for lazy loading on trigger events
  opts = {
    -- your config goes here
    -- or just leave it empty :)
    },
  },

  {
    "ms-jpq/coq_nvim"
  },

  {
    'nvim-telescope/telescope.nvim', tag = '0.1.3',
      dependencies = { 'nvim-lua/plenary.nvim' }
  },

  {
    "glacambre/firenvim",
    lazy = not vim.g.started_by_firenvim,
    module = false,
    build = function()
        vim.fn["firenvim#install"](0)
    end,
  },

  {
    "olimorris/onedarkpro.nvim",
    priority = 1000 -- Ensure it loads first
  },

  {
    "askfiy/visual_studio_code",
    priority = 100,
    config = function()
        vim.cmd([[colorscheme visual_studio_code]])
    end,
  },

  {
  'glepnir/dashboard-nvim',
  event = 'VimEnter',
  config = function()
    require('dashboard').setup {
      -- config
    }
  end,
  dependencies = { {'nvim-tree/nvim-web-devicons'}}
  },

  {
  "roobert/activate.nvim",
  keys = {
      {
      "<C-.>",
      '<CMD>lua require("activate").list_plugins()<CR>',
      desc = "Plugins",
      },
    },
  },

  {
 "folke/trouble.nvim",
 dependencies = { "nvim-tree/nvim-web-devicons" },
 opts = {
  -- your configuration comes here
  -- or leave it empty to use the default settings
  -- refer to the configuration section below
    },
  },  
  {
    "nvim-telescope/telescope.nvim"
  },
  {
    "romgrk/fzy-lua-native"
  },
  {
    "Yggdroot/LeaderF"
  },
  {
    "mfussenegger/nvim-dap"
  },
}
return plugins

