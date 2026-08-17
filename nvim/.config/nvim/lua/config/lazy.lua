-- Download the lazy.nvim from,
-- `git clone https://github.com/folke/lazy.nvim.git ~/.local/share/nvim/lazy/lazy.nvim`

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
 require('mini.jump').setup({ delay = 0 })
   vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  spec = {
    {
      "echasnovski/mini.nvim",
      version = false,
    },

    {
      "hrsh7th/nvim-cmp",
      dependencies = {
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-buffer",
      },
      config = function()
        local cmp = require("cmp")

        cmp.setup({
          mapping = cmp.mapping.preset.insert({
            ["<C-Space>"] = cmp.mapping.complete(),
            ["<CR>"] = cmp.mapping.confirm({ select = true }),
          }),

          sources = {
            { name = "path" },
            { name = "buffer" },
          },
        })
      end,
    },
  },

  checker = { enabled = true },
})
