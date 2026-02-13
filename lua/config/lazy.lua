local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
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

local local_plugins = {
    -- {
    --     'nvim-telescope/telescope.nvim',
    --     version = '0.1.8',
    --     dependencies = {
    --         {'nvim-lua/plenary.nvim'},
    --     },
    -- },

    --[[
    ({
        "rebelot/kanagawa.nvim",
        as = 'kanagawa',
        config = function()
            vim.cmd('colorscheme kanagawa')
        end,
    })
    --]]

    -- {
    --     'rose-pine/neovim',
    --     as = 'rose-pine',
    --     config = function()
    --         vim.cmd('colorscheme rose-pine')
    --     end,
    -- },
    -- {
    --     'nvim-treesitter/nvim-treesitter',
    --     build = ':TSUpdate'
    -- },
    'nvim-treesitter/playground',
    -- 'theprimeagen/harpoon',
    -- 'neovim/nvim-lspconfig',
    -- 'williamboman/mason.nvim',
    -- {
    --     "mason-org/mason.nvim",
    --     opts = {}
    -- },
    -- 'williamboman/mason-lspconfig.nvim',
    -- 'Saghen/blink.cmp',

    -- completion plugins
     'hrsh7th/nvim-cmp',
     'hrsh7th/cmp-nvim-lsp',
     'hrsh7th/cmp-vsnip',
    --  'hrsh7th/vim-vsnip',
    --  'rafamadriz/friendly-snippets',
    -- {
    --     "vhyrro/luarocks.nvim",
    --     priority = 1000, -- Very high priority is required, luarocks.nvim should run as the first plugin in your config.
    --     config = true,
    -- },
}

-- require("lazy").setup(local_plugins, {})
require("lazy").setup({
    local_plugins,
	{ import = "plugins" },
	checker = { enabled = true },
})

