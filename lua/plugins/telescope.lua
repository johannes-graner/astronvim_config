---@type LazySpec
return {
  {
    "nvim-telescope/telescope-live-grep-args.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    config = function() require("telescope").load_extension "live_grep_args" end,
  },
  {
    "AstroNvim/astrocore",
    opts = function(_, opts)
      opts.mappings.n["<leader>fw"] = {
        function() require("telescope").extensions.live_grep_args.live_grep_args() end,
        desc = "Live Grep with arguments",
      }
    end,
  },
}
