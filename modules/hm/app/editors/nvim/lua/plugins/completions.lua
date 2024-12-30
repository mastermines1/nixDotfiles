return {
	{
		"saghen/blink.cmp",
		lazy = false, -- lazy loading handled internally
		-- optional: provides snippets for the snippet source
		dependencies = {
			"rafamadriz/friendly-snippets",
			"niuiic/blink-cmp-rg.nvim",
		},
		-- use a release tag to download pre-built binaries
		-- version = "v0.5.1",
		-- OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
		-- build = 'cargo build --release',
		-- If you use nix, you can build from source using latest nightly rust with:
		build = "nix run .#build-plugin",

		---@module 'blink.cmp'
		---@type blink.cmp.Config
		opts = {
			-- 'default' for mappings similar to built-in completion
			-- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
			-- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
			-- see the "default configuration" section below for full documentation on how to define
			-- your own keymap.
			keymap = { preset = "super-tab" },

			-- set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
			-- adjusts spacing to ensure icons are aligned
			nerd_font_variant = "mono",

			-- experimental auto-brackets support
			accept = { auto_brackets = { enabled = true } },

			-- experimental signature help support
			-- trigger = { signature_help = { enabled = true } }

			sources = {
				completion = {
					enabled_providers = { "lsp", "path", "snippets", "buffer", "ripgrep" }, -- add "ripgrep" here
				},
				providers = {
					-- other sources
					ripgrep = {
						module = "blink-cmp-rg",
						name = "Ripgrep",
						-- options below are optional, these are the default values
						---@type blink-cmp-rg.Options
						opts = {
							-- blink.cmp get prefix in a different way,
							-- thus use `prefix_min_len` instead of `min_keyword_length`
							prefix_min_len = 3,
							get_command = function(context, prefix)
								return {
									"rg",
									"--no-config",
									"--json",
									"--word-regexp",
									"--ignore-case",
									"--",
									prefix .. "[\\w_-]+",
									vim.fs.root(0, ".git") or vim.fn.getcwd(),
								}
							end,
							get_prefix = function(context)
								local col = vim.api.nvim_win_get_cursor(0)[2]
								local line = vim.api.nvim_get_current_line()
								local prefix = line:sub(1, col):match("[%w_-]+$") or ""
								return prefix
							end,
						},
					},
				},
			},
		},
		-- allows extending the enabled_providers array elsewhere in your config
		-- without having to redefining it
		opts_extend = { "sources.completion.enabled_providers" },
	},
}
