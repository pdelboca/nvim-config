vim.g.mapleader = " "

-- [[ Setting options ]]
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
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.swapfile = false

vim.opt.autoindent = true
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"}, {
  pattern = {"*.js", "*.html", "*.css", "*.lua", "*.tf", "*.ts"},
  callback = function()
    vim.opt.tabstop = 2
    vim.opt.softtabstop = 2
    vim.opt.shiftwidth = 2
  end
})
-- Clean trailing whitespace
vim.api.nvim_create_autocmd({"BufWritePre"}, {
  pattern = {"*.py", "*.css", "*.md", "*.qss"},
  callback = function()
    vim.api.nvim_command("%s/\\s\\+$//e")
  end
})

-- [[ Basic Keymaps ]]
vim.keymap.set("n", "<leader>t", "<cmd>NvimTreeToggle<CR>", { desc = "NVimTree toggle window"})
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
vim.keymap.set("n", "<C-PageUp>", "<cmd>bnext<cr>", {desc = "Move to next buffer"})
vim.keymap.set("n", "<C-PageDown>", "<cmd>bprevious<cr>", {desc = "Move to previous buffer"})
vim.keymap.set("i", "<C-PageUp>", "<cmd>bnext<cr>", {desc = "Move to next buffer"})
vim.keymap.set("i", "<C-PageDown>", "<cmd>bprevious<cr>", {desc = "Move to previous buffer"})
vim.keymap.set("n", "<leader>b", "Oimport ipdb; ipdb.set_trace();<esc>:w<cr>")

-- When normal or editing I do not want arrow keys to jump between lines. Navigating long lines gets annoying if they are wrapped.
-- I want a more traditional text editor navigation style.
vim.keymap.set("n", "<Up>", "gk")
vim.keymap.set("n", "<Down>", "gj")
vim.keymap.set("i", "<Up>", "<C-o>gk")
vim.keymap.set("i", "<Down>", "<C-o>gj")

-- LSP Configurations (requires NVIM 0.11+)
-- Requires pyright: uv tool install pyright
vim.lsp.enable("pyright")

-- Enable auto completion (requires NVIM 0.11+)
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    if client:supports_method('textDocument/completion') then
      vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
    end
  end,
})

-- Use CTRL-space to manually trigger LSP completion.
-- Use CTRL-Y to select an item. |complete_CTRL-Y|
vim.keymap.set('i', '<c-space>', function()
  vim.lsp.completion.get()
end)

-- Add noselect to completeopt, otherwise autocomplete is annoying
vim.cmd("set completeopt+=noselect")

-- Install lazy-nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({"git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath,})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")
vim.cmd.colorscheme "catppuccin"
