---@type LazySpec
return {
  {
    "johannes-graner/remote-nvim.nvim",
    version = "*",
    dependencies = {
      "nvim-lua/plenary.nvim", -- For standard functions
      "MunifTanjim/nui.nvim", -- To build the plugin UI
      "nvim-telescope/telescope.nvim", -- For picking b/w different remote methods
    },
    config = true,
  },
  {
    "AstroNvim/astrocore",
    opts = function(_, opts)
      local nmaps = opts.mappings.n
      nmaps["<Leader>r"] = { desc = "Remote dev" }
      nmaps["<Leader>rs"] = { "<cmd>RemoteStart<cr>", desc = "Start", noremap = true, silent = true }
      nmaps["<Leader>rl"] = { "<cmd>RemoteLog<cr>", desc = "Logs", noremap = true, silent = true }
    end,
  },
}
