vim.api.nvim_create_user_command("PackerInstall", [[packadd packer.nvim | lua require("plugins").install()]], { bang = true })
vim.api.nvim_create_user_command("PackerUpdate", [[packadd packer.nvim | lua require("plugins").update()]], { bang = true })
vim.api.nvim_create_user_command("PackerSync", [[packadd packer.nvim | lua require("plugins").sync()]], { bang = true })
vim.api.nvim_create_user_command("PackerClean", [[packadd packer.nvim | lua require("plugins").clean()]], { bang = true })
vim.api.nvim_create_user_command("PackerCompile", [[packadd packer.nvim | lua require("plugins").compile()]], { bang = true })

require('options')

