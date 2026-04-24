return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter").setup({
			ensure_installed = { "c", "cpp", "cuda", "python", "lua", "typescript", "tsx", "terraform", "hcl", "html", "css", "javascript" },
			highlight = { enable = true },
			indent = { enable = true }
		})
	end
}
