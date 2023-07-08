return {
  "harrisoncramer/gitlab.nvim",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "nvim-lua/plenary.nvim"
  },
  build = function () require("gitlab").build() end, -- Builds the Go binary
  config = function()
    require("gitlab").setup()
  end,
}
