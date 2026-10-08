local function open_external(path)
  if path == '' or vim.fn.filereadable(path) == 0 then
    vim.notify('No readable file to open: ' .. path, vim.log.levels.WARN)
    return
  end
  local cmd
  if vim.fn.has 'mac' == 1 then
    cmd = { 'open', path }
  elseif vim.fn.executable 'imv' == 1 then
    cmd = { 'imv', path }
  else
    cmd = { 'mpv', path }
  end
  vim.fn.jobstart(cmd, { detach = true })
end

vim.keymap.set('n', '<leader>oi', function()
  open_external(vim.api.nvim_buf_get_name(0))
end, { desc = '[O]pen [I]mage externally' })
