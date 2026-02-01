return {
	{
		"williamboman/mason.nvim",
		opts = {
			ensure_installed = {
				"pyright",
                "tailwindcss-language-server"
			},
		},
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"clangd",
					"pyright",
					"texlab",
                    "vtsls",
                    "emmet_ls",
                    "tailwindcss",
                    "prismals"
				},
			})
		end,
		opts = {
			automatic_enable = {
				exclude = {
					"jdtls",
				},
			},
		},
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			vim.lsp.config("lua_ls", {
				capabilities = capabilities,
			})
			vim.lsp.config("clangd", {
				capabilities = capabilities,
			})
			vim.lsp.config("pyright", {
				capabilities = capabilities,
				filetypes = { "python" },
			})
            vim.lsp.config("texlab", {
                capabilities = capabilities
            })
            vim.lsp.config("vtsls", {
                capabilities = capabilities,
            })

            vim.lsp.config("emmet_ls", {
                filetypes = { 'html', 'css', 'javascriptreact', 'typescriptreact' }
            })

            vim.lsp.config("tailwindcss", {
                filetypes = { 'html', 'javascriptreact', 'react', 'typescriptreact' }
            })

            vim.lsp.config('prismals', vim.lsp.config.prismals)

			vim.lsp.enable("lua_ls")
			vim.lsp.enable("clangd")
			vim.lsp.enable("pyright")
            vim.lsp.enable("texlab")
            vim.lsp.enable("ts_ls")
            vim.lsp.enable("emmet_ls")
            vim.lsp.enable("tailwindcss")
            vim.lsp.enable("prismals")

			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
		end,
	},
	{
		"mfussenegger/nvim-jdtls",
	},
}
