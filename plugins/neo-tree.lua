return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    close_if_last_window = true,   -- Close Neo-tree if it is the last window left in the tab
    use_popups_for_input = false,  -- Use noice for popups
    filesystem = {
      filtered_items = {
        visible = true             -- Don't hide anything
      }
    },
    default_component_configs = {
      git_status = {
        symbols = {
          added = "+",
          modified = "",
          deleted = "D",
          renamed = "󰁕",
          untracked = "",
          ignored = "",
          unstaged = "󰄱",
          staged = "",
          conflict = "",
        },
      },
    },
  },
}
