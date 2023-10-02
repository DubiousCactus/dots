local M = {}

function M.setup()
  --local tree = require("nvim-tree")
  local copilot = require("copilot")
	--use {
	  --"zbirenbaum/copilot.lua",
	  --cmd = "Copilot",
	  --event = "InsertEnter",
	  --config = function()
		--require("copilot").setup({
	copilot.setup({
		suggestion = { enabled = false },
		panel = { enabled = false },
	})
end

return M
