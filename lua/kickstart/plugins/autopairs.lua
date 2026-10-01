-- autopairs
-- https://github.com/windwp/nvim-autopairs

vim.pack.add { 'https://github.com/windwp/nvim-autopairs' }
require('nvim-autopairs').setup {
  map_cr = true, -- Enter between (|) -> newline + indent, closing bracket on its own line
}
