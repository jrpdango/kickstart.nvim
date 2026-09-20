-- Flutter/Dart development: run, hot reload, device picker, Dart LSP and DAP.
-- https://github.com/nvim-flutter/flutter-tools.nvim
-- NOTE: do NOT configure `dartls` via nvim-lspconfig; this plugin manages it.
vim.pack.add {
  'https://github.com/nvim-flutter/flutter-tools.nvim',
}

require('flutter-tools').setup {
  flutter_path = vim.fn.exepath 'flutter',
  debugger = {
    enabled = true,
    exception_breakpoints = {},
  },
  lsp = {
    settings = {
      showTodos = true,
      completeFunctionCalls = true,
      enableSnippets = true,
      updateImportsOnRename = true,
    },
  },
  dev_log = {
    enabled = true,
    open_cmd = 'tabedit',
    focus_on_open = false,
  },
  dev_tools = {
    autostart = false,
    auto_open_browser = false,
  },
  widget_guides = { enabled = true },
}

-- Kill running Android emulator(s) via adb; flutter-tools has no such command.
-- Resolve adb ourselves: nvim launched from sway may not inherit the shell PATH
-- that contains the Android SDK platform-tools.
local function find_adb()
  if vim.fn.executable 'adb' == 1 then return 'adb' end
  local candidates = {}
  local sdk = vim.env.ANDROID_HOME or vim.env.ANDROID_SDK_ROOT
  if sdk and sdk ~= '' then candidates[#candidates + 1] = sdk .. '/platform-tools/adb' end
  candidates[#candidates + 1] = vim.fn.expand '~/Android/Sdk/platform-tools/adb'
  candidates[#candidates + 1] = '/opt/android-sdk/platform-tools/adb'
  for _, path in ipairs(candidates) do
    if vim.fn.executable(path) == 1 then return path end
  end
end

local function running_emulators(adb)
  local out = vim.fn.system { adb, 'devices' }
  local found = {}
  for line in out:gmatch '[^\n\r]+' do
    local id = line:match '^(emulator%-%d+)%s'
    if id then found[#found + 1] = id end
  end
  return found
end

local function kill_emulator(adb, serial)
  vim.fn.system { adb, '-s', serial, 'emu', 'kill' }
  vim.notify('Killed ' .. serial)
end

vim.api.nvim_create_user_command('FlutterEmulatorKill', function()
  local adb = find_adb()
  if not adb then
    vim.notify('adb not found on PATH or under ANDROID_HOME/~/Android/Sdk', vim.log.levels.ERROR)
    return
  end
  local emulators = running_emulators(adb)
  if #emulators == 0 then
    vim.notify('No running emulator', vim.log.levels.WARN)
  elseif #emulators == 1 then
    kill_emulator(adb, emulators[1])
  else
    vim.ui.select(emulators, { prompt = 'Kill emulator:' }, function(choice)
      if choice then kill_emulator(adb, choice) end
    end)
  end
end, { desc = 'Kill running Android emulator(s)' })

vim.keymap.set('n', '<leader>fk', '<Cmd>FlutterEmulatorKill<CR>', { desc = 'Kill Android emulator' })
