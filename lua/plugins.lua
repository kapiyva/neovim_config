return {
    { "vim-jp/vimdoc-ja", opt = true },
    -- パッケージ管理
    { "wbthomason/packer.nvim", opt = true },

    -- lsp管理
    {
      "neoclide/coc.nvim",
      branch = "release",
      keys = { "<leader>" },
      config = function ()
        require('plugin_config.coc')
      end,
    },

    -- ファジーファインダー
    {
      "nvim-telescope/telescope.nvim", tag = "0.1.1",
      dependencies = {"nvim-lua/plenary.nvim"},
      keys = { "<leader>" },
      config = function()
        require('plugin_config.telescope')
      end,
    },

    -- ファイルツリー
    {
      "nvim-treesitter/nvim-treesitter",
      lazy = true,
    },

    -- ファイルエクスプローラー
    {
      "nvim-tree/nvim-tree.lua",
      dependencies = { "kyazdani42/nvim-web-devicons" },
      keys = { "<leader>" },
      config = function()
        require('plugin_config.nvim-tree')
      end,
    },

    -- ステータスバー装飾
    {
      "nvim-lualine/lualine.nvim",
      dependencies = { "kyazdani42/nvim-web-devicons"},
      lazy = true,
      config = function ()
        require('plugin_config.lualine')
      end,
    },

    -- theme
    {
      "folke/tokyonight.nvim",
      config = function ()
        require('plugin_config.tokyonight')
      end,
    },

    -- スクロールバー関連
    {
      "petertriho/nvim-scrollbar",
      config = function ()
        require('plugin_config.scrollbar')
      end,
    },
    {-- Gitステータスをスクロールバーに表示
      "lewis6991/gitsigns.nvim",
      lazy = true,
      config = function ()
        require('plugin_config.gitsigns')
      end,
    },

    -- rust setup
    {"rust-lang/rust.vim"},

    -- add/delete/change surrounding pairs
    {
        "kylechui/nvim-surround",
        lazy = true,
        config = function()
            require("nvim-surround").setup({})
        end
    },
    -- copilot
    {"github/copilot.vim",
      keys = { "<leader>" },
    },
    
    -- commentary
    {"tpope/vim-commentary"},
    -- window resize
    {"simeji/winresizer",
      keys = { "<leader>" },
    },
  }
