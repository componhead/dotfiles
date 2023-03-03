return {
  {
    'nvim-telescope/telescope.nvim',
    version = '*',
    dependencies = { { 'nvim-lua/plenary.nvim' }, { 'kdheepak/lazygit.nvim' } },
    config = function()
      require("telescope").load_extension("lazygit")
      vim.keymap.set('n', '<leader>sr', require('telescope.builtin').resume, { desc = '[S]earch [R]esume' })
      vim.keymap.set('n', '<leader>gl', require('telescope.builtin').git_commits, { desc = '[G]it [L]og' })
      vim.keymap.set('n', '<leader>st', require('telescope.builtin').git_status, { desc = '[St]atus' })
      vim.keymap.set('n', '<F9>', ':LazyGitCurrentFile<CR>', { desc = 'Lazy git' })
    end
  },
}
