-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
  -- first key is the mode
  n = {
    -- second key is the lefthand side of the map
    -- mappings seen under group name "Buffer"
    ["<leader>bn"] = { "<cmd>tabnew<cr>", desc = "New tab" },
    ["<leader>sf"] = { "<cmd>Format<cr>", desc = "Format code" },
    ["<leader>sF"] = { "<cmd>FormatWrite<cr>", desc = "Format code and write file" },
    ["<leader>bD"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(function(bufnr) require("astronvim.utils.buffer").close(bufnr) end)
      end,
      desc = "Pick to close",
    },
    ["<leader>gR"] = {
      function()
        local isDiff = vim.fn.getwinvar(nil, "&diff")
        local bufName = vim.api.nvim_buf_get_name(0)
        if isDiff ~= 0 or u.string_starts(bufName, "diff") then
          vim.cmd.tabclose()
          vim.cmd.tabprev()
        else
          vim.cmd.DiffviewOpen("main")
        end
      end,
      desc = "Open DiffView against main",
    },
    ["<leader>gms"] = { function() require("gitlab").summary() end, desc = "Git MR summary" },
    ["<leader>gma"] = { function() require("gitlab").approve() end, desc = "Git MR approve" },
    ["<leader>gmR"] = { function() require("gitlab").revoke() end, desc = "Git MR revoke" },
    ["<leader>gmc"] = { function() require("gitlab").create_comment() end, desc = "Git MR comment" },
    ["<leader>gmd"] = { function() require("gitlab").list_discussions() end, desc = "Show MR disccussions" },
    -- tables with the `name` key will be registered with which-key if it's installed
    -- this is useful for naming menus
    ["<leader>b"] = { name = "Buffers" },
    -- quick save
    -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
  },
}
