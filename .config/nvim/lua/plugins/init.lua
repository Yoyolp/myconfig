return {
  -- 主题
  {
    "catppuccin/nvim",
    name = "catppuccin", 
    priority = 1000,
    lazy = false,  -- 确保立即加载
    config = function()
      -- 最小化配置
      require("catppuccin").setup({})
      vim.cmd.colorscheme("catppuccin")
    end,
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' }
  },

  -- 文件树插件
  {
    'nvim-tree/nvim-tree.lua',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {}
  }
}
