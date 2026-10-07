-- VSCode/Zed-style multiple cursors.
-- https://github.com/mg979/vim-visual-multi
--
-- <C-Down> / <C-Up> add a cursor on the line below/above at the current column.
-- <C-n> selects the word under the cursor and adds a cursor at the next match.
-- <Esc> to leave multi-cursor mode, <Tab> to switch between cursors.
--
-- NOTE: g:VM_maps must be set before the plugin loads, so keep this above vim.pack.add.
vim.g.VM_maps = {
  ['Add Cursor Down'] = '<C-Down>',
  ['Add Cursor Up'] = '<C-Up>',
}

vim.pack.add { 'https://github.com/mg979/vim-visual-multi' }
