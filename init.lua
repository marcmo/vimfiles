-- ~/.config/nvim/init.lua
-- disable netrw at the very start
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Load core options, keymaps, and autocommands
require("options")
require("keymaps")
require("autocmds")

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Setup plugins
require("lazy").setup({
  { import = "plugins" },
})

-- Set colorscheme
vim.cmd.colorscheme("onedark")

-- stop command suggestions from auto-selecting the first item:
vim.o.wildmode = "longest:full,full" -- disables preselection
vim.o.wildmenu = true
vim.o.pumblend = 0       -- disable transparency
vim.o.completeopt = "menu,menuone,noselect"
