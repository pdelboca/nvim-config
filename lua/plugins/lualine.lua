return {
  "nvim-lualine/lualine.nvim",
  config = function ()
    require("lualine").setup({
      sections = {
        lualine_a = {"mode"},
        lualine_b = {"buffers"},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {{"filename", path = 1}},
        lualine_z = {"branch"}
      },
      extension = {"nvim-tree"},
    })
    -- Keymaps to navigate buffers
    vim.keymap.set("n", "<Tab>", "<cmd>bnext<CR>", { desc = "Navigate next buffer."})
    vim.keymap.set("n", "<C-Shift-Tab>", "<cmd>bprev<CR>", { desc = "Navigate previous buffer."})
  end,
  dependencies = { "nvim-tree/nvim-web-devicons" }
  }
