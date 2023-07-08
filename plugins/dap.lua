return {
  "mfussenegger/nvim-dap",
  enabled = vim.fn.has "win32" == 0,
  dependencies = {
    {
      "jay-babu/mason-nvim-dap.nvim",
      dependencies = { "nvim-dap" },
      cmd = { "DapInstall", "DapUninstall" },
      opts = { handlers = {} },
    },
    {
      "rcarriga/nvim-dap-ui",
      opts = { floating = { border = "rounded" } },
      config = require "plugins.configs.nvim-dap-ui",
    },
  },
  event = "User AstroFile",
  config = function()
    local dap = require("dap")
    dap.adapters.lldb = {
      type = 'server',
      host = '127.0.0.1',
      port = 13000
    }

    dap.configurations.c = {
      {
        type = 'lldb',
        request = 'launch',
        program = function()
          return vim.fn.input('Path to executable: ', vim.fn.getcwd()..'/', 'file')
        end,
        --program = '${fileDirname}/${fileBasenameNoExtension}',
        cwd = '${workspaceFolder}',
        terminal = 'integrated'
      }
    }

    dap.configurations.cpp = dap.configurations.c

    dap.configurations.rust = {
      {
        type = 'lldb',
        request = 'launch',
        program = function()
          return vim.fn.input('Path to executable: ', vim.fn.getcwd()..'/', 'file')
        end,
        cwd = '${workspaceFolder}',
        terminal = 'integrated',
        sourceLanguages = { 'rust' }
      }
    }
    -- dap.adapters.lldb = {
   --    type = 'executable',
   --    command = '/usr/bin/lldb-vscode-15',
   --    name = 'lldb'
   --  }
    --dap.configurations.cpp = {
     -- name = 'Launch',
    --  type = 'lldb',
      --request = 'launch',
      --program = function()
      --  return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
      --end,
      --cwd = '${workspaceFolder}',
      --stopOnEntry = true,
      --args = {},
      --runInTerminal = false,
    --}
    --dap.configurations.c = dap.configurations.cpp
    --dap.configurations.rust = dap.configurations.cpp
  end
}
