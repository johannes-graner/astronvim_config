---@type LazySpec
return {
  {
    "ggandor/leap.nvim",
    lazy = false,
    config = function()
      local leap = require "leap"
      leap.add_default_mappings(true)
      leap.opts.highlight_unlabeled_phase_one_targets = true
      leap.setup {
        special_keys = {
          repeat_search = "<enter>",
          next_phase_one_target = "<enter>",
          next_target = { "<enter>", ";" },
          prev_target = { "<tab>", "," },
          next_group = "<tab>",
          prev_group = "<s-tab>",
          multi_accept = "<enter>",
          multi_revert = "<backspace>",
        },
      }
    end,
  },

  {
    "ggandor/flit.nvim",
    lazy = false,
    dependencies = { "ggandor/leap.nvim" },
    config = function() require("flit").setup() end,
  },
}
