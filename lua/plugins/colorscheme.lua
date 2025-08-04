return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      transparent = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
    },
  },
  {
    "ellisonleao/gruvbox.nvim",
    lazy = false,
    priority = 1000,
    opts = {
       contrast = "soft",
       transparent_mode = true,
    },
  },
  {
    "f-person/auto-dark-mode.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("auto-dark-mode").setup({
        update_interval = 1000,
        set_dark_mode = function()
          vim.o.background = "dark"
          vim.cmd.colorscheme("tokyonight")
        end,
        set_light_mode = function()
          vim.o.background = "light"
          vim.cmd.colorscheme("gruvbox")
        end,
      })
    end,
  },
}
