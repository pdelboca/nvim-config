vim.g.mapleader = " "

-- [[ Setting options ]]
vim.cmd "colorscheme desert"

-- Disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.number = true
vim.opt.relativenumber=true
-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = "a"
-- Sync clipboard between OS and Neovim.
--  See `:help 'clipboard'`
vim.opt.clipboard = "unnamedplus"
vim.opt.undofile = true
-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true
-- Sets how neovim will display certain whitespace in the editor.
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
-- Preview substitutions live, as you type!
vim.opt.inccommand = "split"

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
