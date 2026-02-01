return {
	"lervag/vimtex",
	lazy = false,
	init = function()
		vim.g.vimtex_view_method = "zathura"
		vim.keymap.set("n", "<leader>p", ":!zathura <C-r> expand('%:r')<cr>.pdf &<cr>")
		vim.g.vimtex_quickfix_ignore_into = "Underfull"
		vim.g.vimtex_compiler_latexmk = {
			options = {
				"-verbose",
				"-file-line-error",
				"-synctex=1",
				"-interaction=nonstopmode",
				-- >>> The important line to add is here <<<
				"-shell-escape",
			},
		}
	end,
}
