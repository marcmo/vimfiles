-- ~/.config/nvim/lua/utils.lua

local M = {}

function M.clean_buffer()
  local view = vim.fn.winsaveview()
  vim.cmd([[%s/\s\+$//e]])
  if vim.fn.has("unix") == 1 then
    vim.cmd([[%s/\r\+$//e]])
  end
  vim.fn.winrestview(view)
end

function M.toggle_spell()
  if vim.wo.spell then
    vim.wo.spell = false
  else
    vim.wo.spell = true
    vim.bo.spelllang = "en_us"
  end
end

local indent_guides_enabled = false

function M.toggle_indent_guides()
  indent_guides_enabled = not indent_guides_enabled
  if indent_guides_enabled then
    vim.cmd([[highlight IndentGuides guibg=#303030 ctermbg=234]])
    vim.fn.matchadd("IndentGuides", [[\%(^\s*\)\@<=\%\(\%3v\|\%5v\|\%7v\|\%9v\|\%11v\|\%13v\|\%15v\)\s]])
  else
    vim.cmd([[2match none]])
  end
end

function M.switch_window_keep_cwd()
  local current = vim.fn.getcwd()
  vim.cmd("wincmd W")
  vim.cmd("cd " .. vim.fn.fnameescape(current))
end

return M
