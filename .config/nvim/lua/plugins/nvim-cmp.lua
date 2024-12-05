-- 自动补全
return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    -- 补全提示的图标
    "onsails/lspkind-nvim",
    -- 补全来源 https://github.com/hrsh7th/nvim-cmp/wiki/List-of-sources
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "roginfarrer/cmp-css-variables",
    -- 可替换其他snippets
    { "L3MON4D3/LuaSnip", dependencies = { "rafamadriz/friendly-snippets" } },
    "saadparwaiz1/cmp_luasnip",
  },
  config = function()
    local lspkind = require('lspkind')
    local cmp = require("cmp")
    require("luasnip.loaders.from_vscode").lazy_load()
    cmp.setup({
      -- 补全菜单显示位置
      -- view = {
      --   entries = {name = 'custom', selection_order = 'near_cursor' }
      -- },
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
      formatting = {
        fields = { "abbr", "kind", "menu" },
        format = lspkind.cmp_format({
          -- 图标样式
          preset = 'default',   --选项: 'default' (nerd-fonts font图标), 'codicons'(vscode-codicons font图标)
          -- 显示样式(图标、文字)
          mode = 'symbol_text', --选项: 'text', 'text_symbol', 'symbol_text', 'symbol'
          ellipsis_char = "...",
          menu = (
            {
              buffer = "[Buffer]",
              nvim_lsp = "[LSP]",
              luasnip = "[LuaSnip]",
              nvim_lua = "[Lua]",
              latex_symbols = "[Latex]",
            }
          ),
          maxwidth = {
            menu = 60,
            abbr = 60,
          },
          show_labelDetails = true, -- show labelDetails in menu. Disabled by default
        })
      },
      -- 可替换其他snippets
      snippet = {
        expand = function(args)
          require('luasnip').lsp_expand(args.body)
        end,
      },
      -- 加载补全来源
      sources = cmp.config.sources(
        {
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
          { name = 'buffer' },
          { name = 'path' },
          { name = 'css-variables' },
        }
      ),
      -- 按键映射
      mapping = {
        ["<Esc>"] = cmp.mapping.close(),                                                     -- 关闭补全菜单
        ["<C-Up>"] = cmp.mapping.scroll_docs(-4),                                            -- 向上翻页
        ["<C-Down>"] = cmp.mapping.scroll_docs(4),                                           -- 向下翻页
        ["<Up>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),   -- 选择上个
        ["<Down>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }), -- 选择下个
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            local entry = cmp.get_selected_entry()
            if not entry then
              cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
            end
            cmp.confirm()
          else
            fallback()
          end
        end, { "i", "s", "c", }),
      },
    })
    -- 命令行模式
    cmp.setup.cmdline({ '/', '?' }, {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = 'buffer' }
      }
    })
    -- 命令行模式
    cmp.setup.cmdline(':', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources(
        {
          { name = 'path' },
          { name = 'cmdline' }
        }
      ),
      matching = { disallow_symbol_nonprefix_matching = false }
    })
  end,
}
