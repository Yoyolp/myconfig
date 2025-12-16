-- ~/.config/nvim/init.lua

-- =============================================
-- Neovim 基础配置
-- =============================================

-- 清除可能影响主题的环境变量
vim.env.THEME = nil
vim.env.COLORSCHEME = nil
vim.env.GRUVBOX_THEME = nil

-- 强制设置终端颜色
vim.o.termguicolors = true

-- 设置终端标题
vim.opt.title = true
vim.opt.titlestring = "nvim: %{expand('%:p')}"

-- 设置 leader 键
vim.g.mapleader = " "
vim.g.maplocalleader = " "

require('config.options')
require('config.keymaps')
-- require('config.autocmds')
require("config.lazy")
