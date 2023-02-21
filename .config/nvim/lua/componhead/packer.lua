-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.1',
		-- or                            , branch = '0.1.x',
		requires = { {'nvim-lua/plenary.nvim'} }
	}

	use {
    		"nvim-telescope/telescope-file-browser.nvim",
    		requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
	}

	use 'EdenEast/nightfox.nvim'

	use ( 'nvim-treesitter/nvim-treesitter', { run = ':TSUpdate'} )

	use ( 'theprimeagen/harpoon' )

	use ( 'mbbill/undotree' )

	use({
      		"folke/trouble.nvim",
      		config = function()
          			require("trouble").setup {
              			icons = false,
              			-- your configuration comes here
              			-- or leave it empty to use the default settings
              			-- refer to the configuration section below
          			}
      		end
	})

	use("folke/zen-mode.nvim")

	use ( 'tpope/vim-dadbod' )
	use ( 'kristijanhusak/vim-dadbod-ui' )

	use ( 'tpope/vim-surround' )

	use {
	  'VonHeikemen/lsp-zero.nvim',
	  branch = 'v1.x',
	  requires = {
	    -- LSP Support
	    {'neovim/nvim-lspconfig'},             -- Required
	    {'williamboman/mason.nvim'},           -- Optional
	    {'williamboman/mason-lspconfig.nvim'}, -- Optional
	
	    -- Autocompletion
	    {'hrsh7th/nvim-cmp'},         -- Required
	    {'hrsh7th/cmp-nvim-lsp'},     -- Required
	    {'hrsh7th/cmp-buffer'},       -- Optional
	    {'hrsh7th/cmp-path'},         -- Optional
	    {'saadparwaiz1/cmp_luasnip'}, -- Optional
	    {'hrsh7th/cmp-nvim-lua'},     -- Optional
	
	    -- Snippets
	    {'L3MON4D3/LuaSnip'},             -- Required
	    {'rafamadriz/friendly-snippets'}, -- Optional
	  }
	}

	use("github/copilot.vim")

  	use("eandrju/cellular-automaton.nvim")

 	use("laytan/cloak.nvim")	

	use {
		'nvim-tree/nvim-tree.lua',
		requires = {
 			'nvim-tree/nvim-web-devicons', -- optional, for file icons
  		},
  		tag = 'nightly' -- optional, updated every week. (see issue #1193)
	}
end)
