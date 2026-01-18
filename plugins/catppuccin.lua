return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  opts = function()
    require("catppuccin").setup({
      lsp_styles = {
        underlines = {
          errors = { "undercurl" },
          hints = { "undercurl" },
          warnings = { "undercurl" },
          information = { "undercurl" },
        },
      },
      integrations = {
        -- gitsigns = true,
        -- neotree = true,
        noice = true,
        notify = true,
      },
    })
    vim.cmd([[colorscheme catppuccin-frappe]])
  end,
}
