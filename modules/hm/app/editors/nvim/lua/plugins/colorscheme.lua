return {
  "catppuccin/nvim",
	name = "catppucin",
  lazy = false,
  priority = 1000,
	config = function()
		require("catppuccin").setup({
	    default_integrations = false,
		})
		vim.cmd.colorscheme "catppuccin-mocha"
	end
}
