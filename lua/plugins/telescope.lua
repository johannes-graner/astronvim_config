---@type LazySpec
return {
  {
    "nvim-telescope/telescope-live-grep-args.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    config = function()
      local telescope = require "telescope"
      local lga_actions = require "telescope-live-grep-args.actions"
      telescope.setup {
        extensions = {
          live_grep_args = {
            auto_quoting = true,
            mappings = {
              i = {
                ["<C-k>"] = lga_actions.quote_prompt(),
                ["<C-i>"] = lga_actions.quote_prompt { postfix = " --iglob " },
                ["<C-space>"] = lga_actions.to_fuzzy_refine,
              },
            },
          },
        },
      }
      telescope.load_extension "live_grep_args"
    end,
  },
  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      mappings = {
        n = {
          ["<Leader>fw"] = {
            function() require("telescope").extensions.live_grep_args.live_grep_args() end,
            desc = "Live Grep with arguments",
          },
          grr = { require("telescope.builtin").lsp_references },
        },
      },
    },
  },
}
