return {
  "saghen/blink.cmp",
  dependencies = { "rafamadriz/friendly-snippets", "xzbdmw/colorful-menu.nvim", "onsails/lspkind.nvim" },
  version = "1.*",
  opts = {
    preset = "enter",
    keymap = {
      ["<Tab>"] = { "accept", "fallback" },
    },
    appearance = {
      -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
      -- Adjusts spacing to ensure icons are aligned
      nerd_font_variant = "mono",
    },
    completion = {
      -- 示例：使用'prefix'对于'foo_|_bar'单词将匹配'foo_'(光标前面的部分),使用'full'将匹配'foo__bar'(整个单词)
      keyword = { range = "full" },
      list = { selection = { preselect = true, auto_insert = false } },
      menu = {
        draw = {
          columns = { { "kind_icon", gap = 1 }, { "label", gap = 2 } },
          components = {
            kind_icon = {
              text = function(ctx)
                local icon = ctx.kind_icon
                icon = require("lspkind").symbolic(ctx.kind, {
                  mode = "symbol_text",
                  -- "default"(nerd font),"codicons"(vscode icons)
                  preset = "default",
                })
                return icon .. ctx.icon_gap
              end,

              -- Optionally, use the highlight groups from nvim-web-devicons
              -- You can also add the same function for `kind.highlight` if you want to
              -- keep the highlight groups in sync with the icons.
              highlight = function(ctx)
                local hl = ctx.kind_hl
                if vim.tbl_contains({ "Path" }, ctx.source_name) then
                  local dev_icon, dev_hl = require("nvim-web-devicons").get_icon(ctx.label)
                  if dev_icon then
                    hl = dev_hl
                  end
                end
                return hl
              end,
            },
            label = {
              width = { fill = true, max = 60 },
              text = function(ctx)
                local highlights_info = require("colorful-menu").blink_highlights(ctx)
                if highlights_info ~= nil then
                  -- Or you want to add more item to label
                  return highlights_info.label
                else
                  return ctx.label
                end
              end,
              highlight = function(ctx)
                local highlights = {}
                local highlights_info = require("colorful-menu").blink_highlights(ctx)
                if highlights_info ~= nil then
                  highlights = highlights_info.highlights
                end
                for _, idx in ipairs(ctx.label_matched_indices) do
                  table.insert(highlights, { idx, idx + 1, group = "BlinkCmpLabelMatch" })
                end
                -- Do something else
                return highlights
              end,
            },
          },
        },
      },
    },
  },
}
