---@type LazySpec
return {
  {
    "stevearc/oil.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {},
  },
  {
    "AstroNvim/astrocore",
    opts = function(_, opts)
      opts.mappings.n["-"] = {
        "<CMD>Oil<CR>",
        desc = "Open parent directory",
      }
    end,
  },
}
