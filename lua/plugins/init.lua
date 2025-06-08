-- ~/.config/nvim/lua/plugins/init.lua

return {
  -- Essentials
  { "tpope/vim-surround" },
  { "tpope/vim-unimpaired" },
  { "tpope/vim-repeat" },
  { "numToStr/Comment.nvim", config = true },

  -- Navigation
  {
    "preservim/nerdtree",
    cmd = { "NERDTreeToggle", "NERDTreeFind" },
    init = function()
      vim.g.NERDTreeShowHidden = 1
      vim.g.NERDTreeQuitOnOpen = 1
      vim.keymap.set("n", ",d", function()
        vim.cmd("execute 'NERDTreeToggle ' . getcwd()")
        vim.cmd("wincmd b") -- like <C-W>b
      end, { desc = "NERDTree toggle at cwd" })

      vim.keymap.set("n", ",f", ":NERDTreeFind<CR>", { silent = true, desc = "NERDTree find current file" })
    end,
  },
  {
    "junegunn/fzf",
    build = "./install --bin", -- installs fzf binary locally
    lazy = true,
  },
  {
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("fzf-lua").setup({})
    end,
    cmd = "FzfLua", -- lazy load on use
  },
  -- UI
  { "nvim-lualine/lualine.nvim", dependencies = { "nvim-tree/nvim-web-devicons" }, config = true },
  {
    "navarasu/onedark.nvim",
    priority = 1000,  -- Load before other plugins for consistency
    config = function()
      require("onedark").setup {
        style = "dark",  -- other options: 'dark', 'cool', 'warm', 'warmer'
      }
      require("onedark").load()
    end,
  },

  -- LSP & Autocompletion
  { "neovim/nvim-lspconfig" },
  { "hrsh7th/nvim-cmp" },
  { "hrsh7th/cmp-nvim-lsp" },
  { "L3MON4D3/LuaSnip" },

  -- Treesitter for better syntax
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },

  -- Git
  { "lewis6991/gitsigns.nvim", config = true },

  -- Formatting & Linting
  { "stevearc/conform.nvim" }, -- modern formatter

  -- Session & MRU
  { "ethanholz/nvim-lastplace" },
  { "Shatur/neovim-session-manager" },

  -- Utility
  { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },
  { "nvim-lua/plenary.nvim" },
}

