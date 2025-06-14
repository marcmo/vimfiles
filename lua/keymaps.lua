-- ~/.config/nvim/lua/keymaps.lua

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Escape and helpers
map("i", "kj", "<Esc>", opts)
map("i", "<F1>", "<Esc>", opts)
map("n", "<F1>", "<nop>", opts)

-- Timestamp
map("n", "<F22>", function()
  vim.fn.setreg('\"', os.date("%Y%m%d-%H%M"))
  vim.cmd("normal! P")
end, opts)

-- Visual mode timestamp replacement
map("v", "<F22>", [[:s/.*/<C-R>=strftime("%Y%m%d-%H%M")<CR>/g<CR>]], opts)

-- window switching
map({ "n", "v" }, ";;", function() require("utils").switch_window_keep_cwd() end, opts)

-- Re-select last changed
map("n", "gp", "`[v`]", opts)

-- Source current line or selection
map("v", "<leader>S", "y:execute @@<CR>:echo 'Sourced selection.'<CR>", opts)
map("n", "<leader>S", "^vg_y:execute @@<CR>:echo 'Sourced line.'<CR>", opts)

-- Toggle view
map("n", "<leader>w", ":set wrap!<CR>", opts)
map("n", "<leader>l", ":set list!<CR>", opts)

-- Split nav
map("n", ",v", ":vsp<CR><C-w><C-w>", opts)
map("n", ",h", ":sp<CR><C-w><C-w>", opts)
map("n", ",o", ":only<CR>", opts)

-- Buffer
map("n", ",a", ":e#<CR>", opts)
map("n", ",w", ":bd<CR>", opts)
map("n", "<C-S-Tab>", ":bp<CR>", opts)

-- Movement with wrapped lines
map("n", "j", "gj", opts)
map("n", "k", "gk", opts)

-- Escape shortcuts
map("n", "<Leader><Tab>", "<Esc>", opts)
map("v", "<Tab>", "<Esc>gV", opts)
map("v", "<Leader><Tab>", "<Esc>gV", opts)
map("o", "<Tab>", "<Esc>", opts)
map("o", "<Leader><Tab>", "<Esc>", opts)
map("c", "<Leader><Tab>", "<Esc>", opts)
map("i", "<Leader><Tab>", "<Esc>", opts)

-- fzf setup
map("n", ",u", "<cmd>FzfLua oldfiles<CR>")
map("n", "<space><space>", "<cmd>FzfLua files<CR>")
map("n", "<leader>a", "<cmd>FzfLua live_grep<CR>")
map("n", "<leader>q", function()
  require("fzf-lua").live_grep({ default_text = vim.fn.expand("<cword>") })
end, { desc = "live grep word under cursor" })
map("n", "<C-p>", "<cmd>FzfLua buffers<CR>")
map("n", "<leader>gd", "<cmd>FzfLua git_diff<CR>")
map("n", "<leader>gs", "<cmd>FzfLua git_status<CR>")

-- LSP
map("n", "gd", vim.lsp.buf.definition, opts)
map("n", "K", vim.lsp.buf.hover, opts)
map("n", "gr", vim.lsp.buf.references, opts)
map("n", "<leader>rn", vim.lsp.buf.rename, opts)
map("n", "<leader>f", function() vim.lsp.buf.format({ async = true }) end, opts)

-- Custom utils
map("n", "<leader>c", function() require("utils").clean_buffer() end, opts)

-- Make
map("n", ",m", ":make<CR>", opts)

-- QuickRun substitute
map("n", ",rr", ":!%<CR>", opts)
map("v", ",rr", ":'<,'>w !sh<CR>", opts)

-- Tab-to-spaces substitute
map("n", ",s", function() vim.cmd("set expandtab | retab") end, opts)

-- Indent Guides toggle
map("n", "<leader>I", function() require("utils").toggle_indent_guides() end, opts)

-- Toggle spell
map("n", "<F9>", function() require("utils").toggle_spell() end, opts)
map("i", "<F9>", "<Esc>:lua require('utils').toggle_spell()<CR>a", opts)

-- Easy align
map("v", "<CR>", "<Plug>(EasyAlign)", {})
