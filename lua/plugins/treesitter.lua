return { 
	"nvim-treesitter/nvim-treesitter", 
	build = ":TSUpdate",
	config = function()
		local config = require("nvim-treesitter.configs")
		config.setup({
			ensure_installed = {"lua", "java", "c", "python", "typescript", "tsx", "prisma"},
			highlight = { enable = true },
			indent = { enable = true }
		})
	end
}
