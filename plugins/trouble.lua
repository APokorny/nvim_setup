local prefix = "<leader>x"
return {
  'folke/trouble.nvim',
  dependencies = { "nvim-tree/nvim-web-devicons"} ,
  cmd = {TroubleToggle, Trouble},
    keys = {
      { prefix, desc="Trouble"},
      {prefix .. "X", "<cmd>TroubleToggle workspace_diagnostics<cr>",  desc= "Workspace Diagnostics"},
      {prefix .. "x", "<cmd>TroubleToggle document_diagnostics<cr>",  desc= "Document Diagnostics"},
      {prefix .. "q", "<cmd>TroubleToggle quickfix<cr>",  desc= "Quickfix List Trouble"},
  },
  opts = {use_diagnostics_signs = true,
  action_keys= { 
      close = { "q", "<esc>"},
      cancel = "<c-e>"}
  }
}
