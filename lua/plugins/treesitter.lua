return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter").setup({
			ensure_installed = { "c", "cpp", "cuda", "python", "lua", "typescript", "tsx" },
			highlight = { enable = true },
			indent = { enable = true }
		})
	end
}
