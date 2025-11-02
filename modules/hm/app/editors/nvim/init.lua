vim.o.number = true
vim.o.relativenumber = true
vim.o.signcolumn = "yes"
vim.o.wrap = false
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.smartindent = true
vim.o.swapfile = false
vim.o.undofile = true
vim.o.undodir = vim.fn.expand("~/.vim/undo")
vim.o.winborder = "rounded"
vim.o.termguicolors = true
vim.cmd("colorscheme cool")
vim.cmd(":hi statusline guibg=NONE")

vim.g.mapleader = " "
vim.keymap.set('n', '<leader>o', ':update<CR> :source<CR>')
vim.keymap.set('n', '<leader>w', ':write<CR>')
vim.keymap.set('n', '<leader>q', ':quit<CR>')
vim.keymap.set({ 'n', 'v', 'x' }, '<leader>y', '"+y<CR>')
vim.keymap.set({ 'n', 'v', 'x' }, '<leader>p', '"+p<CR>')
vim.keymap.set('n', '<leader>c', ':edit ' .. vim.fn.expand('$MYVIMRC') .. '<CR>')

vim.pack.add({
	{ src = "https://github.com/christoomey/vim-tmux-navigator" },
	{ src = "https://github.com/nvim-telescope/telescope.nvim" },
	{ src = "https://github.com/nvim-lua/plenary.nvim" },
	{ src = "https://github.com/nvimtools/none-ls.nvim" },
})
require('telescope').setup()

local null_ls = require("null-ls")
null_ls.setup({
	sources = {
		null_ls.builtins.diagnostics.mypy.with({
			extra_args = { "--strict" }
		}),
	},
})


vim.lsp.enable({ "lua_ls", "nixd",  "ruff", "tinymist" })
vim.lsp.inlay_hint.enable(true)
vim.diagnostic.config({
	virtual_lines = false,
	virtual_text = true,
	update_in_insert = false,
	severity_sort = true,
})

vim.keymap.set('n', '<leader>gf', vim.lsp.buf.format)
vim.keymap.set('n', '<leader>ff', ":Telescope find_files<CR>")
vim.keymap.set('n', '<leader>fg', ":Telescope live_grep<CR>")
vim.keymap.set('n', '<leader>b', ":Telescope buffers<CR>")

vim.keymap.set('n', '<leader>h', ":Telescope help_tags<CR>")
