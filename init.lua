vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.g.mapleader = " "

vim.opt.number = true
vim.opt.colorcolumn = "100"

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.o.rtp = lazypath .. "," .. vim.o.rtp

local plugins = {
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      { "<C-p>", function() require("telescope.builtin").find_files() end, desc = "Find files" },
      { "<leader>fg", function() require("telescope.builtin").live_grep() end, desc = "Live grep" },
    }
  }
}
local opts = {}

require("lazy").setup(plugins, opts)

require("catppuccin").setup()
vim.cmd.colorscheme "catppuccin-mocha"
