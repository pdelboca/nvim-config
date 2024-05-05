vim.g.mapleader = " "

-- [[ Setting options ]]
vim.cmd "colorscheme desert"
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.number = true
vim.opt.relativenumber=true
vim.opt.mouse = "a"
vim.opt.clipboard = "unnamedplus"
vim.opt.undofile = true
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
vim.opt.inccommand = "split"
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop =4
vim.opt.shiftwidth = 4

-- [[ Basic Keymaps ]]
vim.keymap.set("n", "<leader>bd", "<cmd>%bd|e#|bd#<cr>", {desc = "Close all other buffers"} )
vim.keymap.set("n", "<C-n>", "<cmd>NvimTreeToggle<CR>", { desc = "NVimTree toggle window"})

-- Install lazy-nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({"git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath,})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")
