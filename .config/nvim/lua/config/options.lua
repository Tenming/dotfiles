local opt = vim.opt

-- 行号
opt.relativenumber = true  --相对
opt.number = true

-- 缩进
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

-- 防止包裹
opt.wrap = false

-- 光标所在行高亮
opt.cursorline= true

-- 启用鼠标
opt.mouse:append("a")

-- 剪贴板
opt.clipboard:append("unnamedplus")

-- 新窗口
opt.splitright = true
opt.splitbelow = true

-- 搜索
opt.ignorecase = true -- 忽略大小写
opt.smartcase = true -- 智能搜索

-- 外观
opt.termguicolors = true
opt.signcolumn = "yes"

--
