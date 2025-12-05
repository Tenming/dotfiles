-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
local opt = vim.opt
opt.wrap = true
opt.textwidth = 120
opt.relativenumber = false
opt.scrolloff = 4
opt.spelllang = { "en", "zh_CN" }
opt.autoread = true
-- 设置光标形状和闪烁
opt.gcr = "a:hor20,i:ver20,a:blinkwait700-blinkoff400-blinkon250"
