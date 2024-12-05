
-- lsp服务
return {
	"neovim/nvim-lspconfig",
  dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
	},
	config = function()
		require("mason").setup({
			ui = {
				border = "rounded",
        icons = {
          package_installed = "✓ ",
          package_pending = "➜ ",
          package_uninstalled = "✗ "
			  }
      }
		})
    -- 安装的语言服务
    local servers = { "lua_ls", "bashls","clangd","cssls","html","ts_ls","jsonls","pyright" }
		require("mason-lspconfig").setup({
      ensure_installed = servers
    })
    local lsp = require("lspconfig")
    for _, server in pairs(servers) do
      lsp[server].setup({})
    end
	end,
}
