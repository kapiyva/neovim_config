-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- empty setup using defaults
require("nvim-tree").setup({
  renderer = {
    icons = {
      glyphs = {
        git = {
          unstaged = "M",
          staged = "M+",
          unmerged = "↓",
          renamed = "R",
          untracked = "U",
          deleted = "D",
          ignored = "",
        },
      },
    },
  },
})

vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>')

