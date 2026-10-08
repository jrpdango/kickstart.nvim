local image_open = require 'custom.image_open'

vim.keymap.set('n', '<leader>oi', function()
  image_open.open(vim.api.nvim_buf_get_name(0))
end, { desc = '[O]pen [I]mage externally' })
