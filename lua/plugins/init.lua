-- ~/.config/nvim/lua/plugins/init.lua

return {
  -- Essentials
  { "tpope/vim-surround" },
  { "tpope/vim-unimpaired" },
  { "tpope/vim-repeat" },
  { "numToStr/Comment.nvim", config = true },

  -- Navigation
  { "nvim-tree/nvim-tree.lua", dependencies = { "nvim-tree/nvim-web-devicons" }, config = true },
  { "nvim-telescope/telescope.nvim", tag = "0.1.4", dependencies = { "nvim-lua/plenary.nvim" } },

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

