-- Live preview Markdown/HTML/AsciiDoc/SVG in the browser.
-- https://github.com/brianhuster/live-preview.nvim
vim.pack.add { 'https://github.com/brianhuster/live-preview.nvim' }

require('livepreview.config').set {
  port = 5500,
  browser = 'default',
  dynamic_root = false,
  sync_scroll = true,
  picker = 'telescope',
  address = '127.0.0.1',
}

vim.keymap.set('n', '<leader>ls', '<Cmd>LivePreview start<CR>', { desc = '[L]ive preview [s]tart' })
vim.keymap.set('n', '<leader>lc', '<Cmd>LivePreview close<CR>', { desc = '[L]ive preview [c]lose' })
vim.keymap.set('n', '<leader>lp', '<Cmd>LivePreview pick<CR>', { desc = '[L]ive preview [p]ick file' })
