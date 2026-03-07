vim.cmd("source ~/vimrc/common.vim")

vim.g.mapleader = " "

vim.opt.termguicolors = true
vim.opt.runtimepath:append(vim.fn.stdpath("data") .. "/site")
vim.env.PATH = "/usr/local/bin:" .. vim.env.PATH

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
local uv = vim.uv or vim.loop
if not uv.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  {
    "Tsuzat/NeoSolarized.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("NeoSolarized").setup({
        style = "dark",
        transparent = false,
        terminal_colors = true,
        enable_italics = true,
        styles = {
          comments = { italic = true },
          keywords = { italic = true },
          functions = { bold = true },
          variables = {},
          string = { italic = true },
          underline = true,
          undercurl = true,
        },
      })
      vim.cmd.colorscheme("NeoSolarized")
    end,
  },

  { "tpope/vim-fugitive" },
  { "tpope/vim-surround" },
  { "mattn/emmet-vim" },
  { "saltstack/salt-vim" },
  { "hashivim/vim-terraform" },

  { "github/copilot.vim" },

  { "neovim/nvim-lspconfig" },

  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
  },
}, {
  rocks = {
    enabled = false,
  },
})

vim.g.copilot_no_tab_map = true
vim.keymap.set("i", "<C-J>", 'copilot#Accept("\\<CR>")', {
  expr = true,
  replace_keycodes = false,
  silent = true,
})

vim.lsp.config("gopls", {
  settings = {
    gopls = {
      gofumpt = true,
      staticcheck = true,
      analyses = {
        unusedparams = true,
      },
    },
  },
})

vim.lsp.enable("gopls")

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
    vim.lsp.buf.format({ async = false })
  end,
})

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(ev)
    local opts = { buffer = ev.buf, silent = true }

    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
    vim.keymap.set("n", "<leader>f", function()
      vim.lsp.buf.format({ async = true })
    end, opts)
  end,
})

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<C-p>", builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
