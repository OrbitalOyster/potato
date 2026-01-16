return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = "nvim-tree/nvim-web-devicons",
  opts = {
    options = {
      mode = "buffers",
      separator_style = "thin",
      always_show_bufferline = true,
      show_buffer_close_icons = true,
      show_buffer_icons = true,
      color_icons = true,
      themable = false,
      offsets = {{
        filetype = "neo-tree",
        separator = false
      }},
    },
  },
}
