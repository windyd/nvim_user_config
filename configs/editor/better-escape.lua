return function()
	-- https://github.com/max397574/better-escape.nvim/blob/master/readme.md
	require("better_escape").setup({
		timeout = vim.o.timeoutlen,
		default_mappings = true,
		mappings = {
			i = {
				j = {
					-- These can all also be functions
					k = "<Esc>",
					j = "<Esc>",
				},
			},
			c = {
				j = {
					k = "<Esc>",
					j = "<Esc>",
				},
			},
			t = {
				j = {
					k = "<C-\\><C-n>",
				},
			},
			v = {
				j = {
					k = "<Esc>",
				},
			},
			s = {
				j = {
					k = "<Esc>",
				},
			},
		},
	})
end
