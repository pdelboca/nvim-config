return { -- Highlight, edit, and navigate code
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = { "bash", "lua", "markdown", "vim", "vimdoc", "python", "css", "terraform", "dockerfile", "go", "cpp" },
      auto_install = true,
      highlight = { enable = true },
      indent = { enable = true },
    })
  end,
 }
