---@type LazySpec
return {
  {
    url = "https://gitlab.com/schrieveslaach/sonarlint.nvim",
    ft = { "python", "typescript" },
    dependencies = {
      "williamboman/mason.nvim",
    },
    config = function()
      local sonar_language_server_path =
        require("mason-registry").get_package("sonarlint-language-server"):get_install_path()
      local analyzers_path = sonar_language_server_path .. "/extension/analyzers"
      require("sonarlint").setup {
        server = {
          cmd = {
            -- NOTE: Requires at least Java 17.
            sonar_language_server_path .. "/sonarlint-language-server",
            "-stdio",
            "-analyzers",
            vim.fn.expand(analyzers_path .. "/sonarpython.jar"),
            vim.fn.expand(analyzers_path .. "/sonarjs.jar"),
          },
        },
        filetypes = {
          "python",
          "typescript",
        },
      }
    end,
  },
}
