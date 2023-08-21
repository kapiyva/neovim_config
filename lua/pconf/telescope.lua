require('telescope').setup({
  defaults = {
    file_ignore_patterns = { 'node_modules', '.git', 'venv', },
  },
  extentions = {
    coc = {
      prefer_locations = true,
    }
  }
})

require('telescope').load_extension('coc')

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>fa', "<cmd>Telescope<cr>", {})
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>fd', "<cmd>Telescope coc workspace_diagnostics<cr>", {})

