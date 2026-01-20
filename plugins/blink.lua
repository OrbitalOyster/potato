return {
  'saghen/blink.cmp',

  version = '1.*',
  opts = {
    keymap = {
      preset = 'enter',
      ["<Tab>"] = {
        function(cmp)
          if cmp.is_menu_visible() then
            return require("blink.cmp").select_next()
          elseif cmp.snippet_active() then
            return cmp.snippet_forward()
          end
        end,
        "fallback",
      },
      ["<S-Tab>"] = {
        function(cmp)
          if cmp.is_menu_visible() then
            return require("blink.cmp").select_prev()
          elseif cmp.snippet_active() then
            return cmp.snippet_backward()
          end
        end,
        "fallback",
      },
    },

    appearance = {
      nerd_font_variant = 'normal'
    },

    completion = {
      menu = {
        auto_show = true,
        border = "rounded",
        -- nvim-cmp style menu
        draw = {
          columns = {
            { "label", "label_description", gap = 1 },
            { "kind_icon", "kind", gap = 1 },
          },
        },
      },
      documentation = {
        auto_show = true,
        window = { border = "rounded" },
      },
    },

    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer' },
    },

    fuzzy = { implementation = "prefer_rust_with_warning" }
  },
  opts_extend = { "sources.default" }
}

