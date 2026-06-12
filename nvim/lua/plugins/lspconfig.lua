return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      { "williamboman/mason.nvim", config = true },
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "pyright", "clangd", "ts_ls", "html", "cssls" },
        handlers = {
          function(server_name)
            require("lspconfig")[server_name].setup({
              capabilities = require("blink.cmp").get_lsp_capabilities(),
            })
          end,
        },
      })
    end,
  },
}
