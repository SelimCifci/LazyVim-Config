return {
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      -- Force the global diagnostic config
      vim.diagnostic.config({
        update_in_insert = true,
        virtual_text = true,
        signs = true,
      })
      -- Ensure the 'opts' table also carries this so LazyVim doesn't 
      -- toggle it back off during its internal setup
      opts.diagnostics = opts.diagnostics or {}
      opts.diagnostics.update_in_insert = true
    end,
  },
}
