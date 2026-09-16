-- VSCode/Zed-style git + diagnostic change bars on the right edge.
-- https://github.com/petertriho/nvim-scrollbar
-- Requires gitsigns.nvim (configured in init.lua).
vim.pack.add { 'https://github.com/petertriho/nvim-scrollbar' }

require('scrollbar').setup {
  handlers = {
    cursor = true, -- cursor position mark
    diagnostic = true, -- LSP errors/warnings/info/hints
    gitsigns = true, -- git add/change/delete; also calls the gitsigns handler setup
    handle = true, -- draggable scrollbar handle
    search = false, -- would require nvim-hlslens
    ale = false,
  },
}
