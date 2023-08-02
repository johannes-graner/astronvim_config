return {
  -- You can also add new plugins here as well:
  -- Add plugins, the lazy syntax
  -- "andweeb/presence.nvim",
  -- {
  --   "ray-x/lsp_signature.nvim",
  --   event = "BufRead",
  --   config = function()
  --     require("lsp_signature").setup()
  --   end,
  -- },
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
  { "catppuccin/nvim" },
  { "jose-elias-alvarez/typescript.nvim" },
  {
    "https://gitlab.com/schrieveslaach/sonarlint.nvim.git",
    event = "BufRead",
    config = function()
      require("sonarlint").setup {
        server = {
          cmd = {
            vim.fn.expand "$MASON/packages/sonarlint-language-server/sonarlint-language-server",
            -- Ensure that sonarlint-language-server uses stdio channel
            "-stdio",
            "-analyzers",
            -- paths to the analyzers you need, using those for python and java in this example
            vim.fn.expand "$MASON/share/sonarlint-analyzers/sonarpython.jar",
            vim.fn.expand "$MASON/share/sonarlint-analyzers/sonarjs.jar",
            vim.fn.expand "$MASON/share/sonarlint-analyzers/sonarcfamily.jar",
            -- vim.fn.expand "$MASON/share/sonarlint-analyzers/sonarjava.jar",
          },
        },
        filetypes = {
          -- Tested and working
          "python",
          "cpp",
          "typescript",
          "typescriptreact",
          -- Requires nvim-jdtls, otherwise an error message will be printed
          -- "java",
        },
      }
    end,
  },
  {
    "nvim-telescope/telescope-live-grep-args.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    config = function() require("telescope").load_extension "live_grep_args" end,
  },
}
