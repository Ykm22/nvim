return {
  "yacineMTB/pyrepl.nvim",
  ft = "python",
  config = function()
    require("pyrepl").setup()
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "python",
      callback = function()
        vim.keymap.set("v", "<leader>r", function()
          require("pyrepl").run_selected_lines()
        end, { buffer = true, desc = "Run selected Python code" })
      end
    })
  end,
}
