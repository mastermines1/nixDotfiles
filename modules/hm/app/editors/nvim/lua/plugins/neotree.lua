return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
		-- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
	},
	config = function()
		local keymap = vim.keymap

		keymap.set("n", "<C-n>", ":Neotree float<CR>")


		require("neo-tree").setup({
			close_if_last_window = true,
			popup_border_style = "rounded",
			enable_git_status = true,
			enable_diagnostics = true,

			filesystem = {
				filtered_items = {
					visable = true,
					hide_dotfiles = false,
					hide_gitignored = false,
				},
			},
		})
	end,
}
