-- Milo's NeoVim Config
--- I'll try and keep things readable, but don't expect me to explain every line :/
--- Thanks to catperson for helping me with some plugins and with setting up the repo :>



-- Disabling netrw (apparently needed for nvim-tree to function :/)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1



-- Keybinds

--- Lazy
vim.keymap.set("n", "<space>l", "<cmd>Lazy home<cr>", { desc = 'Open Lazy Menu' })

--- Telescope
vim.keymap.set("n", "<space>ff", "<cmd>Telescope find_files<cr>", { desc = 'Telescope find files' })
vim.keymap.set("n", "<space>fg", "<cmd>Telescope live_grep<cr>", { desc = 'Telescope live grep' })
vim.keymap.set("n", "<space>fb", "<cmd>Telescope buffers<cr>", { desc = 'Telescope buffer search' })
vim.keymap.set("n", "<space>fh", "<cmd>Telescope help_tags<cr>", { desc = 'Telescope help search' })

--- Nvim-Tree
vim.keymap.set("n", "<space>f.", "<cmd>NvimTreeToggle<cr>", { desc = 'Toggle Nvim-Tree' })



-- Lazy.nvim Setup

--- Enabling Plugin Loader (Lazy.nvim)
--- config: ./nvim/lua/config/lazy.lua
--- plugins: ./nvim/lua/plugins/
require("config.lazy")

-- Import Plugins (each plugin is called "plugin.filename")
require("lazy").setup({
    spec = {
        { import = "plugins.mason" },
        { import = "plugins.nord-theme" },
        { import = "plugins.lualine" },
        { import = "plugins.nvim-tree" },
        { import = "plugins.telescope" },
        { import = "plugins.whichkey" },
        { import = "plugins.lspconfig" },
        { import = "plugins.blink" }
    },
    -- set the colour scheme
    install = { colorscheme = { "nord" } },
    -- automatically check for plugin updates
    checker = { enabled = true },
})



-- Mason Setup
require("mason").setup()



-- Lualine Setup
--- This section is gonna be kinda massive and probably a bit confusing. Sorry in advance... :c
require('lualine').setup {
    options = {
        icons_enabled = true,
        theme = 'auto',
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
        disabled_filetypes = {
            statusline = {},
            winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        always_show_tabline = true,
        globalstatus = false,
        refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
            refresh_time = 16, -- ~60fps
            events = {
                'WinEnter',
                'BufEnter',
                'BufWritePost',
                'SessionLoadPost',
                'FileChangedShellPost',
                'VimResized',
                'Filetype',
                'CursorMoved',
                'CursorMovedI',
                'ModeChanged',
            },
        }
    },
    sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch', 'diff', 'diagnostics' },
        lualine_c = { 'filename' },
        lualine_x = { 'encoding', 'fileformat', 'filetype' },
        lualine_y = { 'progress' },
        lualine_z = { 'location' }
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { 'filename' },
        lualine_x = { 'location' },
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {},
    winbar = {},
    inactive_winbar = {},
    extensions = {}
}



-- Telescope Setup

--- Other settings
require('telescope').setup {
    defaults = {
        mappings = {
            i = {
                ["<C-h>"] = "which_key"
            }
        }
    },
    pickers = {},
    extensions = {}
}



-- Blink Setup
--- Nothing here, all the options are in ./lua/plugins/blink.lua



-- WhichKey Setup

local wk = require("which-key")
