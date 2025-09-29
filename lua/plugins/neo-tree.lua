return	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		},
		config = function()
			vim.keymap.set('n', '<leader>q', ':Neotree toggle<CR>')
			vim.keymap.set('n', '<leader>w', '<C-w><Left>')
			vim.keymap.set('n', '<leader>e', '<C-w><Right>')
			vim.keymap.set('n', '<leader>r', ':bd<CR><C-w><Left>')
		end
	}
