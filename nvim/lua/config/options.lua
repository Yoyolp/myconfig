vim.opt.number = true           -- 显示行号
vim.opt.relativenumber = false  -- 显示相对行号
vim.opt.cursorline = false      -- 高亮当前行
vim.opt.signcolumn = "yes"      -- 总是显示标记列

-- 缩进设置
vim.opt.tabstop = 2             -- Tab 宽度
vim.opt.shiftwidth = 2          -- 自动缩进宽度
vim.opt.expandtab = true        -- 用空格代替 Tab
vim.opt.smartindent = true      -- 智能缩进
vim.opt.autoindent = true       -- 自动缩进

-- 搜索设置
vim.opt.ignorecase = true       -- 忽略大小写
vim.opt.smartcase = true        -- 智能大小写
vim.opt.hlsearch = true         -- 高亮搜索结果
vim.opt.incsearch = true        -- 实时搜索

-- 外观设置
vim.opt.termguicolors = false   -- 启用真彩色
vim.opt.background = "dark"     -- 深色背景
vim.opt.wrap = false            -- 不自动换行
vim.opt.scrolloff = 8           -- 上下保留行数
vim.opt.sidescrolloff = 8       -- 左右保留列数
vim.opt.showmatch = true        -- 显示匹配括号

-- 文件设置
vim.opt.encoding = "utf-8"      -- 文件编码
vim.opt.fileencoding = "utf-8"  -- 文件写入编码
vim.opt.backup = false          -- 不创建备份文件
vim.opt.writebackup = false     -- 不创建写入备份
vim.opt.swapfile = false        -- 不创建交换文件
vim.opt.undofile = true         -- 持久化撤销历史
vim.opt.undodir = vim.fn.stdpath("data") .. "/undo" -- 撤销文件目录

-- 其他设置
vim.opt.mouse = "a"             -- 启用鼠标
vim.opt.clipboard = "unnamedplus" -- 系统剪贴板
vim.opt.completeopt = "menuone,noselect" -- 补全选项
vim.opt.timeoutlen = 500        -- 快捷键超时时间
vim.opt.updatetime = 300        -- 更新时间