return {
  "nvim-lualine/lualine.nvim",
  config = function ()
    require("lualine").setup({
      sections = {
        lualine_a = {"mode"},
        lualine_b = {"branch"},
        lualine_c = {
          {"diagnostics", sources = {"nvim_diagnostic"}, symbols = { error = "E ", warn = "W ", info = "I ", hint = "H " }},
          {"filename", path = 1}
        },
        lualine_x = {},
        lualine_y = {"location"},
        lualine_z = {}
      },
      extension = {"nvim-tree"},
    })
    -- Keymaps to navigate buffers
    vim.keymap.set("n", "<Tab>", "<cmd>bnext<CR>", { desc = "Navigate next buffer."})
    vim.keymap.set("n", "<C-Shift-Tab>", "<cmd>bprev<CR>", { desc = "Navigate previous buffer."})
  end,
  dependencies = { "nvim-tree/nvim-web-devicons" }
  }
