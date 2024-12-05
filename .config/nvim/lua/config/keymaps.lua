vim.g.mapleader = " "

local key = vim.keymap

key.set("i", "<C-c>", "<Esc>")
key.set({ "n", "i" }, "<C-s>", "<cmd>w<cr><esc>")

-- 窗口
key.set("n", "wb<Left>", "<cmd>BufferLineCyclePrev<cr>", { desc = "切换至上个标签页" })
key.set("n", "wb<Right>", "<cmd>BufferLineCycleNext<cr>", { desc = "切换至下个标签页" })
key.set("n", "wbq<Left>", "<cmd>BufferLineCloseLeft<cr>", { desc = "关闭左侧标签" })
key.set("n", "wbq<Right>", "<cmd>BufferLineCloseRight<cr>", { desc = "关闭右侧标签" })
key.set("n", "qq", "<cmd>q!<cr>", { desc = "退出neovim" })
key.set("n", "TF", "<cmd>lua vim.lsp.buf.format()<cr>", { desc = "格式化文档" })
key.set("n", "<leader>M", "<cmd>Yazi cwd<CR>", { desc = "打开Yazi" })
key.set("n", "<leader>m", "<cmd>NvimTreeOpen<cr>", { desc = "打开NvimTree" })

-- 单行或多行移动
key.set("v", "j", ":m '>+1<CR>gv=gv")
key.set("v", "k", ":m '<-2<CR>gv=gv")
