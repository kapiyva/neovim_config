local packer
local function init()
  if not packer then
    packer = require "packer"
    packer.init ({
      disable_commands = true,
      display = {
        open_fn = function()
          return require("packer.util").float({ border = "single" })
        end,
      },
    })
  end
  packer.reset()

  packer.use{
    { "vim-jp/vimdoc-ja", opt = true },
    -- パッケージ管理
    { "wbthomason/packer.nvim", opt = true },

    -- lsp管理
    {
      "neoclide/coc.nvim",
      branch = "release",
      config = function ()
        require('plugin_config.coc')
      end,
    },

    -- ファジーファインダー
    {
      "nvim-telescope/telescope.nvim", tag = "0.1.1",
      requires = {{"nvim-lua/plenary.nvim"}},
      event = {"VimEnter"},
      config = function()
        require('plugin_config.telescope')
      end,
    },

    -- ファイルエクスプローラー
    {
      "lambdalisue/fern.vim",
      config = function()
        require('plugin_config.fern')
      end,
    },

    -- ステータスバー装飾
    {
      "nvim-lualine/lualine.nvim",
      requires = { "kyazdani42/nvim-web-devicons"},
      event = {"BufEnter","BufWinEnter"},
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
      config = function ()
        require('plugin_config.gitsigns')
      end,
    },

    -- rust setup
    {"rust-lang/rust.vim"},

    -- add/delete/change surrounding pairs
    {
        "kylechui/nvim-surround",
        tag = "*", -- Use for stability; omit to use `main` branch for the latest features
        config = function()
            require("nvim-surround").setup({})
        end
    },
    -- copilot
    {"github/copilot.vim",
      event = {"BufRead"},
    },
    
    -- commentary
    {"tpope/vim-commentary"},
    -- window resize
    {"simeji/winresizer"},
  }
end

return setmetatable({}, {
  __index = function(_, key)
    init()
    return packer[key]
  end,
})
