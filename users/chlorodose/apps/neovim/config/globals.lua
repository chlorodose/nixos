-- 启用真彩色
vim.o.termguicolors = true
-- 永远显示左侧指示图标列
vim.o.signcolumn = "yes"
-- 右侧文本长度参考线
vim.o.colorcolumn = "80"
-- 缩进字符
vim.o.softtabstop = 4
vim.o.expandtab = true
-- 自动缩进
vim.o.autoindent = true
vim.o.smartindent = true
vim.o.shiftwidth = 4
vim.o.shiftround = true
-- Providers
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0
-- 显示行数
vim.o.number = true
vim.o.relativenumber = true
-- 系统剪贴板
vim.keymap.set("", "<C-c>", "\"+y")
vim.keymap.set("", "<C-v>", "\"+p")
-- Theme
vim.cmd.colorscheme("catppuccin-mocha")

require("which-key").setup({})