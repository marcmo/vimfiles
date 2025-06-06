-- ~/.config/nvim/lua/options.lua

local opt = vim.opt
local g = vim.g

-- Encoding
opt.encoding = "utf-8"
opt.fileencoding = "utf-8"

-- UI
opt.number = true
opt.relativenumber = false
opt.cursorline = true
opt.wrap = false
opt.termguicolors = true
opt.signcolumn = "yes"
opt.scrolloff = 8
opt.sidescrolloff = 8
opt.cmdheight = 1
opt.showmode = false

-- Tabs & Indents
opt.expandtab = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.softtabstop = 2
opt.smartindent = true
opt.autoindent = true

-- Search
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true
opt.incsearch = true

-- Behavior
opt.mouse = "a"
opt.clipboard = "unnamedplus"
opt.splitright = true
opt.splitbelow = true
opt.hidden = true
opt.swapfile = false
opt.backup = false
opt.undofile = true
opt.updatetime = 300
opt.timeoutlen = 500
opt.completeopt = { "menuone", "noselect" }
opt.wildmode = { "longest", "full" }
opt.history = 1000
opt.lazyredraw = true
opt.virtualedit = "block"
opt.diffopt:append({ "vertical", "context:4", "iwhite" })
