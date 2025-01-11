local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
	return
end

local setup = {
	plugins = {
		marks = true, -- shows a list of your marks on ' and `
		registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
		spelling = {
			enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
			suggestions = 20, -- how many suggestions should be shown in the list?
		},
		-- the presets plugin, adds help for a bunch of default keybindings in Neovim
		-- No actual key bindings are created
		presets = {
			operators = false, -- adds help for operators like d, y, ... and registers them for motion / text object completion
			motions = true, -- adds help for motions
			text_objects = true, -- help for text objects triggered after entering an operator
			windows = true, -- default bindings on <c-w>
			nav = true, -- misc bindings to work with windows
			z = true, -- bindings for folds, spelling and others prefixed with z
			g = true, -- bindings for prefixed with g
		},
	},
	-- add operators that will trigger motion and text object completion
	-- to enable all native operators, set the preset / operators plugin above
	-- operators = { gc = "Comments" },
	key_labels = {
		-- override the label used to display some keys. It doesn't effect WK in any other way.
		-- For example:
		-- ["<space>"] = "SPC",
		-- ["<cr>"] = "RET",
		-- ["<tab>"] = "TAB",
	},
	icons = {
		breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
		separator = "➜", -- symbol used between a key and it's label
		group = "+", -- symbol prepended to a group
	},
	popup_mappings = {
		scroll_down = "<c-d>", -- binding to scroll down inside the popup
		scroll_up = "<c-u>", -- binding to scroll up inside the popup
	},
	window = {
		border = "rounded", -- none, single, double, shadow
		position = "bottom", -- bottom, top
		margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
		padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
		winblend = 0,
	},
	layout = {
		height = { min = 4, max = 25 }, -- min and max height of the columns
		width = { min = 20, max = 50 }, -- min and max width of the columns
		spacing = 3, -- spacing between columns
		align = "left", -- align columns left, center or right
	},
	ignore_missing = true, -- enable this to hide mappings for which you didn't specify a label
	hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
	show_help = true, -- show help message on the command line when the popup is visible
	triggers = "auto", -- automatically setup triggers
	-- triggers = {"<leader>"} -- or specify a list manually
	triggers_blacklist = {
		-- list of mode / prefixes that should never be hooked by WhichKey
		-- this is mostly relevant for key maps that start with a native binding
		-- most people should not need to change this
		i = { "j", "k" },
		v = { "j", "k" },
	},
}


which_key.add({
    { "<leader>P", "<cmd>lua require('telescope').extensions.projects.projects()<cr>", desc = "Projects", nowait = true, remap = false },
    { "<leader>a", "<cmd>Alpha<cr>", desc = "Alpha", nowait = true, remap = false },
    { "<leader>b", "<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<cr>", desc = "Buffers", nowait = true, remap = false },
    { "<leader>e", desc = "telescope.extensions.file_browser.file_browser", nowait = true, remap = false },
    { "<leader>g", group = "Git", nowait = true, remap = false },
    { "<leader>gR", desc = "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", nowait = true, remap = false },
    { "<leader>gb", desc = "<cmd>Telescope git_branches<cr>", nowait = true, remap = false },
    { "<leader>gc", desc = "<cmd>Telescope git_commits<cr>", nowait = true, remap = false },
    { "<leader>gj", desc = "<cmd>lua require 'gitsigns'.next_hunk()<cr>", nowait = true, remap = false },
    { "<leader>gk", desc = "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", nowait = true, remap = false },
    { "<leader>gl", desc = "<cmd>lua require 'gitsigns'.blame_line()<cr>", nowait = true, remap = false },
    { "<leader>go", desc = "<cmd>Telescope git_status<cr>", nowait = true, remap = false },
    { "<leader>gp", desc = "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", nowait = true, remap = false },
    { "<leader>gr", desc = "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", nowait = true, remap = false },
    { "<leader>gs", desc = "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", nowait = true, remap = false },
    { "<leader>gu", desc = "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>", nowait = true, remap = false },
    { "<leader>p", group = "Packer", nowait = true, remap = false },
    { "<leader>pS", desc = "<cmd>PackerStatus<cr>", nowait = true, remap = false },
    { "<leader>pc", desc = "<cmd>PackerCompile<cr>", nowait = true, remap = false },
    { "<leader>pi", desc = "<cmd>PackerInstall<cr>", nowait = true, remap = false },
    { "<leader>ps", desc = "<cmd>PackerSync<cr>", nowait = true, remap = false },
    { "<leader>pu", desc = "<cmd>PackerUpdate<cr>", nowait = true, remap = false },
    { "<leader>s", group = "Search", nowait = true, remap = false },
    { "<leader>sC", desc = "<cmd>Telescope commands<cr>", nowait = true, remap = false },
    { "<leader>sM", desc = "<cmd>Telescope man_pages<cr>", nowait = true, remap = false },
    { "<leader>sR", desc = "<cmd>Telescope registers<cr>", nowait = true, remap = false },
    { "<leader>sc", desc = "<cmd>Telescope colorscheme<cr>", nowait = true, remap = false },
    { "<leader>sh", desc = "<cmd>Telescope help_tags<cr>", nowait = true, remap = false },
    { "<leader>sk", desc = "<cmd>Telescope keymaps<cr>", nowait = true, remap = false },
    { "<leader>sr", desc = "<cmd>Telescope oldfiles<cr>", nowait = true, remap = false },
    { "<leader>t", group = "Terminal", nowait = true, remap = false },
    { "<leader>tf", desc = "<cmd>ToggleTerm direction=float<cr>", nowait = true, remap = false },
    { "<leader>th", desc = "<cmd>ToggleTerm size=10 direction=horizontal<cr>", nowait = true, remap = false },
    { "<leader>tn", desc = "<cmd>lua _NODE_TOGGLE()<cr>", nowait = true, remap = false },
    { "<leader>tt", desc = "<cmd>lua _HTOP_TOGGLE()<cr>", nowait = true, remap = false },
    { "<leader>tu", desc = "<cmd>lua _NCDU_TOGGLE()<cr>", nowait = true, remap = false },
    { "<leader>tv", desc = "<cmd>ToggleTerm size=80 direction=vertical<cr>", nowait = true, remap = false },
})

which_key.setup(setup)
