return {
	"folke/sidekick.nvim",
	lazy = false,
	opts = {
		-- add any options here
		nes = {
			enabled = false,
		},
		cli = {
			tools = {
				antigravity = {
					cmd = { "agy" },
				},
			},
			mux = {
				enabled = true,
			},
			prompts = {
				-- The "Explain" Prompts
				cp_explain = "Explain the algorithmic approach of {this}. Break down the core logic and the data structures being used.",
				cp_complexity = "Analyze the exact time and space complexity of {this}. Will this pass standard 1-second time limits for N = 10^5 or N = 10^6?",

				-- The "Debugging" Prompts
				cp_edge_cases = "Generate a set of tricky edge cases for {this} that might cause a Wrong Answer (WA) or Runtime Error (RE). Think about integer overflow, empty arrays, or negative numbers.",
				cp_debug_wa = "I am getting a Wrong Answer on a hidden test case. Please find the logical bug, out-of-bounds error, or integer overflow issue in {this}.",
				cp_debug_mle = "I am getting a Memory Limit Exceeded on a hidden test case. Please find the bug in this.",

				-- The "Optimization" Prompts
				cp_optimize = "Optimize {this} for competitive programming. Suggest ways to reduce the constant factor, avoid unnecessary allocations, or use more efficient C++ STL containers.",

				-- The "Stress Testing" Prompt
				cp_stress_test = "Translate {this} into equivalent Python code so I can write a brute-force script to stress-test my optimized C++ solution.",
			},
		},
	},
	keys = {
		-- {
		-- 	"<tab>",
		-- 	function()
		-- 		-- if there is a next edit, jump to it, otherwise apply it if any
		-- 		if not require("sidekick").nes_jump_or_apply() then
		-- 			return "<Tab>" -- fallback to normal tab
		-- 		end
		-- 	end,
		-- 	expr = true,
		-- 	desc = "Goto/Apply Next Edit Suggestion",
		-- },
		{
			"<c-.>",
			function()
				require("sidekick.cli").focus()
			end,
			desc = "Sidekick Focus",
			mode = { "n", "t", "i", "x" },
		},
		{
			"<leader>aa",
			function()
				require("sidekick.cli").toggle()
			end,
			desc = "Sidekick Toggle CLI",
		},
		{
			"<leader>as",
			function()
				require("sidekick.cli").select()
			end,
			-- Or to select only installed tools:
			-- require("sidekick.cli").select({ filter = { installed = true } })
			desc = "Select CLI",
		},
		{
			"<leader>ad",
			function()
				require("sidekick.cli").close()
			end,
			desc = "Detach a CLI Session",
		},
		{
			"<leader>at",
			function()
				require("sidekick.cli").send({ msg = "{this}" })
			end,
			mode = { "x", "n" },
			desc = "Send This",
		},
		{
			"<leader>af",
			function()
				require("sidekick.cli").send({ msg = "{file}" })
			end,
			desc = "Send File",
		},
		{
			"<leader>av",
			function()
				require("sidekick.cli").send({ msg = "{selection}" })
			end,
			mode = { "x" },
			desc = "Send Visual Selection",
		},
		{
			"<leader>ap",
			function()
				require("sidekick.cli").prompt()
			end,
			mode = { "n", "x" },
			desc = "Sidekick Select Prompt",
		},
		-- Example of a keybinding to open Claude directly
		{
			"<leader>ac",
			function()
				require("sidekick.cli").toggle({ name = "claude", focus = true })
			end,
			desc = "Sidekick Toggle Claude",
		},
	},
}
