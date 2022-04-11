local M = {}

function M.setup()
    local tabset = require("tabset")
    tabset.setup({
	defaults = {
	    tabwidth = 4,
	    expandtab = true
	},
	languages = {
	    go = {
		tabwidth = 4,
		expandtab = false
	    },
	    {
		filetypes = {
		    "javascript",
		"typescript",
		"javascriptreact",
		"typescriptreact",
		"json",
		"yaml",
		"vuejs",
		"vue",
		"javascriptvue",
		"js"
		},
		config = {
		    tabwidth = 2
		}
	    }
	}
    })
end

return M
