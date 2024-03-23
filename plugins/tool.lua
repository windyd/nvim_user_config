local tool = {}

tool["CopilotC-Nvim/CopilotChat.nvim"] = {
	branch = "canary",
	event = "VeryLazy",
	dependencies = {
		{ "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
		{ "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
	},
	opts = {
		debug = true, -- Enable debugging
		-- See Configuration section for rest
		auto_follow_cursor = false, -- Don't follow the cursor after getting response
		show_help = false, -- Show help in virtual text, set to true if that's 1st time using Copilot Chat
		mappings = {
			-- Use tab for completion
			complete = {
				detail = "Use @<Tab> or /<Tab> for options.",
				insert = "<Tab>",
			},
			-- Close the chat
			close = {
				normal = "q",
				insert = "<C-c>",
			},
			-- Reset the chat buffer
			reset = {
				normal = "<C-l>",
				insert = "<C-l>",
			},
			-- Submit the prompt to Copilot
			submit_prompt = {
				normal = "<CR>",
				insert = "<C-CR>",
			},
			-- Accept the diff
			accept_diff = {
				normal = "<C-y>",
				insert = "<C-y>",
			},
			-- Show the diff
			show_diff = {
				normal = "gmd",
			},
			-- Show the prompt
			show_system_prompt = {
				normal = "gmp",
			},
			-- Show the user selection
			show_user_selection = {
				normal = "gms",
			},
		},
		commands = {
			"CopilotChatVisual",
			"CopilotChatInline",
			"CopilotChatBuffer",
			"BufEnter",
		},
	},
	-- See Commands section for default commands if you want to lazy load on them
	config = require("configs.tool.copilot-chat"),
}

return tool
