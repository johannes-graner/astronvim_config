---@type LazySpec
return {
  {
    "olimorris/codecompanion.nvim",
    config = function()
      local plugin = require "codecompanion"
      plugin.setup {
        strategies = {
          chat = { adapter = "copilot" },
          inline = { adapter = "copilot" },
        },
      }
    end,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "github/copilot.vim",
    },
  },
  {
    "github/copilot.vim",
    config = function()
      vim.api.nvim_set_keymap("i", "<S-CR>", 'copilot#Accept("<CR>")', { expr = true, noremap = true, silent = true })
      vim.g.copilot_no_tab_map = true
    end,
  },
}
