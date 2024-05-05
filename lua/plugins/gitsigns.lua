return {
  "lewis6991/gitsigns.nvim",
  config = function()
    local gitsigns = require("gitsigns")
    gitsigns.setup({})

    vim.keymap.set("n", "<leader>gd", gitsigns.preview_hunk_inline)
    vim.keymap.set("n", "<leader>gr", gitsigns.reset_hunk)
  end
}
