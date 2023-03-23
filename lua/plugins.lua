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

    -- ファジーファインダー
    {
      'nvim-telescope/telescope.nvim', tag = '0.1.1',
      requires = { {'nvim-lua/plenary.nvim'} }
    },

    -- ステータスバー装飾
    {
      'nvim-lualine/lualine.nvim',
      requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    },

    -- theme
    {'arcticicestudio/nord-vim'},

    -- スクロールバー関連
    {
      "petertriho/nvim-scrollbar"
    },
    {-- 検索結果をスクロールバーに表示
      "kevinhwang91/nvim-hlslens"
    },
    {-- Gitステータスをスクロールバーに表示
      "lewis6991/gitsigns.nvim"
    },

    -- rust setup
    {"rust-lang/rust.vim"},

    -- sidebar
    {"lambdalisue/fern.vim"},
    {"lambdalisue/nerdfont.vim"},
    {"lambdalisue/fern-renderer-nerdfont.vim"},
    {"lambdalisue/fern-git-status.vim"},

    -- add/delete/change surrounding pairs
    {
        "kylechui/nvim-surround",
        tag = "*", -- Use for stability; omit to use `main` branch for the latest features
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end
    },
  }
end

return setmetatable({}, {
  __index = function(_, key)
    init()
    return packer[key]
  end,
})
