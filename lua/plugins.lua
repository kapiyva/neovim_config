local packer
local function init()
  if not packer then
    packer = require "packer"
    packer.init ({disable_commands = true})
  end
  packer.reset()

  packer.use{
    { 'vim-jp/vimdoc-ja' },
    -- パッケージ管理
    { "wbthomason/packer.nvim" },

    -- lsp管理
    {'neoclide/coc.nvim', branch = 'release'},

    {-- ファジーファインダー
      'nvim-telescope/telescope.nvim', tag = '0.1.1',
      requires = { {'nvim-lua/plenary.nvim'} }
    },

    {
      'nvim-lualine/lualine.nvim',
      requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    },

    -- theme
    {'arcticicestudio/nord-vim'},

    {
      "folke/trouble.nvim",
      requires = "nvim-tree/nvim-web-devicons",
      config = function()
        require("trouble").setup(
          signs = {
            error = "E",
            warning = "W",
            hint = "H",
            information = "I",
          },
        )
      end
    },


    -- スクロールバー関連
    {
      "petertriho/nvim-scrollbar",
      config = function()
        require('scrollbar').setup()
      end,
    },
    {-- 検索結果をスクロールバーに表示
      "kevinhwang91/nvim-hlslens",
      config = function()
        require("hlslens").setup({
           build_position_cb = function(plist, _, _, _)
                require("scrollbar.handlers.search").handler.show(plist.start_pos)
           end,
        })
        vim.cmd([[
            augroup scrollbar_search_hide
                autocmd!
                autocmd CmdlineLeave : lua require('scrollbar.handlers.search').handler.hide()
            augroup END
        ]])
      end,
    },
    {-- Gitステータスをスクロールバーに表示
      "lewis6991/gitsigns.nvim",
      config = function()
        require('gitsigns').setup()
        require("scrollbar.handlers.gitsigns").setup()
      end
    },

    -- rust setup
    {"rust-lang/rust.vim"},

    -- sidebar
    {"lambdalisue/fern.vim"},
    {"lambdalisue/nerdfont.vim"},
    {"lambdalisue/fern-renderer-nerdfont.vim"},
    {"lambdalisue/fern-git-status.vim"},

  }
end

return setmetatable({}, {
  __index = function(_, key)
    init()
    return packer[key]
  end,
})
