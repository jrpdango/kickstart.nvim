-- Project-wide search & replace in a dedicated buffer, with live diff preview.
-- https://github.com/MagicDuck/grug-far.nvim
--
-- Open with <leader>sR (normal or visual mode). Type the search text in the
-- "Search" field and the replacement in "Replace"; the diff previews as you type.
-- Apply with the buffer-local <localleader>r (<Space>r). Start a search from a
-- selection: linewise selections scope the search to that range, otherwise the
-- selection just pre-fills the search field.
--
-- NOTE: grug-far defers its requires, so we only require it inside the mapping.
vim.pack.add { 'https://github.com/MagicDuck/grug-far.nvim' }

vim.keymap.set({ 'n', 'x' }, '<leader>sR', function()
  require('grug-far').open { visualSelectionUsage = 'auto-detect' }
end, { desc = '[S]earch & [R]eplace (grug-far)' })
