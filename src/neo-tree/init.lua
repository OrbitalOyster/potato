require("neo-tree").setup({
  close_if_last_window = true,  -- Close Neo-tree if it is the last window left in the tab
  use_popups_for_input = false, -- Use noice for popups
  filesystem = {
    filtered_items = {
      visible = true            -- Don't hide anything
    }
  }
})
vim.keymap.set('n', '<leader>o', '<cmd>Neotree toggle<cr>')

