local bind = require("keymap.bind")
local map_cr = bind.map_cr
local map_callback = bind.map_callback

return {
	-- Copilot-Chat
	["n|<leader>ah"] = map_callback(function()
			local actions = require("CopilotChat.actions")
			require("CopilotChat.integrations.telescope").pick(actions.help_actions())
		end)
		:with_noremap()
		:with_silent()
		:with_desc("tool: CopilotChat - Help actions"),

	["n|<leader>ap"] = map_callback(function()
			local actions = require("CopilotChat.actions")
			require("CopilotChat.integrations.telescope").pick(actions.prompt_actions())
		end)
		:with_noremap()
		:with_silent()
		:with_desc("tool: CopilotChat - Prompt actions"),

	-- visual
	["x|<leader>ap"] = map_cr(
			"lua require('CopilotChat.integrations.telescope').pick(require('CopilotChat.actions').prompt_actions({selection = require('CopilotChat.select').visual}))"
		)
		:with_noremap()
		:with_silent()
		:with_desc("tool: CopilotChat - Prompt actions"),

	-- Code related commands
	["n|<leader>ae"] = map_cr("CopilotChatExplain")
		:with_noremap()
		:with_silent()
		:with_desc("tool: CopilotChat - Explain code"),

	["n|<leader>at"] = map_cr("CopilotChatTests")
		:with_noremap()
		:with_silent()
		:with_desc("tool: CopilotChat - Generate tests"),

	["n|<leader>ar"] = map_cr("CopilotChatReview")
		:with_noremap()
		:with_silent()
		:with_desc("tool: CopilotChat - Review code"),

	["n|<leader>aR"] = map_cr("CopilotChatRefactor")
		:with_noremap()
		:with_silent()
		:with_desc("tool: CopilotChat - Refactor code"),

	["n|<leader>an"] = map_cr("CopilotChatBetterNamings")
		:with_noremap()
		:with_silent()
		:with_desc("tool: CopilotChat - Better Naming"),

	["x|<leader>av"] = map_cr("CopilotChatVisual")
		:with_noremap()
		:with_silent()
		:with_desc("tool: CopilotChat - Open in vertical split"),

	["x|<leader>ax"] = map_cr("CopilotChatInline")
		:with_noremap()
		:with_silent()
		:with_desc("tool: CopilotChat - Inline chat"),

	["n|<leader>ai"] = map_callback(function()
			local input = vim.fn.input("Ask Copilot: ")
			if input ~= "" then
				vim.cmd("CopilotChat " .. input)
			end
		end)
		:with_noremap()
		:with_silent()
		:with_desc("tool: CopilotChat - Ask input"),

	["n|<leader>am"] = map_cr("CopilotChatCommit")
		:with_noremap()
		:with_silent()
		:with_desc("tool: CopilotChat - Generate commit message for all changes"),

	-- Generate commit message based on the git diff
	["n|<leader>aM"] = bind.map_cr("CopilotChatCommitStaged")
		:with_noremap()
		:with_silent()
		:with_desc("tool: CopilotChat - Generate commit message for staged changes"),

	-- Quick chat with Copilot
	["n|<leader>aq"] = bind.map_callback(function()
		local input = vim.fn.input("Quick Chat: ")
		if input ~= "" then
			vim.cmd("CopilotChatBuffer " .. input)
		end
	end),
	-- Debug

	["n|<leader>ad"] = bind.map_cr("CopilotChatDebugInfo")
		:with_noremap()
		:with_silent()
		:with_desc("tool: CopilotChat - Debug Info"),
	-- Fix the issue with diagnostic
	["n|<leader>af"] = bind.map_cr("CopilotChatFixDiagnostic")
		:with_noremap()
		:with_silent()
		:with_desc("tool: CopilotChat - Fix Diagnostic"),
	-- Clear buffer and chat history
	["n|<leader>al"] = bind.map_cr("CopilotChatReset")
		:with_noremap()
		:with_silent()
		:with_desc("tool: CopilotChat - Clear buffer and chat history"),
	-- Toggle Copilot Chat Vsplit
	["n|<leader>av"] = bind.map_cr("CopilotChatToggle")
		:with_noremap()
		:with_silent()
		:with_desc("tool: CopilotChat - Toggle Vsplit"),
}
