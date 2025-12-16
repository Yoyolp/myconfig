-- =============================================
-- 快捷键映射
-- =============================================

-- 常用操作
vim.keymap.set("n", "<leader>w", "<cmd>w<CR>", { desc = "保存文件" })
vim.keymap.set("n", "<leader>q", "<cmd>q<CR>", { desc = "退出" })
vim.keymap.set("n", "<leader>qq", "<cmd>q!<CR>", { desc = "强制退出" })
vim.keymap.set("n", "<leader>wq", "<cmd>wq<CR>", { desc = "保存并退出" })

-- 窗口管理
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "切换到左侧窗口" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "切换到下方窗口" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "切换到上方窗口" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "切换到右侧窗口" })

-- 标签页管理
vim.keymap.set("n", "<leader>tn", "<cmd>tabnew<CR>", { desc = "新建标签页" })
vim.keymap.set("n", "<leader>tc", "<cmd>tabclose<CR>", { desc = "关闭标签页" })
vim.keymap.set("n", "<leader>th", "<cmd>tabprevious<CR>", { desc = "上一个标签页" })
vim.keymap.set("n", "<leader>tl", "<cmd>tabnext<CR>", { desc = "下一个标签页" })
