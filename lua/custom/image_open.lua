local M = {}

local function viewer_cmd(path)
  if vim.fn.has 'mac' == 1 then
    return { 'open', path }
  elseif vim.fn.executable 'imv' == 1 then
    return { 'imv', path }
  end
  return { 'mpv', path }
end

function M.open(path)
  if not path or path == '' or vim.fn.filereadable(path) == 0 then
    vim.notify('No readable file to open: ' .. tostring(path), vim.log.levels.WARN)
    return
  end
  vim.fn.jobstart(viewer_cmd(path), { detach = true })
end

return M
