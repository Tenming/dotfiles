vim.g.mapleader =  " "

local key = vim.keymap

-- 插入模式 --
key.set("i","<leader>q","<Esc>")

-- 正常模式 --
-- 窗口
key.set("n","<leader>sv","<C-w>v") -- 水平新增窗口
key.set("n","<leader>sh","<C-w>s") -- 垂直新增窗口
key.set("n","<C-Left>","<C-w><Left>")
key.set("n","<C-Right>","<C-w><Right>")
key.set("n","<C-Up>","<C-w><Up>")
key.set("n","<C-Down","<C-w><Down>")
  -- Neotree
  key.set("n","<leader>m","<cmd>Neotree toggle<CR>")

-- 可视模式 --
-- 单行或多行移动
key.set("v","j",":m '>+1<CR>gv=gv")
key.set("v","k",":m '<-2<CR>gv=gv")

