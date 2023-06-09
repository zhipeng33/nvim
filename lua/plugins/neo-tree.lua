-- file tree
return {
    'nvim-neo-tree/neo-tree.nvim',
    dependencies = {
        { "nvim-lua/plenary.nvim" },
		{ "nvim-tree/nvim-web-devicons" },
		{ "MunifTanjim/nui.nvim" },
    },
    keys = {
        { "<leader>tt", "<cmd>Neotree toggle reveal_force_cwd<CR>", "n" },
    },
    config = function()
        require('neo-tree').setup( {
            source_selector = {
				winbar = false,
				statusline = false
			},
            close_if_last_window = false, -- Close Neo-tree if it is the last window left in the tab
            popup_border_style = "single",
            enable_git_status = true,
			enable_diagnostics = true, 
            default_component_configs = {
                indent_size = 2,
                padding = 1, -- extra padding on left hand side
            },
            filesystem = { 
                hijack_netrw_behavior = "open_default",
                                    -- "open_current",  
                                    -- "disabled",
            },
            buffers = {
                show_unloaded = true,
            },
            window = {
                position = "float",
                width = 40,
                mapping_options = {
                    noremap = true,
                    nowait = true,
                },
                mappings = {}, 
            }
        } )
    end
}
