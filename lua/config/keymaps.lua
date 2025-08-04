vim.keymap.set("n", "<leader>tl", function()
  vim.o.background = vim.o.background == "dark" and "light" or "dark"
end, { desc = "Toggle light/dark theme" })
