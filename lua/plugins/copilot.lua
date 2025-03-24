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
    "AstroNvim/astrocore",
    opts = function(_, opts)
      local nmaps = opts.mappings.n
      local vmaps = opts.mappings.v

      local toggle = {
        key = "<Leader>a",
        value = {
          "<cmd>CodeCompanionChat Toggle<cr>",
          desc = "Toggle AI Chat",
          noremap = true,
          silent = true,
        },
      }
      nmaps[toggle.key] = toggle.value
      vmaps[toggle.key] = toggle.value

      local actions = {
        key = "C-a",
        value = {
          "<cmd>CodeCompanionActions<cr>",
          noremap = true,
          silent = true,
        },
      }
      nmaps[actions.key] = actions.value
      vmaps[actions.key] = actions.value

      local prompt = {
        key = "<Leader>P",
        value = {
          "<cmd>CodeCompanion<cr>",
          desc = "Prompt LLM",
          noremap = true,
          silent = true,
        },
      }
      nmaps[prompt.key] = prompt.value
      vmaps[prompt.key] = prompt.value
    end,
  },
  {
    "github/copilot.vim",
    config = function()
      vim.api.nvim_set_keymap("i", "<S-CR>", 'copilot#Accept("<CR>")', { expr = true, noremap = true, silent = true })
      vim.g.copilot_no_tab_map = true
    end,
  },
}
