config = function()
    local pywal = require('pywal')
    pywal.setup()
    vim.cmd('colorscheme pywal')
    
    -- Auto-reload when pywal colors change
    local pywal_colors = vim.fn.expand('~/.cache/wal/colors.json')
    vim.api.nvim_create_autocmd('BufWritePost', {
      pattern = pywal_colors,
      callback = function()
        vim.cmd('colorscheme pywal')
      end,
    })
    
    -- Also watch for file changes using a custom autocmd
    vim.api.nvim_create_autocmd('FocusGained', {
      callback = function()
        vim.cmd('colorscheme pywal')
      end,
    })
  end,
