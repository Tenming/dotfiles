local opt = vim.opt
-- neovide
if vim.g.neovide then
  opt.linespace = 2
  vim.g.neovide_hide_mouse_when_typing = true -- 打字时隐藏鼠标
  vim.g.neovide_refresh_rate = 60             -- 程序刷新率
  vim.g.neovide_cursor_vfx_mode = "torpedo"   -- 光标动画 https://neovide.dev/configuration.html#cursor-particles
end
-- 行号
opt.relativenumber = false --相对
opt.number = true
-- 缩进
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true
-- 防止包裹
opt.wrap = false
-- 光标所在行高亮
opt.cursorline = true
-- 移动时光标周围保留4行
opt.scrolloff = 4
-- 启用鼠标
opt.mouse:append("a")
-- 剪贴板
opt.clipboard:append("unnamedplus")
-- 新窗口
opt.splitright = true
opt.splitbelow = true
-- 搜索
opt.ignorecase = true -- 忽略大小写
opt.smartcase = true  -- 智能搜索
-- 外观
opt.termguicolors = true
opt.signcolumn = "yes"
-- 自动加载外部修改
opt.autoread = true
-- 不可见字符的显示，这里只把空格显示为一个点
opt.list = false
opt.listchars = "space:․"

