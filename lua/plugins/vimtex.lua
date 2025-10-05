return {
	"lervag/vimtex",
	lazy = false, 
	init = function()
		vim.g.vimtex_view_method = "zathura"
        vim.keymap.set('n', "<leader>p", 
            ":!zathura <C-r> expand('%:r')<cr>.pdf &<cr>")
        vim.g.vimtex_quickfix_ignore_into = 'Underfull'
	end,
}
