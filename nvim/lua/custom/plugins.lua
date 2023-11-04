local plugins = {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "pyright",
        "mypy",
        "ruff",
        "black",
        "debugpy",
        "python-lsp-server"
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "nvimtools/none-ls.nvim",
    ft = {"python"},
    opts = function()
      return require "custom.configs.null-ls"
    end,
  },
  {
    "mfussenegger/nvim-dap",
    config = function(_, opts)
      require("core.utils").load_mappings("dap")
    end
  },
  {
    "mfussenegger/nvim-dap-python",
    ft = "python",
    dependencies = {
      "mfussenegger/nvim-dap",
      "rcarriga/nvim-dap-ui",
    },
    config = function(_, opts)
      local path = "C:/Users/compuland/AppData/Local/nvim-data/mason/packages/debugpy/venv/Scripts/python"
      require("dap-python").setup(path)
      require("core.utils").load_mappings("dap_python")
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = "mfussenegger/nvim-dap",
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")
      dapui.setup()
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end,
  }
  ,
  {
    "tanvirtin/monokai.nvim"
  },
  {
    "olimorris/onedarkpro.nvim",
    priority = 1000 -- Ensure it loads first
  },

  {
    "ms-jpq/coq_nvim"
  },
  {
	  "Vigemus/iron.nvim",
	  keys = {
		  { "<leader>i", vim.cmd.IronRepl, desc = "󱠤 Toggle REPL" },
		  { "<leader>I", vim.cmd.IronRestart, desc = "󱠤 Restart REPL" },

		  -- these keymaps need no right-hand-side, since that is defined by the
		  -- plugin config further below
		  { "+", mode = { "n", "x" }, desc = "󱠤 Send-to-REPL Operator" },
		  { "++", desc = "󱠤 Send Line to REPL" },
	  },

	  -- since irons's setup call is `require("iron.core").setup`, instead of
	  -- `require("iron").setup` like other plugins would do, we need to tell
	  -- lazy.nvim which module to via the `main` key
	  main = "iron.core",

	  opts = {
		  keymaps = {
			  send_line = "++",
			  visual_send = "+",
			  send_motion = "+",
		  },
		  config = {
			  -- this defined how the repl is opened. Here we set the REPL window
			  -- to open in a horizontal split to a bottom, with a height of 10
			  -- cells.
			  repl_open_cmd = "horizontal bot 10 split",

			  -- This defines which binary to use for the REPL. If `ipython` is
			  -- available, it will use `ipython`, otherwise it will use `python3`.
			  -- since the python repl does not play well with indents, it's
			  -- preferable to use `ipython` or `bypython` here.
			  -- (see: https://github.com/Vigemus/iron.nvim/issues/348)
			  repl_definition = {
				  python = {
					  command = function()
						  local ipythonAvailable = vim.fn.executable("ipython") == 1
						  local binary = ipythonAvailable and "ipython" or "python3"
						  return { binary }
					  end,
				  },
			  },
		  },
	  },
  },
  {
    "okuuva/auto-save.nvim",
    cmd = "ASToggle",
    event = { "InsertLeave", "TextChanged" },
    opts = {
      -- your config goes here
      -- or just leave it empty :)
    },
  },

  {
    'gorbit99/codewindow.nvim',
    lazy = false,
    config = function()
      local codewindow = require('codewindow')
      codewindow.setup()
      codewindow.apply_default_keybinds()
    end,
  },

  -- Lua
  {
    "folke/zen-mode.nvim",
    lazy = false,
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
  },

  {
    "folke/twilight.nvim",
    lazy = false,
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
  },
}
return plugins
