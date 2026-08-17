vim.o.number = true
vim.o.relativenumber = true
vim.o.wrap = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.swapfile = false
vim.o.termguicolors = true

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

require("config.lazy")

vim.cmd[[colorscheme miniautumn]]

require('mini.pairs').setup()
require('mini.comment').setup()
require('mini.icons').setup()
require('mini.statusline').setup()
require('mini.starter').setup()
require('mini.tabline').setup()
require('mini.files').setup()
require('mini.jump2d').setup({mappings = { start_jumping = 's' }})
require('mini.hipatterns').setup({highlighters = {hex_color = require('mini.hipatterns').gen_highlighter.hex_color(),}})

local keymaps = {
    n = {
        ["<Esc><Esc>"] = { "<Cmd>nohlsearch<CR>", desc = "Clear search highlight" },
        ["<C-s>"] = { "<Cmd>w<CR>", desc = "Save" },
        ["<C-c>"] = { "ggVG\"+y", desc = "Copy All" },
        ["<C-q>"] = { "ZQ", desc = "Quit from Vim" },
        ["<M-j>"] = { "V<Cmd>move +1<CR><Esc>", desc = "Move down a line" },
        ["<M-k>"] = { "V<Cmd>move -2-2R><Esc>", desc = "Move up a line" },
        ["<leader>tn"] = { "<Cmd>tabnew<CR>", desc = "Create a new tab" },
        ["<leader>tt"] = { "<Cmd>belowright split | terminal bash<CR>", desc = "Create a new terminal" },
        ["<F2>"] = { function() MiniFiles.open() end, desc = "Opening File browser" },
    },

    i = {
        ["<C-s>"] = { "<C-o><Cmd>w<CR>", desc = "Save" },
        ["<C-e>"] = { "<C-o>A", desc = "Go to the end of the line" },
        ["<C-b>"] = { "<C-o>I", desc = "Go to the begining of the line" },
        ["<C-h>"] = { "<left>", desc = "Move cursor to the left" },
        ["<C-l>"] = { "<right>", desc = "Move cursor to the right" },
        ["<C-v>"] = { "<C-o>\"+P", desc = "Paste Here" },
        ["<C-a>"] = { "<Esc>ggVG", desc = "Select All" },
        ["<C-j>"] = { "<Esc>:m +1<CR>==gi", "Move cursor to the down" },
        ["<C-k>"] = { "<Esc>:m -2<CR>==gi", "Move cursor to the up" },
        ["<C-BS>"] = { "<C-w>", "backspace a word" },
    },

    v = {
        ["<C-c>"] = { "\"+y", desc = "Copy Selected" },
        ["<M-j>"] = { "<Cmd>move +1<CR>", desc = "Move a chunk upwards" },
        ["<M-k>"] = { "<Cmd>move -2<CR>", desc = "Move a chunk downwards" },
    }
}

for mode, mappings in pairs(keymaps) do
    for lhs, rhs in pairs(mappings) do
        local cmd, opts
        if type(rhs) == 'table' then
            cmd = rhs[1]
            opts = { desc = rhs.desc or "", noremap = true, silent = true }
        else
            cmd = rhs
            opts = { noremap = true, silent = true }
        end

        vim.keymap.set(mode, lhs, cmd, opts)
    end
end

