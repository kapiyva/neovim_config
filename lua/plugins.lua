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
    { "vim-jp/vimdoc-ja" },
    -- パッケージ管理
    { "wbthomason/packer.nvim", opt = true },

    -- lsp管理
    {
      "neoclide/coc.nvim",
      branch = "release",
      config = function ()
        require('config_plugin.coc')
      end,
    },

    -- ファジーファインダー
    {
      "nvim-telescope/telescope.nvim", tag = "0.1.1",
      requires = {{"nvim-lua/plenary.nvim"}},
      event = {"CmdwinEnter"},
    },
    -- ファジーファインダー上のファイルブラウザ
    {
      "nvim-telescope/telescope-file-browser.nvim",
      requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
      event = {"CmdwinEnteBufReadr"},
      after = "telescope.nvim",
      config = function()
        require('config_plugin.telescope')
      end,
    },

    -- ステータスバー装飾
    {
      "nvim-lualine/lualine.nvim",
      requires = { "kyazdani42/nvim-web-devicons"},
      event = {"BufEnter","BufWinEnter"},
      config = function ()
        require('config_plugin.lualine')
      end,
    },

    -- theme
    {"arcticicestudio/nord-vim",
      config = function ()
        require('config_plugin.nord')
      end,
    },

    -- スクロールバー関連
    {
      "petertriho/nvim-scrollbar",
      config = function ()
        require('config_plugin.scrollbar')
      end,
    },
    {-- Gitステータスをスクロールバーに表示
      "lewis6991/gitsigns.nvim",
      config = function ()
        require('config_plugin.gitsigns')
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
    {"github/copilot.vim"},
  }
end

return setmetatable({}, {
  __index = function(_, key)
    init()
    return packer[key]
  end,
})
