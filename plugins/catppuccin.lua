return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  opts = {
    lsp_styles = {
      underlines = {
        errors = { "undercurl" },
        hints = { "undercurl" },
        warnings = { "undercurl" },
        information = { "undercurl" },
      },
    },
    integrations = {
      noice = true,
      snacks = true,
    },
  },
}
