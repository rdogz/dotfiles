return {
    "stevearc/conform.nvim",
    opts = {
        formatters_by_ft = {
            python     = { "prettier" },
            javascript = { "prettier" },
            html       = { "prettier" },
            css        = { "prettier" },
            c          = { "prettier" },
            lua        = { "prettier" },
        },
        format_on_save = {
            timeout_ms = 500,
            lsp_fallback = true,
        },
    },
}
