vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.2',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- development_l0
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'

  -- development_l1
  -- use 'andymass/vim-matchup'
  -- use 'godlygeek/tabular'
  -- use 'tomtom/tcomment_vim'
  -- use 'tpope/vim-abolish'
  -- use 'tpope/vim-fugitive'
  -- use 'tpope/vim-repeat'
  -- use 'tpope/vim-surround'
  -- use 'samoshkin/vim-mergetool'
  -- use 'matchit.vim'

  -- development_l2
  -- use 'github/copilot.vim'

  -- personal
  -- use 'vimwiki/vimwiki'

  -- ui
  -- use 'psliwka/vim-smoothie'
  -- use 'itchyny/lightline.vim'
  -- use 'ap/vim-css-color'


  -- languages
  -- ruby
  --    use 'thoughtbot/vim-rspec'
  --    use 'tpope/vim-rails'
  --    use 'ecomba/vim-ruby-refactoring'
  -- rust
  --    use 'rust-lang/rust.vim'

  -- colorschemes
  use { 'bluz71/vim-moonfly-colors', as = 'moonfly' }
  -- use {'nyoom-engineering/oxocarbon.nvim', as = 'oxocarbon' }
end)
