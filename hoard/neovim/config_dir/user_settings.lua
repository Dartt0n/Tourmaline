-- Function for make mapping easier.
local function map(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend("force", options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

additional_plugins = {
    { "wakatime/vim-wakatime" },
    { "tami5/lspsaga.nvim" },
    { "python-rope/ropevim" },
    { "sainnhe/gruvbox-material" },
    { "catppuccin/nvim", as = "catppuccin"},
}

vim.g.enfocado_style = "neon"    -- styles: nature and neon.
vim.cmd("colorscheme enfocado")


vim.cmd("colorscheme catppuccin")


vim.g.gruvbox_material_background = 'medium'
vim.g.gruvbox_material_palette = "mix"
vim.g.gruvbox_material_diagnostic_virtual_text = 'colored'

-- Neovide config
vim.g.neovide_cursor_vfx_mode= 'ripple'
vim.g.neovide_refresh_rate=60
vim.g.neovide_no_idle="false"
vim.o.guifont="Iosevka Custom:h12"

-- Lspsaga stuff
local lspsaga = require 'lspsaga'
lspsaga.setup {
    debug = false,
    use_saga_diagnostic_sign=true,
    error_sign=" ",
    warn_sign=" ",
    hint_sign=" ",
    infor_sign=" ",
    diagnostic_header_icon=" ",
    code_action_icon=" ",
    code_action_prompt = {
        enable=true,
        sign=true,
        sign_priority=40,
        virtual_text=true
    },
    finder_definition_icon = " ",
    finder_reference_icon = " ",
    max_preview_lines=10,
    finder_action_keys = {
        open = "o",
        vsplit = "s",
        split = "i",
        quit = "q",
        scroll_down = "<C-f>",
        scroll_up = "<C-b>"
    },
    code_action_keys = {
        quit = "q",
        exec="<CR>",
    },
    rename_action_keys = {
        quit = "<C-c>",
        exec = "<CR>",
    },
    definition_preview_icon = " ",
    border_style="round",
    rename_prompt_prefix="New name: ",
    server_filetype_map = {},
    diagnostic_prefix_format = "%d. ",
}
-- Lspsaga binds
map("n", "lr", "<cmd>Lspsaga rename<cr>")
map("n", "la", "<cmd>Lspsaga code_action<cr>")
map("v", "la", "<cmd>Lspsaga range_code_action<cr>")
map("n", "ld", "<cmd>Lspsaga hover_doc<cr>")
map("n", "ls", "<cmd>Lspsaga show_line_diagnostics<cr>")
map("n", "l<Right>", "<cmd>Lspsaga diagnostic_jump_next<cr>")
map("n", "l<Left>", "<cmd>Lspsaga diagnostic_jump_prev<cr>")

map("n", "<A-t>", "<cmd>terminal<cr>")

local catppuccin = require("catppuccin")
catppuccin.setup(
    {
		transparent_background = false,
		term_colors = false,
		styles = {
			comments = "italic",
			functions = "italic",
			keywords = "italic",
			strings = "NONE",
			variables = "NONE",
		},
		integrations = {
			treesitter = true,
			native_lsp = {
				enabled = true,
				virtual_text = {
					errors = "italic",
					hints = "italic",
					warnings = "italic",
					information = "italic",
				},
				underlines = {
					errors = "underline",
					hints = "underline",
					warnings = "underline",
					information = "underline",
				},
			},
			lsp_trouble = false,
			lsp_saga = false,
			gitgutter = false,
			gitsigns = false,
			telescope = false,
			nvimtree = {
				enabled = false,
				show_root = false,
			},
			which_key = false,
			indent_blankline = {
				enabled = false,
				colored_indent_levels = false,
			},
			dashboard = false,
			neogit = false,
			vim_sneak = false,
			fern = false,
			barbar = false,
			bufferline = false,
			markdown = false,
			lightspeed = false,
			ts_rainbow = false,
			hop = false,
		},
	}
)


user_lualine_style = 1 -- You can choose between 1, 2, 3, 4 and 5
user_indent_blankline_style = 1 -- You can choose between 1, 2, 3, 4,5 and 6
