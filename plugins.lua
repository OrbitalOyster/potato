return { 
  -- Catppuccin color theme
  {
    "catppuccin/nvim",
    priority = 1000,
    config = function()
      vim.cmd([[colorscheme catppuccin-frappe]])
    end,
  }
}
