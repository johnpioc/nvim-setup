return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.black,
				null_ls.builtins.formatting.isort,
				null_ls.builtins.formatting.terraform_fmt,
				null_ls.builtins.formatting.clang_format.with({
					filetypes = { "c", "cpp", "cuda" },
					extra_args = { "--style=file", "--fallback-style=Google" },
				}),
				null_ls.builtins.formatting.prettier.with({
					filetypes = { "html", "css", "scss", "less", "javascript", "javascriptreact", "typescript", "typescriptreact" },
				}),
			},
		})
		vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})

		vim.api.nvim_create_autocmd("BufWritePre", {
			pattern = { "*.c", "*.cc", "*.cpp", "*.cu", "*.h", "*.hpp", "*.tpp" },
			callback = function() vim.lsp.buf.format({ async = false }) end,
		})

		vim.api.nvim_create_autocmd("BufWritePre", {
			pattern = { "*.tf", "*.tfvars" },
			callback = function() vim.lsp.buf.format({ async = false }) end,
		})

		vim.api.nvim_create_autocmd("BufWritePre", {
			pattern = { "*.html", "*.css", "*.scss", "*.less", "*.js", "*.jsx", "*.ts", "*.tsx" },
			callback = function() vim.lsp.buf.format({ async = false }) end,
		})
	end,
}
